USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS A01_Fornecedores(
	Id_Fornecedores INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Fornecedor VARCHAR(100),
    CNPJ VARCHAR(18),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS A01_Produtos(
	Id_Produtos INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Produto VARCHAR(100),
    Marca_Produto VARCHAR(100),
    Descricao VARCHAR(200),
    Preco FLOAT,
    Estoque INT
);

CREATE TABLE IF NOT EXISTS A01_Vendas(
	Id_Vendas INT AUTO_INCREMENT PRIMARY KEY,
    Quantidade INT NOT NULL,
    Produto_Nome VARCHAR(100),
    Nome_Cliente VARCHAR(100),
    Valor_Venda FLOAT,
    Data_Venda VARCHAR(10)
);

SELECT * FROM A01_Fornecedores;
SELECT * FROM A01_Produtos;
SELECT * FROM A01_Vendas;
-- DROP TABLE A01_Vendas;

INSERT INTO A01_Fornecedores(Nome_Fornecedor, CNPJ, Telefone, Email) VALUES ("Nestlé","56.071.971/0001-87","(11) 6842-7452","nestle@email.com");
INSERT INTO A01_Produtos(Nome_Produto, Marca_Produto, Descricao, Preco, Estoque) VALUES ("Café Preto","Pilão","Café preto sem açúcar","2.00", "260");
INSERT INTO A01_Vendas(Quantidade, Produto_Nome, Nome_Cliente, Valor_Venda, Data_Venda) VALUES ("10","Café Preto","Arthur","20.00","11/09/2025");