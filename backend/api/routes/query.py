from fastapi import APIRouter, Depends
from db.influxDB import InfluxDbManager
from db.dependencies import get_influxDb
import json

router = APIRouter()


@router.get("/patients-at-risk/")
async def read_influxDb(
        influxdb_client: InfluxDbManager = Depends(get_influxDb)
):
    tables = influxdb_client.query_sensor_data(
        influxdb_client.settings.BUCKET_NAME,
        "-24h",
        "atRisk"
    )

    return tables
