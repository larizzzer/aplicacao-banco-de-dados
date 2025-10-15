USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E12_Produtos(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(4,2) NOT NULL,
    Estoque INT
);

INSERT INTO E12_Produtos(Nome, Descricao, Preco, Estoque)
VALUES ("Pão Francês", "Pão Francês quentinho",2.00,320),
	   ("Bolo de Chocolate", "Bolo de chocolate fofinho e com cobertura de chocolate cremoso", 4.50, 122),
       ("Suco de Maracujá", "Suco de maracujá feito na hora", 5.60, 95),
       ("Croissant", "Croissant reacheado de presunto e queijo", 11.37, 396);
       
UPDATE E12_Produtos SET Estoque = 400 WHERE Id = 4;

DELETE FROM E12_Produtos WHERE Id = 3;

SELECT * FROM E12_Produtos;

SELECT 
	Nome, LENGTH(Nome) AS Tamanho, -- Retorna o comprimento do campo
    UPPER(Nome) AS Maiusculas, -- Deixa todas as letras maiúsculas
    LOWER(Nome) AS Minusculas -- Deixas todas as letras minúsculas
FROM E12_Produtos;

SELECT
	Preco,
    ROUND(Preco,0) AS 'Preco_Arredondado', -- Arredonda o valor para quantas casas decimais quiser
    ABS(Preco), -- Valor sempre positivo (absoluto)
    CEILING(Preco), -- Arredonda pra cima sempre
    FLOOR(Preco), -- Arredonda pra baixo sempre
    ROUND(Preco / 2,2) AS '50% de Desconto', -- Exemplo de calcúlo em uma coluna
    ROUND(Preco * 0.9,2) AS '10% de Desconto' -- aplica 10% no valor
FROM E12_Produtos;

SELECT 
	COUNT(*) AS 'Quantidade de Registros', -- Retorna a quantidade de registros dessa coluna
    AVG(Preco) AS 'Média de preço', -- Retorna a média aritmética da coluna
    Nome
FROM E12_Produtos 
GROUP BY Nome; -- Group By para agrupar resultados em uma coluna específica. É obrigatório em leituras que utilizam funções de agregação aliadas a colunas comuns