from fastapi import Depends
from fastapi_pagination import Params

from src.hotels.schemas.hotels import HotelsFiltersParams
from src.hotels.schemas.hotels import HotelsSchema
from src.hotels.repositories.hotels import HotelRepository
from src.hotels.pagination import HotelsPaginationPage
from src.core.pagination import paginate


class ManagementController:
    def __init__(
            self,
            hotels_repo: HotelRepository = Depends(),
    ):
        self.hotels_repo = hotels_repo

    async def   get_hotels(
            self,
            filters: HotelsFiltersParams,
            params: Params
    ) -> HotelsPaginationPage[HotelsSchema]:
        raw_params = params.to_raw_params()
        items = await self.hotels_repo.get_hotels(filters=filters, params=raw_params)
        count = await self.hotels_repo.count(filters=filters)
        return paginate(
            page_cls=HotelsPaginationPage,
            params=params,
            queryset=items,
            total=count
        )

    async def get_hotel_by_id(
            self,
            hotel_id: int
    ) -> HotelsSchema:
        return await self.hotels_repo.get_hotel_by_id(hotel_id)
