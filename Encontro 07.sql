USE DB_03358b_LarissaGaspar;

-- não está funcionando no curso
CREATE USER '03358bLarissaGaspar'@'%' IDENTIFIED BY 'Z3us&Botas';

GRANT ALL PRIVILEGES ON DB_03358b_LarissaGaspar.* TO '03358bLarissaGaspar'@'localhost';

-- conteúdos adicionais, com a inserção de chave estrangeira
CREATE TABLE E07_Produtos(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL (8,2),
    Categoria VARCHAR (20),
    Fornecedor INT,
    FOREIGN KEY (Fornecedor) REFERENCES E07_Fornecedores(Id)
);

CREATE TABLE E07_Fornecedores(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);

INSERT INTO E07_Produtos(Nome, Preco, Categoria, Fornecedor)
VALUES ("Pão Francês","01.50","Padaria",2);
SELECT * FROM E07_Produtos;

INSERT INTO E07_Fornecedores(Nome) VALUES ("Padaria do Zeca");
SELECT * FROM E07_Fornecedores;