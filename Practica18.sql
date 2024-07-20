select * from Clientes

select * from Cuentas

select * from Empleados

select * from Transacciones

--a

CREATE TRIGGER Tr_CrearTabla
ON DATABASE
FOR CREATE_TABLE
AS
PRINT 'Se ha creado una nueva tabla en DBBank'

--b

CREATE TABLE Prestamos (
    PrestamoID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    Monto DECIMAL(18, 2),
    TasaInteres DECIMAL(5, 2),
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE PagosPrestamos (
    PagoID INT IDENTITY(1,1) PRIMARY KEY,
    PrestamoID INT,
    MontoPagado DECIMAL(18, 2),
    FechaPago DATE,
    FOREIGN KEY (PrestamoID) REFERENCES Prestamos(PrestamoID)
);

INSERT INTO Prestamos (ClienteID, Monto, TasaInteres, FechaInicio, FechaFin) VALUES
(1, 10000.00, 5.50, '2023-01-10', '2025-01-10'),
(2, 15000.00, 4.50, '2023-02-10', '2026-02-20');

INSERT INTO PagosPrestamos (PrestamoID, MontoPagado, FechaPago) VALUES
(1, 1000.00, '2023-03-10'),
(2, 1500.00, '2023-03-15');

--c

CREATE TRIGGER Tr_CrearProcedimiento
ON DATABASE
FOR CREATE_PROCEDURE
AS
PRINT 'Se ha creado un Nuevo Procedimiento en DBBank'

--d

CREATE PROCEDURE spIngresarPrestamoConPago
    @ClienteID INT,
    @Monto DECIMAL(18, 2),
    @TasaInteres DECIMAL(5, 2),
    @FechaInicio DATE,
    @FechaFin DATE,
    @MontoPagado DECIMAL(18, 2),
    @FechaPago DATE
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @PrestamoID INT;
        

        INSERT INTO Prestamos (ClienteID, Monto, TasaInteres, FechaInicio, FechaFin)
        VALUES (@ClienteID, @Monto, @TasaInteres, @FechaInicio, @FechaFin);
        
        SET @PrestamoID = SCOPE_IDENTITY();
        
        INSERT INTO PagosPrestamos (PrestamoID, MontoPagado, FechaPago)
        VALUES (@PrestamoID, @MontoPagado, @FechaPago);
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

EXEC spIngresarPrestamoConPago @ClienteID = 1, @Monto = 20000.00, @TasaInteres = 5.00, @FechaInicio = '2024-01-01', @FechaFin = '2026-01-01', @MontoPagado = 500.00, @FechaPago = '2024-02-01';

select * from PagosPrestamos
select * from Prestamos

--e

CREATE PROCEDURE spCompleto
AS
BEGIN
    SELECT 
        c.ClienteID,
        c.Nombre,
        c.Direccion,
        c.Telefono,
        c.Email,
        p.PrestamoID,
        p.Monto AS MontoPrestamo,
        p.TasaInteres,
        p.FechaInicio,
        p.FechaFin,
        pg.PagoID,
        pg.MontoPagado,
        pg.FechaPago
    FROM 
        Clientes c
        INNER JOIN Prestamos p ON c.ClienteID = p.ClienteID
        INNER JOIN PagosPrestamos pg ON p.PrestamoID = pg.PrestamoID;
END;

EXEC spCompleto;
