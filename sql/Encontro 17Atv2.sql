USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E17_Editoras(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Fundacao INT NOT NULL
);

CREATE TABLE IF NOT EXISTS E17_Livros(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    Ano_Publicacao INT NOT NULL,
    Genero VARCHAR(50) NOT NULL,
    Id_Editora INT NOT NULL,
    FOREIGN KEY (Id_Editora) REFERENCES E17_Editoras(Id)
);


CREATE TABLE IF NOT EXISTS E17_Emprestimos(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Id_Livro INT NOT NULL,
    Data_Emprestimo DATE NOT NULL,
    Data_Devolucao DATE NULL,
    Status VARCHAR(20) DEFAULT 'Ativo'
);

INSERT INTO E17_Editoras(Nome, Pais, Fundacao)
VALUES ('Editora Brasil', 'Brasil', 1980),
	   ('Global Editora', 'Brasil', 1995),
	   ('Companhia das Letras', 'Brasil', 1986),
	   ('Penguin Random House', 'EUA', 2013),
	   ('HarperCollins', 'EUA', 1817),
	   ('Jambô Editora', 'Brasil', 2002);
       
INSERT INTO E17_Livros(Titulo, Autor, Ano_Publicacao, Genero, Id_Editora)
VALUES ('Dom Casmurro', 'Machado de Assis', 1899, 'Romance', 1),
	   ('A Flecha de Fogo', 'Leonel Caldela', 2018, 'Fantasia', 6),
	   ('1984', 'George Orwell', 1949, 'Ficção', 4),
	   ('A Deusa no Labirinto', 'Karen Soarelle', 2019, 'Fantasia', 6),
	   ('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 'Fantasia', 5),
	   ('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 'Infantil', 3),
	   ('Grande Sertão: Veredas', 'Guimarães Rosa', 1956, 'Romance', 2);

INSERT INTO E17_Emprestimos(Id_Livro, Data_Emprestimo, Data_Devolucao, Status)
VALUES (1, '2024-01-15', '2024-01-30', 'Devolvido'),
	   (3, '2024-02-10', NULL, 'Ativo'),
	   (5, '2024-02-15', '2024-03-01', 'Devolvido'),
	   (1, '2024-02-20', NULL, 'Ativo'),
	   (6, '2024-03-05', NULL, 'Ativo'),
	   (4, '2024-01-20', '2024-02-05', 'Devolvido');
       
-- 1. Liste todos os livros com as suas editoras
SELECT l.Titulo AS 'Livro', e.Nome AS 'Editora'
FROM E17_Livros AS l JOIN E17_Editoras AS e 
ON e.id = l.Id_Editora;

-- 2. Identificar editoras que não possuem livros
SELECT e.Nome AS 'Editora', l.Titulo AS 'Livro'
FROM E17_Editoras AS e LEFT JOIN E17_Livros AS l
ON e.Id = l.Id_Editora  WHERE l.Id IS NULL
ORDER BY e.Nome;

-- 3. Mostrar livros que nunca foram emprestados
SELECT l.Titulo AS 'Livro', e.Status
FROM E17_Livros AS l LEFT JOIN E17_Emprestimos AS e
ON l.id = e.Id_Livro WHERE e.Id_Livro IS NULL;

-- 4. Liste todos os emprestimos mostrando detalhes do livro emprestado
SELECT l.Titulo AS 'Livro', l.Autor, l.Ano_Publicacao AS 'Publicação', l.Genero AS 'Gênero', ed.Nome AS 'Editora', e.Status
FROM E17_Livros AS l JOIN E17_Emprestimos AS e ON e.Id_Livro = l.Id INNER JOIN E17_Editoras AS ed 
ON l.Id_Editora = ed.Id;

-- 5. Mostre os livros mais populares (que possuem mais empréstimos)
SELECT l.Titulo AS 'Livro', l.Autor, COUNT(em.Id) AS Total_Emprestimo
FROM E17_Livros As l LEFT JOIN E17_Emprestimos AS em
ON l.Id = em.Id_Livro GROUP BY l.Titulo, l.Autor 
ORDER By Total_Emprestimo DESC;

-- 6. Liste empréstimos ativos com todos os detalhes do livro e editora
SELECT l.Titulo, l.Autor, l.Ano_Publicacao, l.Genero, ed.Nome, ed.Pais, ed.Fundacao, em.Status AS 'Status'
FROM E17_Livros AS l JOIN E17_Editoras AS ed 
ON ed.Id = l.Id_Editora JOIN E17_Emprestimos AS em 
ON em.Id_Livro = l.Id WHERE em.Status = 'Ativo';

-- 7. Mostre cada editora com a quantidade de livros publicados
SELECT e.Nome AS 'Editora', COUNT(l.Id) AS 'Quantidade de Livros'
FROM E17_Livros AS l LEFT JOIN E17_Editoras AS e
ON e.Id = l.Id_Editora
GROUP BY e.Nome ORDER BY COUNT(l.Id) DESC;