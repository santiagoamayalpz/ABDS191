
--Explorar las propiedades de una BD
EXEC sp_helpdb

--Explorar las propiedades de un objeto de la BD
EXEC sp_help 'Usuarios'

--llaves primarias de una tabla
EXEC sp_helpindex 'Usuarios'

--informacion de los usuarios y procesos actuales
EXEC sp_who

--rendimiento del servidor
EXEC sp_monitor

--Espacio usado por la BD
EXEC sp_spaceused

--Puerto de escucha del SQL sERVER
EXEC sp_readerrorlog 0,1

--Nuestros procedimientos

CREATE PROCEDURE sp_ObtenerHistorial
@usuarioId INT
AS
BEGIN

select h.HistorialID, p.Titulo, h.FechaVisualizacion
from HistorialVisualizacion h
JOIN Peliculas p ON h.PeliculaID = p.PeliculaID
WHERE h.UsuarioID = @usuarioId
ORDER BY h.FechaVisualizacion DESC

END;

EXEC sp_ObtenerHistorial 5

--sp para insertar peliculas 
SELECT * FROM Peliculas

CREATE PROCEDURE sp_insertarPeliculas
@titulo NVARCHAR(100),
@genero NVARCHAR(50),
@fechaEstreno DATE
AS
BEGIN
	INSERT INTO Peliculas(Titulo,Genero,FechaEstreno) VALUES(@titulo, @genero, @fechaEstreno)
END;

DROP PROCEDURE [sp_insertarPeliculas];
GO

EXEC sp_insertarPeliculas @titulo = 'Intensamente 2', @genero = 'Infantil', @fechaEstreno = '2024-06-13'

DELETE FROM Peliculas WHERE PeliculaID = 12;