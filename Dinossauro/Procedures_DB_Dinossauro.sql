-- exercício 1
CREATE PROCEDURE AnoDeDescoberta
AS
SELECT nome, year(ano_descoberta) AS Ano
FROM Dinossauro;

EXEC AnoDeDescoberta;

-- exercício 2
CREATE PROCEDURE ObterDinossaurosPorGrupo
    @NomeDoGrupo VARCHAR(50)
AS
BEGIN
    SELECT dinonauros.nome AS 'Nome do Dinossauro'
    FROM Dinossauro AS dinonauros
    INNER JOIN Grupo AS grupo ON dinonauros.fk_grupo = grupo.id_grupo
    WHERE grupo.nome = @NomeDoGrupo;
END;

EXEC ObterDinossaurosPorGrupo @NomeDoGrupo = 'Anquilossauros';

-- exercício 3
CREATE PROCEDURE AtualizarPesoDinossauro
    @IdDinossauro INT,
    @NovoPesoToneladas DECIMAL(10, 2)
AS
BEGIN
    UPDATE Dinossauro
    SET toneladas = @NovoPesoToneladas
    WHERE id_dinossauro = @IdDinossauro;
END;

EXEC AtualizarPesoDinossauro @IdDinossauro = 1, @NovoPesoToneladas = 10.5;