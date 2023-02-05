from fastapi import Depends, FastAPI

from db.dependencies import get_influxDb
from db.influxDB import InfluxDbManager

from influxdb_client.client.write_api import SYNCHRONOUS

from loguru import logger


async def connect_to_influxDB() -> None:
    # Authentication process
    logger.info("Connecting to influxDB")

    influxdb_client: InfluxDbManager = get_influxDb()
    influxdb_client.initialise_write_api(write_options=SYNCHRONOUS)
    influxdb_client.initialise_query_api()

    logger.info("Connected to influxDB")


async def disconnect_from_influxDB() -> None:
    ...
