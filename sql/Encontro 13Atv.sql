USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E13_Produtos(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Estoque INT NOT NULL,
    Data_Cadastro DATE NOT NULL,
	Marca VARCHAR(50),
    Avaliacao DECIMAL(4,2) DEFAULT 0.00
);

INSERT INTO E13_Produtos(Nome, Categoria, Preco, Estoque, Data_Cadastro, Marca, Avaliacao)
VALUES ('Iphone 17 Pro Max', 'Smartphone', 15849.50, 20, '2025-09-20', 'Apple',8.5),
	   ('Samsung Galaxy Tab A9', 'Tablet', 780.80, 5, '2024-05-06', 'Samsung',7.9),
       ('Smart TV Thinq Ai', 'TV', 1978.53, 10, '2024-10-19', 'LG',5.6),
       ('Dell Pro 16', 'Computador', 4915.91, 15, '2025-10-06', 'Dell',10),
       ('Samsung Galaxy S4 Ultra', 'Smartphone', 5201.56, 2, '2024-02-01', 'Samsung',9.1),
       ('Iphone 16 Plus', 'Smartphone', 7895.99, 8, '2024-11-26', 'Apple',9.0),
       ('IdeaPad 1I Intel Core', 'Computador', 2564.98, 30, '2023-06-10', 'Lenovo',7.9),
       ('Ipad Pro 11pol', 'Tablet', 12564.32, 3, '2024-10-31', 'Apple',10),
       ('Alienware 16 Aurora', 'Computador', 6459.99, 8, '2025-10-01', 'Dell',9.0),
       ('Smart TV Samsung Crystal', 'TV', 2546.95, 16, '2025-09-25', 'Samsung',8.9);

SELECT * FROM E13_Produtos;

SELECT 								-- Seleciona todos os produtos da Apple
	Nome, Preco, Marca
FROM E13_Produtos WHERE Marca = 'Apple';

SELECT
	Nome, Preco, Marca
FROM E13_Produtos WHERE Marca LIKE '%Apple%';

SELECT 								-- Seleciona produtos com menos de 10 no estoque
	Nome, Categoria, Estoque
FROM E13_Produtos WHERE Estoque < 10
ORDER BY Estoque ASC;

SELECT
	Nome, Marca, Preco				-- Seleciona produtos com preços acima de 3000
FROM E13_Produtos WHERE Preco > 3000.00;

SELECT 								-- Seleciona smartphones com nota acima de 4.5
	Nome, Avaliacao
FROM E13_Produtos WHERE Avaliacao > 4.5 AND Categoria = 'Smartphone';

SELECT								-- Seleciona produtos entre 1500 e 4000
	Nome, Marca, Preco
FROM E13_Produtos WHERE Preco >= 1500.00 AND Preco <= 4000.00;

SELECT 								-- Seleciona produtos das marcas Dell e Samsung
	Nome, Marca, Categoria, Preco
FROM E13_Produtos WHERE Marca = 'Dell' OR Marca = 'Samsung'
ORDER BY Marca ASC;

SELECT 								-- Seleciona 3 produtos com menor estoque
	Nome, Marca, Estoque
FROM E13_Produtos WHERE Estoque < 10
ORDER BY Estoque ASC
LIMIT 3;

