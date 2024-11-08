from typing import Optional

from fastapi import Query
from pydantic import BaseModel


class ClientsSchema(BaseModel):
    id: int
    name: str
    phone: str
    email: str


class ClientFiltersSchema(BaseModel):
    name: Optional[str] = Query(None, alias="name")
    email: Optional[str] = Query(None, alias="email")
