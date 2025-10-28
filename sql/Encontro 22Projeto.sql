CREATE DATABASE Restaurante_Sabor_Elegante;

CREATE TABLE Cardapio(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Entrada VARCHAR(50) NOT NULL,
    Prato_Principal VARCHAR(50) NOT NULL,
    Sobremesa VARCHAR(50) NOT NULL,
    Bebida VARCHAR(50) NOT NULL,
    Preco DECIMAL(5,2),
    Descricao NVARCHAR(MAX) NOT NULL
);

CREATE TABLE Cliente(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Reserva(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Id_Cliente INT,
    Data_Hora_Reserva DATETIME2(0),
    Observacao NVARCHAR(MAX) NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id)
);

CREATE TABLE Mesa(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Lugares INT NOT NULL,
    Status BIT NOT NULL DEFAULT 0,
    Observacao NVARCHAR(MAX) NULL
);

CREATE TABLE Comanda(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Id_Mesa INT,
    Tipo VARCHAR(20),
    FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id)
);

CREATE TABLE Pagamento(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Id_Comanda INT,
    Valor DECIMAL(8,2) NOT NULL,
    Forma_Pagamento NVARCHAR(20),
    FOREIGN KEY (Id_Comanda) REFERENCES Comanda(Id)
);

CREATE TABLE Pedido(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Id_Comanda INT,
    Id_Cardapio INT,
    Quantidade INT NOT NULL,
    FOREIGN KEY (Id_Comanda) REFERENCES Comanda(Id),
    FOREIGN KEY (Id_Cardapio) REFERENCES Cardapio(Id)
);

INSERT INTO Cardapio (Entrada, Prato_Principal, Sobremesa, Bebida, Preco, Descricao) VALUES
('Salada Caesar', 'Filé Mignon', 'Petit Gâteau', 'Vinho Tinto', 89.90, 'Clássico menu executivo com salada Caesar, filé mignon ao ponto, petit gâteau e vinho tinto da casa'),
('Carpaccio', 'Salmão Grelhado', 'Tiramisu', 'Vinho Branco', 75.50, 'Menu italiano com carpaccio de carne, salmão grelhado com ervas, tiramisu tradicional e vinho branco'),
('Bruschetta', 'Frango à Parmegiana', 'Mousse de Chocolate', 'Refrigerante', 45.90, 'Menu executivo econômico com bruschetta, frango à parmegiana, mousse de chocolate e refrigerante'),
('Sopa do Dia', 'Risotto de Cogumelos', 'Pudim de Leite', 'Suco Natural', 52.00, 'Menu vegetariano com sopa do dia, risotto de cogumelos frescos, pudim de leite condensado e suco natural'),
('Bolinhos de Bacalhau', 'Feijoada Completa', 'Gelatina', 'Cerveja', 65.80, 'Menu brasileiro com bolinhos de bacalhau, feijoada completa, gelatina colorida e cerveja'),
('Salada Verde', 'Picanha na Chapa', 'Sorvete', 'Refrigerante', 68.90, 'Menu churrasco com salada verde, picanha na chapa, sorvete de creme e refrigerante'),
('Caldo de Mandioquinha', 'Lasanha à Bolonhesa', 'Fruta da Estação', 'Vinho Tinto', 58.50, 'Menu comfort food com caldo de mandioquinha, lasanha à bolonhesa, fruta da estação e vinho tinto'),
('Antepasto', 'Frango Grelhado', 'Cheesecake', 'Suco de Laranja', 49.90, 'Menu light com antepasto de legumes, frango grelhado, cheesecake de frutas vermelhas e suco de laranja'),
('Ceviche', 'Moqueca de Peixe', 'Cocada', 'Caipirinha', 72.00, 'Menu nordestino com ceviche, moqueca de peixe, cocada e caipirinha de limão'),
('Pão de Alho', 'Costela no Bafo', 'Doce de Leite', 'Cerveja Artesanal', 85.00, 'Menu gourmet com pão de alho, costela no bafo, doce de leite com queijo e cerveja artesanal');

INSERT INTO Cliente (Nome, Telefone, Email) VALUES
('João Silva', '(11) 99999-1234', 'joao.silva@email.com'),
('Maria Santos', '(11) 98888-5678', 'maria.santos@email.com'),
('Pedro Oliveira', '(11) 97777-9012', 'pedro.oliveira@email.com'),
('Ana Costa', '(11) 96666-3456', 'ana.costa@email.com'),
('Carlos Pereira', '(11) 95555-7890', 'carlos.pereira@email.com'),
('Fernanda Lima', '(11) 94444-1234', 'fernanda.lima@email.com'),
('Ricardo Alves', '(11) 93333-5678', 'ricardo.alves@email.com'),
('Juliana Martins', '(11) 92222-9012', 'juliana.martins@email.com'),
('Roberto Ferreira', '(11) 91111-3456', 'roberto.ferreira@email.com'),
('Amanda Souza', '(11) 90000-7890', 'amanda.souza@email.com');

