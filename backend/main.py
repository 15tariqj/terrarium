from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from influxDB import InfluxDbManager
import influxdb_client as influxd
from datetime import datetime

BUCKET_NAME="patientData"
MEASUREMENT_NAME=""
ORG="terrarium"
influxdb_client = InfluxDbManager()


app = FastAPI(
    title="Canary backend services"
)
# Configuring CORS policies
origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/at-risk-patients")
def get_at_risk_patient():
    return {"Hello": "World"}

'''
Assuming the payload sample is the following json format:

{
    'timestamp': ,
    'patientId': ,
    'vo2max_ml_per_min_per_kg': ,
    'saturation_samples': ,
    'vo2_samples': ,
    'avg_saturation_percentage': ,
    'temperature': ,
    'respiratory_rate': ,
    'avg_hr_bpm': ,
    'max_hr_bpm': 
}
'''
@app.post("/patient-data")
def write_patient_data(payload):
    """
    Write sensor data of protobuf type `sensor_readings_pb2.SensorReadingSet` to the influxDB
    """
    # TODO: Add in exception and logging

    for i in range(10):
        p = influxd \
            .Point("sensor_reading") \
            .time(datetime.fromtimestamp(payload['timestamp'] / 1000000)) \
            .field("patientId", payload['patientId'] ) \
            .field("vo2max_ml_per_min_per_kg", payload['vo2max_ml_per_min_per_kg'] ) \
            .field("saturation_samples", payload['saturation_samples'] ) \
            .field("vo2_samples", payload['vo2_samples'] ) \
            .field("avg_saturation_percentage", payload['avg_saturation_percentage'] ) \
            .field("temperature", payload['temperature'] ) \
            .field("respiratory_rate", payload['respiratory_rate'] ) \
            .field("avg_hr_bpm", payload['avg_hr_bpm'] ) \
            .field("max_hr_bpm", payload['max_hr_bpm'])

        influxdb_client.write_api.write(
            bucket=BUCKET_NAME,
            org=ORG,
            record_measurement_key=MEASUREMENT_NAME,
            record=p
        )


# Connecting to database
influxdb_client.check_connection()
