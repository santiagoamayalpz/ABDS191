
--INSERTS
INSERT INTO tipo_usuario (id,clasificacion)
VALUES (1,'principiante'),
	(2,'avanzado'),
	(3,'experto');

INSERT INTO USUARIO(id, fecha_ingreso, tipo_u_id, nombre, apellido1, apellido2, correo)
VALUES (1, '2024-05-31', 1, 'Juan', 'P�rez', 'Garc�a', 'juan@gmail.com'),
	(2, '2024-06-01', 2, 'Santiago', 'Amaya', 'L�pez', 'juan@gmail.com'),
	(3, '2024-06-02', 2, 'Juan', 'Armando', 'Gallardo', 'juan@gmail.com'),
	(4, '2024-06-03', 3, 'Mar�a', 'Gonz�lez', 'Mart�nez', 'maria@gmail.com'),
    (5, '2024-06-04', 1, 'Pedro', 'Ram�rez', 'S�nchez', 'pedro@gmail.com'),
    (6, '2024-06-05', 2, 'Ana', 'L�pez', 'P�rez', 'ana@gmail.com');


insert into calculadora (id,fecha,calcuC02,usuario_id)
values (1,'2024-06-01', 178.23, 1 ),
	   (2, '2024-06-02', 250.10, 2),
       (3, '2024-06-03', 123.45, 3),
       (4, '2024-06-04', 300.75, 1);

INSERT INTO foro (id, titulo, descripcion)
VALUES (1, 'Foro de Programaci�n', 'Discusi�n sobre lenguajes de programaci�n'),
       (2, 'Foro de Dise�o', 'Comparte tus creaciones y obt�n feedback'),
       (3, 'Foro de Ciencia', 'Debates cient�ficos y descubrimientos');

INSERT INTO comentario (id, fecha, contenido, usuario_id, publicacion_id)
VALUES (1, '2024-06-01', '�Excelente art�culo!', 1, 1),
       (2, '2024-06-02', 'Me gustar�a colaborar en el dise�o', 2, 2),
       (3, '2024-06-03', '�Alguien m�s est� emocionado por esto?', 3, 3);

INSERT INTO curso (id, titulo, estatus, contenido, fecha_publicacion)
VALUES (1, 'Curso de SQL', 'Activo', 'Aprende a manejar bases de datos', '2024-06-01'),
       (2, 'Curso de Dise�o Gr�fico', 'Pr�ximamente', 'Herramientas y t�cnicas creativas', '2024-06-02'),
       (3, 'Curso de F�sica Cu�ntica', 'En desarrollo', 'Explorando el mundo subat�mico', '2024-06-03');

INSERT INTO PUBLICACION(id, contenido, fecha, foto_id, usuario_id)
VALUES (1, 'Introduccion a Python', '2024-06-01', 1, 1),
       (2, 'Diseño de logotipos', '2024-06-02', 2, 2),
       (3, 'Avances en la fisica cuantica', '2024-06-03', 3, 3);

INSERT INTO clases (id, titulo, contenido, curso_id)
VALUES (1, 'Introducción a SQL', 'Conceptos básicos de consultas', 1),
       (2, 'Diseño de logotipos avanzado', 'Técnicas de ilustración digital', 2),
       (3, 'Teoría cuántica aplicada', 'Entendiendo los principios', 3);

INSERT INTO inscripcion (id, estatus, fehca_inscripcion, curso_id, usuario_id)
VALUES
    (1, 'Activa', '2024-06-01', 1, 1),
    (2, 'Pendiente', '2024-06-02', 2, 2),
    (3, 'Aprobada', '2024-06-03', 3, 3),
    (4, 'Rechazada', '2024-06-04', 1, 2),
    (5, 'En espera', '2024-06-05', 2, 3);

-- para obtener información de usuarios y sus inscripciones
SELECT u.nombre, u.apellido1, i.estatus
FROM usuario u
INNER JOIN inscripcion i ON u.id = i.usuario_id;

-- para obtener que usuario esta en que curso
SELECT u.nombre, u.apellido1, c.titulo
FROM usuario u
INNER JOIN inscripcion i ON u.id = i.usuario_id
INNER JOIN curso c ON i.curso_id = c.id;


-- para ver el contenido de publicaciones en algun foro
SELECT p.contenido, f.titulo
FROM publicacion p
INNER JOIN foro f ON p.foto_id = f.id;


-- para obtener información de foros y sus publicaciones
-- tomando en cuenta los foros que no tienen publicaciones
SELECT f.titulo, p.contenido
FROM foro f
LEFT JOIN publicacion p ON f.id = p.foto_id;

-- para obtener información de clases y sus cursos
-- tomando en cuenta los cursos que no tienen clases
SELECT c.titulo, cl.contenido
FROM curso c
RIGHT JOIN clases cl ON c.id = cl.curso_id;








