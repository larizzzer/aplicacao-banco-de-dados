-- Condicionais dentro do T-SQL (Case e If)
CREATE TABLE Clientes(
    Nome VARCHAR(50),
    Saldo DECIMAL(10,2)
);
GO

INSERT INTO Clientes(Nome, Saldo) VALUES 
('Larissa', 4444), ('Robert', 12345), ('Steve', 9843), ('Maria', 900);
GO

SELECT * FROM Clientes;

SELECT 
    Nome,
    Saldo,
    CASE -- Cria uma coluna com essa condicional
        WHEN Saldo > 10000 THEN 'PREMIUM' -- Tradução: Quando o SALDO > 10k então é premium e vai pra próxima
        WHEN Saldo BETWEEN 5000 AND 10000 THEN 'STANDARD'
        ELSE 'BASIC' -- Precisa colocar o ELSE, pois todos os caminhos retornam algo
    END AS Categoria FROM Clientes;

SELECT  
    Nome,
    Saldo,
    CASE    
        WHEN LEN(Nome) > 5 THEN 'Nome Grande'
        ELSE 'Nome Pequeno'
    END AS 'Tamanho de Nome' FROM CLientes;

--IIF(Condição, Resultado da condição se verdadeira, Resultado da condição se falso)
SELECT 
    Nome,
    Saldo,
    IIF(LEN(Nome) > 5, 'Nome Grande', 'Nome Pequeno') AS TamanhoDeNome
FROM Clientes;

