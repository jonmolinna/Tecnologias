-- Comandos en la consola
-- \l => ver la base de datos
-- \c nameBase => permite cambiar de base de datos

-- Crear una base de datos
CREATE DATABASE curso;

-- Creando tablas
CREATE TABLE usuarios (
	nombre VARCHAR(50) NOT NULL,
	edad INT,
	descripcion TEXT,
	id_usuario SERIAL,
	PRIMARY KEY (id_usuario)
);

CREATE TABLE tareas (
	id_tareas SERIAL PRIMARY KEY,
	titulo VARCHAR(50) NOT NULL,
	fecha DATE DEFAULT CURRENT_DATE,
	estado BOOLEAN DEFAULT false,
	id_usuario INT,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Agregando un campo a la tabla
ALTER TABLE tareas
ADD descripcion TEXT;

-- Eliminando una campo de la tabla
ALTER TABLE tareas
DROP descripcion;

-- Cambiando el tipo de dato de la culumna
ALTER TABLE tareas
ALTER COLUMN descripcion SET DATA TYPE VARCHAR(255);

-- Cambiando el nombre de la columna
ALTER TABLE tareas
RENAME COLUMN titulo TO cabecera;

-- INSERTANDO REGISTRO
INSERT INTO usuarios(nombre, edad, descripcion)
VALUES
('Alex', 50, 'Le gusta la musica'),
('Kendra', 27, 'Le gusta la musica');

INSERT INTO tareas(cabecera, id_usuario)
VALUES
('Comprar una guitarra', 1),
('Ir a trabajar', 2);

INSERT INTO tareas(cabecera, id_usuario)
VALUES
('Afinar guitarra', 1),
('Revisar los documentos', 2);

-- ACTUALIZANDO REGISTRO
UPDATE tareas
SET cabecera = 'Comprar una bateria', descripcion = 'Bateria profesional'
WHERE id_tareas = 1;

-- ELIMINANDO REGISTRO
DELETE FROM tareas
WHERE id_tareas = 1;



-- CREANDO BASE DE DATOS CAFE
DROP TABLE IF EXISTS cliente_ordenes_productos;
DROP TABLE IF EXISTS cliente_ordenes;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	cliente_id SERIAL PRIMARY KEY,
	cliente_nombre VARCHAR(60)
);

-- campo numeric (6,2) => 1234,56
CREATE TABLE productos (
	producto_id SERIAL PRIMARY KEY,
	producto_nombre VARCHAR(80) NOT NULL,
	producto_precio NUMERIC(6,2) CHECK(producto_precio >= 0),
	producto_stock SMALLINT CHECK(producto_stock >= 0) DEFAULT 0,
	producto_tipo VARCHAR(80)
);

CREATE TABLE cliente_ordenes (
	cliente_orden_id SERIAL PRIMARY KEY,
	cliente_id INT REFERENCES clientes(cliente_id),
	orden_fecha DATE DEFAULT NOW()
);

CREATE TABLE cliente_ordenes_productos (
	cliente_orden_id INT REFERENCES cliente_ordenes(cliente_orden_id),
	producto_id INT REFERENCES productos(producto_id),
	cantidad SMALLINT DEFAULT 1	
);

-- Insertando registros
INSERT INTO clientes (cliente_nombre)
VALUES
('Maria'),
('Carmen'),
('Josefa'),
('Antonio'),
('Jose'),
('Manuel'),
('David'),
('Daniel');

INSERT INTO productos (producto_nombre, producto_precio, producto_stock, producto_tipo)
VALUES
('Latte', 2.50, 100, 'café'),
('Cappuccino', 1.90, 100, 'café'),
('Dulce de leche Latte', 20.50, 100, 'café'),
('Café Americano', 3.50, 100, 'café'),
('Iced Café Americano', 0.50, 100, 'ice café'),
('Café Mocha', 50, 100, 'café'),
('Caramel Macchiato', 3.2, 100, 'café'),
('Iced Mocha', 2.50, 100, 'ice café'),
('Mocha Blanco', 2.50, 0, null),
('Vanilla Latte', 2.50, 100, 'té'),
('Flat White', 2.50, 100, 'té'),
('Espresso', 2.50, 100, 'café'),
('Espresso Macchiato', 0.90, 0, 'café'),
('Espresso Con Panna', 1.50, 100, 'café'),
('Café Cortado', 3.50, 100, 'café'),
('Torta Cuatro Leches', 4.50, 100, 'postre'),
('Pie de Berries', 5.50, 0, 'postre'),
('Bagel', 2.50, 100, 'postre'),
('Donut Rellena', 6.50, 100, 'donut'),
('Scone de 4 quesos', 7.50, 100, 'sandwich'),
('Muffin Zanahoria Nuez', 8.50, 100, 'muffin'),
('Media luna', 9.50, 100, 'donut'),
('Pan de Queso', 11.50, 100, 'sandwich'),
('Praline Cake', 12.50, 100, 'sandwich'),
('Lemon Cake', 22.50, 100, null),
('Muffin con Chips', 33.50, 100, 'muffin'),
('Muffin de Arándano', 454.50, 10, 'muffin');

INSERT INTO cliente_ordenes (cliente_id)
VALUES (3);

INSERT INTO cliente_ordenes_productos (cliente_orden_id, producto_id, cantidad)
VALUES (1, 11, 2);

UPDATE productos
SET producto_stock = producto_stock -2
WHERE producto_id = 11;
-- 

INSERT INTO cliente_ordenes_productos (cliente_orden_id, producto_id, cantidad)
VALUES (1, 12, 1);

UPDATE productos
SET producto_stock = producto_stock - 1
WHERE producto_id = 12;