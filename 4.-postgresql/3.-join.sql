-------------------------------------- INNER JOIN - JOIN
SELECT p.producto_nombre, cop.cantidad
FROM productos AS p 
INNER JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

-- total por producto
SELECT p.producto_nombre, p.producto_precio, 
        cop.cantidad, cop.cantidad * p.producto_precio AS total_pagar
FROM productos AS p 
INNER JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;

-- total a pagar
SELECT SUM(cop.cantidad * p.producto_precio) AS total_pagar
FROM productos AS p 
INNER JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id;


-------------------------------------- LEFT JOIN
-- Liste los productos que no se venden
SELECT p.producto_nombre
FROM productos AS p
LEFT JOIN cliente_ordenes_productos AS cop
ON p.producto_id = cop.producto_id
WHERE cop.cliente_orden_id IS NULL;


-------------------------------------- RIGHT JOIN
-- Liste los productos con ventas
SELECT p.producto_nombre
FROM productos p
RIGHT JOIN cliente_ordenes_productos cop
ON p.producto_id = cop.producto_id;


-------------------------------------- FULL JOIN
SELECT *
FROM productos p
FULL JOIN cliente_ordenes_productos cop
ON p.producto_id = cop.producto_id;


-------------------------------------- INNER JOIN CON N TABLAS
SELECT co.orden_fecha, p.producto_nombre
FROM cliente_ordenes co
INNER JOIN cliente_ordenes_productos cop
ON co.cliente_orden_id = cop.cliente_orden_id
INNER JOIN productos p
ON p.producto_id = cop.producto_id;

-- Pintar nombre cliente, fecha orden, cantidad, nombre producto y cantidad por precio
SELECT 
    c.cliente_nombre, 
    co.orden_fecha,
    cop.cantidad,
    p.producto_nombre,
    cop.cantidad * p.producto_precio AS total
FROM clientes c
JOIN cliente_ordenes co
ON c.cliente_id = co.cliente_id
JOIN cliente_ordenes_productos cop
ON co.cliente_orden_id = cop.cliente_orden_id
JOIN productos p
ON p.producto_id = cop.producto_id;