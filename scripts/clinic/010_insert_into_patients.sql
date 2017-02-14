INSERT INTO patients(family_name,given_name,gender,height,weight,born_on)
  SELECT 'Jett', 'Joan', 'f', 65, 120, DATE '1958-09-22'
  UNION
  SELECT 'Rollins', 'Henry', 'm', 69, 190, '1961-02-13'
;
