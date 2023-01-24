-- https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.pdf

-- 1.4.8.1

-- 1. Devuelve el nombre del cliente con mayor límite de crédito
SELECT c.nombre_cliente , c.limite_credito 
FROM cliente c 
where c.limite_credito = (SELECT MAX(c2.limite_credito) FROM cliente c2);

-- 2. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT p.codigo_producto , p.nombre , p.precio_venta 
from producto p 
WHERE p.precio_venta = (SELECT max(p2.precio_venta) from producto p2);  

-- 3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que
-- calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos
-- de la tabla detalle_pedido)


-- 4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
SELECT c.codigo_cliente , c.nombre_cliente , c.limite_credito , p2.total 
FROM cliente c 
join pago p2 ON c.codigo_cliente  = p2.codigo_cliente 
WHERE c.limite_credito > p2.total 
group by c.codigo_cliente; 

-- 5. Devuelve el producto que más unidades tiene en stock.
select p.codigo_producto , p.nombre , p.cantidad_en_stock 
FROM producto p
WHERE p.cantidad_en_stock = (SELECT MAX(p2.cantidad_en_stock) from producto p2);

-- 6. Devuelve el producto que menos unidades tiene en stock.
select p.codigo_producto , p.nombre , p.cantidad_en_stock 
FROM producto p
WHERE p.cantidad_en_stock = (SELECT MIN(p2.cantidad_en_stock) from producto p2);

-- 7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria
select CONCAT(e.nombre,' ', e.apellido1,' ', e.apellido2 ) AS 'Nombre y apellidos', e.email as 'Email', e.codigo_jefe 
from empleado e 
WHERE e.codigo_jefe = 3;

-- 8. Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT p2.codigo_producto
from producto p2 WHERE p2.codigo_producto not in 
(SELECT dp.codigo_producto  from detalle_pedido dp group by codigo_producto)

-- 9. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
SELECT e.codigo_empleado as 'C.Empleado' , 
CONCAT(e.nombre , ' ' ,e.apellido1, ' ', e.apellido2) as 'Empleado'  , 
e.codigo_jefe as 'C.Jefe' ,
CONCAT(e2.nombre , ' ' ,e2.apellido1, ' ', e2.apellido2) as 'Jefe' 
FROM empleado e
left join empleado e2
on e.codigo_jefe = e2.codigo_empleado 
where e.codigo_empleado
not in (SELECT DISTINCT (c.codigo_empleado_rep_ventas) from cliente c);

--Ejercicios varios

-- 1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en
-- cuenta que pueden existir clientes que no han realizado ningún pedido.

SELECT c.codigo_cliente , c.nombre_cliente , COUNT( DISTINCT p.codigo_pedido) as 'N.Pedidos'
FROM cliente c 
left join pedido p ON p.codigo_cliente = c.codigo_cliente 
GROUP by c.codigo_cliente;

-- 2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en
-- cuenta que pueden existir clientes que no han realizado ningún pago.
SELECT c.codigo_cliente , c.nombre_cliente , SUM( DISTINCT p.total) as 'total_pagado'
FROM cliente c 
left join pago p  ON p.codigo_cliente  = c.codigo_cliente 
WHERE p.total is not null
GROUP by c.codigo_cliente;

-- 3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de
-- menor a mayor.

SELECT c.codigo_cliente , c.nombre_cliente , p.fecha_pedido 
FROM cliente c 
left join pedido p ON p.codigo_cliente = c.codigo_cliente 
where YEAR (p.fecha_pedido) = 2008
GROUP by c.codigo_cliente
ORDER by c.nombre_cliente  asc;

-- 4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número
-- de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

-- 5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su
-- representante de ventas y la ciudad donde está su oficina.

-- 6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

-- 7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
