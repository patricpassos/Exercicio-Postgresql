--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2988

CREATE TABLE teams (
    id integer PRIMARY KEY,
    name varchar(50)
);

--GRANT SELECT ON teams TO sql_user;

CREATE TABLE matches  (
    id integer PRIMARY KEY,
    team_1 integer,
    team_2 integer,
    team_1_goals integer,
    team_2_goals integer,
    FOREIGN KEY (team_1) REFERENCES teams(id),
    FOREIGN KEY (team_2) REFERENCES teams(id)
);

--GRANT SELECT ON matches TO sql_user;
insert into teams
    (id, name)
values
    (1,'CEARA'),
    (2,'FORTALEZA'),
    (3,'GUARANY DE SOBRAL'),
    (4,'FLORESTA');

insert into  matches
    (id, team_1, team_2, team_1_goals, team_2_goals)
values
    (1,4,1,0,4),
    (2,3,2,0,1),
    (3,1,3,3,0),
    (4,3,4,0,1),
    (5,1,2,0,0),
    (6,2,4,2,1);

/* Execute this query to drop the table */

SELECT *
FROM matches;

SELECT *
FROM teams;

SELECT *
FROM teams
LEFT JOIN matches ON teams.id = matches.team_1 OR teams.id = matches.team_2;

----------------------------------------------------------------------------------------------
SELECT *,
CASE
	WHEN (teams.id = team_1 AND team_1_goals > team_2_goals) 
    OR (teams.id = team_2 AND team_2_goals > team_1_goals) THEN 1
    ELSE 0
END AS victories,

CASE
	WHEN (teams.id = team_1 AND team_1_goals < team_2_goals) 
    OR (teams.id = team_2 AND team_2_goals < team_1_goals) THEN 1
    ELSE 0
END AS defeats,

CASE
	WHEN team_1_goals = team_2_goals THEN 1
    ELSE 0
END AS draws,

CASE
	WHEN (teams.id = team_1 AND team_1_goals > team_2_goals) 
    OR (teams.id = team_2 AND team_2_goals > team_1_goals) THEN 3
	WHEN team_1_goals = team_2_goals THEN 1
	ELSE 0
END AS score

FROM teams
LEFT JOIN matches ON teams.id = matches.team_1 OR teams.id = matches.team_2;

-----------------------------------------------------------------------------------------

SELECT teams.name, COUNT(teams.id) AS matches,
SUM(CASE
	WHEN (teams.id = team_1 AND team_1_goals > team_2_goals) 
    OR (teams.id = team_2 AND team_2_goals > team_1_goals) THEN 1
    ELSE 0
END) AS victories,

SUM(CASE
	WHEN (teams.id = team_1 AND team_1_goals < team_2_goals) 
    OR (teams.id = team_2 AND team_2_goals < team_1_goals) THEN 1
    ELSE 0
END) AS defeats,

SUM(CASE
	WHEN team_1_goals = team_2_goals THEN 1
    ELSE 0
END) AS draws,

SUM(CASE
	WHEN (teams.id = team_1 AND team_1_goals > team_2_goals) 
    OR (teams.id = team_2 AND team_2_goals > team_1_goals) THEN 3
	WHEN team_1_goals = team_2_goals THEN 1
	ELSE 0
END) AS score

FROM teams
LEFT JOIN matches ON teams.id = matches.team_1 OR teams.id = matches.team_2
GROUP BY teams.id, teams.name
ORDER BY score DESC;

