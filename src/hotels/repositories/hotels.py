from fastapi import Depends
from fastapi import Query

from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, text, func
from sqlalchemy.sql.selectable import Select
from fastapi_pagination.bases import RawParams

from src.core.config import get_session
from src.hotels.schemas.hotels import HotelsFiltersParams
from src.hotels.schemas.hotels import HotelsSchema
from src.core.repositories.base_repository import CountListABC
from src.hotels.serializers.hotels import HotelListSerializer, HotelSerializer


class HotelRepository(CountListABC):
    def __init__(
            self,
            session: AsyncSession = Depends(get_session),
            hotels_serializer: HotelListSerializer = Depends(),
            hotel_serializer: HotelSerializer = Depends(),
    ):
        self.session = session
        self.hotels_serializer = hotels_serializer
        self.hotel_serializer = hotel_serializer

    async def get_hotels(
            self,
            filters: HotelsFiltersParams,
            params: RawParams
    ) -> list[HotelsSchema]:
        stmt = select(text("* FROM hotels")).limit(params.limit).offset(params.offset)
        stmt = self._filter_by_query(stmt=stmt, filters=filters)
        res = await self.session.execute(stmt)
        mapped_res = res.mappings().all()
        return self.hotels_serializer.serialize_list(mapped_res)

    async def count(
            self,
            filters: HotelsFiltersParams
    ) -> int:
        subquery = select(text("* FROM hotels")).subquery()
        stmt = select(func.count()).select_from(subquery)
        stmt = self._filter_by_query(stmt=stmt, filters=filters)
        res = await self.session.execute(stmt)
        return res.scalar()

    @staticmethod
    def _filter_by_query(
            stmt: Query,
            filters: HotelsFiltersParams
    ) -> Select:
        if filters.title:
            stmt = stmt.where(text("title = :title").bindparams(title=filters.title))
        return stmt

    async def get_hotel_by_id(
            self,
            hotel_id: int,
    ) -> HotelsSchema:
        stmt = select(
            text("id, title, description FROM hotels WHERE hotels.id = :hotel_id").bindparams(hotel_id=hotel_id))
        res = await self.session.execute(stmt)
        mapped_res = res.mappings().one()
        return self.hotel_serializer.serialize(mapped_res)
