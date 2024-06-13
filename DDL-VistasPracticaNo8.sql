
CREATE VIEW Vista_ComprasComics AS
SELECT c.id_comic AS id_CC, cc.cantidad, c.nombre AS nombre_comic, cc.id_compra, ct.fecha_compra, ct.total
FROM Comics c
LEFT JOIN Comic_Compras cc ON c.id_comic = cc.id_comic
INNER JOIN Compras ct ON cc.id_compra = ct.id_compra;

SELECT * FROM Vista_ComprasComics;

CREATE VIEW Vista_ComicsComprados AS
SELECT cli.id_cliente, cli.nombre, cc.cantidad AS cantidad_comprada
FROM Clientes cli
INNER JOIN Compras c ON cli.id_cliente = c.id_cliente
INNER JOIN Comic_Compras cc ON  cc.id_compra = c.id_compra;

SELECT * FROM Vista_ComicsComprados;

