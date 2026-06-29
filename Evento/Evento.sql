CREATE TABLE tb_categoria (
	id INT PRIMARY KEY,
	descricao VARCHAR(20) NOT NULL
);

CREATE TABLE tb_atividade (
	id INT PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	descricao VARCHAR(50),
	preco FLOAT,
	categoria_id INT NOT NULL,
	FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
);

CREATE TABLE tb_bloco (
	id INT PRIMARY KEY,
	inicio TIMESTAMP,
	fim TIMESTAMP,
	atividade_id INT NOT NULL,
	FOREIGN KEY(atividade_id) REFERENCES tb_atividade(id)
);

CREATE TABLE tb_participante (
	id INT PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	email VARCHAR(20) NOT NULL
);

ALTER TABLE tb_participante ADD UNIQUE (email);

CREATE TABLE tb_participacao (
	participante_id int  NOT NULL,
	atividade_id int NOT NULL,
	PRIMARY KEY (participante_id, atividade_id), -- A chave primaria e a junção das duas chaves estrangeiras
	FOREIGN KEY(participante_id) REFERENCES tb_participante(id),
	FOREIGN KEY(atividade_id) REFERENCES tb_atividade(id)
);