from fastapi import APIRouter, Depends
from db.influxDB import InfluxDbManager
from db.dependencies import get_influxDb
from pydantic import BaseModel
import datetime
import influxdb_client as influxd
import json


router = APIRouter()


START_TIME = "2023-02-04T00:00:00Z"
STOP_TIME = "2023-02-04T04:30:00Z"


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

   # Write to database
   influxdb_client.write_sensor_data_to_db(p, influxdb_client.settings.MEASUREMENT_NAME)

   # Query patient historical data to determine if at risk
   query = f'from(bucket:"{influxdb_client.settings.BUCKET_NAME}") \
            |> range(start: {START_TIME}, stop: {STOP_TIME}) \
            |> filter(fn:(r) => r._measurement == "{influxdb_client.settings.MEASUREMENT_NAME}") \
            |> filter(fn: (r) => r["_field"] == "avg_saturation_percentage" or r["_field"] == "avg_hr_bpm") \
            |> filter(fn: (r) => r["patientId"] == "{payload.patientId}")'

   tables = influxdb_client.query_api.query(org=influxdb_client.settings.ORG, query=query)

   # Serialize to JSON
   jsonTables = json.loads(tables.to_json(indent=5))

   # Process into reading arrays
   heart_rate = []
   saturation = []

   for entry in jsonTables:
      if entry["_field"] == "avg_saturation_percentage":
         saturation.append(entry["_value"])
      elif entry["_field"] == "avg_hr_bpm":
         heart_rate.append(entry["_value"])

   # Detect if patient at risk
   if (heart_rate[0] < heart_rate[(len(heart_rate) - 1)]) and ((1 - (saturation[(len(saturation) - 1)] / saturation[0])) > 0.04):
      p = influxd \
         .Point("atRisk") \
         .time(payload.time) \
         .tag("patientId", int(payload.patientId)) \
         .field("vo2max_ml_per_min_per_kg", payload.vo2max_ml_per_min_per_kg) \
         .field("avg_saturation_percentage", payload.avg_saturation_percentage) \
         .field("temperature", payload.temperature) \
         .field("respiratory_rate", payload.respiratory_rate) \
         .field("avg_hr_bpm", payload.avg_hr_bpm) \
         .field("max_hr_bpm", payload.max_hr_bpm)

      influxdb_client.write_sensor_data_to_db(p, "atRisk")
