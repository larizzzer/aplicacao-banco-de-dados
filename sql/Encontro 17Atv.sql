USE DB_03358b_LarissaGaspar;

-- Criação das tabelas
CREATE TABLE IF NOT EXISTS E17_Produtos(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(5,2)
);

CREATE TABLE IF NOT EXISTS E17_Vendas(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Id_Produto INT,
    Quantidade INT,
    Data_Venda DATE,
    FOREIGN KEY (Id_Produto) REFERENCES E17_Produtos(Id)
);

CREATE TABLE IF NOT EXISTS E17_Faixas_Preco(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(50),
    Preco_Min DECIMAL(5,2),
    Preco_Max DECIMAL(5,2)
);

-- Inserindo dados
INSERT INTO E17_Produtos(Nome, Preco)
VALUES ("Pão de Queijo",2.50), ("Geleia de Morango",10.99), ("Croissant Recheado",6.99),
	   ("Pão Francês",0.60), ("Torta de Frango",7.99), ("Brigadeiro",0.99);
       
INSERT INTO E17_Vendas(Id_Produto, Quantidade, Data_Venda)
VALUES (6,50,'2025-06-26'), (4,256,'2025-08-28'),
	   (1,25,'2025-10-06'), (5,6,'2025-09-10'),
       (2,10,'2025-01-30'), (3,31,'2025-05-15'),
       (6,100,'2025-03-09'), (1,309,'2025-05-19');
       
INSERT INTO E17_Faixas_Preco(Categoria, Preco_Min, Preco_Max)
VALUES ("Barato", 00.00, 2.50), ("Intermediário", 2.51, 7.99), ("Caro", 8.00, 11.00);

-- Lista todos os produtos, mesmo se não tivesse vendido
SELECT p.Nome AS 'Produto', COUNT(v.Quantidade) AS 'Quantidade de Vendas'
FROM E17_Produtos AS p LEFT JOIN E17_Vendas AS v ON p.Id = v.Id_Produto
GROUP BY p.Id;

-- Mostra a classificação Barato, Intermediário e Caro com base em seu preço
SELECT p.Nome AS 'Produto', p.Preco AS 'Preço', f.Categoria AS 'Categoria'
FROM E17_Produtos AS p JOIN E17_Faixas_Preco AS f ON p.Preco BETWEEN f.Preco_Min AND f.Preco_Max
ORDER BY p.Preco ASC;