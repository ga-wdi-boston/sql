-- read rows of data about people
SELECT *
FROM people
WHERE surname = 'Donovan'
  OR surname = 'Diaz'
  AND gender = 'f'
ORDER BY given_name;

SELECT COUNT(*) as num, gender
FROM people
GROUP BY gender
HAVING num > 1202;

SELECT COUNT(*), SUBSTR(dob, 1, 4)
FROM people
WHERE dob BETWEEN '1990' AND '19991231'
GROUP BY SUBSTR(dob, 1, 4)
ORDER BY SUBSTR(dob, 1, 4);
