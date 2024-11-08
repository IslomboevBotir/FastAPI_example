from fastapi import APIRouter
from fastapi import Depends
from starlette import status
from fastapi_pagination import Params

from src.clients.descriptions.descriptions_info import GET_ALL_CLIENTS
from src.clients.descriptions.descriptions_info import GET_CLIENT_BY_ID
from src.clients.controller import ClientsController
from src.clients.pagination import ClientsPagination
from src.clients.schemas.clients import ClientsSchema
from src.clients.schemas.clients import ClientFiltersSchema

router = APIRouter()


@router.get(
    "",
    response_model=ClientsPagination[ClientsSchema],
    description=GET_ALL_CLIENTS,
    status_code=status.HTTP_200_OK,
)
async def get_clients(
        filters: ClientFiltersSchema = Depends(),
        controller: ClientsController = Depends(),
        params: Params = Depends(),
) -> ClientsPagination[ClientsSchema]:
    return await controller.get_clients(filters, params)


@router.get(
    "/{client_id}/",
    response_model=ClientsSchema,
    description=GET_CLIENT_BY_ID,
    status_code=status.HTTP_200_OK,
)
async def get_client_by_id(
        client_id: int,
        controller: ClientsController = Depends(),
):
    return await controller.get_client_by_id(client_id)
