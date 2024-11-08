from fastapi import Depends
from fastapi_pagination import Params

from src.booking.schemas.booking import BookingHotelsSchema
from src.booking.repositories.booking_hotels import BookingRepository
from src.booking.schemas.booking import BookingHotelFiltersSchema
from src.core.pagination import paginate
from src.booking.pagination import BookingPagination


class BookingController:
    def __init__(
            self,
            booking_repository: BookingRepository = Depends(),
    ):
        self.booking_repository = booking_repository

    async def create_booking(
            self,
            booking_data: BookingHotelsSchema,
    ) -> dict:
        return await self.booking_repository.create_booking_hotels(booking_data)

    async def update_booking(
            self,
            booking_data: BookingHotelsSchema,
            booking_id: int,
    ) -> dict:
        return await self.booking_repository.update_booking_hotels(booking_data=booking_data, booking_id=booking_id)

    async def delete_booking(
            self,
            booking_id: int,
    ) -> dict:
        return await self.booking_repository.delete_booking_hotels(booking_id=booking_id)

    async def get_booking(
            self,
            params: Params,
            filters: BookingHotelFiltersSchema,
    ) -> BookingPagination[BookingHotelsSchema]:
        raw_params = params.to_raw_params()
        items = await self.booking_repository.get_booking_hotels(filters=filters, params=raw_params)
        count = await self.booking_repository.count()
        return paginate(
            page_cls=BookingPagination,
            queryset=items,
            params=params,
            total=count,
        )
