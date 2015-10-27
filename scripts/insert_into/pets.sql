-- create rows with data about pets
INSERT INTO pets(name, dob)
  SELECT 'Manfred', '20110403' UNION
  SELECT 'Lee', '20090702'
;
