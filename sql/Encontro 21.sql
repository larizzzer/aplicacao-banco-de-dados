-- GETDATE() Retorna a data atual em um campo de tipo DATA
-- CURRENT_TIMESTAMP retorna a data e hora atual

CREATE TABLE Clientes(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(20),
    Saldo DECIMAL(10,2),
    DataCadastro DATE DEFAULT GETDATE()
);

SELECT * FROM Clientes;

INSERT INTO Clientes (Nome, Saldo)
VALUES ('Kitty', 12345.67),('João',1248.14);

INSERT INTO Clientes (Nome, Saldo)
VALUES ('Khelani', 54.677777);

SELECT UPPER(Nome) AS 'Nome Miaúsculo', 
       LOWER(Nome) AS 'Nome Minúsculo',
       LEN(Nome) AS 'Tamanho do Nome', -- No workbench é LENGTH()
       LEFT(Nome, 3) AS 'Primeiras Letras', -- LEFT(Campo, Quantidade de Caracteres) corta a string para quantidade informada, então mostra as 3 primeiras do campo
       RIGHT(Nome, 3) AS 'Últimas Letras', -- RIGHT(Campo, Quantidade de Caracteres) corta a string para quantidade informada, então mostra as 3 ultimas do campo
       ROUND(Saldo, 0) AS 'Valor Arredondado', -- Arredonda para a casa mais próxima
       ROUND(Saldo*01 + Saldo, 2) AS 'Bônus de  de 10%' -- 
FROM Clientes;

