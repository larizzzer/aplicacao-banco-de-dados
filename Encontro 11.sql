USE DB_03358b_LarissaGaspar;

CREATE TABLE E11_Alunos(
	AlunoId INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE,
    Nascimento DATE,
    Ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE E11_Cursos(
	CursoId INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Descricao TEXT,
    CargaHoraria INT,
    Preco DECIMAL (10,2)
);

INSERT INTO E11_Alunos(Nome, Sobrenome, Email, Nascimento, Ativo) 
VALUES ("Ana","Costa","ana.costa@email.com",'2000-01-10',TRUE),
	   ("Pedro","Lima","pedro.lima@email.com",'1998-03-22',FALSE),
       ("Mariana","Souza","mariana.s@email.com",NULL,TRUE),
       ("Carlos","Gomes","carlos.g@email.com",'2002-03-26',TRUE);

SELECT * FROM E11_Alunos;

INSERT INTO E11_Cursos(Titulo, Descricao, CargaHoraria, Preco)
VALUES ("Introdução ao SQL","Curso básico de SQL para iniciantes",40,299.90),
	   ("Desenvolvimento WEB com Python","Aprenda a criar aplicações com Python e Django",80,599.90),
       ("Banco de Dados Avançado","Tópicos avançados em otimização e modelagem",60,450.00);
       
UPDATE E11_Alunos SET Email = "pedro.novo.email@email.com" WHERE AlunoId = 2;

SELECT * FROM E11_Cursos;

BEGIN;
UPDATE E11_Alunos SET Ativo = FALSE WHERE AlunoId = 3;
ROLLBACK;

BEGIN;
UPDATE E11_Cursos SET CargaHoraria = 45, Preco = 320.00 WHERE CursoId = 1;
COMMIT;

BEGIN;
DELETE FROM E11_Alunos WHERE AlunoId = 2;
ROLLBACK;

       