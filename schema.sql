CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "car_maker" (
    "id" UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    "name" TEXT NOT NULL
);

CREATE TABLE "car" (
    "id" UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "maker_id" UUID NOT NULL,
    FOREIGN KEY("maker_id") REFERENCES "car_maker"("id")
);

CREATE TABLE "person" (
    "id" UUID PRIMARY KEY DEFAULT UUID_GENERATE_V4(),
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

CREATE TABLE "car_owner" (
    "car_id" UUID NOT NULL,
    "person_id" UUID NOT NULL,
    FOREIGN KEY("car_id") REFERENCES "car"("id"),
    FOREIGN KEY("person_id") REFERENCES "person"("id"),
    PRIMARY KEY("car_id", "person_id")
);
