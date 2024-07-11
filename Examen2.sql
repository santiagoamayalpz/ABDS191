
CREATE DATABASE DBBank;
USE DBBank;

CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Direccion NVARCHAR(200),
    Telefono NVARCHAR(15),
    Email NVARCHAR(100)
);

INSERT INTO Clientes (Nombre, Direccion, Telefono, Email)
VALUES ('Juan Zepeda', 'Tecnologico', '1111111', 'Zepeda@gmail.com'),
       ('Mauricio Aleman', 'Carretas', '2222222', 'Aleman@gmail.com'),
       ('Santiago Amaya', 'Mision de Santiago', '3333333', 'Amaya@gmail.com');

CREATE TABLE Cuentas (
    CuentaID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT,
    TipoCuenta NVARCHAR(50),
    Saldo DECIMAL(18, 2),
    FechaApertura DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
VALUES (1, 'Ahorro', 1900.00, '10-07-2024'),
       (2, 'Ahorro', 2100.00, '10-07-2024'),
       (3, 'Ahorro', 3400.00, '10-07-2024');


CREATE TABLE Transacciones (
    TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
    CuentaID INT,
    TipoTransaccion NVARCHAR(50),
    Monto DECIMAL(18, 2),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CuentaID) REFERENCES Cuentas(CuentaID)
);

INSERT INTO Transacciones (CuentaID, TipoTransaccion, Monto, FechaTransaccion)
VALUES (1, 'Deposito', 500.00, '11-07-2024 10:00:00'),
       (2, 'Retiro', 300.00, '11-07-2024 14:00:00'),
       (3, 'Deposito', 700.00, '11-07-2024 16:00:00');

CREATE TABLE Empleados (
    EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Posicion NVARCHAR(50),
    Departamento NVARCHAR(50),
    FechaContratacion DATE
);

INSERT INTO Empleados (Nombre, Posicion, Departamento, FechaContratacion)
VALUES ('Isidro Martinez', 'Gerente', 'Ventas', '10-07-2023'),
       ('Genaro Vera', 'Analista', 'IT', '10-07-2023'),
       ('Armando Juarez', 'Asistente', 'Recursos Humanos', '10-07-2023');

SELECT * FROM Empleados
SELECT * FROM Transacciones
SELECT * FROM Cuentas
SELECT * FROM Clientes

--1

CREATE PROCEDURE AbrirNuevaCuenta
    @ClienteID INT,
    @TipoCuenta NVARCHAR(50),
    @Saldo DECIMAL(18, 2),
    @FechaApertura DATE
AS
BEGIN
    INSERT INTO Cuentas (ClienteID, TipoCuenta, Saldo, FechaApertura)
    VALUES (@ClienteID, @TipoCuenta, @Saldo, @FechaApertura);
END

SELECT * FROM Cuentas
SELECT * FROM Clientes

DROP PROCEDURE AbrirNuevaCuenta

EXEC AbrirNuevaCuenta @ClienteID = 1, @TipoCuenta = 'Ahorros', @Saldo = 5500.00, @FechaApertura = '2024-10-07';
EXEC AbrirNuevaCuenta @ClienteID = 2, @TipoCuenta = 'Debito', @Saldo = 40000.00, @FechaApertura = '2024-12-07';

--2

CREATE PROCEDURE ModificarDatosCuenta
    @CuentaID INT,
    @NuevoClienteID INT,
    @NuevoTipoCuenta NVARCHAR(50),
    @NuevoSaldo DECIMAL(18, 2),
    @NuevaFechaApertura DATE
AS
BEGIN
    UPDATE Cuentas
    SET ClienteID = @NuevoClienteID, TipoCuenta = @NuevoTipoCuenta, Saldo = @NuevoSaldo, FechaApertura = @NuevaFechaApertura
    WHERE CuentaID = @CuentaID;
END

SELECT * FROM Cuentas

EXEC ModificarDatosCuenta @CuentaID = 1, @NuevoClienteID = 2, @NuevoTipoCuenta = 'Debito', @NuevoSaldo = 2080.00, @NuevaFechaApertura = '2024-11-11';
EXEC ModificarDatosCuenta @CuentaID = 5, @NuevoClienteID = 1, @NuevoTipoCuenta = 'Debito', @NuevoSaldo = 3080.00, @NuevaFechaApertura = '2024-10-11';

