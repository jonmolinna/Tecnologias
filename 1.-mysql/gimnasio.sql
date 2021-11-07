DROP DATABASE IF EXISTS gimnasio;

CREATE DATABASE gimnasio;

USE gimnasio;

CREATE TABLE clientes (
    cli_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cli_nombre VARCHAR(50) NOT NULL,
    cli_empresa VARCHAR(50),
    PRIMARY KEY (cli_id)
  );

CREATE TABLE empleados (
    emp_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    emp_nombre VARCHAR(50) NOT NULL,
    emp_genero CHAR(1),
    PRIMARY KEY (emp_id)
  );

CREATE TABLE entrenamientos (
    ent_id INT UNSIGNED AUTO_INCREMENT,
    ent_tipo VARCHAR(30),
    cli_id INT UNSIGNED NOT NULL,
    emp_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (ent_id),
    FOREIGN KEY (cli_id) REFERENCES clientes (cli_id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (emp_id) REFERENCES empleados (emp_id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
  );


  -- SENTENCIAS DML: Inserción de registros y actualizaciones --

INSERT INTO clientes (cli_nombre, cli_empresa) VALUES
    ("Silvia", "Microsoft"),
    ("Nacho", "Samsung"),
    ("Ramón", "Apple"),
    ("Sofía", "Microsoft"),
    ("Andrés", "Microsoft"),
    ("Carla", "Apple"),
    ("Raul", "Samsung"),
    ("Lucía", "Apple");


INSERT INTO empleados (emp_nombre, emp_genero) VALUES
    ("Thomas", "M"),
    ("Martha", "F"),
    ("Robert", "M"),
    ("Rachel", "F");


INSERT INTO entrenamientos (ent_tipo, cli_id, emp_id) VALUES
    ("Mantenimiento", 1, 1),
    ("Potencia", 2, 2),
    ("Cardio", 3, 3),
    ("Mantenimiento", 4, 4),
    ("Cardio", 5,1),
    ("Mantenimiento", 6, 2),
    ("Cardio", 7, 4),
    ("Mantenimiento", 1,1),
    ("Mantenimiento", 5, 1),
    ("Potencia", 3, 2),
    ("Mantenimiento", 5, 2),
    ("Cardio", 7, 4);


--- CONSULTAS MULTITABLAS
-- Liste el nombre clientes y sus respectivas entrenamietos con sus empleados
SELECT cli_nombre, emp_nombre, ent_tipo
FROM clientes, empleados, entrenamientos
WHERE clientes.cli_id = entrenamientos.cli_id
AND empleados.emp_id = entrenamientos.emp_id;