INSERT INTO Comanda (Id_Mesa, Tipo) VALUES
(1, 'Física'),
(2, 'Digital'),
(3, 'Física'),
(4, 'Digital'),
(5, 'Física'),
(6, 'Digital'),
(7, 'Física'),
(8, 'Digital'),
(9, 'Física'),
(10, 'Digital');

INSERT INTO Mesa (Lugares, Status, Observacao) VALUES
(2, 0, 'Mesa de casal - canto romântico'),
(4, 1, 'Mesa família - centro do salão'),
(6, 0, 'Mesa grande - ideal para grupos'),
(2, 1, 'Mesa bar - próximo à janela'),
(4, 0, 'Mesa com vista para o jardim'),
(8, 0, 'Mesa para eventos - reservas apenas'),
(4, 1, 'Mesa próximo à cozinha'),
(2, 0, 'Mesa área externa'),
(6, 1, 'Mesa redonda - centro'),
(4, 0, 'Mesa com sofá');

INSERT INTO Pagamento (Id_Comanda, Valor, Forma_Pagamento) VALUES
(1, 89.90, 'Cartão Crédito'),
(2, 151.00, 'Dinheiro'),
(3, 225.50, 'Cartão Débito'),
(4, 98.80, 'PIX'),
(5, 176.40, 'Cartão Crédito'),
(6, 320.00, 'Dinheiro'),
(7, 132.75, 'Cartão Débito'),
(8, 89.90, 'PIX'),
(9, 267.30, 'Cartão Crédito'),
(10, 196.00, 'Dinheiro');

INSERT INTO Pedido (Id_Comanda, Id_Cardapio, Quantidade) VALUES
(1, 1, 1), (1, 3, 1), (2, 2, 2), (3, 5, 3), (4, 4, 2),
(5, 6, 4), (6, 7, 5), (7, 8, 3), (8, 9, 2), (9, 10, 3),
(10, 1, 2),(10, 2, 2),(3, 4, 1), (5, 8, 2), (7, 3, 1),
(2, 5, 1), (4, 6, 1), (6, 9, 2), (8, 7, 1), (9, 10, 1);

INSERT INTO Reserva (Id_Cliente, Data_Hora_Reserva, Observacao) VALUES
(1, '2024-01-15 19:00:00', 'Mesa perto da janela, aniversário de casamento'),
(2, '2024-01-15 20:30:00', 'Cliente vegetariana'),
(3, '2024-01-16 12:30:00', 'Reunião de negócios - precisa de tomada'),
(4, '2024-01-16 21:00:00', 'Sem observações'),
(5, '2024-01-17 13:00:00', 'Trazer cadeira de bebê'),
(6, '2024-01-17 19:30:00', 'Alergia a frutos do mar'),
(7, '2024-01-18 20:00:00', 'Comemoração formatura'),
(8, '2024-01-18 12:00:00', 'Mesa rápida - horário de almoço'),
(9, '2024-01-19 19:00:00', 'Cliente VIP - dar atenção especial'),
(10, '2024-01-19 20:30:00', 'Prefere área externa se disponível');

DELETE FROM Comanda;
DBCC CHECKIDENT ('Comanda', RESEED, 0); -- Reinicia o IDENTIFY (A tabela comanda estava Iniciando em 2 no ID)

SELECT * FROM Cardapio;
SELECT * FROM Cliente;
SELECT * FROM Reserva;
SELECT * FROM Mesa;
SELECT * FROM Comanda;
SELECT * FROM Pagamento;
SELECT * FROM Pedido;

SELECT c.Nome AS 'Cliente', 
       c.Telefone AS 'Telefone', 
       r.Data_Hora_Reserva AS 'Data e Hora da Reserva'
FROM Cliente c 
INNER JOIN Reserva r ON c.Id = r.Id_Cliente;

SELECT c.Id AS 'Número da Comanda',
       m.Id AS 'Número da Mesa',
       c.Tipo AS 'Tipo da Comanda',
       m.Status AS 'Status da Mesa'
FROM Mesa m INNER JOIN Comanda c ON m.Id = c.Id_Mesa;

SELECT co.Id AS 'Número da Comanda',
       p.Id AS 'Número do Pedido',
       ca.Descricao AS 'Pedido'
FROM Comanda co INNER JOIN Pedido p 
ON co.Id = p.Id_Comanda INNER JOIN Cardapio ca ON ca.Id = p.Id_Cardapio
WHERE co.Id = 3;
       