from abc import ABC, abstractmethod
from typing import Any, Sequence

from pydantic import BaseModel


class BaseSerializer[V: Any, T: BaseModel](ABC):
    @abstractmethod
    def serialize(self, value: V, **kwargs) -> Sequence[T]:
        raise NotImplementedError


class BaseListSerializer[V: Sequence[Any], T: Sequence[BaseModel]](ABC):
    @abstractmethod
    def serialize_list(self, value: V, **kwargs) -> T:
        raise NotImplementedError
