CREATE TABLE Funcionarios(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    Departamento VARCHAR(50) NOT NULL,
    Data_Admissao DATE NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Nivel_Experiencia INT NOT NULL,
    Projetos_Concluidos INT DEFAULT 0,
    Ultima_Avaliacao DECIMAL (3,2) DEFAULT 0.00,
    Ativo BIT DEFAULT 1
);

INSERT INTO Funcionarios(Nome, Cargo, Salario, Departamento, Data_Admissao, Data_Nascimento, Nivel_Experiencia, Projetos_Concluidos, Ultima_Avaliacao, Ativo)
VALUES ('Larissa Gaspar','Engenheira de Dados',5643.15,'TI','2025-12-03','2002-02-16',1,3,9.85,1), 
       ('Robert da Silva','Gerente de Projetos', 12849.26, 'Gestão', '2018-06-01', '1985-02-22', 7, 25, 4.8, 1),
       ('Fernanda Lima', 'Assistente Administrativo', 3262.14, 'Administrativo', '2022-09-20', '1998-11-05', 2, 3, 4.1, 1), 
       ('Diego Pereira', 'Desenvolvedor Back-End', 7800.00, 'TI', '2020-02-10', '1994-09-18', 5, 10, 4.6, 0),
       ('Beatriz Castro', 'Analista Financeiro', 7453.85, 'Financeiro', '2019-11-12', '1989-05-29', 6, 15, 4.3, 1), 
       ('João Henrique', 'Técnico de Suporte', 4594.23, 'Suporte', '2023-04-03', '1996-03-08', 3, 4, 3.9, 1),
       ('Pedro Gomes', 'Coordenadora de Marketing', 9826.85, 'Marketing', '2017-08-21', '1987-01-17', 8, 30, 4.7, 1), 
       ('José Almeida', 'Estagiário de TI', 1754.45, 'TI', '2024-01-15', '2003-12-02', 1, 1, 3.5, 1);

SELECT * FROM Funcionarios;

-- 01: Classifique os funcionários em categorias salariais: Baixa, Média, Alta e Executiva
SELECT 
      Nome,
      Salario,
      CASE
          WHEN Salario > 10000 THEN 'Executivo'
          WHEN Salario BETWEEN 6001 AND 10000 THEN 'Alto'
          WHEN Salario BETWEEN 3001 AND 6000 THEN 'Médio'
          ELSE 'Baixo'
      END AS Categoria 
FROM Funcionarios;

-- 02: Categorize os funcionários por nível de experiência: Júnior, Pleno, Sênior e Especialista
SELECT
      Nome,
      Cargo,
      Nivel_Experiencia,
      CASE
          WHEN Nivel_Experiencia <= 2 THEN 'Júnior'
          WHEN Nivel_Experiencia BETWEEN 6 AND 8 THEN 'Sênior'
          WHEN Nivel_Experiencia BETWEEN 3 AND 5 THEN 'Pleno'
          ELSE 'Especialista'
      END AS 'Experiência' 
FROM Funcionarios;

-- 03: Verifique o status do funcionário considerando tempo de empresa: Novato, Consolidado, Experiente, Veterano
SELECT 
      Nome,
      Cargo,
      Data_Admissao,
      DATEDIFF(YEAR, Data_Admissao, GETDATE()) AS 'Anos de Empresa',
      CASE
          WHEN DATEDIFF(YEAR,Data_Admissao,GETDATE()) < 1 THEN 'Novato'
          WHEN DATEDIFF(YEAR,Data_Admissao,GETDATE()) BETWEEN 1 AND 3 THEN 'Consolidado'
          WHEN DATEDIFF(YEAR,Data_Admissao,GETDATE()) BETWEEN 4 AND 6 THEN 'Experiente'
          ELSE 'Veterano'
      END AS 'Tempo de Empresa' 
FROM Funcionarios;

