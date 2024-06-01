select * from Inventario;

-- ejercicio 1
SELECT  i.id_comic, c.nombre, i.disponibilidad
FROM inventario i
INNER JOIN Comics c ON c.id_comic = i.id_comic 
WHERE i.disponibilidad != 0;

--ejercicio 2
SELECT cl.nombre AS Cliente, com.id_compra, c.nombre AS Comic, cc.cantidad
FROM Clientes cl
INNER JOIN Compras com ON cl.id_cliente = com.id_cliente
INNER JOIN Comic_Compras cc ON com.id_compra = cc.id_compra
INNER JOIN Comics c ON cc.id_comic = c.id_comic

--ejercicio 3
SELECT 
    c.id_comic,
    c.nombre AS Comic,
    COALESCE(cc.cantidad, 0) AS Cantidad_Comprada,
    i.disponibilidad AS Cantidad_Disponible
FROM 
    Comics c
FULL JOIN 
    Comic_Compras cc ON c.id_comic = cc.id_comic
FULL JOIN 
    Inventario i ON c.id_comic = i.id_comic;

--ejercicio 4
SELECT 
    c.id_comic,
    c.nombre AS Comic,
    i.disponibilidad AS Cantidad_Disponible
FROM 
    Comics c
FULL JOIN 
    Inventario i ON c.id_comic = i.id_comic;

--ejercicio 5
SELECT c.*, cc.*, i.*
FROM Comics c
FULL JOIN Comic_Compras cc ON c.id_comic = cc.id_comic
FULL JOIN Inventario i ON c.id_comic = i.id_comic;

--ejercicio 6
SELECT 
    cl.id_cliente,
    cl.nombre AS Cliente,
    com.id_compra,
    c.nombre AS Comic,
    cc.cantidad AS Cantidad_Comprada,
    i.disponibilidad AS Cantidad_Disponible
FROM     Clientes cl
INNER JOIN Compras com ON cl.id_cliente = com.id_cliente
INNER JOIN Comic_Compras cc ON com.id_compra = cc.id_compra
INNER JOIN Comics c ON cc.id_comic = c.id_comic
LEFT JOIN Inventario i ON c.id_comic = i.id_comic
WHERE cc.cantidad > 0;
