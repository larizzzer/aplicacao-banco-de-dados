USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E10_Contatos(
	Id_Contatos INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20) NOT NULL,
    Email VARCHAR(50),
    Endereco VARCHAR(200),
    Id_Grupo INT,
    FOREIGN KEY (Id_Grupo) REFERENCES E10Grupos_Contatos(Id_Grupos)
);

CREATE TABLE IF NOT EXISTS E10Grupos_Contatos(
	Id_Grupos INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Grupo VARCHAR(50) NOT NULL,
    Descricao TEXT
);

CREATE TABLE IF NOT EXISTS E10_Telefones(
	Id_Telefones INT AUTO_INCREMENT PRIMARY KEY,
    Id_Contato INT NOT NULL,
    Numero VARCHAR(20),
    Tipo VARCHAR(20),
    FOREIGN KEY (Id_Contato) REFERENCES E10_Contatos(Id_Contatos)
);

INSERT INTO E10Grupos_Contatos(Nome_Grupo, Descricao)
VALUES ("Família","Números que são das pessoas da minha família."),
	   ("Amigos","Números que são dos meus amigos."),
       ("Trabalho","Números que são das pessoas do meu trabalho.");
       
INSERT INTO E10_Contatos(Nome, Sobrenome, Telefone, Email, Endereco, Id_Grupo)
VALUES ("Ana","Da Silva","(11) 91234-9874","anadasilva@trabalho.com","",3),
	   ("Leandro","Parceiro","(11) 98453-7451","","Rua Lá Longe, 200",2),
       ("Ewerton","Sousa","(11) 96345-2814","","",1),
       ("Talita","Alvez","(11) 98562-7513","talitalvez@email.com","Rua Aqui Perto, 55",NULL);

INSERT INTO E10_Telefones(Id_Contato, Numero, Tipo)
VALUES (1,"(11) 3584-6245","Empresa"),
	   (3,"(11) 2631-4853","Telefone Fixo"),
       (4,"(11) 5123-9563","Tabalho");
       
SELECT * FROM E10Grupos_Contatos;
SELECT * FROM E10_Contatos;
SELECT * FROM E10_Telefones;

