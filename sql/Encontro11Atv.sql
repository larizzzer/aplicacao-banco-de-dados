USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E11_Clientes(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Saldo DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE IF NOT EXISTS E11_Transacoes(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(50),
    Valor DECIMAL(10,2),
    Data_Transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM E11_Clientes;
SELECT * FROM E11_Transacoes;

INSERT INTO E11_Clientes(Nome, Saldo) 
VALUES ("João Silva",1000.00),
	   ("Maria Santos",500.00);
       
BEGIN;
UPDATE E11_Clientes SET Saldo = Saldo - 200.00 WHERE Id = 1;
UPDATE E11_Clientes SET Saldo = Saldo + 200.00 Where Id = 2;

INSERT INTO E11_Transacoes(Tipo, Valor)
VALUES ("Pix",200.00),
	   ("Crédito",200.00);
ROLLBACK; -- Até aqui realizou a transação com 200.00 e retorna/limpa a segunda tabela e os voltam os valores anteriores.

BEGIN;
UPDATE E11_Clientes SET Saldo = Saldo - 20.00 WHERE Id = 1;
UPDATE E11_Clientes SET Saldo = Saldo + 20.00 WHERE Id = 2;

INSERT INTO E11_Transacoes(Tipo, Valor)
VALUES ("Pix",20.00);
COMMIT; -- Aqui apenas realiza uma transação com 20.00 e registra ela.

