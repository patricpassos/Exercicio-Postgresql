--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2742

CREATE TABLE dimensions(
	id INTEGER PRIMARY KEY,
	name varchar(255)
);

CREATE TABLE life_registry(
	id INTEGER PRIMARY KEY,
	name VARCHAR(255),
	omega NUMERIC,
	dimensions_id INTEGER REFERENCES dimensions (id)
);


INSERT INTO dimensions(id, name)
VALUES 
      (1, 'C774'),
      (2, 'C784'),
      (3, 'C794'),
      (4, 'C824'),
      (5, 'C875');
      
INSERT INTO life_registry(id, name, omega, dimensions_id)
VALUES
	  (1, 'Richard Postman', 5.6, 2),	
	  (2, 'Simple Jelly', 1.4, 1),	
	  (3, 'Richard Gran Master', 2.5, 1),	
	  (4, 'Richard Turing', 6.4, 4),	
	  (5, 'Richard Strall',	1.0, 3);

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE life_registry, dimensions; --


/*
A sua primeira tarefa é selecionar todos os possíveis Richards das dimensões C875 e C774, junto a sua probabilidade de existência (o fator N) com a precisão de 3 casas decimais.
Lembre-se que (o fator N) é calculado multiplicando o valor omega por 1,618. Os dados devem ser ordenados pelo menor valor do campo omega.*/

SELECT *
FROM life_registry;

SELECT *
FROM life_registry
INNER JOIN dimensions ON life_registry.dimensions_id = dimensions.id;

SELECT life_registry.name, ROUND(CAST(omega * 1.618 AS numeric), 3) AS fator_n, dimensions.name
FROM life_registry
INNER JOIN dimensions ON life_registry.dimensions_id = dimensions.id
ORDER BY fator_n;

SELECT life_registry.name, ROUND(CAST(omega * 1.618 AS numeric), 3) AS fator_n
FROM life_registry
INNER JOIN dimensions ON life_registry.dimensions_id = dimensions.id
WHERE LOWER(life_registry.name) LIKE 'richard%' and dimensions.name IN ('C875', 'C774')
ORDER BY fator_n;

