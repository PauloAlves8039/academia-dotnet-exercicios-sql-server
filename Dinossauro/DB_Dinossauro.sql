CREATE DATABASE DB_Dinossauro;

USE DB_Dinossauro;

CREATE TABLE Era (
    id_era INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ano_inicio INT NOT NULL,
    ano_fim INT NOT NULL
);

CREATE TABLE Grupo (
    id_grupo INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Descobridor (
    id_descobridor INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Dinossauro (
    id_dinossauro INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    toneladas DECIMAL(10, 2) NOT NULL,
    ano_descoberta INT NOT NULL,
    pais_descobrimento VARCHAR(50) NOT NULL,
    fk_grupo INT FOREIGN KEY REFERENCES Grupo(id_grupo),
    fk_descobridor INT FOREIGN KEY REFERENCES Descobridor(id_descobridor),
    fk_era INT FOREIGN KEY REFERENCES Era(id_era)
);

CREATE TABLE Dinossauro_Descobridor (
    id_dinossauro INT,
    id_descobridor INT,
    FOREIGN KEY (id_dinossauro) REFERENCES Dinossauro(id_dinossauro),
    FOREIGN KEY (id_descobridor) REFERENCES Descobridor(id_descobridor),
    PRIMARY KEY (id_dinossauro, id_descobridor)
);

INSERT INTO Era (nome, ano_inicio, ano_fim) VALUES
('Cretáceo', 145, 66),
('Jurássico', 201, 145),
('Triássico', 252, 201);

INSERT INTO Grupo (nome) VALUES
('Terópodes'),
('Saurópodes'),
('Ornitísquios'),
('Anquilossauros');

INSERT INTO Descobridor (nome) VALUES
('Paleontólogo 1'),
('Paleontólogo 2'),
('Paleontólogo 3'), 
('Paleontólogo 4');

INSERT INTO Dinossauro (nome, toneladas, ano_descoberta, pais_descobrimento, fk_grupo, fk_descobridor, fk_era) VALUES
('Tyrannosaurus rex', 9, 1902, 'EUA', 1, 1, 1),
('Stegosaurus', 2, 1877, 'EUA', 3, 2, 2),
('Triceratops', 9, 1887, 'EUA', 3, 3, 2),
('Anquilossauro', 6, 1897, 'EUA', 4, 1, 2),
('Triceratops II', 8, 1915, 'EUA', 3, 3, 2),
('Stegosaurus II', 3, 1922, 'EUA', 4, 4, 2);

INSERT INTO Dinossauro_Descobridor (id_dinossauro, id_descobridor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 3),
(6, 4);

-- exercício 7
SELECT
    Dinossauro.id_dinossauro AS 'Id do Dinossauro',
    Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Descoberta',
    Dinossauro.pais_descobrimento AS 'Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro, Grupo, Descobridor, Era
WHERE Dinossauro.fk_grupo = Grupo.id_grupo
AND Dinossauro.fk_descobridor = Descobridor.id_descobridor
AND Dinossauro.fk_era = Era.id_era
ORDER BY Dinossauro.nome;

SELECT
    Dinossauro.id_dinossauro AS 'Id do Dinossauro',
	Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Descoberta',
    Dinossauro.pais_descobrimento AS 'Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro
INNER JOIN Grupo ON Dinossauro.fk_grupo = Grupo.id_grupo
INNER JOIN Descobridor ON Dinossauro.fk_descobridor = Descobridor.id_descobridor
INNER JOIN Era ON Dinossauro.fk_era = Era.id_era
ORDER BY Dinossauro.nome ASC;

-- exercício 8
SELECT
    Dinossauro.id_dinossauro AS 'id do Dinossauro',
    Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Ano da Descoberta',
    Dinossauro.pais_descobrimento AS 'pais do Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro, Grupo, Descobridor, Era
WHERE Dinossauro.fk_grupo = Grupo.id_grupo
AND Dinossauro.fk_descobridor = Descobridor.id_descobridor
AND Dinossauro.fk_era = Era.id_era
ORDER BY Descobridor.nome;

SELECT
    Dinossauro.id_dinossauro AS 'id do Dinossauro',
    Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Ano da Descoberta',
    Dinossauro.pais_descobrimento AS 'pais do Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro
INNER JOIN Grupo ON Dinossauro.fk_grupo = Grupo.id_grupo
INNER JOIN Descobridor ON Dinossauro.fk_descobridor = Descobridor.id_descobridor
INNER JOIN Era ON Dinossauro.fk_era = Era.id_era
ORDER BY Descobridor.nome ASC, Dinossauro.nome ASC;

-- exercício 9
SELECT
    Dinossauro.id_dinossauro AS 'id do Dinossauro',
    Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Ano da Descoberta',
    Dinossauro.pais_descobrimento AS 'pais do Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro, Grupo, Descobridor, Era
WHERE Dinossauro.fk_grupo = Grupo.id_grupo
AND Dinossauro.fk_descobridor = Descobridor.id_descobridor
AND Dinossauro.fk_era = Era.id_era
AND Grupo.nome = 'Anquilossauros'
ORDER BY Dinossauro.ano_descoberta;

SELECT
    Dinossauro.id_dinossauro AS 'id do Dinossauro',
    Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Ano da Descoberta',
    Dinossauro.pais_descobrimento AS 'pais do Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro
INNER JOIN Grupo ON Dinossauro.fk_grupo = Grupo.id_grupo
INNER JOIN Descobridor ON Dinossauro.fk_descobridor = Descobridor.id_descobridor
INNER JOIN Era ON Dinossauro.fk_era = Era.id_era
WHERE Grupo.nome = 'Anquilossauros'
ORDER BY Dinossauro.ano_descoberta ASC;

-- exercício 10
SELECT
    Dinossauro.id_dinossauro AS 'id do Dinossauro',
    Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Ano da Descoberta',
    Dinossauro.pais_descobrimento AS 'pais do Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro, Grupo, Descobridor, Era
WHERE Dinossauro.fk_grupo = Grupo.id_grupo
AND Dinossauro.fk_descobridor = Descobridor.id_descobridor
AND Dinossauro.fk_era = Era.id_era
AND (Grupo.nome = 'Ceratopsídeos' OR Grupo.nome = 'Anquilossauros')
AND Dinossauro.ano_descoberta BETWEEN 1900 AND 1999
ORDER BY Dinossauro.ano_descoberta;

SELECT
    Dinossauro.id_dinossauro AS 'id do Dinossauro',
    Dinossauro.nome AS 'Nome do Dinossauro',
    Dinossauro.toneladas AS 'Toneladas',
    Dinossauro.ano_descoberta AS 'Ano da Descoberta',
    Dinossauro.pais_descobrimento AS 'pais do Descobrimento',
    Grupo.nome AS 'Nome do Grupo',
    Descobridor.nome AS 'Nome do Descobridor',
    Era.nome AS 'Era'
FROM Dinossauro
INNER JOIN Grupo ON Dinossauro.fk_grupo = Grupo.id_grupo
INNER JOIN Descobridor ON Dinossauro.fk_descobridor = Descobridor.id_descobridor
INNER JOIN Era ON Dinossauro.fk_era = Era.id_era
WHERE(Grupo.nome = 'Ceratopsídeos' OR Grupo.nome = 'Anquilossauros') 
AND Dinossauro.ano_descoberta BETWEEN 1900 AND 1999
ORDER BY Dinossauro.ano_descoberta ASC;
