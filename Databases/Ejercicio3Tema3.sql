-- Esto es un comentario
CREATE DATABASE IF NOT EXISTS bibliobus;
USE bibliobus;

CREATE TABLE libro(
	codigo_libro CHAR (10) PRIMARY KEY,
	titulo VARCHAR (256),
	autor VARCHAR (256)
);

CREATE TABLE tema(
	codigo_tema CHAR (10) PRIMARY KEY,
	nombre VARCHAR (256)
);

CREATE TABLE socio(
	dni CHAR (9) PRIMARY KEY,
	nombre VARCHAR (256),
	direccion VARCHAR (256),
	localidad VARCHAR (256),
	cp CHAR (5),
	telefono CHAR (9),
	mail VARCHAR (50)
);

CREATE TABLE prestamos(
	fecha_prestamo DATE,
	fecha_devolucion DATE,
	codigo_libro CHAR (10) REFERENCES libro(codigo_libro), 
	codigo_cliente CHAR (9) REFERENCES socio(dni),
	PRIMARY KEY(codigo_libro, codigo_cliente)
);

CREATE TABLE clasificacion(
	codigo_libro CHAR (10) REFERENCES libro(codigo_libro),
	codigo_tema CHAR (10) REFERENCES tema(codigo_tema),
	PRIMARY KEY (codigo_libro, codigo_tema)
);