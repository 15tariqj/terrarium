from datetime import datetime
from influxdb_client.client.write_api import SYNCHRONOUS, WriteOptions
from influxdb_client.rest import ApiException
from loguru import logger
from core.settings.settings import get_settings

import influxdb_client


class InfluxDbManager:
    def __init__(self):
        self.settings = get_settings()
        self.write_api = None
        self.query_api = None

        try:
            self.influxDbClient = influxdb_client.InfluxDBClient(
                url=self.settings.INFLUXDB_URL,
                token=self.settings.TOKEN,
                org=self.settings.ORG
            )
        except ApiException as e:
            # missing credentials
            if e.status == 404:
                raise Exception(f"The specified token doesn't have sufficient credentials") from e
            raise

        # Check if designated bucket exists or not

    # Authentication functions
    def create_token_with_user(self, user):
        ...

    # Initialise APIs
    def initialise_write_api(self, write_options):
        self.write_api = self.influxDbClient.write_api(
            write_options=WriteOptions(
                batch_size=10,
                flush_interval=10_000,
                jitter_interval=2_000,
                retry_interval=5_000
            )
        )

    def initialise_query_api(self):
        self.query_api = self.influxDbClient.query_api()

    # Verification functions
    def check_connection(self):
        self.influxDbClient.api_client.call_api('/ping', 'GET')
        print("ok")

    def check_query(self, bucket):
        try:
            self.influxDbClient.query_api().query(f"from(bucket:\"{bucket}\") |> range(start: -1m) |> limit(n:1)",
                                                  self.settings["ORG"])
        except ApiException as e:
            # missing credentials
            if e.status == 404:
                raise Exception(f"The specified token doesn't have sufficient credentials to read from '{bucket}' "
                                f"or specified bucket doesn't exists.") from e
            raise
        print("ok")

    def check_write(self, bucket):
        try:
            self.influxDbClient.write_api(write_options=SYNCHRONOUS).write(bucket, self.settings["ORG"], b"")
        except ApiException as e:
            # bucket does not exist
            if e.status == 404:
                raise Exception(f"The specified bucket does not exist.") from e
            # insufficient permissions
            if e.status == 403:
                raise Exception(
                    f"The specified token does not have sufficient credentials to write to '{bucket}'.") from e
            # 400 (BadRequest) caused by empty LineProtocol
            if e.status != 400:
                raise
        print("ok")

    # Write and read functions
    def write_sensor_data_to_db(self, payload):
        p = influxdb_client \
            .Point("sensor_reading") \
            .time(datetime.fromtimestamp(payload['timestamp'] / 1000000)) \
            .field("patientId", payload['patientId']) \
            .field("vo2max_ml_per_min_per_kg", payload['vo2max_ml_per_min_per_kg']) \
            .field("saturation_samples", payload['saturation_samples']) \
            .field("vo2_samples", payload['vo2_samples']) \
            .field("avg_saturation_percentage", payload['avg_saturation_percentage']) \
            .field("temperature", payload['temperature']) \
            .field("respiratory_rate", payload['respiratory_rate']) \
            .field("avg_hr_bpm", payload['avg_hr_bpm']) \
            .field("max_hr_bpm", payload['max_hr_bpm'])

        self.write_api.write(
            bucket=self.settings["BUCKET_NAME"],
            org=self.settings["ORG"],
            record_measurement_key=self.settings["MEASUREMENT_NAME"],
            record=p
        )

    def query_sensor_data(self, bucket, time_interval, measurement, field):
        # Query database to get all the patients data
        query = f'from(bucket:"{bucket}") \
                  |> range(start: {time_interval})'

        tables = self.query_api.query(org=self.settings.ORG, query=query)

        # Serialize to JSON
        return tables.to_json(indent=5)
