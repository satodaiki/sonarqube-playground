import os
import sqlalchemy as sa
from sqlalchemy.engine.url import URL

PG_DBNAME = os.getenv("PG_DBNAME", "postgres")
PG_USER = os.getenv("PG_USER", "postgres")
PG_PASSWORD = os.getenv("PG_PASSWORD", "example")
PG_HOST = os.getenv("PG_HOST", "localhost")
PG_PORT = os.getenv("PG_PORT", 5432)

url = URL(
    "postgresql",
    username=PG_USER,
    password=PG_PASSWORD,
    host=PG_HOST,
    port=PG_PORT,
    database=PG_DBNAME,
)

engine = sa.create_engine(url)

conn = engine.connect()

def get_car_id_by_year(year: int) -> int:
    return conn \
        .execute(sa.text(f"SELECT id FROM car WHERE year = {year}")) \
        .scalar_one()


def test():
    print("hello world")
    pass


r = get_car_id_by_year(2020)

print(r)
