CREATE TABLE tb_cargo (
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	nivel VARCHAR(10), -- ausencia do comando NULL indica que pode ser nulo
	salario FLOAT
);

CREATE TABLE tb_departamento(
	id INT PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	sigla VARCHAR(10)
);

CREATE TABLE tb_funcionario(
	id INT,
	nome VARCHAR(30) NOT NULL,
	data_adm DATE,
	sexo CHAR(1),
	cod_cargo INT NOT NULL, --chave estrangeira não podem ser nulos
	cod_depto INT NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id),
	FOREIGN KEY(cod_depto) REFERENCES tb_departamento(id)
);

DROP TABLE tb_funcionario