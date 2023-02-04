from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from influxDB import InfluxDbManager
from influxdb_client.client.write_api import SYNCHRONOUS, WriteOptions

BUCKET_NAME="patientData"
MEASUREMENT_NAME=""

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

@app.post("/patient-data")
def write_patient_data():
    return {"Hello": "World"}

# Connecting to database
influxdb_client.check_connection()
