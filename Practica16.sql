
--a
e
CREATE PROCEDURE inserteunregistroenHistorial
@Titulo NVARCHAR(100),@Genero NVARCHAR(50),@FechaEstreno DATE,@UsuarioID INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO Peliculas (Titulo, Genero, FechaEstreno) 
VALUES (@Titulo, @Genero, @FechaEstreno);
DECLARE @PeliculaID INT;
SET @PeliculaID = SCOPE_IDENTITY();
INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion) 
VALUES (@UsuarioID, @PeliculaID, GETDATE());
COMMIT TRANSACTION;
END;

EXEC inserteunregistroenHistorial @Titulo = 'RayoMcqueen', @Genero = 'Infantil', @FechaEstreno = '2006-12-26', @UsuarioID = 1;

SELECT * FROM HistorialVisualizacion
SELECT * FROM Peliculas

--b

CREATE PROCEDURE insertarunusuarioconsurespectivasuscripción
@Nombre NVARCHAR(100),@Email NVARCHAR(100),@Pass NVARCHAR(100),@TipoSuscripcion NVARCHAR(50),
@FechaInicio DATE,@FechaFin DATE,
@PeliculaID INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO Usuarios (Nombre, Email, Pass, FechaRegistro) 
VALUES (@Nombre, @Email, @Pass, @FechaInicio);
DECLARE @UsuarioID INT;
SET @UsuarioID = SCOPE_IDENTITY();
INSERT INTO Suscripciones (UsuarioID, Tipo, FechaInicio, FechaFin) 
VALUES (@UsuarioID, @TipoSuscripcion, @FechaInicio, @FechaFin);
INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID, FechaVisualizacion) 
VALUES (@UsuarioID, @PeliculaID, GETDATE());
COMMIT TRANSACTION;
END;

EXEC insertarunusuarioconsurespectivasuscripción @Nombre = 'Juanito Pistolas', @Email = 'juanito.pistolas@gmail.com', @Pass = '0123456789', @TipoSuscripcion = 'Mensual', @FechaInicio = '2024-07-01', @FechaFin = '2024-08-01', @PeliculaID = 1;

SELECT * FROM Suscripciones
SELECT * FROM Usuarios

DROP PROCEDURE insertarunusuarioconsurespectivasuscripción

--c

CREATE PROCEDURE actualizarelcorreodelosusuarios
@UsuarioID INT,@NuevoEmail NVARCHAR(100)
AS
BEGIN
BEGIN TRANSACTION
UPDATE Usuarios
SET Email = @NuevoEmail
WHERE UsuarioID = @UsuarioID;
UPDATE Suscripciones
SET Tipo = 'Anual'
WHERE UsuarioID = @UsuarioID;
COMMIT TRANSACTION;
END;

EXEC actualizarelcorreodelosusuarios @UsuarioID = 18, @NuevoEmail = 'juanito.pistolaslocas@example.com';

SELECT * FROM Usuarios

--d

CREATE PROCEDURE EliminarPeliculaHistorial
@PeliculaID INT
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM HistorialVisualizacion
WHERE PeliculaID = @PeliculaID;
DELETE FROM Peliculas
WHERE PeliculaID = @PeliculaID;
COMMIT TRANSACTION;
END;

EXEC EliminarPeliculaHistorial @PeliculaID = 13;

SELECT * FROM HistorialVisualizacion
SELECT * FROM Peliculas

--e

CREATE PROCEDURE EliminarUsuarioSuscripcionesHistorial
@UsuarioID INT
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM HistorialVisualizacion
WHERE UsuarioID = @UsuarioID;
DELETE FROM Suscripciones
WHERE UsuarioID = @UsuarioID;
DELETE FROM Usuarios
WHERE UsuarioID = @UsuarioID;
COMMIT TRANSACTION;
END;

EXEC EliminarUsuarioSuscripcionesHistorial @UsuarioID = 10;

SELECT * FROM Suscripciones
SELECT * FROM Usuarios







