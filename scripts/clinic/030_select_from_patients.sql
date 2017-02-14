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
