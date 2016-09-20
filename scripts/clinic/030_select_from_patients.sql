-- count the number of patients by gender
SELECT gender, COUNT(*)
FROM patients
GROUP BY gender;

-- count the number of females strictly older than 64
SELECT COUNT(*)
FROM patients
WHERE gender = 'f'
AND date_part('year', age(born_on)) > 64;
-- SELECT COUNT(*) FROM patients WHERE gender = 'f' AND date_part('year', age(born_on)) >= 65;
-- SELECT COUNT(*) FROM patients WHERE gender = 'f' AND date_part('year', age(born_on, date '2016-09-20')) > 64;
