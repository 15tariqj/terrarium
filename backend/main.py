from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from influxDB import InfluxDbManager
from influxdb_client.client.write_api import SYNCHRONOUS, WriteOptions

BUCKET_NAME="patientData"
MEASUREMENT_NAME=""

influxdb_client = InfluxDbManager()

def create_application() -> FastAPI:

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

    # Connecting to database
    influxdb_client.check_connection()

    return app


session = create_application()
