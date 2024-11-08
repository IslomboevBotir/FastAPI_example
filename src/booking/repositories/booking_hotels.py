from fastapi import Depends
from fastapi import HTTPException
from fastapi_pagination.bases import RawParams
from sqlalchemy import select
from sqlalchemy import func
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession

from src.core.config import get_session
from src.booking.schemas.booking import BookingHotelsSchema
from src.booking.schemas.booking import BookingHotelFiltersSchema
from src.booking.serializers.booking import BookingListSerializer


class BookingRepository:
    def __init__(
            self,
            session: AsyncSession = Depends(get_session),
            booking_serializer_list: BookingListSerializer = Depends()
    ):
        self.session = session
        self.booking_serializer_list = booking_serializer_list

    async def create_booking_hotels(
            self,
            booking_data: BookingHotelsSchema
    ) -> dict:
        stmt = text("""
            INSERT INTO bookings (from_date, to_date, paid, hotel_id, client_id) 
            VALUES (:from_date, :to_date, :paid, :hotel_id, :client_id) 
            RETURNING id
        """)

        try:
            result = await self.session.execute(
                stmt,
                {
                    "from_date": booking_data.from_date,
                    "to_date": booking_data.to_date,
                    "paid": booking_data.paid,
                    "hotel_id": booking_data.hotel_id,
                    "client_id": booking_data.client_id,
                }
            )
            await self.session.commit()

            inserted_id = result.scalar()
            return {"booking_id": inserted_id}
        except Exception as e:
            await self.session.rollback()
            raise HTTPException(status_code=500, detail=str(e))

    async def update_booking_hotels(
            self,
            booking_data: BookingHotelsSchema,
            booking_id: int
    ) -> dict:
        stmt = text("""
            UPDATE bookings 
            SET from_date = :from_date, 
                to_date = :to_date, 
                paid = :paid, 
                hotel_id = :hotel_id, 
                client_id = :client_id 
            WHERE id = :booking_id
            RETURNING id
        """)

        try:
            result = await self.session.execute(
                stmt,
                {
                    "from_date": booking_data.from_date,
                    "to_date": booking_data.to_date,
                    "paid": booking_data.paid,
                    "hotel_id": booking_data.hotel_id,
                    "client_id": booking_data.client_id,
                    "booking_id": booking_id,
                }
            )
            await self.session.commit()

            updated_id = result.scalar()
            if not updated_id:
                raise HTTPException(status_code=404, detail="Booking not found")

            return {"booking_id": updated_id}
        except Exception as e:
            await self.session.rollback()
            raise HTTPException(status_code=500, detail=str(e))

    async def delete_booking_hotels(
            self,
            booking_id: int
    ) -> dict:
        stmt = text("DELETE FROM bookings WHERE id = :booking_id RETURNING id")

        try:
            result = await self.session.execute(stmt, {"booking_id": booking_id})
            await self.session.commit()

            deleted_id = result.scalar()
            if not deleted_id:
                raise HTTPException(status_code=404, detail="Booking not found")

            return {"message": "Booking deleted successfully", "booking_id": deleted_id}
        except Exception as e:
            await self.session.rollback()
            raise HTTPException(status_code=500, detail=str(e))

    async def get_booking_hotels(
            self,
            filters: BookingHotelFiltersSchema,
            params: RawParams,
    ) -> list[BookingHotelsSchema]:
        stmt = select(text("* FROM bookings")).limit(params.limit).offset(params.offset)
        if filters.sort:
            stmt = stmt.order_by(text(filters.sort))
        res = await self.session.execute(stmt)
        mapped_res = res.mappings().all()
        return self.booking_serializer_list.serialize_list(mapped_res)

    async def count(
            self,
    ) -> int:
        subquery = select(text("* FROM bookings")).subquery()
        stmt = select(func.count()).select_from(subquery)
        res = await self.session.execute(stmt)
        return res.scalar()
