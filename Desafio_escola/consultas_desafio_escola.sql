/*QUESTÃO 1: nome do curso, número e data de início de cada turma de cada curso.*/

SELECT *
FROM tb_curso;

SELECT *
FROM tb_turma;

SELECT *
FROM tb_curso
INNER JOIN tb_turma ON tb_curso.id = tb_turma.curso_id;

SELECT 
nome AS curso,
numero AS turma,
inicio
FROM tb_curso
INNER JOIN tb_turma ON tb_curso.id = tb_turma.curso_id;

/*QUESTÃO 2: nome do curso, número da turma, nome e CPF dos alunos de cada curso e cada turma. Os nomes das colunas devem ser curso, turma, aluno e cpf, conforme exemplo.*/

SELECT * FROM tb_aluno;
SELECT * FROM tb_matricula;

SELECT *
FROM tb_aluno
INNER JOIN tb_matricula ON tb_aluno.cpf = tb_matricula.aluno_id
INNER JOIN tb_turma ON tb_matricula.turma_id = tb_turma.id
INNER JOIN tb_curso ON tb_curso.id = tb_turma.curso_id;

SELECT 
tb_curso.nome AS curso,
numero AS turma,
tb_aluno.nome AS aluno,
tb_aluno.cpf AS cpf
FROM tb_aluno
INNER JOIN tb_matricula ON tb_aluno.cpf = tb_matricula.aluno_id
INNER JOIN tb_turma ON tb_matricula.turma_id = tb_turma.id
INNER JOIN tb_curso ON tb_curso.id = tb_turma.curso_id;

/*QUESTÃO 3: listagem de data e nota de todas avaliações já ocorridas, juntamente com
nome, nota obtida por cada aluno em cada avaliação, e também qual a porcentagem de
nota obtida em relação à nota da avaliação. Os resultados devem estar ordenados da
avaliação mais recente para a mais antiga, e, para cada avaliação, os nomes dos alunos
devem estar ordenados em ordem crescente. A porcentagem deve ter duas casas decimais. */

SELECT * FROM tb_resultado;

SELECT * 
FROM tb_resultado
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id;

SELECT 
data,
nota,
nome,
nota_obtida,
FROM tb_resultado
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id;

SELECT 
data,
nota,
nome,
nota_obtida,
ROUND(((nota_obtida / nota) * 100), 2) AS porcentagem
FROM tb_resultado
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id
ORDER BY data DESC, nome ASC;

/*QUESTÃO 4 : nome e nota total dos alunos da turma 10 (ATENÇÃO: você deve restringir a turma pelo número 10 dela, e não pelo id 2).*/

SELECT * FROM tb_resultado;

SELECT *
FROM tb_resultado
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_turma ON tb_avaliacao.turma_id = tb_turma.id;

SELECT
nome,
nota_obtida,
numero
FROM tb_resultado
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_turma ON tb_avaliacao.turma_id = tb_turma.id;

SELECT
nome,
nota_obtida,
numero
FROM tb_resultado
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_turma ON tb_avaliacao.turma_id = tb_turma.id
WHERE numero = 10
order by nome;

SELECT
nome,
SUM(nota_obtida) AS total
FROM tb_resultado
INNER JOIN tb_aluno ON tb_resultado.aluno_id = tb_aluno.cpf
INNER JOIN tb_avaliacao ON tb_resultado.avaliacao_id = tb_avaliacao.id
INNER JOIN tb_turma ON tb_avaliacao.turma_id = tb_turma.id
WHERE numero = 10
GROUP BY nome;
