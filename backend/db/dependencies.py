from db.influxDB import InfluxDbManager

influxDb = InfluxDbManager()


def get_influxDb() -> InfluxDbManager:
    return influxDb
