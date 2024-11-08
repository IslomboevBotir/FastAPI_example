from fastapi import Depends
from fastapi_pagination import Params

from src.core.pagination import paginate
from src.clients.repositories.clients import ClientsRepository
from src.clients.pagination import ClientsPagination
from src.clients.schemas.clients import ClientsSchema
from src.clients.schemas.clients import ClientFiltersSchema


class ClientsController:
    def __init__(
            self,
            clients_repo: ClientsRepository = Depends(),
    ):
        self.clients_repo = clients_repo

    async def get_clients(
            self,
            filters: ClientFiltersSchema,
            params: Params
    ) -> ClientsPagination[ClientsSchema]:
        raw_params = params.to_raw_params()
        items = await self.clients_repo.get_clients(filters=filters, params=raw_params)
        count = await self.clients_repo.count(filters=filters)
        return paginate(
            page_cls=ClientsPagination,
            params=params,
            queryset=items,
            total=count,
        )

    async def get_client_by_id(
            self,
            client_id: int
    ) -> ClientsSchema:
        return await self.clients_repo.get_client_by_id(client_id=client_id)
