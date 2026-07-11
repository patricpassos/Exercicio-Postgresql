--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 3001

CREATE TABLE products (
id numeric PRIMARY KEY,
name varchar(50),
type char,
price numeric
);

--GRANT SELECT ON products TO sql_user;

INSERT INTO products (id , name, type, price)
VALUES
(1, 'Monitor',  'B', 0),
(2, 'Headset',  'A', 0),
(3, 'PC Case',  'A', 0),
(4, 'Computer Desk', 'C', 0),
(5, 'Gaming Chair', 'C', 0),
(6, 'Mouse',  'A', 0);

/*  Execute this query to drop the tables */
-- DROP TABLE products;
/*
Se o tipo do produto é igual A, o preço será 20.0
Se o tipo do produto é igual B, o preço será 70.0
Se o tipo do produto é igual C, o preço será 530.5
*/

SELECT *
FROM products;

SELECT id, name, type,
CASE
	WHEN UPPER(type) = 'A' THEN 20.0
	WHEN UPPER(type) = 'B' THEN 70.0
	ELSE 530.50
END
FROM products;

SELECT id, name, type,
CASE
	WHEN UPPER(type) = 'A' THEN 20.0
	WHEN UPPER(type) = 'B' THEN 70.0
	ELSE 530.50
END AS price
FROM products;


SELECT id, name, type,
CASE
	WHEN UPPER(type) = 'A' THEN 20.0
	WHEN UPPER(type) = 'B' THEN 70.0
	ELSE 530.50
END AS price
FROM products
ORDER BY type, id DESC;

SELECT name,
CASE
	WHEN type = 'A' THEN 20.0
	WHEN type = 'B' THEN 70.0
	WHEN type = 'C' THEN 530.5
END AS price
FROM products
ORDER BY type, id DESC;
