CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  surname TEXT,
  given_name TEXT,
  gender CHAR(1),
  height INTEGER,
  weight INTEGER,
  born_on DATE
);
