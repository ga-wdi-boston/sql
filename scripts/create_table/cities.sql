-- create a table to store information about cities
CREATE TABLE places(id SERIAL PRIMARY KEY,
                    number INTEGER,
                    street TEXT,
                    city TEXT,
                    state TEXT,
                    country TEXT,
                    postal_code TEXT);
