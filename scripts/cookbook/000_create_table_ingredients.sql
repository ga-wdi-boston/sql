-- create a table to store information about books

CREATE TABLE ingredients (
  id SERIAL PRIMARY KEY,
  name TEXT,
  unit CHAR(4) -- or TEXT (future-proofing; what are the tradeoffs?)
);
