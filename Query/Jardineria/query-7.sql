--1
use jardineria;
select * from cliente;
select nombre, apellido1, apellido2 from empleado;
select c.nombre_cliente as 'Nombre Cliente',
e.nombre as 'Nombre Empleado',
concat(e.apellido1,' ', e.apellido2) as 'Apellidos Empleado'
from cliente c , empleado e
where c.codigo_empleado_rep_ventas = e.codigo_empleado; 

--2
USE jardineria;
SELECT DISTINCT nombre_cliente  as 'Nombre Cliente',
e.nombre as 'Nombre Rep.Ventas',
CONCAT(e.apellido1, ' ', e.apellido2) as 'Apellidos Rep.Ventas'
FROM cliente c, empleado e
where c.codigo_empleado_rep_ventas = e.codigo_empleado
and codigo_cliente  = c.codigo_cliente;

--3
use jardineria; 
SELECT c.codigo_cliente, p.codigo_cliente
from cliente c, pago p 
WHERE p.codigo_cliente != c.codigo_cliente ;

--4
SELECT * FROM pago;
SELECT DISTINCT c.nombre_cliente as 'Nombre cliente',
o.ciudad as 'Ciudad oficina',
e.nombre as 'Nombre Rep.Ventas',
CONCAT(e.apellido1, ' ', e.apellido2) as 'Apellidos Rep.Ventas'
from cliente c , empleado e , pago p , oficina o 
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado 
and p.codigo_cliente  = c.codigo_cliente 
and e.codigo_oficina = o.codigo_oficina ;

--7
SELECT DISTINCT o.ciudad as 'Ciudad Oficina',
c.nombre_cliente as 'Nombre Cliente',
CONCAT(e.nombre, ' ' ,e.apellido1) as 'Nombre rep'
from oficina o , cliente c , empleado e 
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado 
and e.codigo_oficina = o.codigo_oficina ;


