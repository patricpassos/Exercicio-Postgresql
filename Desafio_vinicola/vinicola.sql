CREATE TABLE tb_regiao (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	localidade_s FLOAT NOT NULL,
	localidade_w FLOAT NOT NULL,
	descricao VARCHAR(20)
);

CREATE TABLE tb_vinicola (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	descricao TEXT,
	fone VARCHAR(12),
	email VARCHAR(30) UNIQUE NOT NULL,
	regiao_id INT NOT NULL,
	FOREIGN KEY(regiao_id) REFERENCES tb_regiao(id)
);

CREATE TABLE tb_tipo_vinho (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL
);

CREATE TABLE tb_vinho (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30),
	tipo_id INT NOT NULL,
	preco FLOAT,
	vinicola_id INT NOT NULL,
	FOREIGN KEY(tipo_id) REFERENCES tb_tipo_vinho(id),
	FOREIGN KEY(vinicola_id) REFERENCES tb_vinicola(id)
);

-- Seed 
