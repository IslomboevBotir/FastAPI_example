from abc import ABC, abstractmethod


class CountListABC(ABC):
    @abstractmethod
    async def count(self, filters: dict) -> int:
        raise NotImplementedError
