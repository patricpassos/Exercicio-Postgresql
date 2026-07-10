--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2741

CREATE TABLE students(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  grade NUMERIC
);


INSERT INTO students(id, name, grade)
VALUES (1, 'Terry B. Padilla',7.3),
       (2, 'William S. Ray',0.6),
       (3, 'Barbara A. Gongora',5.2),
       (4, 'Julie B. Manzer', 6.7),
       (5, 'Teresa J. Axtell', 4.6),
       (6, 'Ben M. Dantzler', 9.6);

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE students; --

SELECT * 
FROM students;

-----------------------------------------------------------------
--First solution
SELECT *,
CASE
	WHEN grade >= 7.0 THEN 'Approved'
	ELSE NULL
END AS status
FROM students;


SELECT status AS name, grade
FROM (
	SELECT *,
	CASE
		WHEN grade >= 7.0 THEN CONCAT('Approved: ', name)
		ELSE NULL
	END AS status
	FROM students
) AS juncao
WHERE status IS NOT NULL
ORDER BY grade DESC;

-----------------------------------------------------------------
--Second solution
SELECT *
FROM students
WHERE grade > 7.0;

SELECT CONCAT('Approved: ', name) AS name, grade
FROM students
WHERE grade > 7.0
ORDER BY grade DESC;






