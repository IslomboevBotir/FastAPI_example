from typing import Mapping

from pydantic import TypeAdapter

from src.core.serializers.base_serializer import BaseListSerializer, BaseSerializer
from src.hotels.schemas.hotels import HotelsSchema

hotels_adapter = TypeAdapter(list[HotelsSchema])


class HotelListSerializer(BaseListSerializer):
    def serialize_list(self, value: Mapping, **kwargs) -> list[HotelsSchema]:
        return hotels_adapter.validate_python(value, **kwargs)


class HotelSerializer(BaseSerializer):
    def serialize(self, value: Mapping, **kwargs) -> HotelsSchema:
        return HotelsSchema.model_validate(value)
