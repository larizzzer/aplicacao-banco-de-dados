CREATE TABLE Produtos_Padaria(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Preco DECIMAL (6,2)
);

SELECT * FROM Produtos_Padaria;

INSERT INTO Produtos_Padaria(Nome, Preco)
VALUES ('Pão Francês', 3.56), ('Brigadeiro', 5.14),
       ('Bolo de Fubá', 1.43), ('Café com Leite', 0.25);

-- Mostrar nomes dos produtos em Letras MAIÚSCULAS
SELECT UPPER(Nome) AS 'Nomes em Maiúsculo' FROM Produtos_Padaria;

-- Mostrar nomes dos produtos em Letras minúsculas
SELECT LOWER(Nome) AS 'Nomes em Minúsculo' FROM Produtos_Padaria;

--Contar quantas letras tem o nome
SELECT LEN(Nome) AS 'Tamanho do Nome' FROM Produtos_Padaria;

--Exibir as 3 primeiras letras do nome
SELECT LEFT(Nome, 3) AS 'Primeiras Letras' FROM Produtos_Padaria;

--Arredondar o preço
SELECT Preco, ROUND(Preco, 0) AS 'Preço Arrendodado' FROM Produtos_Padaria;

-- Mostra a data atual com os produtos
SELECT Nome, Preco, CURRENT_TIMESTAMP AS 'Data' FROM Produtos_Padaria;