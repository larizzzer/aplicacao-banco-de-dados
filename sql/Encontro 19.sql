CREATE TABLE Alunos(
    Id INT PRIMARY KEY IDENTITY(1,1), -- IDENTITY substitui o AUTO_INCREMENT primeiro passa o numero em que começa e quantos numeros avança a cada novo registro
    Nome VARCHAR(100) NOT NULL,
    Idade INT,
    Curso VARCHAR(50)
);

SELECT * FROM Alunos;

INSERT INTO Alunos(Nome, Idade, Curso)
VALUES ('Robert Santos',26,'Banco de Dados'),
       ('João Da Silva',20,'C# Orientado a Objetos'),
       ('Peter',26,'Gestão de Projetos ded TI');