-- Esto es un comentario
CREATE DATABASE IF NOT EXISTS distribuidora;
use distribuidora;
CREATE TABLE empleado(
	DNI CHAR(9) PRIMARY KEY,
	numeroSS CHAR(9) not null,
	nombre VARCHAR(30),
	direccion VARCHAR(256),
	cuentabancaria CHAR(24) not null,
	telefono decimal (9),
	tipo enum (
		'sin especialidad',
		'oficinista',
		'transportista',
		'vendedor'
	) DEFAULT 'sin especialidad'
);
CREATE TABLE proveedor(
	id int AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30),
	direccion VARCHAR(256),
	telefono decimal (9)
);
CREATE TABLE ventas(
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_articulo CHAR(9),
	fecha DATE,
	unidades INT NOT NULL DEFAULT 0,
	zona ENUM('zaragoza', 'huesca', 'teruel'),
	CONSTRAINT `ventaarticulo` FOREIGN KEY (id) REFERENCES articulo(id)
);
CREATE TABLE articulo(
	id INT(9) AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR (256),
	descripcion VARCHAR (500)
);
--Tipos de cargos
CREATE TABLE transportista(
	id CHAR(9) PRIMARY KEY,
	matricula CHAR(7) NOT NULL,
	CONSTRAINT `empleado` FOREIGN KEY (id) REFERENCES empleado(DNI)
);
CREATE TABLE vendedor(
	id CHAR(9) PRIMARY KEY,
	comision decimal(7, 2) NOT NULL,
	CONSTRAINT `vendedor_empleado` FOREIGN KEY (id) REFERENCES empleado(DNI)
);
CREATE TABLE oficinista(
	id CHAR(9) PRIMARY KEY,
	cargo VARCHAR(50) NOT NULL,
	CONSTRAINT `vendedorempleado` FOREIGN KEY (id) REFERENCES empleado(DNI)
);
--Modificar base de datos (1)
ALTER TABLE ventas
ADD vendedor CHAR(9);
ALTER TABLE ventas
ADD CONSTRAINT `ventas_vendedores` FOREIGN KEY (vendedor) REFERENCES vendedor(id);
--Modificar el esquema para:
--Crear zona de ventas
--Habra distintas zonas identificadas por un codigo, que llevara una descripcion y tendra a un vendedor que la gestione
--Modificar tabla ventas 
--Zona de ventas use el identificador de las zonas que has creado
CREATE TABLE zonaventas(
	id CHAR(9) PRIMARY KEY,
	descripcion VARCHAR(256)
	ADD CONSTRAINT `vendedor` FOREIGN KEY (vendedor) REFERENCES vendedor(id);
);