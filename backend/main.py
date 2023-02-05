from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from db.influxDB import InfluxDbManager
import influxdb_client as influxd
from datetime import datetime

BUCKET_NAME="patientData"
MEASUREMENT_NAME=""
ORG="terrarium"
QUERY_TIME_INTERVAL=""

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
    # Query database to get all the patients data
    tables = influxdb_client.query_api().query(f'from(bucket:{BUCKET_NAME}) |> range(start: -10m)')

    # Serialize to JSON
    output = tables.to_json(indent=5)

    # pass into function to calculate the most at risk patients
    return output

'''
Assuming the payload sample is the following json format:

{
    'timestamp': ,
    'patientId': ,
    'saturation_samples': ,
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
