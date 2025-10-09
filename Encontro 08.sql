USE DB_03358b_LarissaGaspar;

-- Primeira parte da atividade
CREATE TABLE IF NOT EXISTS E08_Fornecedores(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Cnpj VARCHAR(18),
    Telefone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS E08_Produtos(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Produto VARCHAR(100),
    Descricao VARCHAR(100),
    Estoque INT
);

CREATE TABLE IF NOT EXISTS E08_Vendas(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Quantidade INT,
    Data_Venda VARCHAR(10),
    Produto INT,
    FOREIGN KEY (Produto) REFERENCES E08_Produtos(Id)
);

INSERT INTO E08_Fornecedores(Nome, Cnpj, Telefone) VALUES ("Lindor","00.558.577/0001-13","(11) 2620-6523");
SELECT * FROM E08_Fornecedores;

INSERT INTO E08_Produtos(Produto, Descricao, Estoque) VALUES ("Café com leite","Café com leite sem açúcar",100);
SELECT * FROM E08_Produtos;

INSERT INTO E08_Vendas(Quantidade, Data_Venda, Produto) VALUES (3,"08/10/2025",5);
SELECT * FROM E08_Vendas;

-- Segunda parte da atividade
SELECT * FROM E08_Produtos; -- Todos os produtos cadastrados
SELECT * FROM E08_Vendas WHERE Produto=6; -- Vendas de bolo de fubá
SELECT * FROM E08_Vendas WHERE Produto=1; -- Vendas de bolo de chocolate