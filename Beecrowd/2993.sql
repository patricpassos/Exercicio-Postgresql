--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2993

CREATE TABLE value_table (
    amount integer
);

--GRANT SELECT ON value_table TO sql_user;

insert into
value_table (amount)
values
(4),(6),(7),(1),(1),(2),(3),(2),(3),(1),(5),(6),(1),(7),(8),(9),(10),(11),(12),(4),(5),(5),(3),(6),(2),(2),(1);

/*  Execute this query to drop the tables */
-- DROP TABLE value_table;

SELECT *
FROM value_table;

SELECT amount, COUNT(amount)
FROM value_table
GROUP BY amount
ORDER BY amount;

SELECT amount AS most_frequent_value
FROM(
	SELECT amount, COUNT(amount)
	FROM value_table
	GROUP BY amount
	ORDER BY amount
) as consulta
LIMIT 1;

-------------------------------------------------------------
SELECT amount AS most_frequent_value, COUNT(AMOUNT)
FROM value_table
GROUP BY amount
ORDER BY COUNT(AMOUNT) DESC
LIMIT 1;

SELECT amount AS most_frequent_value
FROM value_table
GROUP BY amount
ORDER BY COUNT(AMOUNT) DESC
LIMIT 1;
