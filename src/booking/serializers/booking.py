from typing import Mapping

from pydantic import TypeAdapter

from src.core.serializers.base_serializer import BaseListSerializer, BaseSerializer
from src.booking.schemas.booking import BookingHotelsSchema

hotels_adapter = TypeAdapter(list[BookingHotelsSchema])


class BookingListSerializer(BaseListSerializer):
    def serialize_list(self, value: Mapping, **kwargs) -> list[BookingHotelsSchema]:
        return hotels_adapter.validate_python(value, **kwargs)
