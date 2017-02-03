-- create a table to store information about books
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title TEXT,
  author TEXT,
  original_language TEXT,
  first_published INTEGER
);
