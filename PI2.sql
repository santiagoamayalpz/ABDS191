
--a. 3 vistas con Joins

--1

CREATE VIEW UsuariosPublicaciones AS
SELECT 
    U.id AS UsuarioID,
    U.nombre,
    U.apellido1,
    U.apellido2,
    P.id AS PublicacionID,
    P.contenido,
    P.fecha
FROM 
    USUARIO U
JOIN 
    PUBLICACION P ON U.id = P.usuario_id;

SELECT * FROM UsuariosPublicaciones;

--2

CREATE VIEW ComentariosPublicaciones AS
SELECT 
    C.id AS ComentarioID,
    C.fecha AS FechaComentario,
    C.contenido AS ContenidoComentario,
    P.id AS PublicacionID,
    P.contenido AS ContenidoPublicacion
FROM 
    COMENTARIO C
JOIN 
    PUBLICACION P ON C.publicacion_id = P.id;

SELECT * FROM ComentariosPublicaciones;

--3

CREATE VIEW InscripcionesUsuariosCursos AS
SELECT 
    I.id AS InscripcionID,
    I.estatus,
    I.fehca_inscripcion,
    U.id AS UsuarioID,
    U.nombre,
    U.apellido1,
    U.apellido2,
    C.id AS CursoID,
    C.titulo AS CursoTitulo
FROM 
    INSCRIPCION I
JOIN 
    USUARIO U ON I.usuario_id = U.id
JOIN 
    CURSO C ON I.curso_id = C.id;

SELECT * FROM InscripcionesUsuariosCursos;

--b. 5 procedimientos Almacenados simples

--1

CREATE PROCEDURE InsertarComentario
@contenido TEXT,
@usuario_id INT,
@publicacion_id INT,
@fecha DATE
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO COMENTARIO(contenido, usuario_id, publicacion_id, fecha)
VALUES (@contenido, @usuario_id, @publicacion_id, @fecha)
COMMIT TRANSACTION;
END;

EXEC InsertarComentario 'Me gusto', 1, 1, '2024-07-08';

SELECT * FROM COMENTARIO;
SELECT * FROM PUBLICACION;

DROP PROCEDURE InsertarComentario

--2

CREATE PROCEDURE InsertarInscripcion
@estatus NVARCHAR(50),
@fehca_inscripcion DATE,
@curso_id INT,
@usuario_id INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO INSCRIPCION(estatus, fehca_inscripcion, curso_id, usuario_id)
VALUES (@estatus, @fehca_inscripcion, @curso_id, @usuario_id)
COMMIT TRANSACTION;
END;

EXEC InsertarInscripcion 'activo', '2024-07-08', 1, 2;

SELECT * FROM INSCRIPCION;
SELECT * FROM CURSO;

DROP PROCEDURE InsertarInscripcion;

--3

CREATE PROCEDURE InsertarPublicacion
@contenido TEXT,
@fecha DATE,
@foto_id INT,
@usuario_id INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO PUBLICACION(contenido, fecha, foto_id, usuario_id)
VALUES (@contenido, @fecha, @foto_id, @usuario_id)
COMMIT TRANSACTION;
END;

EXEC InsertarPublicacion 'Sistemas Inteligentes', '2024-07-08', 1, 1;

SELECT * FROM PUBLICACION;
SELECT * FROM USUARIO;

DROP PROCEDURE InsertarPublicacion;

--4

CREATE PROCEDURE InsertarCurso
@titulo NVARCHAR(100),
@estatus NVARCHAR(50),
@contenido TEXT,
@fecha_publicacion DATE
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO CURSO(titulo, estatus, contenido, fecha_publicacion)
VALUES (@titulo, @estatus, @contenido, @fecha_publicacion)
COMMIT TRANSACTION;
END;

EXEC InsertarCurso 'Base de datos', 'activo', 'SQL Server', '2024-07-08';

SELECT * FROM CURSO;
SELECT * FROM CLASES;

DROP PROCEDURE InsertarCurso;

--5

CREATE PROCEDURE InsertarUsuario
@nombre NVARCHAR(50),
@apellido1 NVARCHAR(50),
@apellido2 NVARCHAR(50),
@correo NVARCHAR(100),
@fecha_ingreso DATE,
@tipo_u_id INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO USUARIO(nombre, apellido1, apellido2, correo, fecha_ingreso, tipo_u_id)
VALUES (@nombre, @apellido1, @apellido2, @correo, @fecha_ingreso, @tipo_u_id)
COMMIT TRANSACTION;
END;

EXEC InsertarUsuario 'Michelle', 'Quintero', 'Moreno', 'michelle.quintero@gmail.com', '2024-07-08', 1;

SELECT * FROM USUARIO;
SELECT * FROM TIPO_USUARIO;

DROP PROCEDURE InsertarUsuario;


--c. 3 procedimientos con transacciones

--1

CREATE PROCEDURE InsertarNuevaPublicacion
@contenido TEXT,
@fecha DATE,
@foto_id INT,
@usuario_id INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO PUBLICACION (contenido, fecha, foto_id, usuario_id)
VALUES (@contenido, @fecha, @foto_id, @usuario_id);
COMMIT TRANSACTION;
END;

EXEC InsertarNuevaPublicacion 'Fisica Moderna', '2024-07-08', 3, 1;

SELECT * FROM PUBLICACION;
SELECT * FROM USUARIO;

DROP PROCEDURE InsertarNuevaPublicacion;

--2

CREATE PROCEDURE InsertarNuevaInscripcion
@estatus NVARCHAR(50),
@fehca_inscripcion DATE,
@curso_id INT,
@usuario_id INT
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO INSCRIPCION (estatus, fehca_inscripcion, curso_id, usuario_id)
VALUES (@estatus, @fehca_inscripcion, @curso_id, @usuario_id);
COMMIT TRANSACTION;
END;

EXEC InsertarNuevaInscripcion 'pendiente', '2024-07-08', 2, 2;

SELECT * FROM INSCRIPCION;
SELECT * FROM CURSO;

DROP PROCEDURE InsertarNuevaInscripcion;

--3

CREATE PROCEDURE InsertarNuevoCurso
@titulo NVARCHAR(100),
@estatus NVARCHAR(50),
@contenido TEXT,
@fecha_publicacion DATE
AS
BEGIN
BEGIN TRANSACTION
INSERT INTO CURSO (titulo, estatus, contenido, fecha_publicacion)
VALUES (@titulo, @estatus, @contenido, @fecha_publicacion);
COMMIT TRANSACTION;
END;

EXEC InsertarNuevoCurso 'Cuidado del Agua', 'Proximamente', 'Como cuidar el agua', '2024-07-08';

SELECT * FROM CURSO;
SELECT * FROM CLASES;

DROP PROCEDURE InsertarNuevoCurso;


