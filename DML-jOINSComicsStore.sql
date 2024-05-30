-- INNER JOIN

SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
from Compras c 
INNER JOIN Clientes cl ON c.id_cliente=cl.id_cliente;

-- LEFT JOIN
SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
from Compras c 
LEFT JOIN Clientes cl ON c.id_cliente=cl.id_cliente;

-- RIGHT JOIN
SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
from Compras c 
RIGHT JOIN Clientes cl ON c.id_cliente=cl.id_cliente;

-- FULL JOIN
SELECT *
FROM Clientes cl
full join Compras c
on c.id_cliente = c.id_cliente