-- create a table to store information about patients
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  family_name TEXT,
  given_name TEXT,
  gender TEXT,
  height INTEGER,
  weight INTEGER,
  born_on DATE
);
