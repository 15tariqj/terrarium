from typing import Callable

from fastapi import FastAPI

from db.events import connect_to_influxDB, disconnect_from_influxDB

from loguru import logger


def create_start_app_handler(app: FastAPI) -> Callable:
    async def start_app() -> None:
        logger.info("Starting up backend services")

        await connect_to_influxDB()

    return start_app


def create_close_app_handler(app: FastAPI) -> Callable:
    async def close_app() -> None:
        ...

    return close_app
