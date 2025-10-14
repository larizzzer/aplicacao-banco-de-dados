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