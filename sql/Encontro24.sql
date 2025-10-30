CREATE TABLE Vendas(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Data_Venda DATE NOT NULL,
    Produto VARCHAR(50) NOT NULL,
    Quantidade INT NOT NULL,
    Forma_de_Pagamento VARCHAR(50) NOT NULL,
    Avaliacao_Cliente INT
);

SELECT * FROM Vendas;

INSERT INTO Vendas(Data_Venda, Produto, Quantidade, Forma_de_Pagamento, Avaliacao_Cliente)
VALUES('2025-06-01','Hambúrguer', 3, 'Dinheiro', 5), ('2025-06-01','Refrigerante', 2, 'Cartão', 4),
      ('2025-06-01','Batata Frita', 1, 'Cartão', 4), ('2025-06-02','Hambúrguer', 4, 'PIX', 5),
      ('2025-06-02','Suco Natural', 2, 'Dinheiro', 3), ('2025-06-03','Batata Frita', 3, 'Cartão', 4),
      ('2025-06-03','Hambúrguer', 5, 'PIX', 5), ('2025-06-03','Refrigerante', 2, 'Dinheiro', 4),
      ('2025-06-04','Combo Especial', 1, 'Cartão', 5);