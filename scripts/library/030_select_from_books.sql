 -- return all records
SELECT *
FROM books;
-- return the first ten records
SELECT *
FROM books
LIMIT 10;
-- return the only book with id of 42
SELECT *
FROM books
WHERE id=42;
-- return only books with the string 'heinlein' somewhere in the author column
SELECT *
FROM books
WHERE author ILIKE '%heinlein%';
-- return only books published in the year 2000
SELECT *
FROM books
WHERE published_on >= '2000-01-01'
AND published_on < '2000-12-31';
-- return all the authors who have more than one book, the total books they have, in descending order
SELECT author, COUNT(*)
FROM books
GROUP BY author
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;
