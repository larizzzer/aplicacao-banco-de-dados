USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E08_Aluno(
	Id_Aluno INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Curso VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS E08_Professor(
	Id_Professor INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Professor VARCHAR(100),
    Curso VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS E08_Comentarios(
	Id_Comentario INT AUTO_INCREMENT PRIMARY KEY,
    Id_Aluno INT,
    Id_Professor INT,
    Comentario TEXT,
    Nota_Professor DECIMAL (3,1),
	FOREIGN KEY (Id_Aluno) REFERENCES E08_Aluno(Id_Aluno),
    FOREIGN KEY (Id_Professor) REFERENCES E08_Professor(Id_Professor)
);

INSERT INTO E08_Aluno(Nome, Sobrenome, Curso) 
VALUES ("Larissa","Gaspar","Análise e Desenvolvimento de Sistemas"),
	   ("João Pedro","Hercules","Segurança da Informação"),
       ("Arthur","Pereira","Psicologia"),
       ("Aurora","Janones","Ciência da Computação");

INSERT INTO E08_Professor(Nome_Professor, Curso)
VALUES ("Carlos Augusto","Ciência da Computação"),
	   ("Antônio Reis","Psicologia"),
       ("Talita Martins","Análise e Desenvolvimento de Sistemas"),
       ("Maria Da Silva","Segurança da Informação");

INSERT INTO E08_Comentarios(Id_Aluno, Id_Professor, Comentario, Nota_Professor)
VALUES (3,2,"Professor com explicação excelente!",10.0),
	   (4,1,"Entrou como substituta e era melhor que o anterior!", 8.5),
       (2,4,"Explicação confusa", 5.3);

SELECT * FROM E08_Aluno;
SELECT * FROM E08_Professor;
SELECT * FROM E08_Comentarios WHERE Nota_Professor < 6.0;
SELECT * FROM E08_Comentarios WHERE Nota_Professor > 6.0;

ALTER TABLE E08_Professor ADD COLUMN Quantidade_Turmas INT;
UPDATE E08_Professor SET Quantidade_Turmas = 2 WHERE Id_Professor = 1;
ALTER TABLE E08_Professor CHANGE COLUMN Quantidade_Turmas Faltas INT DEFAULT 0;
UPDATE E08_Professor SET Faltas = 0 WHERE Id_Professor = 1
