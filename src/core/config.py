from functools import lru_cache
from typing import AsyncGenerator

from fastapi import Depends
from sqlalchemy.ext.asyncio import (AsyncEngine,
                                    async_sessionmaker,
                                    AsyncSession,
                                    create_async_engine)

from src.core.settings import get_settings

settings = get_settings()


@lru_cache
def get_engine() -> AsyncEngine:
    general_engine = create_async_engine(
        f"postgresql+asyncpg://{settings.POSTGRES_USER}:{settings.POSTGRES_PASSWORD}@{settings.POSTGRES_HOST}:{settings.POSTGRES_PORT}/{settings.POSTGRES_DB}",
        echo=True,
        echo_pool=True,
    )
    return general_engine


def get_session_maker(
        engine: AsyncEngine = Depends(get_engine)
) -> async_sessionmaker[AsyncSession]:
    async_session_maker = async_sessionmaker(
        autocommit=False,
        autoflush=False,
        bind=engine)
    return async_session_maker


async def get_session(
        session_maker: async_sessionmaker[AsyncSession] = Depends(get_session_maker)
) -> AsyncGenerator[AsyncSession, None]:
    async with session_maker() as session:
        await session.connection(
            execution_options={"isolation_level": "AUTOCOMMIT"}
        )
        yield session
