from fastapi import APIRouter, Depends
from db.influxDB import InfluxDbManager
from db.dependencies import get_influxDb


router = APIRouter()


@router.post("/patient-data/")
async def write_to_influxDb():
   ...
