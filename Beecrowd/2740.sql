--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2740

CREATE TABLE league(
  position INTEGER,
  team CHARACTER VARYING (255)
);


INSERT INTO league(position, team)
VALUES (1, 'The Quack Bats'),
       (2, 'The Responsible Hornets'),
       (3, 'The Bawdy Dolphins'),
       (4, 'The Abstracted Sharks'),
       (5, 'The Nervous Zebras'),
       (6, 'The Oafish Owls'),
       (7, 'The Unequaled Bison'),
       (8, 'The Keen Kangaroos'),
       (9, 'The Left Nightingales'),
       (10, 'The Terrific Elks'),
       (11, 'The Lumpy Frogs'),
       (12, 'The Swift Buffalo'),
       (13, 'The Big Chargers'),
       (14, 'The Rough Robins'),
       (15, 'The Silver Crocs');

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE league; --

SELECT *
FROM league;

SELECT position, team,
CASE
	WHEN position = 1 THEN CONCAT('Podium: ', team)
	WHEN position = 2 THEN CONCAT('Podium: ', team)
	WHEN position = 3 THEN CONCAT('Podium: ', team)
	WHEN position = 14 THEN CONCAT('Demoted: ', team)
	WHEN position = 15 THEN CONCAT('Demoted: ', team)
END AS name
FROM league;

SELECT 
CASE
	WHEN position = 1 THEN CONCAT('Podium: ', team)
	WHEN position = 2 THEN CONCAT('Podium: ', team)
	WHEN position = 3 THEN CONCAT('Podium: ', team)
	WHEN position = 14 THEN CONCAT('Demoted: ', team)
	WHEN position = 15 THEN CONCAT('Demoted: ', team)
END AS name
FROM league
WHERE position IN(1, 2, 3, 14, 15);

------------------------------------------------------------------
SELECT *
FROM league;

SELECT position, CONCAT('Podium: ', team)
FROM league
LIMIT 3;

SELECT position, CONCAT('Demoted: ', team)
FROM league
ORDER BY position DESC
LIMIT 2;

SELECT *
FROM (
	(SELECT position, CONCAT('Podium: ', team)
	FROM league
	LIMIT 3)
	
	UNION ALL
	
	(SELECT position, CONCAT('Demoted: ', team)
	FROM league
	ORDER BY position DESC
	LIMIT 2)
) AS uniao

SELECT concat AS name
FROM (
	(SELECT position, CONCAT('Podium: ', team)
	FROM league
	LIMIT 3)
	
	UNION
	
	(SELECT position, CONCAT('Demoted: ', team)
	FROM league
	ORDER BY position DESC
	LIMIT 2)
) AS uniao

