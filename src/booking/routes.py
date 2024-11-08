from fastapi import APIRouter
from fastapi import Depends
from starlette import status
from fastapi_pagination import Params

from src.booking.descriptions.descriptions_info import CREATE_BOOK_HOTEL
from src.booking.descriptions.descriptions_info import UPDATE_BOOK_HOTEL
from src.booking.descriptions.descriptions_info import DELETE_BOOK_HOTEL
from src.booking.descriptions.descriptions_info import GET_BOOK_HOTEL
from src.booking.schemas.booking import BookingHotelFiltersSchema
from src.booking.controller import BookingController
from src.booking.pagination import BookingPagination
from src.booking.schemas.booking import BookingHotelsSchema

router = APIRouter()


@router.post(
    "",
    description=CREATE_BOOK_HOTEL,
    status_code=status.HTTP_201_CREATED,
)
async def create_booking(
        booking_request: BookingHotelsSchema,
        controller: BookingController = Depends()
) -> dict:
    return await controller.create_booking(booking_request)


@router.put(
    "/{booking_id}/",
    description=UPDATE_BOOK_HOTEL,
    status_code=status.HTTP_200_OK,
)
async def update_booking(
        booking_request: BookingHotelsSchema,
        booking_id: int,
        controller: BookingController = Depends()
) -> dict:
    return await controller.update_booking(booking_id=booking_id, booking_data=booking_request)


@router.delete(
    "/{booking_id}/",
    description=DELETE_BOOK_HOTEL,
    status_code=status.HTTP_200_OK
)
async def delete_booking(
        booking_id: int,
        controller: BookingController = Depends()
) -> dict:
    return await controller.delete_booking(booking_id=booking_id)


@router.get(
    "",
    description=GET_BOOK_HOTEL,
    status_code=status.HTTP_200_OK,
    response_model=BookingPagination[BookingHotelsSchema],
)
async def get_book_hotels(
        params: Params = Depends(),
        filters: BookingHotelFiltersSchema = Depends(),
        controller: BookingController = Depends()
) -> BookingPagination[BookingHotelsSchema]:
    return await controller.get_booking(params=params, filters=filters)
