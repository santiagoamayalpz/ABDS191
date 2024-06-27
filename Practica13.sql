
--1
CREATE PROCEDURE sp_InsertarUsuario
@Nombre NVARCHAR(100),
@Email NVARCHAR(100),
@Pass NVARCHAR(250),
@FechaRegistro DATE
AS
BEGIN
    INSERT INTO Usuarios(Nombre, Email, Pass, FechaRegistro) 
    VALUES(@Nombre, @Email, @Pass, @FechaRegistro)
END;

EXEC sp_InsertarUsuario @Nombre = 'Mauricio', @Email = 'mau.aleman@gmail.com', @Pass = password11, @FechaRegistro = '2024-10-09'

select * from Usuarios

--2

CREATE PROCEDURE sp_EditarSuscripcion
@SuscripcionId INT,
@UsuarioID INT,
@Tipo NVARCHAR(50),
@FechaInicio DATE,
@FechaFin DATE
AS
BEGIN
    UPDATE Suscripciones
    SET Tipo = @Tipo, UsuarioID = @UsuarioID, FechaInicio = @FechaInicio, FechaFin = @FechaFin
    WHERE SuscripcionID = @SuscripcionId
END;

EXEC sp_EditarSuscripcion @SuscripcionId = 1, @UsuarioID = 8 , @FechaInicio = '2024-01-01', @FechaFin = '2024-12-31', @Tipo = 'Anual'

select * from Suscripciones

DROP PROCEDURE sp_EditarSuscripcion;

--3

CREATE PROCEDURE sp_EliminarHistorialVisualizacion
@HistorialID INT
AS
BEGIN
    DELETE FROM HistorialVisualizacion 
    WHERE HistorialID = @HistorialID
END;

EXEC sp_EliminarHistorialVisualizacion @HistorialID = 11

SELECT * FROM HistorialVisualizacion

--4

CREATE PROCEDURE sp_ConsultarUsuariosSuscripcion
@Tipo NVARCHAR(50)
AS
BEGIN
    SELECT u.UsuarioID, u.Nombre, u.Email, s.Tipo
    FROM Usuarios u
    JOIN Suscripciones s ON u.UsuarioID = s.UsuarioID
    WHERE s.Tipo = @Tipo
END;

EXEC sp_ConsultarUsuariosSuscripcion @Tipo = 'Anual'

--5

CREATE PROCEDURE sp_PeliculasReproducidas
@Genero NVARCHAR(50)
AS
BEGIN
    SELECT p.PeliculaID, p.Titulo, p.Genero, h.FechaVisualizacion
    FROM Peliculas p
    JOIN HistorialVisualizacion h ON p.PeliculaID = h.PeliculaID
    WHERE p.Genero = @Genero
    ORDER BY h.FechaVisualizacion DESC
END;

EXEC sp_PeliculasReproducidas @Genero = 'Terror'


select * from Peliculas