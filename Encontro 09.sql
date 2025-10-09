USE DB_03358b_LarissaGaspar;

CREATE TABLE IF NOT EXISTS E09_Livros(
	Id_Livros INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    Ano_Publicacao INT,
    Disponivel BOOLEAN DEFAULT 1
);

INSERT INTO E09_Livros(Titulo, Autor, Ano_Publicacao, Disponivel)
VALUE ("Dom Casmurro","Machado de Assis",1899,1),
	  ("1984","George Orwell",1949,0),
      ("A Fúria dos Reis","George R. R. Martin",1998,1);
      
ALTER TABLE E09_Livros ADD Genero VARCHAR(50);

UPDATE E09_Livros SET Genero = "Romance" WHERE Id_Livros = 1;
UPDATE E09_Livros SET Genero = "Ficção Científica" WHERE Id_Livros = 2;
UPDATE E09_Livros SET Genero = "Fantasia" WHERE Id_Livros = 3;

SELECT * FROM E09_Livros;
SELECT * FROM E09_Livros WHERE Autor = "George Orwell";

