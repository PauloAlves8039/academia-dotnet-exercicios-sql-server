CREATE DATABASE Biblioteca;

USE Biblioteca;

CREATE TABLE Editoras (
	id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE Autores (
	id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	nome VARCHAR(50) NOT NULL,
	nacionalidade VARCHAR(40)
);

CREATE TABLE Categorias (
	id INTEGER PRIMARY KEY NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE Livros (
	isbn VARCHAR(22) PRIMARY KEY NOT NULL,
	titulo VARCHAR(50) NOT NULL,
	ano INTEGER NOT NULL,
	fk_editora INTEGER NOT NULL,
	fk_categoria INTEGER NOT NULL,
	FOREIGN KEY (fk_editora) REFERENCES editoras(id),
	FOREIGN KEY (fk_categoria) REFERENCES categorias(id)
);

CREATE TABLE Livro_Autor (
	id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	fk_livro VARCHAR(22) NOT NULL,
	fk_autor INTEGER NOT NULL,
	FOREIGN KEY (fk_livro) REFERENCES livros(isbn),
	FOREIGN KEY (fk_autor) REFERENCES autores(id)
);

INSERT INTO Categorias 
VALUES 
('Terror'),
('Horror'), 
('Fic��o Cientifica'),
('Humor'), 
('Literatura Juvenil');

INSERT INTO Editoras 
VALUES 
('Darkside'),
('Editora Aleph'),
('Suma'), 
('Broadway Books'), 
('Via Leitura'),
('Cl�ssicos Zahar'),
('Principis'),
('Penguin-Companhia');

INSERT INTO Autores
VALUES 
('H. P. Lovecraft', 'Americana'),
('Stephen King', 'Americana'),
('William Gibson', 'Canadense'), 
('Lauren Weisberger', 'Americana'), 
('Antonie de Saint-Exup�ry', 'Francesa'), 
('H. G. Wells', 'Brit�nica'), 
('J�lio Verne', 'Francesa'), 
('Jack London', 'Americana');

INSERT INTO Livros 
VALUES 
('6555981083', 'Chamado de Cthulhu', 2021, 1, 1),
('8576573008', 'Neuromancer', 2016, 2, 3),
('8560280944', 'It: A coisa', 2014, 3, 1),  
('0767914767', 'O Diabo Veste Prata', 2004, 4, 4), 
('856709710X', 'O Pequeno Pr�ncipe', 2021, 5, 5), 
('8556510094', 'A guerra dos mundos', 2016, 3, 3), 
('8537815861', 'O Homem Invis�vel', 2017, 6, 3), 
('8594318766', 'Vinte mil l�guas submarinas', 2019, 7, 3),
('8594318146', 'A volta ao mundo em 80 dias', 2019, 7, 3),
('8563560859', 'Caninos brancos', 2014, 8, 5);

INSERT INTO Livro_Autor 
VALUES 
('6555981083', 1),
('8560280944', 2),
('8576573008', 3), 
('0767914767', 4), 
('856709710X', 5), 
('8556510094', 6),
('8537815861', 6), 
('8594318766', 7),
('8594318146', 7),
('8563560859', 8);

SELECT 
    Livros.isbn AS 'ISBN', 
    Livros.titulo AS 'T�tulo do Livro', 
    Livros.ano AS 'Ano de Lan�amento', 
    Editoras.nome AS 'Nome da Editora', 
    Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade AS 'Nacionalidade do Autor'
FROM Livros, Editoras, Categorias, Autores
WHERE Livros.fk_editora = Editoras.id
AND Livros.fk_categoria = Categorias.id
AND Livros.isbn IN (SELECT fk_livro FROM Livro_Autor WHERE Livro_Autor.fk_autor = Autores.id)
ORDER BY Livros.titulo;

SELECT
    Livros.isbn AS 'ISBN', 
	Livros.titulo AS 'T�tulo do Livro', 
	Livros.ano AS 'Ano de Lan�amento',
    Editoras.nome AS 'Nome da Editora', 
	Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade 'Nacionalidade do Autor'
FROM Livros
JOIN Editoras ON Livros.fk_editora = Editoras.id
JOIN Categorias ON Livros.fk_categoria = Categorias.id
JOIN Livro_Autor ON Livros.isbn = Livro_Autor.fk_livro
JOIN Autores ON Livro_Autor.fk_autor = Autores.id
ORDER BY Livros.titulo;

SELECT 
	Livros.isbn AS 'ISBN', 
    Livros.titulo AS 'T�tulo do Livro', 
    Livros.ano AS 'Ano de Lan�amento', 
    Editoras.nome AS 'Nome da Editora', 
    Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade AS 'Nacionalidade do Autor'
FROM Livros, Editoras, Categorias, Livro_Autor, Autores
WHERE Livros.fk_editora = Editoras.id
AND Livros.fk_categoria = Categorias.id
AND Livro_Autor.fk_livro = Livros.isbn
AND Livro_Autor.fk_autor = Autores.id
ORDER BY Autores.nome;

SELECT
    Livros.isbn AS 'ISBN', 
	Livros.titulo AS 'T�tulo do Livro', 
	Livros.ano AS 'Ano de Lan�amento',
    Editoras.nome AS 'Nome da Editora', 
	Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade 'Nacionalidade do Autor'
FROM Livros
JOIN Editoras ON Livros.fk_editora = Editoras.id
JOIN Categorias ON Livros.fk_categoria = Categorias.id
JOIN Livro_Autor ON Livros.isbn = Livro_Autor.fk_livro
JOIN Autores ON Livro_Autor.fk_autor = Autores.id
ORDER BY Autores.nome;

SELECT 
    Livros.isbn AS 'ISBN', 
    Livros.titulo AS 'T�tulo do Livro', 
    Livros.ano AS 'Ano de Lan�amento', 
    Editoras.nome AS 'Nome da Editora', 
    Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade AS 'Nacionalidade do Autor'
FROM Livros, Editoras, Categorias, Autores, Livro_Autor
WHERE Livros.fk_editora = Editoras.id
AND Livros.fk_categoria = Categorias.id
AND Livros.isbn = Livro_Autor.fk_livro
AND Livro_Autor.fk_autor = Autores.id
AND Categorias.nome = 'Literatura Juvenil'
ORDER BY Livros.ano;

SELECT
    Livros.isbn AS 'ISBN', 
	Livros.titulo AS 'T�tulo do Livro', 
	Livros.ano AS 'Ano de Lan�amento',
    Editoras.nome AS 'Nome da Editora', 
	Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade 'Nacionalidade do Autor'
FROM Livros
JOIN Editoras ON Livros.fk_editora = Editoras.id
JOIN Categorias ON Livros.fk_categoria = Categorias.id
JOIN Livro_Autor ON Livros.isbn = Livro_Autor.fk_livro
JOIN Autores ON Livro_Autor.fk_autor = Autores.id
WHERE Categorias.nome = 'Literatura Juvenil'
ORDER BY Livros.ano;

SELECT 
    Livros.isbn AS 'ISBN', 
    Livros.titulo AS 'T�tulo do Livro', 
    Livros.ano AS 'Ano de Lan�amento', 
    Editoras.nome AS 'Nome da Editora', 
    Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade AS 'Nacionalidade do Autor'
FROM Livros, Editoras, Categorias, Autores, Livro_Autor
WHERE Livros.fk_editora = Editoras.id
AND Livros.fk_categoria = Categorias.id
AND Livros.isbn = Livro_Autor.fk_livro
AND Livro_Autor.fk_autor = Autores.id
AND (Categorias.nome = 'Humor' OR Categorias.nome = 'Fic��o Cientifica')
AND Livros.ano BETWEEN 2000 AND 2010
ORDER BY Livros.ano;

SELECT
    Livros.isbn AS 'ISBN', 
	Livros.titulo AS 'T�tulo do Livro', 
	Livros.ano AS 'Ano de Lan�amento',
    Editoras.nome AS 'Nome da Editora', 
	Categorias.nome AS 'Categoria do Livro',
    Autores.nome AS 'Nome do Autor',
    Autores.nacionalidade 'Nacionalidade do Autor'
FROM Livros
JOIN Editoras ON Livros.fk_editora = Editoras.id
JOIN Categorias ON Livros.fk_categoria = Categorias.id
JOIN Livro_Autor ON Livros.isbn = Livro_Autor.fk_livro
JOIN Autores ON Livro_Autor.fk_autor = Autores.id
WHERE (Categorias.nome = 'Humor' OR Categorias.nome = 'Fic��o Cientifica') 
AND Livros.ano BETWEEN 2000 AND 2010
ORDER BY Livros.ano;
