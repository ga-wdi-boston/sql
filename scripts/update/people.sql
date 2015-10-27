-- update rows of data about people
-- UPDATE people
-- SET middle_initial = 'N'
-- WHERE surname = 'Donovan'
--   AND given_name = 'Antony';

UPDATE people
SET middle_name = 'Nigel'
WHERE surname = 'Donovan'
  AND given_name = 'Antony';
