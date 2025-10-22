USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E18_Departamento(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Departamento VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS E18_Funcionarios(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Id_Departamento INT,
    Nome VARCHAR(200) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Id_Departamento) REFERENCES E18_Departamento(Id)
);

CREATE TABLE IF NOT EXISTS E18_Faixa(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Sal_Min DECIMAL(10,2),
    Sal_Max DECIMAL(10,2),
    Faixa VARCHAR(50)
);

INSERT INTO E18_Departamento(Departamento) 
VALUES ("Desenvolvimento"), ("Inovação"), 	   ("Vendas"), 	   ("Recursos Humanos"), 
	   ("Marketing"),	    ("Administração"), ("Manutenção"), ("Limpeza");

INSERT INTO E18_Funcionarios(Id_Departamento, Nome, Salario)
VALUES (3,"Luciano de Souza",2641.95), (8,"Pedro Sampaio",1645.32), 	(1,"Larissa Gaspar",6452.15),	  (5,"Yennifer de Rivia",4596.84),
	   (4,"Sônia Fernandes",3654.85),  (7,"Sérgio Cardoso",2456.32),    (3,"Adriano Gomes",5123.49), 	  (6,"Vanessa da Mata",6451.92),
       (1,"Maria Marques",10246.62),   (5,"Daniela de Araújo",1945.06), (6,"Guilherme Teixeira",4945.46), (8,"Cláudio Nunes",1564.00),
       (7,"André Santana",5613.49),    (3,"Luana Dias",3489.52), 	    (1,"Roberto Batista",9148.60), 	  (4,"Sandra Teixeira",3485.22);

INSERT INTO E18_Faixa(Sal_Min, Sal_Max, Faixa)
VALUES (1500.00, 5000.00, "Júnior"), (5001.00, 9000.00, "Pleno"), (9001.00, 15000.00, "Sênior");

-- Desafio 01: Lista todos os departamentos com seus funcionarios e o departamento sem funcionarios aparece como NULL
SELECT f.Nome AS 'Funcionário', d.Departamento
FROM E18_Funcionarios AS f RIGHT JOIN E18_Departamento AS d
ON d.Id = f.Id_Departamento ORDER BY d.Departamento ASC;

-- Desafio 02: Mostra cada funcionário com o seu nível salarial
SELECT f.Nome AS 'Funcionário', f.Salario, fa.Faixa AS 'Faixa Salarial'
FROM E18_Funcionarios AS f JOIN E18_Faixa AS fa
ON f.Salario BETWEEN fa.Sal_Min AND fa.Sal_Max ORDER BY f.Salario ASC;

-- Desafio 03: Mostrar funcionários que sejam PLENOS e trabalham no departamento vendas
SELECT f.Nome AS 'Funcionário', d.Departamento, fa.Faixa
FROM E18_Funcionarios AS f INNER JOIN E18_Departamento AS d
ON d.Id = f.Id_Departamento INNER JOIN E18_Faixa AS fa
ON f.Salario BETWEEN fa.Sal_Min AND fa.Sal_Max
WHERE fa.Faixa = 'Pleno' AND d.Departamento = 'Vendas';

