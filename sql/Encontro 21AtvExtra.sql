SELECT * FROM dbo.pokemon;

-- Atividade 01: Apenas pokemons lendários da terceira e quarta geração
SELECT 
      Name,
      Generation,
      Legendary
FROM dbo.pokemon
WHERE (Generation = 3 OR Generation = 4) AND Legendary = 1;

-- Atividade 02: Pokemons que sejam do Tipo 1 Fogo (Fire)
SELECT
      Name,
      Type_1,
      Generation
FROM dbo.pokemon 
WHERE Type_1 LIKE '%Fire%';

-- Atividade 03: 3 Pokemons não lendários com mais ataques
SELECT  TOP 3
      Name,
      Type_1,
      Attack,
      Legendary
FROM dbo.pokemon
WHERE Legendary = 0 ORDER BY Attack DESC;

-- Atividade 04: Os 5 pokemons com mais vida da primeira geração
SELECT TOP 5
      Name,
      Type_1,
      HP,
      Generation
FROM dbo.pokemon 
WHERE Generation = 1 ORDER BY HP DESC;

-- Atividade 05: Todos os pokemons que possuem Mega no nome em ordem alfabética
SELECT
      Name,
      Type_1,
      Total,
      Generation,
      Legendary
FROM dbo.pokemon
WHERE Name LIKE '%Mega%' ORDER BY Name ASC;

-- Atividade 06: Os 10 últimos pokemons dessa pokedex
SELECT TOP 10
      *
FROM dbo.pokemon
ORDER BY Id DESC;
      
-- Atividade 07: O seu pokemon favorito!
SELECT 
      * 
FROM dbo.pokemon
WHERE Name LIKE 'Marill%';
