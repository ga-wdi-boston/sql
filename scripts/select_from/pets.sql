-- read rows of data about pets
SELECT *
FROM pets
INNER JOIN people
  ON people.id = pets.person_id
WHERE pets.id IN (1, 2);