-- 04: Calcular bônus baseado na última avaliação
SELECT
      Nome,
      Salario,
      CASE 
          WHEN Ultima_Avaliacao >= 4.5 THEN Salario * 0.20
          WHEN Ultima_Avaliacao BETWEEN 4.0 AND 4.4 THEN Salario * 0.15
          WHEN Ultima_Avaliacao BETWEEN 3.5 AND 3.9 THEN Salario * 0.10
          ELSE 0
      END AS 'Bônus de salário',
      IIF(Ultima_Avaliacao >= 4.0, 'Bônus Aprovado', 'Sem Bônus') AS 'Status do Bônus'
FROM Funcionarios;

-- 05: Identificar funcionários com prioridade para promoção: Alta prioridade, Média Prioridade e Baixa Prioridade
SELECT
      Nome,
      Cargo,
      Departamento,
      Nivel_Experiencia,
      CASE
          WHEN Nivel_Experiencia >= 6 AND Ultima_Avaliacao >= 4.0 AND Projetos_Concluidos >= 5 THEN 'Alta Prioridade'
          WHEN Nivel_Experiencia BETWEEN 3 AND 5 AND Ultima_Avaliacao >= 3.8 THEN 'Média Prioridade'
          ELSE 'Baixa Prioridade'
      END AS 'Promoção',
      IIF(Nivel_Experiencia >= 6 AND Projetos_Concluidos > 10, 'Promoção Imediata', 'Análise Contínua') AS 'Recomendação do RH'
FROM Funcionarios;

-- 06: Classifique por faixa etária: Jovem, Jovem Adulto, Adulto, Experiente, Sênior
SELECT  
      Nome,
      Data_Nascimento,
      DATEDIFF(YEAR,Data_Nascimento,GETDATE()) AS Idade,
      CASE
          WHEN DATEDIFF(YEAR,Data_Nascimento,GETDATE()) <= 25 THEN 'Jovem'
          WHEN DATEDIFF(YEAR,Data_Nascimento,GETDATE()) BETWEEN 26 AND 35 THEN 'Jovem Adulto'
          WHEN DATEDIFF(YEAR,Data_Nascimento,GETDATE()) BETWEEN 36 AND 45 THEN 'Adulto'
          WHEN DATEDIFF(YEAR,Data_Nascimento,GETDATE()) BETWEEN 46 AND 55 THEN 'Experiente'
          ELSE 'Sênior'
      END AS 'Faixa Etária' 
FROM Funcionarios;

-- 07: Verificar status de Ativo e Inativo
SELECT
      Nome,
      Cargo,
      Departamento,
      Nivel_Experiencia,
      IIF(Ativo = 1, 'Ativo', 'Inativo') AS 'Status',
      IIF(ativo = 1 AND DATEDIFF(YEAR, Data_Admissao, GETDATE()) > 2, 'Funcionário Consolidado', 
        IIF(ativo = 1, 'Em Adaptação', 'Desligado')) AS 'Detalhe do Status'
FROM Funcionarios
ORDER BY Ativo DESC, Nome;

--08: Classificar combinando departamento e cargo para análise de RH
SELECT
      Nome,
      Cargo,
      Departamento,
      CASE
          WHEN Departamento = 'TI' AND Cargo  LIKE '%Desenvolvedor%' THEN 'TI: Desenvolvedor'
          WHEN Departamento = 'TI' AND Cargo LIKE '%Engenheir%' THEN 'TI: Dados'
          WHEN Departamento = 'TI' AND Cargo LIKE '%Estagiário%' THEN 'TI: Estagiários'
          WHEN Departamento = 'Gestão' AND Cargo LIKE '%Gerente%' THEN 'Gestão: Projetos'
          WHEN Departamento = 'Financeiro' AND Cargo LIKE '%Analista%' THEN 'Financeiro: Analista'
          ELSE 'Outras Categorias'
      END AS Analise_RH
FROM Funcionarios
ORDER BY Departamento ASC, Analise_RH;