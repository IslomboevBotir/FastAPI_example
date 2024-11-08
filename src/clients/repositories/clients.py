from fastapi import Depends
from fastapi import Query
from sqlalchemy import select
from sqlalchemy import text
from sqlalchemy import func
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.sql.selectable import Select
from fastapi_pagination.bases import RawParams

from src.core.config import get_session
from src.clients.schemas.clients import ClientFiltersSchema
from src.clients.schemas.clients import ClientsSchema
from src.core.repositories.base_repository import CountListABC
from src.clients.serializers.serializers import ClientsListSerializer


class ClientsRepository(CountListABC):
    def __init__(
            self,
            session: AsyncSession = Depends(get_session),
            clients_serializer: ClientsListSerializer = Depends(),
    ):
        self.session = session
        self.clients_serializer = clients_serializer

    async def get_clients(
            self,
            params: RawParams,
            filters: ClientFiltersSchema
    ) -> list[ClientsSchema]:
        stmt = select(text("* FROM clients")).limit(params.limit).offset(params.offset)
        stmt = self._filter_by_query(stmt=stmt, filters=filters)
        res = await self.session.execute(stmt)
        mapped_res = res.mappings().all()
        return self.clients_serializer.serialize_list(mapped_res)

    async def count(
            self,
            filters: ClientFiltersSchema
    ) -> int:
        subquery = select(text("* FROM clients")).subquery()
        stmt = select(func.count()).select_from(subquery)
        stmt = self._filter_by_query(stmt=stmt, filters=filters)
        res = await self.session.execute(stmt)
        return res.scalar()

    @staticmethod
    def _filter_by_query(
            stmt: Query,
            filters: ClientFiltersSchema
    ) -> Select:
        if filters.name:
            stmt = stmt.where(text("name = :name").bindparams(name=filters.name))
        if filters.email:
            stmt = stmt.where(text("email = :email").bindparams(email=filters.email))
        return stmt

    async def get_client_by_id(
            self,
            client_id: int
    ) -> ClientsSchema:
        stmt = select(text("* FROM clients WHERE clients.id = :clients_id").bindparams(clients_id=client_id))
        res = await self.session.execute(stmt)
        mapped_res = res.mappings().one()
        return self.clients_serializer.serialize(mapped_res)
