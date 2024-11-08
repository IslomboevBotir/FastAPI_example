from __future__ import annotations
from math import ceil
from typing import TypeVar, Generic, Sequence, Any, Type, Optional

from fastapi_pagination.utils import create_pydantic_model, verify_params
from pydantic import BaseModel
from fastapi_pagination.bases import AbstractPage, AbstractParams
from fastapi_pagination.types import GreaterEqualZero, AdditionalData, ItemsTransformer
from fastapi_pagination import Params
from fastapi_pagination.api import apply_items_transformer, create_page, set_page

T = TypeVar("T")


class PageInfoMeta(BaseModel):
    total: GreaterEqualZero
    size: int
    page: int
    pages: int


class CustomPage(AbstractPage[T], Generic[T]):
    pagination: PageInfoMeta
    data: Sequence[T]

    __params_type__ = Params

    @classmethod
    def create(
            cls,
            items: Sequence[T],
            params: AbstractParams,
            total: int = None,
            **kwargs: Any,
    ) -> CustomPage[T]:
        if not isinstance(params, Params):
            raise TypeError("Page should be used with Params")

        size = params.size if params.size is not None else total
        page = params.page if params.page is not None else 1
        pages = ceil(total / size) if total is not None else None

        return create_pydantic_model(
            cls,
            data=items,
            pagination=PageInfoMeta(total=total, page=page, pages=pages, size=size),
            **kwargs,
        )


def paginate(
        page_cls: Type[AbstractPage],
        queryset: Sequence[T],
        total: int,
        params: Optional[AbstractParams] = None,
        *,
        transformer: Optional[ItemsTransformer] = None,
        additional_data: AdditionalData = {},
):
    params, _ = verify_params(params, "limit-offset")
    trans_items = apply_items_transformer(queryset, transformer)
    with set_page(page=page_cls):
        return create_page(trans_items, total, params, **additional_data)
