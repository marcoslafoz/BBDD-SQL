CREATE DATABASE IF NOT EXISTS ventacoches;
USE ventacoches;

--Borrar tablas: DROP TABLE tabla;

CREATE TABLE clientes(
	nie char(9) PRIMARY KEY,
	nombre varchar(256),
	direccion varchar(512),
	ncuenta char(24)
);

CREATE TABLE coches(
	nbastidor char(17) PRIMARY KEY,
	marca varchar(256),
	modelo varchar(256),
	color varchar(256),
	tipo enum('nuevo','usado')
);

CREATE TABLE cochenuevo (
	nbastidor char(17),
	matriculado boolean default false,
	f_itv date,
	CONSTRAINT `bastidor_nuevo` FOREIGN KEY nbastidor REFERENCES coches(nbastidor)
);

CREATE TABLE cocheusado(
	f_fabricacion date,
	propietarios decimal(2),
	matricula char(7),
	nbastidor char(17) PRIMARY KEY,
	f_itv date,
	CONSTRAINT `bastidor_usado` FOREIGN KEY nbastidor REFERENCES coches(nbastidor)
);

CREATE TABLE mecanicos(
	nif char(7) PRIMARY KEY,
	nombre varchar(256),
	especialidad varchar(128)
);