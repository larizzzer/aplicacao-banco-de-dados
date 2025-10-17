USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E15_Fornecedor(
	Id_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS E15_Produtos(
	Id_Produtos INT AUTO_INCREMENT PRIMARY KEY,
    Id_Fornecedor INT,
    Nome VARCHAR(200) NOT NULL,
    Preco DECIMAL(5,2) NOT NULL,
    Estoque INT,
    FOREIGN KEY (Id_Fornecedor) REFERENCES E15_Fornecedor(Id_Fornecedor)
);

CREATE TABLE IF NOT EXISTS E15_Vendas(
	Id_Vendas INT AUTO_INCREMENT PRIMARY KEY,
    Id_Produtos INT,
    Quantidade INT NOT NULL,
    Data_Venda DATE NOT NULL,
    FOREIGN KEY (Id_Produtos) REFERENCES E15_Produtos(Id_Produtos)
);

SELECT * FROM E15_Fornecedor;
SELECT * FROM E15_Produtos;
SELECT * FROM E15_Vendas;

INSERT INTO E15_Fornecedor(Nome)
VALUES ("Nestlé"), ("Dona Benta"), ("Sadia"), ("Perdigão"), ("União");

INSERT INTO E15_Produtos(Id_Fornecedor, Nome, Preco, Estoque)
VALUES (1,"Leite em Pó",15.99,200), (2,"Farinha de Trigo",5.99,25), (3,"Nuggets Congelados",25.99,15), (4,"Presunto",4.85,5),
	   (5,"Açúcar",3.99,30), (1,"Danone",2.95,100), (3,"Mortadela",2.15,6), (4,"Pacote de Salsicha",16.99,10);
       
INSERT INTO E15_Vendas(Id_Produtos, Quantidade, Data_Venda)
VALUES (1,3,'2025-02-25'), (3,5,'2025-04-30'), (5,4,'2025-09-02'), (7,1,'2025-03-10'), (6,25,'2025-08-05'),
	   (2,6,'2025-01-15'), (4,2,'2025-10-05'), (6,9,'2025-06-19'), (8,5,'2025-07-09'), (1,10,'2025-09-06');

-- Exibe os nomes dos produtos com os seus respectivos fornecedores
SELECT p.Nome AS Produto, f.Nome AS Fornecedor FROM E15_Produtos AS p INNER JOIN E15_Fornecedor AS f ON p.Id_Fornecedor = f.Id_Fornecedor;

-- Lista os produtos vendidos com a quantidade vendida e data de venda
SELECT p.Nome AS Produto, v.Quantidade AS Quantidade, v.Data_Venda AS 'Data da Venda' 
FROM E15_Produtos AS p INNER JOIN E15_Vendas AS v ON p.Id_Produtos = v.Id_Produtos ORDER BY v.Quantidade;

-- Vê o nome do produto, valor total da venda e nome do fornecedor
SELECT p.Nome AS Produto, (v.Quantidade * p.Preco) AS 'Valor Total da Venda', f.Nome AS Fornecedor
FROM E15_Produtos AS p INNER JOIN E15_Vendas AS v ON p.Id_Produtos = v.Id_Produtos INNER JOIN E15_Fornecedor AS f ON p.Id_Fornecedor = f.Id_Fornecedor;

-- Exibe produtos com estoque abaixo de 30 unidades e os seus fornecedores
SELECT p.Nome AS Produto, p.Estoque AS Estoque, f.Nome AS Fornecedor FROM E15_Produtos AS p 
INNER JOIN E15_Fornecedor AS f ON p.Id_Fornecedor = f.Id_Fornecedor WHERE Estoque <= 30;
	   
