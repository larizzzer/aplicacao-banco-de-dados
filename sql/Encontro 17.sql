USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E17_Clientes(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Score_Credito INT
);

CREATE TABLE IF NOT EXISTS E17_Faixas(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Score_Min INT,
    Score_Max INT,
    Risco VARCHAR(10)
);

INSERT INTO E17_Clientes(Nome, Score_Credito)
VALUES ("Larissa",699), ("Augusto",998), ("Maria",323);

INSERT INTO E17_Faixas(Score_Min, Score_Max, Risco)
VALUES (0, 499, "Baixo"), (500, 699, "Médio"), (700, 999, "Alto");

SELECT c.Nome, c.Score_Credito, f.Risco 
FROM E17_Clientes AS c JOIN E17_Faixas AS f 
ON c.Score_Credito BETWEEN f.Score_Min AND f.Score_Max; 