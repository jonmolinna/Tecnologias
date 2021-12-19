/*
SELECT
- DISTINCT
- ORDER BY
- WHERE
- LIMIT
- IS NULL
- GROUP BY
- HAVING
- JOIN (aqui no se vera)
*/

-- SELECT
SELECT * FROM productos;
SELECT producto_nombre FROM productos;

SELECT producto_nombre, producto_precio 
FROM productos;

SELECT producto_nombre || ' - ' || producto_precio AS nombre_precio
FROM productos;

-- ORDER BY
SELECT producto_nombre, producto_stock, producto_precio
FROM productos
ORDER BY producto_nombre ASC;

SELECT producto_nombre, producto_precio
FROM productos
ORDER BY producto_precio DESC;

SELECT producto_nombre, LENGTH(producto_nombre) AS longitud
FROM productos
ORDER BY longitud DESC

-- DISTINCT
SELECT DISTINCT producto_tipo
FROM productos;

-- WHERE
-- =, >, <, >=, <=, <>, !=, AND, OR
-- IN, BETWEEN, LIKE, IS NULL, NOT

-- Liste los productos cafe con stock mayor a cero
SELECT producto_nombre, producto_precio, producto_tipo, producto_stock
FROM productos
WHERE producto_tipo = 'café' AND producto_stock > 0;

-- Liste los categorias de té, café, ice café
SELECT producto_nombre, producto_tipo, producto_precio
FROM productos
WHERE producto_tipo IN ('té', 'café', 'ice café')
ORDER BY producto_tipo ASC;

-- Liste todos los categorias de cafe excepto café y té
SELECT producto_nombre, producto_tipo, producto_precio
FROM productos
WHERE producto_tipo NOT IN ('té', 'café')
ORDER BY producto_tipo ASC;

-- Liste todos los cafes que tenga el nombre espresso
SELECT producto_nombre, producto_precio, producto_tipo, producto_stock
FROM productos
WHERE producto_nombre LIKE 'Espresso%';

-- Liste los productos con rango de precios de 1 a 4
SELECT producto_nombre, producto_precio
FROM productos
WHERE producto_precio BETWEEN 1 AND 4
ORDER BY producto_precio;

-- LIMIT
-- Liste los 3 primero productos con rango de precios de 1 a 4
SELECT producto_nombre, producto_precio
FROM productos
WHERE producto_precio BETWEEN 1 AND 4
ORDER BY producto_precio
LIMIT 3

-- Liste entre 3 a 6 primero productos con rango de precios de 1 a 4
SELECT producto_nombre, producto_precio
FROM productos
WHERE producto_precio BETWEEN 1 AND 4
ORDER BY producto_precio
LIMIT 3 OFFSET 3;

-- IS NULL
-- Liste los productos con categoria null
SELECT producto_nombre, producto_precio, producto_tipo
FROM productos
WHERE producto_tipo IS NULL;

SELECT producto_nombre, producto_precio, producto_tipo
FROM productos
WHERE producto_tipo IS NOT NULL;

-- GROUP BY
-- Liste la cantidad de productos que hay en las categorias
SELECT producto_tipo, COUNT(producto_nombre) AS cantidad_producto
FROM productos
GROUP BY producto_tipo;

-- HAVING => es el reemplazo de where en GROUP BY
-- Liste la cantidad de productos que hay en las categorias y sea mayor a 3
SELECT producto_tipo, COUNT(producto_nombre) AS cantidad_producto
FROM productos
GROUP BY producto_tipo
HAVING COUNT(producto_nombre) > 2;
