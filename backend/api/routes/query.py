from fastapi import APIRouter, Depends
from db.influxDB import InfluxDbManager
from db.dependencies import get_influxDb


router = APIRouter()


@router.get("/patients-at-risk/")
async def read_influxDb(
        influxdb_client: InfluxDbManager = Depends(get_influxDb),
        bucket: str = None,
        time_interval: str = None,
        measurement: str = None,
        field: str = None
):
    return influxdb_client.query_sensor_data(
        bucket,
        time_interval,
        measurement,
        field
    )
