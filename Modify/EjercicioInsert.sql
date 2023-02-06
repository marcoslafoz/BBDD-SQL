-- INSERT SOBRE JARDINERIA
-- Crea para hoy un nuevo pedido de 30 arboles de picota para el cliente Dardenas S.A. 
-- a 7€ la unidad que deja pagado y se le entregara pasado mañana

INSERT INTO pedido (codigo_cliente, codigo_pedido, fecha_pedido, fecha_esperada, estado) 
    VALUES (14, 129, '2023-01-01', '2023-01-04', 'Pendiente');
    
INSERT INTO detalle_pedido 
    VALUES (129, 'FR-28', 30, 7, 1);

INSERT INTO jardineria.empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) 
    VALUES(32, 'Marcos', 'Lafoz', 'Miranda', 3211, 'aa22.mlafoz47@iespabloserrano.com', 'TAL-ES', NULL, NULL);

-- Crea una tabla denominada usuarios, con el id de usuario con autoincremental, su nombre y apellido. Inserta un dato y comprueba
-- que no necesitas asignar el id

CREATE TABLE `usuarios` (
  `codigo_usuario` int(11)  auto_increment primary key,
  `nombre` varchar(50) not null,
  `apellido1` varchar(50) not null,
  `apellido2` varchar(50) default null 
);

INSERT INTO jardineria.usuarios (nombre, apellido1, apellido2) 
    VALUES('Marcos', 'Lafoz', 'Miranda');
INSERT INTO jardineria.usuarios (nombre, apellido1, apellido2) 
    VALUES('Pablo', 'Lopez', 'Martinez');
INSERT INTO jardineria.usuarios (nombre, apellido1) 
    VALUES('Miguel', 'Perez');

--Ejemplo

INSERT into empleado values 
((select max (e.codigo_empleado) +1 from empleado e), 'Siguiente' , 'Apellido' , 'Apellido' , '4564' , 'marcos@marcos.net', 'TAL-ES', NULL , NULL);

-- Crear una tabla empleados con vacaciones en invierno, que son todos los empleados que trabajan en la oficina de Sydney

CREATE TABLE vacaciones_invierno(
codigo_empleado int (11) primary key,
nombre varchar (50) not null,
apellido1 varchar(50) not null ,
apellido2 varchar(50) default null);

INSERT INTO vacaciones_invierno (codigo_empleado , nombre , apellido1 , apellido2)
SELECT e.codigo_empleado , e.nombre , e.apellido1 , e.apellido2  from empleado e where codigo_oficina like 'SYD-AU';

SELECT * from vacaciones_invierno vi;