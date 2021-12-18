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
CREATE TABLE clientes (
	cliente_id SERIAL PRIMARY KEY,
	cliente_nombre VARCHAR(60)
);

-- campo numeric (6,2) => 1234,56
CREATE TABLE productos (
	producto_id SERIAL PRIMARY KEY,
	producto_nombre VARCHAR(80),
	producto_precio NUMERIC(6,2) CHECK(producto_precio >= 0),
	producto_stock SMALLINT CHECK(producto_stock >= 0) DEFAULT 0,
	producto_tipo VARCHAR(80)
);
