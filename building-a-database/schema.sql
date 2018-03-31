DROP TABLE IF EXISTS zoning_types;
DROP TABLE IF EXISTS construction_types;
DROP TABLE IF EXISTS accounts;

CREATE TABLE zoning_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE construction_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  zoning_type_id INTEGER,
  construction_type_id INTEGER
);
