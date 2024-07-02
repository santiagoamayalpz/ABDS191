
CREATE PROCEDURE Suscripcion
    @UsuarioID INT,
    @FechaInicio DATE,
    @FechaFin DATE,
    @Tipo NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;

    INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo)
    VALUES (@UsuarioID, @FechaInicio, @FechaFin, @Tipo);

    UPDATE Usuarios
    SET FechaRegistro = @FechaInicio
    WHERE UsuarioID = @UsuarioID;

    COMMIT TRANSACTION;
END;

select * from Suscripciones
select * from Usuarios

DROP PROCEDURE NuevaSuscripcion