USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E12_Vendas(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Produto VARCHAR(100) NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL (10,2) NOT NULL,
    Desconto DECIMAL(10,2) DEFAULT 0.00,
    Data_Venda DATE,
    Categoria VARCHAR(50)
);

INSERT INTO E12_Vendas(Produto, Quantidade, Preco_Unitario, Desconto, Data_Venda, Categoria)
VALUES ('iPhone 14', 3, 4999.99, 299.99, '2023-11-15', 'Smartphone'),
	   ('Samsung Galaxy S23', 5, 4299.90, 215.00, '2023-11-18', 'Smartphone'),
	   ('Notebook Dell XPS', 2, 8999.00, 899.90, '2023-11-20', 'Computador'),
	   ('iPad Air', 4, 3799.00, 0.00, '2023-11-22', 'Tablet'),
	   ('Smart TV LG 55"', 3, 3299.99, 230.99, '2023-11-25', 'TV'),
	   ('MacBook Pro', 1, 12999.00, 1299.90, '2023-11-28', 'Computador'),
	   ('Samsung Tablet S7', 6, 2199.90, 329.99, '2023-12-01', 'Tablet'),
	   ('Smartphone Xiaomi', 8, 1899.00, 151.92, '2023-12-03', 'Smartphone');
       
SELECT * FROM E12_Vendas;

SELECT
	Produto, Quantidade, Preco_Unitario,
    ROUND(Quantidade * Preco_Unitario,2) AS 'Valor Total'
FROM E12_Vendas;

SELECT
	Produto, Quantidade,
    Preco_Unitario AS 'Preço Unitário',
    Desconto,
    ROUND((Quantidade * Preco_Unitario) - Desconto,2) AS 'Valor Líquido'
FROM E12_Vendas;

SELECT
	Produto, Quantidade,
    ROUND(Preco_Unitario,0) AS 'Preço Arredondado',
    ROUND(Desconto,1) AS 'Desconto Arredondado',
    ROUND(Quantidade * Preco_Unitario,2) AS 'Valor Total'
FROM E12_Vendas;

SELECT
	Categoria,
	ROUND(AVG(Preco_Unitario),2) AS 'Média de Preço',
    SUM(Quantidade) AS 'Quantidade',
    ROUND(SUM(Quantidade * Preco_Unitario),2) AS 'Valor Total'
FROM E12_Vendas
GROUP BY Categoria;

SELECT
	Produto, Desconto,
	ROUND((Desconto / (Quantidade * Preco_Unitario)) * 100,2) AS 'Percentual de Desconto'
FROM E12_Vendas;

SELECT
	ROUND(ABS(
			(SELECT AVG(Preco_Unitario)FROM E12_Vendas WHERE Categoria = 'Smartphone') -- Guarda apenas a média da categoria dos smartphones
            - (SELECT AVG(Preco_Unitario) FROM E12_Vendas) -- Guarda a média geral do Preço Unitário
	   ),2) AS 'Diferença Absoluta';
    

