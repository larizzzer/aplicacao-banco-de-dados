USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E14_Produtos(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(5,2),
    Estoque INT
);

INSERT INTO E14_Produtos(Nome, Preco, Estoque)
VALUES ("Bolo de Chocolate",15.99,15), ("Pão Doce",0.60,350),
	   ("Pão Francês",0.25,980), ("Bolo de Milho",10.99,20),
       ("Croissant",5.99,65), ("Vanderléia",8.59,25),
       ("Carolina",3.99,52), ("Baguete Recheada",9.99,6),
       ("Pão de Queijo",0.99,61), ("Pão Francês Integral",0.75,261);
       
SELECT * FROM E14_Produtos;

-- Mostrar produtos com preços acima de 5.00
SELECT Nome, Preco FROM E14_Produtos WHERE Preco > 5.00 ORDER BY Preco ASC;

-- Mostrar produtos com nome contendo 'Bolo'
SELECT * FROM E14_Produtos WHERE Nome LIKE '%Bolo%';

-- Mostrar produtos com estoque abaixo de 20 unidades
SELECT Nome, Estoque FROM E14_Produtos WHERE Estoque <=20 ORDER BY Estoque DESC;

-- Mostrar produtos entre 3.00 e 10.00
SELECT Nome, Preco FROM E14_Produtos WHERE Preco BETWEEN 3.00 AND 5.00;

-- Mostrar produtos que começam com Pão
SELECT Nome, Preco FROM E14_Produtos WHERE Nome LIKE 'Pão%' ORDER BY Nome ASC;

-- Mostrar produtos com nome 'Croissant' e estoque maior que 30
SELECT Nome, Estoque FROM E14_Produtos WHERE Nome LIKE '%Croissant%' AND Estoque > 30;
