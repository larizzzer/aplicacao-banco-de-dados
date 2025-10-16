USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E14_TabelaA(
	Nome VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS E14_TabelaB(
	Nome VARCHAR(50)
);

INSERT INTO E14_TabelaA VALUES('Fernanda');
INSERT INTO E14_TabelaA VALUES('Josefa');
INSERT INTO E14_TabelaA VALUES('Luiz');
INSERT INTO E14_TabelaA VALUES('Fernando');
INSERT INTO E14_TabelaB VALUES('Carlos');
INSERT INTO E14_TabelaB VALUES('Manoel');
INSERT INTO E14_TabelaB VALUES('Luiz');
INSERT INTO E14_TabelaB VALUES('Fernando');

# INNER JOIN, traz como resultado dados que estejam apenas em ambas as tabelas
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a INNER JOIN E14_TabelaB as b on a.Nome = b.Nome;

#LEFT JOIN, traz como resultado dados que estão na tabela à esquerda e que estão em ambas as tabelas
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a LEFT JOIN E14_TabelaB as b on a.Nome = b.Nome;

#RIGHT JOIN, traz como resultado dados que estão na tabela à direita e que estão em ambas as tabelas
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a RIGHT JOIN E14_TabelaB as b on a.Nome = b.Nome;

#FULL OUTER JOIN, traz como resultado todos os dados (FULL JOIN não suportado no MYSQL)
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a LEFT JOIN E14_TabelaB as b on a.Nome = b.Nome
UNION
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a RIGHT JOIN E14_TabelaB as b on a.Nome = b.Nome;

# LEFT EXCLUDING JOIN, traz como resultado dados que estão APENAS na tabela à esquerda
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a LEFT JOIN E14_TabelaB AS b on a.Nome = b.Nome WHERE b.Nome IS NULL;

# RIGHT EXCLUDING JOIN, traz como resultado dados que estão APENAS na tabela à direita
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a RIGHT JOIN E14_TabelaB AS b on a.Nome = b.Nome WHERE a.Nome IS NULL;

#OUTER EXCLUDING JOIN, traz como resultado dados que fazem parte apenas de uma das tabelas (dados compartilhados são deixados de fora)
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a LEFT JOIN E14_TabelaB as b on a.Nome = b.Nome WHERE b.Nome IS NULL
UNION
SELECT a.Nome, b.Nome FROM E14_TabelaA AS a RIGHT JOIN E14_TabelaB as b on a.Nome = b.Nome WHERE a.Nome IS NULL;