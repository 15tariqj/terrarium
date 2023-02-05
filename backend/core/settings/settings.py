from pydantic import BaseSettings
from functools import lru_cache


class Settings(BaseSettings):
    APP_NAME: str

    # InfluxDB configuration
    INFLUXDB_URL: str
    TOKEN: str
    ORG: str
    BUCKET_NAME: str
    MEASUREMENT_NAME: str

    class Config:
        env_file = ".env"


@lru_cache()
def get_settings():
    return Settings()
