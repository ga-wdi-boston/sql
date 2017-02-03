-- retrieve info about patients
-- SELECT gender, COUNT(*)
-- FROM patients
-- GROUP BY gender;
-- SELECT COUNT(*)
-- FROM patients
-- WHERE gender = 'f'
-- AND date_part('year', age(born_on)) >= 65;
SELECT COUNT(*),
  CASE
    WHEN DATE_PART('year', AGE(born_on)) < 16
      THEN 'child'
    WHEN DATE_PART('year', AGE(born_on)) > 64
      THEN 'senior'
    ELSE
      'adult'
  END AS type
FROM patients
GROUP BY type;
