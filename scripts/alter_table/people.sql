-- add or remove columns about people
-- ALTER TABLE people ADD COLUMN middle_initial CHARACTER VARYING(1);

-- ALTER TABLE people ALTER COLUMN middle_initial TYPE text;

-- ALTER TABLE people RENAME COLUMN middle_initial TO middle_name;

ALTER TABLE people ADD COLUMN place_id INTEGER REFERENCES places(id);

