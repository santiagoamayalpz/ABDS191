
CREATE PROCEDURE NuevasSuscripciones
@Id_usuario INT,
@Tipo NVARCHAR(50),
@Fecha_inicio DATE,
@Fecha_fin DATE
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO Suscripciones(UsuarioID, Tipo, FechaInicio, FechaFin) VALUES (@Id_usuario, @Tipo, @Fecha_inicio, @Fecha_fin)
UPDATE Usuarios
SET FechaRegistro = @Fecha_inicio
WHERE UsuarioID = @Id_usuario;
COMMIT TRANSACTION;
END;

EXEC NuevasSuscripciones 6, 'Anual','2023-06-13', '2024-07-13'

select * from Suscripciones
select * from Usuarios

DROP PROCEDURE NuevaSuscripcion