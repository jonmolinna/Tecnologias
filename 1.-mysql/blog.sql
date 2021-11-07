DROP DATABASE IF EXISTS blog;

CREATE DATABASE blog;

USE blog;

CREATE TABLE usuarios (
    id_usuario INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    pais VARCHAR(30),
    popularidad SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    activo BOOLEAN NOT NULL DEFAULT 1,
    PRIMARY KEY (id_usuario),
    UNIQUE (nombre)
  );


CREATE TABLE articulos (
    id_articulo INT UNSIGNED AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    texto VARCHAR(1000) NOT NULL,
    tema ENUM ("General", "Python", "Mysql"),
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT UNSIGNED,
    PRIMARY KEY (id_articulo),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
        ON DELETE NO ACTION ON UPDATE CASCADE
  );



  -- SENTENCIAS DML: Inserción de registros y actualizaciones --

INSERT INTO usuarios (nombre, pais) VALUES
    ("rubén", "Colombia"),
    ("susan", "México"),
    ("lucas", Null),
    ("nacho", "España"),
    ("maría", Null),
    ("ramón", "Colombia"),
    ("lucía", "México"),
    ("sofía", "Ecuador");


INSERT INTO articulos (titulo, texto, tema, id_usuario) VALUES
    (
      "Lenguaje divertido",
      "Python es un lenguaje de programación divertido.",
      "Python",
      1
    );

UPDATE usuarios SET popularidad = popularidad + 1
    WHERE id_usuario = 1;

INSERT INTO articulos (titulo, texto, tema, fecha, id_usuario) VALUES
    (
      "Bases de datos fáciles",
      "El SGDB MySQL es fácil de aprender.",
      "Python",
      "2020-01-10 15:00:00",
      2
    );

UPDATE usuarios SET popularidad = popularidad + 4
    WHERE id_usuario = 2;


INSERT INTO articulos (titulo, texto, tema, fecha, id_usuario) VALUES
    (
      "Programar es útil",
      "Aprender a programar es algo muy útil.",
      "General",
      "2020-05-18 23:30:00",
      4
    );

UPDATE usuarios SET popularidad = popularidad + 3
    WHERE id_usuario = 4;


INSERT INTO articulos (titulo, texto, tema, fecha, id_usuario) VALUES
    (
      "Empezar por lo básico",
      "Es conviente aprender bien las bases de la programación.",
      "General",
      "2021-03-12 19:20:08",
      2
    );

UPDATE usuarios SET popularidad = popularidad + 1
    WHERE id_usuario = 2;


INSERT INTO articulos (titulo, texto, tema, fecha, id_usuario) VALUES
    (
      "Hacer juegos con python",
      "Con la librería pygame se pueden hacer juegos interesantes en python.",
      "Python",
      "2021-08-23 08:27:14",
      1
    );

UPDATE usuarios SET popularidad = popularidad + 1
    WHERE id_usuario = 1;



INSERT INTO articulos (titulo, texto, tema, fecha, id_usuario) VALUES
    (
      "Modelo físico",
      "Con MySQL se puede crear el modelo físico de una base de datos fácilmente.",
      "MySQL",
      "2021-11-30 16:15:00",
      3
    );

UPDATE usuarios SET popularidad = popularidad + 1
    WHERE id_usuario = 3;



INSERT INTO articulos (titulo, texto, tema, fecha, id_usuario) VALUES
    (
      "Algoritmos",
      "Aprender algoritmos es muy interesante.",
      "General",
      "2021-11-30 16:15:00",
      7
    );

UPDATE usuarios SET popularidad = popularidad + 4
    WHERE id_usuario = 7;


INSERT INTO articulos (titulo, texto, tema, fecha, id_usuario) VALUES
    (
      "Versiones",
      "Python hay dos versiones principales, la versión 2 y la 3.",
      "Python",
      "2021-11-30 16:15:00",
      5
    );

UPDATE usuarios SET popularidad = popularidad + 1
    WHERE id_usuario = 5;


-- Un usuario se da de baja

UPDATE usuarios SET activo = 0
    WHERE id_usuario = 5;


-------------------------------------------------- CONSULTAS MULTITABLAS
-- Consulte el nombre de usuario y su articulo
SELECT nombre, titulo
FROM usuarios, articulos
WHERE usuarios.id_usuario = articulos.id_usuario;