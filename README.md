# Blog API

## Запуск проекта

1. Клонируйте репозиторий.
2. Создайте `.env` в корне проекта, используя `.example.env` для примера, и убедитесь, что `DB_HOST` и `DB_PORT` не изменены:
    ```env
    POSTGRES_HOST=db
    POSTGRES_PORT=5432
    ```
3. Запустите приложение с помощью Docker Compose:
    ```bash
    docker-compose up --build
    ```

## Эндпоинты
- http://0.0.0.0:8000/docs