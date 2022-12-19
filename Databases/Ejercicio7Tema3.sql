REATE DATABASE IF NOT EXISTS agencia_viajes;
USE agencia_viajes;

CREATE TABLE oficina(
    codigo_oficina CHAR (10) PRIMARY KEY,
    direccion VARCHAR(256),
    codigo_responsable CHAR(10)
);

CREATE TABLE cliente(
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR (50),
    direccion VARCHAR(256),
    telefono CHAR(9),
    n_cuenta CHAR(24)
);

CREATE TABLE viaje(
    codigo_viaje CHAR(10) PRIMARY KEY,
    precio DECIMAL(10,2),
    tipo enum('Pension completa','Alojamiento','Desayuno o alojamiento'),
    codigo_origen CHAR(10),
    codigo_destino CHAR(10),
    codigo_cliente CHAR(9),
    codigo_oficina CHAR(10),
    CONSTRAINT `codigo_origen` FOREIGN KEY (codigo_origen) REFERENCES lugar(codigo_lugar),
    CONSTRAINT `codigo_destino` FOREIGN KEY (codigo_destino) REFERENCES lugar(codigo_lugar),
    CONSTRAINT `codigo_cliente` FOREIGN KEY (codigo_cliente) REFERENCES cliente(dni),
    CONSTRAINT `codigo_oficina` FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina)
);

CREATE TABLE lugar(
    codigo_lugar CHAR(10) PRIMARY KEY,
    nombre VARCHAR(256),
    pais VARCHAR (50)
);