-- Esto es un comentario

CREATE DATABASE IF NOT EXISTS censo;
USE censo;

CREATE TABLE viviendas(
	Codigo CHAR (9) PRIMARY KEY REFERENCES personas(DNI),
	Calle VARCHAR(255),
	Numero INT,
	Piso INT,
	Puerta CHAR(1),
	Bloque INT,
	OtrasCaracteristicas VARCHAR(255)
);

CREATE TABLE personas(
	DNI CHAR (9) PRIMARY KEY,
	Nombre VARCHAR (255),
	Apellidos VARCHAR (255),
	FechaNacimiento DATE,
	CabezaFamiliaPersonas VARCHAR(9) REFERENCES personas(DNI) 
);

CREATE TABLE municipio(
	Nombre VARCHAR (255) PRIMARY KEY,
	Provincia VARCHAR (256)
);

CREATE TABLE habita(
	Persona VARCHAR (9),
	Vivienda VARCHAR (35),
	dueño BOOL default false
);