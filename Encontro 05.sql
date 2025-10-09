-- Criação do banco de dados, tabela e inserção de dados

CREATE DATABASE IF NOT EXISTS DB_03358b_LarissaGaspar;
USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E05_Cliente(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

SELECT * FROM E05_Cliente;

INSERT INTO E05_Cliente(nome, telefone, email)
VALUES('Larissa Gomes','(11)99999-9999','larissa@email.com');

SELECT nome, telefone FROM E05_Cliente;