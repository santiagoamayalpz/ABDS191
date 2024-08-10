
-- a. Crear un Trigger para mostrar un mensaje después de insertar un nuevo cliente
CREATE TRIGGER trg_InsertarCliente
ON Clientes
AFTER INSERT
AS
BEGIN
    PRINT 'Se ha insertado un nuevo cliente en la tabla Clientes.'
END;

INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES ('Mau Aleman', 'Arrecife', '555-5555', 'mau@gmail.com');

SELECT * FROM Clientes;

-- b. Crear un Trigger para mostrar un mensaje después de eliminar un cliente
CREATE TRIGGER trg_EliminarCliente
ON Clientes
AFTER DELETE
AS
BEGIN
    PRINT 'Se ha eliminado un cliente de la tabla Clientes.'
END;

DELETE FROM Clientes WHERE ClienteID = 4;

SELECT * FROM Clientes;

-- c. Crear un Trigger para validar si existe el cliente antes de crear una nueva cuenta
CREATE TRIGGER trg_ValidarClienteEnCuenta
ON Cuentas
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1 
            FROM Clientes c 
            WHERE c.ClienteID = i.ClienteID
        )
    )
    BEGIN
        PRINT 'El cliente especificado no existe. No se puede crear la cuenta.';
    END
    ELSE
    BEGIN
        INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
        SELECT ClienteID, TipoCuenta, Saldo, FechaApertura
        FROM inserted;
        PRINT 'La cuenta ha sido creada con éxito.';
    END
END;

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES (3, 'Ahorro', 500.00, '2024-03-01');

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura) VALUES (2, 'Ahorro', 500.00, '2024-03-01');

SELECT * FROM Cuentas;

-- d. Crear un Trigger para evitar la actualización de cuentas con saldo negativo
CREATE TRIGGER trg_ValidarSaldoCuenta
ON Cuentas
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        WHERE i.Saldo < 0
    )
    BEGIN
        PRINT 'No se permite actualizar la cuenta con un saldo negativo.';
    END
    ELSE
    BEGIN
        UPDATE Cuentas
        SET ClienteID = i.ClienteID,
            TipoCuenta = i.TipoCuenta,
            Saldo = i.Saldo,
            FechaApertura = i.FechaApertura
        FROM inserted i
        WHERE Cuentas.CuentaID = i.CuentaID;
        PRINT 'La cuenta ha sido actualizada con éxito.';
    END
END;

UPDATE Cuentas SET Saldo = -100.00 WHERE CuentaID = 2;

UPDATE Cuentas SET Saldo = 3000.00 WHERE CuentaID = 2;

SELECT * FROM Cuentas;

-- e. Crear un Trigger para evitar la eliminación de un préstamo si tiene pagos asociados
CREATE TRIGGER trg_EvitarEliminacionPrestamo
ON Prestamos
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM deleted d
        JOIN PagosPrestamos pp ON d.PrestamoID = pp.PrestamoID
    )
    BEGIN
        PRINT 'No se puede eliminar el préstamo porque tiene pagos asociados.';
    END
    ELSE
    BEGIN
        DELETE FROM Prestamos
        WHERE PrestamoID IN (SELECT PrestamoID FROM deleted);
        PRINT 'El préstamo ha sido eliminado con éxito.';
    END
END;

DELETE FROM Prestamos WHERE PrestamoID = 1;

DELETE FROM Prestamos WHERE PrestamoID = 2;

SELECT * FROM Prestamos;
SELECT * FROM PagosPrestamos;

-- f. Crear una tabla logClientes para registrar operaciones en la tabla Clientes

CREATE TABLE logClientes (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Operacion NVARCHAR(10),
    FechaHora DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER trg_LogOperacionesClientes
ON Clientes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operacion NVARCHAR(10);

    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        SET @Operacion = 'UPDATE';
    END
    ELSE IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        SET @Operacion = 'INSERT';
    END
    ELSE IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        SET @Operacion = 'DELETE';
    END

    INSERT INTO logClientes (Operacion)
    VALUES (@Operacion);
END;

INSERT INTO Clientes (Nombre, Direccion, Telefono, Email) VALUES ('diego amaya', 'Mision', '444-7777', 'diego@gmail.com');

UPDATE Clientes SET Direccion = 'Calle Sol 789' WHERE ClienteID = 1;

