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
('Ficção Cientifica'),
('Humor'), 
('Literatura Juvenil');

INSERT INTO Editoras 
VALUES 
('Darkside'),
('Editora Aleph'),
('Suma'), 
('Broadway Books'), 
('Via Leitura'),
('Clássicos Zahar'),
('Principis'),
('Penguin-Companhia');

INSERT INTO Autores
VALUES 
('H. P. Lovecraft', 'Americana'),
('Stephen King', 'Americana'),
('William Gibson', 'Canadense'), 
('Lauren Weisberger', 'Americana'), 
('Antonie de Saint-Exupéry', 'Francesa'), 
('H. G. Wells', 'Britânica'), 
('Júlio Verne', 'Francesa'), 
('Jack London', 'Americana');

INSERT INTO Livros 
VALUES 
('6555981083', 'Chamado de Cthulhu', 2021, 1, 1),
('8576573008', 'Neuromancer', 2016, 2, 2),
('8560280944', 'It: A coisa', 2014, 3, 1),  
('0767914767', 'O Diabo Veste Prata', 2004, 4, 4), 
('856709710X', 'O Pequeno Príncipe', 2021, 5, 5), 
('8556510094', 'A guerra dos mundos', 2016, 3, 3), 
('8537815861', 'O Homem Invisível', 2017, 6, 3), 
('8594318766', 'Vinte mil léguas submarinas', 2019, 7, 3),
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
