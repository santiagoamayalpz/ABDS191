
CREATE PROCEDURE Insertar
@nombre VARCHAR(50), @correo_electronico VARCHAR (50), @pass VARCHAR(25)
AS
BEGIN
INSERT INTO Clientes(nombre, correo_electronico, pass)
VALUES (@nombre, @correo_electronico, @pass);
END;

exec Insertar 'santiago', 'santi@gmail.com', '123contra'

select * from Clientes

--2

CREATE PROCEDURE Insertar1
    @id_Comic INT,
    @nombre VARCHAR(50),
    @anio VARCHAR(4),
    @precio FLOAT
AS
BEGIN
    SET IDENTITY_INSERT Comics ON;

    INSERT INTO Comics (id_comic, nombre, anio, precio)
    VALUES (@id_Comic, @nombre, @anio, @precio);

    SET IDENTITY_INSERT Comics OFF;
END;

exec Insertar1 43, 'superman', 24, 499;

select * from Comics;

DROP PROCEDURE Insertar1;

--Procedimientos para editar
--1

CREATE PROCEDURE EditarCliente
    @id_Cliente INT,
    @nombre VARCHAR(50),
    @correo_electronico VARCHAR(50),
    @pass VARCHAR(25)
AS
BEGIN
    UPDATE Clientes
    SET nombre = @nombre,
        correo_electronico = @correo_electronico,
        pass = @pass
    WHERE id_Cliente = @id_Cliente;
END;

exec EditarCliente 11, 'Sara', 'sara.juarez@gmail.com', '123pass';
 
select * from Clientes;

--2

CREATE PROCEDURE EditarComic
@id_Comic INT, @nombre VARCHAR(50), @anio VARCHAR(4),
    @precio FLOAT
AS
BEGIN
    UPDATE Comics
    SET nombre = @nombre,
        anio = @anio,
        precio = @precio
    WHERE id_comic = @id_Comic;
END;

exec EditarComic 42, 'Ant-Man', 20, 369;

select * from Comics

--Procedimientos para eliminar
--1

CREATE PROCEDURE EliminarCliente
    @id_Cliente INT
AS
BEGIN
    DELETE FROM Clientes
    WHERE id_Cliente = @id_Cliente;
END;

exec EliminarCliente 10002;

select * from Clientes;

--2

CREATE PROCEDURE EliminarComic
    @id_comic INT
AS
BEGIN
    DELETE FROM Comics
    WHERE id_comic = @id_comic;
END;

exec EliminarComic 43;

select * from Comics;

DROP PROCEDURE EliminarComic;

--Consultas Joins
--1

CREATE PROCEDURE ConsultarComicsPorAutor
    @id_autor BIGINT
AS
BEGIN
    SELECT c.id_comic, c.nombre, c.anio, c.precio, a.nombre AS autor_nombre
    FROM Comics c
    JOIN Autores a ON c.id_autor = a.id_autor
    WHERE a.id_autor = @id_autor;
END;

exec ConsultarComicsPorAutor @id_autor = 302;

select * from Autores

--2

CREATE PROCEDURE ComprasClientes
    @id_Cliente INT
AS
BEGIN
    SELECT cl.id_Cliente, cl.nombre, cl.correo_electronico, p.id_compra, p.fecha_compra
    FROM Clientes cl
    JOIN Compras p ON cl.id_Cliente = p.id_Cliente
    WHERE cl.id_Cliente = @id_Cliente;
END;

exec ComprasClientes @id_Cliente = 2;

select * from Compras

DROP PROCEDURE ComprasClientes;

--3

CREATE PROCEDURE DetallesCompras
    @id_compra INT
AS
BEGIN
    SELECT c.id_compra, c.fecha_compra, d.id_cliente
    FROM Compras c
    JOIN Compras d ON c.id_compra = d.id_compra
    WHERE c.id_compra = @id_compra;
END;

exec DetallesCompras @id_compra = 100;

select * from Compras

select * from Comic_Compras





