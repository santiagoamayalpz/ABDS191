
--1

CREATE PROCEDURE AgregarCliente
@Nombre NVARCHAR(100), @Correo NVARCHAR(255), @Pass NVARCHAR(255)
AS
BEGIN
    INSERT INTO dbo.Clientes (nombre, correo_electronico, pass)
    VALUES (@Nombre, @Correo, @Pass);
END;

SELECT * FROM Clientes

EXEC AgregarCliente  @Nombre = 'Luis Suarez',  @Correo = 'luis.suarez@gmail.com', @Pass = '123pass';

--2

CREATE PROCEDURE AgregarAutor
@Nombre NVARCHAR(100), @PaisOrigen NVARCHAR(100)
AS
BEGIN
    INSERT INTO dbo.Autores (nombre, pais_origen)
    VALUES (@Nombre, @PaisOrigen);
END;

SELECT * FROM Autores

EXEC AgregarAutor @Nombre = 'Antony Mota', @PaisOrigen = 'Bélgica';

--3

CREATE PROCEDURE AgregarComic
@Nombre NVARCHAR(100), @Anio TINYINT, @Precio DECIMAL(10,2), @IdAutor BIGINT
AS
BEGIN
    INSERT INTO dbo.Comics (nombre, anio, precio, id_autor)
    VALUES (@Nombre, @Anio, @Precio, @IdAutor);
END;

SELECT * FROM Comics

EXEC AgregarComic @Nombre = 'Tintin en el Congo', @Anio = 31, @Precio = 899.00, @IdAutor = 10301;

--4

CREATE PROCEDURE ActualizarPaisOrigenAutor
@Id_autor BIGINT, @NuevoPaisOrigen NVARCHAR(100)
AS
BEGIN
    UPDATE dbo.Autores
    SET pais_origen = @NuevoPaisOrigen
    WHERE id_autor = @Id_Autor;
END;

SELECT * FROM Autores;

EXEC ActualizarPaisOrigenAutor @Id_autor = 301, @NuevoPaisOrigen = 'México';

--5

CREATE PROCEDURE ActualizarPrecioComic
@IdComic BIGINT, @NuevoPrecio DECIMAL(10,2)
AS
BEGIN
    UPDATE dbo.Comics
    SET precio = @NuevoPrecio
    WHERE id_comic = @IdComic;
END;

SELECT * FROM Comics

EXEC ActualizarPrecioComic @IdComic = 16, @NuevoPrecio = 900.00;






