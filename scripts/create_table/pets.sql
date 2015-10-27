-- create a table to store information about pets
CREATE TABLE pets (id SERIAL PRIMARY KEY,
                   dob TEXT NOT NULL,
                   kind TEXT NOT NULL,
                   name TEXT NOT NULL,
--                   person_id INTEGER,
--  FOREIGN KEY (person_id)
--  REFERENCES people(id)
);
