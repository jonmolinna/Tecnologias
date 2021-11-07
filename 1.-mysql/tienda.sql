DROP DATABASE IF EXISTS tienda;

CREATE DATABASE tienda;

USE tienda;

CREATE TABLE productos (
    ref CHAR(4),
    nombre VARCHAR(50) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    categoria VARCHAR(30),
    unidades INT UNSIGNED DEFAULT 0,
    precio DECIMAL(8,2),
    PRIMARY KEY (ref)
);

INSERT INTO productos VALUES
  ("DE01", "Disco externo HDD 1 TB", "WESTERN", "Almacenamiento", 0, 49.25),
  ("DE02", "Disco externo HDD 500 GB", "WESTERN", "Almacenamiento", 3, 34.99),
  ("DE03", "Disco externo HDD 2 TB", "WESTERN", "Almacenamiento", 12, 101.24),
  ("DE04", "Disco externo HDD 1TB", "SEAGATE", "Almacenamiento", 0, 52.99),
  ("DE05", "Disco externo HDD 2TB", "SEAGATE", "Almacenamiento", 3, 93.80),
  ("DE06", "Disco externo HDD 500GB", "SEAGATE", "Almacenamiento", 0, 41.12),
  ("DE07", "Disco externo HDD 1 TB", "TOSHIBA", "Almacenamiento", 5, 58.71),
  ("DE08", "Disco externo HDD 2 TB", "TOSHIBA", "Almacenamiento", 0, 98.79),
  ("DI01", "Disco interno SSD 500 GB", "SAMSUNG", "Almacenamiento", 15, 101.99),
  ("DI02", "Disco interno SSD 1 TB", "SAMSUNG", "Almacenamiento", 15, 149.76),
  ("DI03", "Disco interno SSD 500GB", "SEAGATE", "Almacenamiento", 15, 68.91),
  ("DI04", "Disco interno SSD 1TB", "SEAGATE", "Almacenamiento", 36, 125.90);

---------------------------------- CONSULTAS AL REGISTRO ------------------------------------------------
-- Ver los 5 primeros de la lista
SELECT * FROM productos LIMIT 5; 

-- Ver algunos campos del producto
SELECT nombre, unidades, precio FROM productos;

-- Liste todos los productos, donde las unidades sean mayor a 0
SELECT * FROM productos WHERE unidades > 0;

-- Liste la marca SEAGATE y que el precio sea menor a 50
SELECT * FROM productos WHERE marca = "SEAGATE" AND precio < 50;

-- Liste productos donde las unidades sean mayor a 0 y que el precio sea menor a 50
SELECT * FROM productos WHERE unidades > 0 AND precio < 50;

-- Filtre todos los productos que tenga los precios entre 50 y 100
SELECT * FROM productos WHERE precio BETWEEN 50 AND 100;
SELECT * FROM productos WHERE precio > 50 AND precio < 100;

-- Liste los productos que tengan la marca TOSHIBA, SAMSUNG y WESTERN
SELECT * FROM productos WHERE marca="TOSHIBA" OR marca="SAMSUNG" OR marca="WESTERN";
SELECT * FROM productos WHERE marca IN ("TOSHIBA", "SAMSUNG", "WESTERN");

-- Liste los productos de disco interno
SELECT * FROM productos WHERE nombre LIKE "Disco interno%";

-- Liste todos los productos que tenga un 1TB de almacenamiento
SELECT * FROM productos WHERE nombre LIKE "%1 TB";
SELECT * FROM productos WHERE nombre LIKE "%1%TB";

-- Comodin _ (Solo un caracter)
SELECT * FROM productos WHERE marca LIKE "_ESTERN";

-- Muestre la solo marca de los productos
SELECT DISTINCT marca FROM productos;

-- Muestre el diferente de unidades que existen
SELECT DISTINCT unidades FROM productos;

-- Ordene los precios en forma ascendente
SELECT * FROM productos ORDER BY precio;

-- Ordene los unidades en forma descendente
SELECT * FROM productos ORDER BY unidades DESC;

-- Muestre los productos con unidades mayor a 0 y ordene en forma asc
SELECT * FROM productos WHERE unidades > 0 ORDER BY unidades ASC;

-- Ordene los productos por marca y unidades
SELECT * FROM productos ORDER by marca, unidades;

-- Muestre toda las marcas del producto y cambie el nombre a marcas_diferentes
SELECT DISTINCT marca AS marcas_diferentes FROM productos;
SELECT DISTINCT marca AS "Marcas Diferentes" FROM productos;

--- Muestre la cantidad de productos que existen.
SELECT COUNT(nombre) AS cantidad FROM productos;

-- Muestre el nombre de productos y cambie por articulos
SELECT p.nombre AS articulos FROM productos AS p;

-- SETENCIA UPDATE
-- Actualize el precio del producto WESTERN con codigo a "DE01" a 27.39
UPDATE productos SET precio = 27.39
WHERE ref = "DE01";

-- Actualiza la cantidad del producto "DE04" a 100 unidades
UPDATE productos SET unidades = 100
WHERE ref = "DE04";

-- Actualizar el producto "DI04", ingreso mas 20 unidades, el precio se redujo a mitad
UPDATE productos 
SET unidades = unidades + 20, precio = precio * 0.5
WHERE ref = "DI04";


-- AQUI USAMOS LA BASE DE DATOS WORLD
-- Muestre todas las ciudades de España (ciudad, pais)
SELECT c.name AS ciudad, p.name AS pais
FROM city AS c, country AS p
WHERE c.countrycode = "ESP" AND p.code = "ESP";

SELECT c.name AS ciudad, p.name AS pais
FROM city AS c, country AS p
WHERE c.countrycode = "PER" AND p.code = "PER";