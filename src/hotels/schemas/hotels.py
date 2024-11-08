from typing import Optional

from fastapi import Query
from pydantic import BaseModel


class HotelsSchema(BaseModel):
    id: int
    title: str
    description: str


class HotelsFiltersParams(BaseModel):
    title: Optional[str] = Query(None, alias="title")
