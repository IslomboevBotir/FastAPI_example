from typing import Mapping, Sequence
from pydantic import TypeAdapter

from src.clients.schemas.clients import ClientsSchema
from src.core.serializers.base_serializer import BaseListSerializer
from src.core.serializers.base_serializer import BaseSerializer

clients_type_adapter = TypeAdapter(list[ClientsSchema])


class ClientsListSerializer(BaseListSerializer, BaseSerializer):
    def serialize_list(self, value: Mapping, **kwargs) -> list[ClientsSchema]:
        return clients_type_adapter.validate_python(value, **kwargs)

    def serialize(self, value: Mapping, **kwargs) -> ClientsSchema:
        return ClientsSchema.model_validate(value)
