-- 1. Visualizar cuántos clientes tienen límite de crédito superior a 100000.
SELECT codigo_cliente,
    nombre_cliente,
    limite_credito
FROM cliente
WHERE limite_credito > 100000;

-- 2. Visualizar todos los datos de los clientes que tienen límite de crédito
--superior a 100000 ordenados por límite de crédito.
SELECT codigo_cliente,
    nombre_cliente,
    limite_credito
FROM cliente
WHERE limite_credito > 100000
ORDER BY limite_credito;

-- 3. Visualizar todos los datos de los clientes de los que se desconoce la región.
select *
from cliente
where region is null;

-- 4. Visualizar todos los datos de los empleados que no pertenezcan a oficinas españolas.
SELECT * 
FROM empleado
WHERE codigo_oficina =! "*-ES";

-- 5
SELECT *
from cliente;
select nombre_cliente,
    apellido_contacto
from cliente
where codigo_cliente > 13;

-- 6
SELECT *
from cliente;
SELECT *
from empleado;
SELECT cliente.nombre_cliente,
    telefono,
    nombre,
    apellido1, 
    apellido2
from cliente;

-- 7

SELECT *
from cliente;
SELECT DISTINCT codigo_oficina,
    nombre
from empleado;

-- 8
SELECT c.nombre_cliente as 'Nombre Cliente',
    telefono,
    nombre,
    apellido1,
    email
from cliente c,
    empleado e;

-- 9
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS 'Nombre y apellidos'
FROM empleado;

-- 10 
select concat(apellido1, ' ', apellido2, ' ', nombre) as 'Nombre apellidos'
from empleado
where codigo_oficina = 'TAL-ES';

-- 11
select concat(apellido1, ' ', apellido2, ' ', nombre) as 'Nombre apellidos'
from empleado
where codigo_jefe != codigo_empleado && codigo_oficina = 'TAL-ES';
-- where codigo_oficina = 'TAL-ES' and codigo_jefe is not null
