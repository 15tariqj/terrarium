from fastapi import APIRouter, Depends
from db.influxDB import InfluxDbManager
from db.dependencies import get_influxDb
from pydantic import BaseModel
import datetime
import influxdb_client as influxd
router = APIRouter()


class patientData(BaseModel):
   time: datetime.datetime
   patientId: str
   vo2max_ml_per_min_per_kg: float
   avg_saturation_percentage: float
   temperature:float
   respiratory_rate:float
   avg_hr_bpm:float
   max_hr_bpm:float


@router.post("/patient-data/")
async def write_to_influxDb(
        influxdb_client: InfluxDbManager = Depends(get_influxDb),
        payload: patientData = None
):
   p = influxd \
      .Point("mem") \
      .time(payload.time) \
      .tag("patientId", payload.patientId) \
      .field("vo2max_ml_per_min_per_kg", payload.vo2max_ml_per_min_per_kg) \
      .field("avg_saturation_percentage", payload.avg_saturation_percentage) \
      .field("temperature", payload.temperature) \
      .field("respiratory_rate", payload.respiratory_rate) \
      .field("avg_hr_bpm", payload.avg_hr_bpm) \
      .field("max_hr_bpm", payload.max_hr_bpm)

   return influxdb_client.write_sensor_data_to_db(p)
