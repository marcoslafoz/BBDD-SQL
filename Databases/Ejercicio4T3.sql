--La Consejería de Educación gestiona los centros de enseñanza secundaria y los
--profesores.
--De cada centro se conoce su código, nombre dirección, teléfono y tipo 
--(con posibles valores público, concertado o privado). 
--De los privados se sabe también la mensualidad que cobran 
--y de los concertados el número de grupos que tienen.

--De los profesores interesa su DNI, Nombre, Apellidos y Especialidad.

--Un profesor puede impartir clase en varios centros hasta completar su jornada.
--Es importante conocer la fecha de inicio y de finalización de trabajo de los profesores en los centros.

CREATE DATABASE IF NOT EXISTS consejeria_educacion;
USE consejeria_educacion;

CREATE TABLE centro(
    codigo CHAR (10) PRIMARY KEY,
    nombre VARCHAR (256),
    direccion VARCHAR (256),
    telefono CHAR (9),
    tipo ENUM('publico','concertado','privado'),
    mensualidad FLOAT(10,2),
    num_grupos INT
);

CREATE TABLE profesor(
    DNI CHAR (9) PRIMARY KEY,
    nombre VARCHAR (256),
    apellidos VARCHAR (256),
    especialidad VARCHAR (256)
);

CREATE TABLE jornada(
    codigo_centro CHAR (10) REFERENCES centro(codigo),
    codigo_profesor CHAR (9) REFERENCES profesor(DNI),
    fecha_inicio DATE,
    fecha_final DATE ,
    PRIMARY KEY (codigo_centro,codigo_profesor)
);









