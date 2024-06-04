
CREATE TABLE Autores (
    id_autor BIGINT IDENTITY(300,1) PRIMARY KEY,
    nombre VARCHAR(100),
    pais_origen VARCHAR(100)
);

ALTER TABLE Comics
ADD id_autor bigint,
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);

INSERT INTO Autores (nombre, pais_origen) VALUES 
('Gabriel García Márquez', 'Colombia'),
('Mario Vargas Llosa', 'Perú'),
('Isabel Allende', 'Chile'),
('Julio Cortázar', 'Argentina');

SELECT * FROM Comics;

select * from autores;

update Comics
set id_autor = 300 where id_comic=14

update Comics
set id_autor = 301 where id_comic=16

update Comics
set id_autor = 302 where id_comic=18

update Comics
set id_autor = 303 where id_comic=20

update Comics
set id_autor = 300 where id_comic=22

update Comics
set id_autor = 301 where id_comic=24

update Comics
set id_autor = 302 where id_comic=26

update Comics
set id_autor = 303 where id_comic=28

update Comics
set id_autor = 300 where id_comic=30

update Comics
set id_autor = 301 where id_comic=32

update Comics
set id_autor = 302 where id_comic=34

update Comics
set id_autor = 303 where id_comic=36

SELECT c.nombre AS Comic, a.nombre AS Autor, i.cantidad_disponible AS cantidad_disponible
FROM Comics c
LEFT JOIN Autores a ON c.id_autor = a.id_autor
LEFT JOIN Inventario i ON c.id_comic = i.id_comic;

SELECT * FROM Inventario;

SELECT * FROM Autores;

SELECT a.pais_origen AS pais_origen, a.nombre AS Autor, c.nombre AS Comic
FROM Comics c
LEFT JOIN Autores a ON a.id_autor = c.id_autor;








