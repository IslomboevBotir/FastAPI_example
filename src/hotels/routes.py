from fastapi import APIRouter
from fastapi import Depends
from fastapi import status
from fastapi_pagination import Params

from src.hotels.controller import ManagementController
from src.hotels.pagination import HotelsPaginationPage
from src.hotels.schemas.hotels import HotelsSchema
from src.hotels.schemas.hotels import HotelsFiltersParams
from src.hotels.descriptions.descriptions_info import GET_ALL_HOTEL
from src.hotels.descriptions.descriptions_info import GET_HOTEL_BY_ID

router = APIRouter()


@router.get(
    "",
    response_model=HotelsPaginationPage[HotelsSchema],
    description=GET_ALL_HOTEL,
    status_code=status.HTTP_200_OK,
)
async def get_hotels(
        controller: ManagementController = Depends(),
        filters: HotelsFiltersParams = Depends(),
        params: Params = Depends(),
) -> HotelsPaginationPage[HotelsSchema]:
    return await controller.get_hotels(filters=filters, params=params)


@router.get(
    "/{hotel_id}/",
    response_model=HotelsSchema,
    description=GET_HOTEL_BY_ID,
    status_code=status.HTTP_200_OK,
)
async def get_hotel_by_id(
        hotel_id: int,
        controller: ManagementController = Depends(),
) -> HotelsSchema:
    return await controller.get_hotel_by_id(hotel_id=hotel_id)
