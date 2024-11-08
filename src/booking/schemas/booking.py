from datetime import date
from typing import Optional

from fastapi import Query
from pydantic import BaseModel
from pydantic import field_validator

from src.booking.descriptions.descriptions_info import SORT_DESCRIPTION
from src.booking.constants.order_by import BOOKING_SORT_BY_OPTIONS
from src.booking.constants.order_by import BOOKING_ORDER_BY


class BookingHotelsSchema(BaseModel):
    from_date: date
    to_date: date
    paid: bool = False
    hotel_id: int
    client_id: int


class BookingHotelFiltersSchema(BaseModel):
    sort: Optional[BOOKING_SORT_BY_OPTIONS] = Query("-created_at", description=SORT_DESCRIPTION)

    @field_validator("sort", mode="after")
    def get_orderings(cls, v):
        return BOOKING_ORDER_BY.get(v)
