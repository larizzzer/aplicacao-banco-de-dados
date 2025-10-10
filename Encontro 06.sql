-- Criação de nova tabela, com inserção de alguns dados

USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E06_Alunos(
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Curso VARCHAR(100)
);

SELECT * FROM E06_Alunos;

SELECT * FROM E06_Alunos WHERE Curso != "Aplicação de Banco de Dados";
SELECT * FROM E06_Alunos ORDER BY Curso ASC;
SELECT * FROM E06_Alunos ORDER BY Curso DESC;
SELECT * FROM E06_Alunos LIMIT 3;
SELECT * FROM E06_Alunos WHERE Nome != "Larissa" ORDER BY Nome ASC LIMIT 2;

INSERT INTO E06_Alunos(Nome, Curso) VALUES ("Douglas", "SAP e ABAP");