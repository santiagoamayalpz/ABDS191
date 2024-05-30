USE ComicsStore;

-- Insertar nuevos clientes
INSERT INTO Clientes (nombre, correo_electronico, pass) VALUES
('Carlos', 'carlos99@gmail.com', 'abc123'),
('Laura', 'laura.smith@hotmail.com', 'password1'),
('Javier', 'javi32@gmail.com', 'javi321'),
('Lucia', 'lucia@outlook.es', 'lucia12'),
('Martina', 'martina88@gmail.com', 'marta123'),
('Diego', 'diego.rocks@gmail.com', 'diego76'),
('Alberto', 'alberto_g@hotmail.com', 'albert1'),
('Pilar', 'pilar89@gmail.com', 'pilar789'),
('Clara', 'clara91@otlook.es', 'clara123'),
('Gabriel', 'gabriel20@gmail.com', 'gab20'),
('Sofia', 'sofia.hernandez@gmail.com', 'sofia23');

-- Insertar nuevos cómics
INSERT INTO Comics (nombre, anio, precio) VALUES
('Spider-Man: Homecoming', '17', '450.00'),
('The Flash: Rebirth', '16', '400.00'),
('Black Panther: A Nation Under Our Feet', '16', '500.00'),
('Ms. Marvel: No Normal', '14', '350.00'),
('Iron Man: Extremis', '05', '300.00'),
('The Walking Dead', '03', '200.00'),
('Green Lantern: Rebirth', '04', '350.00'),
('Thor: God of Thunder', '12', '375.00'),
('Daredevil: Born Again', '86', '450.00'),
('Captain Marvel: Higher, Further, Faster, More', '14', '400.00'),
('Guardians of the Galaxy', '08', '350.00'),
('Doctor Strange: The Oath', '07', '375.00'),
('Black Widow: The Finely Woven Thread', '14', '400.00'),
('Hawkeye: My Life as a Weapon', '12', '375.00'),
('Ant-Man: Second-Chance Man', '15', '325.00');

-- Seleccionar todas las filas de las tablas Clientes, Comics, e Inventario
SELECT * FROM Clientes;
SELECT * FROM Comics;
SELECT * FROM Inventario;

-- Modificar la columna disponibilidad en la tabla Inventario
ALTER TABLE Inventario
ALTER COLUMN disponibilidad BIT;

-- Insertar nuevos registros en la tabla Inventario
INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES
(14, 5, 1),
(16, 3, 1),
(18, 0, 0),
(20, 2, 1),
(22, 4, 1),
(24, 0, 0),
(26, 5, 1),
(28, 1, 1),
(30, 2, 1),
(32, 3, 1),
(34, 6, 1),
(36, 2, 1),
(38, 1, 1),
(40, 3, 1),
(42, 2, 1);


-- Insertar nuevas compras
INSERT INTO Compras (id_cliente, fecha_compra, total) VALUES
('1', '2023-03-11', '450.00'),
('3', '2024-05-03', '400.00'),
('6', '2024-01-15', '350.00'),
('8', '2024-03-05', '400.00'),
('10', '2023-11-21', '500.00'),
('11', '2024-04-23', '300.00'),
('2', '2024-02-23', '375.00');

-- Seleccionar todas las filas de la tabla Compras e Inventario
SELECT * FROM Compras;
SELECT * FROM Inventario;

-- Insertar más compras
INSERT INTO Compras (id_cliente, fecha_compra, total) VALUES
('2', '2023-12-20', '450.00'),
('4', '2023-11-27', '400.00'),
('7', '2024-01-10', '450.00'),
('2', '2024-01-20', '400.00'),
('4', '2024-01-27', '375.00'),
('7', '2024-01-20', '400.00'),
('2', '2024-02-20', '500.00'),
('4', '2024-02-27', '450.00'),
('7', '2024-02-10', '375.00');

-- Insertar nuevos registros en la tabla Comic_Compras
INSERT INTO Comic_Compras (cantidad, id_compra, id_comic) VALUES
(1, 100, 14),
(1, 103, 16),
(1, 106, 18),
(1, 109, 20),
(1, 112, 22),
(1, 115, 24),
(1, 118, 26),
(1, 121, 28),
(1, 124, 30),
(1, 127, 32),
(1, 130, 34),
(1, 133, 36),
(1, 136, 38),
(1, 139, 40),
(1, 142, 42);

select * from Comics
