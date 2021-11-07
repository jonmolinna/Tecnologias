CREATE DATABASE IF NOT EXISTS agenda;

USE agenda;

-- DROP DATABASE agenda;

-- CREANDO TABLAS
CREATE TABLE contactos (
    id_contacto INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    fecha_nacimiento DATE,
    ultima_comunicacion DATETIME,
    PRIMARY KEY (id_contacto)
);

CREATE TABLE pruebas (
    id INT UNSIGNED AUTO_INCREMENT,
    dos_decimales DECIMAL(8,2),
    cuatro_decimales DECIMAL(8,4),
    muchos_decimales DECIMAL(65,30),
    tipo_float FLOAT(255,30),
    tipo_double DOUBLE(255,30),
    PRIMARY KEY (id)
);

-- INSERTAR REGISTROS A UNA TABLA
INSERT INTO contactos (nombre, apellido, email, telefono, fecha_nacimiento, ultima_comunicacion) VALUES
("Kendra", "Contreras", "kcontreras123@gmail.com", "51 923457892", "1994-05-30", "2021-04-27 10:30:00");

INSERT INTO contactos (nombre, apellido, empresa, email, telefono) VALUES
("Grace", "Tandon", "Hn tv", "gtandon45@gmail.com", "51 345234567"),
("Bronwie", "Tanase", "Hn tv", "btanase_123@gmail.com", "51 912345876"),
("Jane", "Saez", "Hn tv", "janesaz.12gmail.com", "51 923786543");

INSERT INTO pruebas (dos_decimales, cuatro_decimales, muchos_decimales, tipo_float, tipo_double) VALUES
(1234.12, 1234.1234, POW(10,20), POW(10,25), POW(10,30));