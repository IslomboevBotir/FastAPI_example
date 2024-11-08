from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    POSTGRES_DB: str
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str
    POSTGRES_HOST: str
    POSTGRES_PORT: str

    model_config = SettingsConfigDict(
        env_file=".env"
    )


@lru_cache
def get_settings() -> Settings:
    return Settings()
