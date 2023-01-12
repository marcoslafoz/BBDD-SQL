-- Ejercicios Tema 4 /ejer2

-- https://docs.google.com/document/d/1EY-NKtEWIobMlZa2JmitlqChYsrR1Llx7eccFWpajJU/edit
-- https://docs.google.com/document/d/1zW-NyHc3_vGZds0x1WFtG5AY4A_zTdqw5_hd1mP-pfM/edit#heading=h.gjdgxs

-- EJERCICIO 2 SOLUCIONES

-- 1. Visualizar el código de oficina y la ciudad donde hay oficinas.

-- 2. Visualizar cuántos empleados hay en la compañía.

-- 3. Visualizar cuántos clientes tiene cada país.

-- 4. Visualizar cuál fue el pago medio en 2005 (pista: Usar la función YEAR de mysql
-- o la función to_chart(fecha, &#39;yyyy&#39;) de Oracle).

-- 5. Visualizar cuántos pedidos están en cada estado ordenado descendente por el
-- número de pedidos
 
-- 6. Visualizar el precio del producto más caro y más barato.
select max (precio_venta) as 'Producto mas caro', 
min (precio_venta) as 'Producto más barato' from producto p;

-- 7. Visualizar la ciudad y el teléfono de las oficinas de Estados Unidos.
select ciudad, telefono, pais
from oficina where pais like '%EEUU%';

-- 8. Visualizar el nombre, los apellidos y el email de los empleados a cargo de
-- Alberto Soria.
select DISTINCT  nombre, apellido1, apellido2, email
from empleado e 
where codigo_jefe =3;

-- 9. Visualizar el cargo, nombre, apellidos y email del jefe de la empresa.
SELECT puesto, nombre, apellido1, apellido2, email FROM empleado e 
WHERE puesto LIKE 'Director General';

-- 10. Visualizar el nombre, apellidos y cargo de aquellos que no sean representantes
-- de ventas.
SELECT nombre,apellido1,apellido2,puesto
from empleado e
WHERE puesto != 'Representante Ventas';

-- 11. Visualizar el número de clientes que tiene la empresa.
SELECT COUNT(c.codigo_cliente) AS 'total clientes' FROM cliente c;

-- 12. Visualizar el nombre de los clientes españoles.
select nombre_contacto, pais from cliente c2 ;
select DISTINCT c.nombre_contacto ,c.pais 
from cliente c
where c.pais like '%Spain%';

-- 13. Visualizar cuántos clientes tiene cada país.
SELECT pais as 'Pais',
count(*) as 'Numero de clientes'
from cliente group by pais;

-- 14. Visualizar cuántos clientes tiene la ciudad de Madrid.
SELECT c.codigo_cliente , c.nombre_cliente  
FROM cliente c  
WHERE c.ciudad = 'madrid';

SELECT COUNT(*)  
FROM cliente c  
WHERE c.ciudad = 'madrid';

-- 15. Visualizar cuántos clientes tienen las ciudades que empiezan por M.
select count(*) as 'Nº de clientes', ciudad 
from cliente
where ciudad LIKE 'M%'
group by ciudad;

-- 16. Visualizar el código de empleado y el número de clientes al que atiende cada
-- representante de ventas.
select * from empleado;
select * from cliente;
select  c.codigo_empleado_rep_ventas  as 'codigo rep. de ventas', count (*) as 'nº de clientes' 
from  cliente c  
group by c.codigo_empleado_rep_ventas;

-- 17. Visualizar el número de clientes que no tiene asignado representante de
-- ventas.
SELECT COUNT(codigo_cliente) as 'Clientes sin Rep.Ventas'  
FROM cliente c 
WHERE codigo_empleado_rep_ventas is NULL ;

-- 18. Visualizar cuál fue el primer y último pago que hizo algún cliente. 

-- 19. Visualizar el código de cliente de aquellos clientes que hicieron pagos en 2008. 
SELECT fecha_pago , codigo_cliente
FROM pago p
WHERE YEAR (fecha_pago) = 2008;

-- 20. Visualizar los distintos estados por los que puede pasar un pedido.
select DISTINCT estado from pedido;

-- 21. Visualizar el número de pedido, código de cliente, fecha requerida y fecha de
-- entrega de los pedidos que no han sido entregados a tiempo.
SELECT p.codigo_pedido AS 'Número de pedido', 
c.codigo_cliente AS 'Código de cliente', 
p.fecha_esperada AS 'Fecha esperada', 
p.fecha_entrega AS 'Fecha de entrega',
DATEDIFF( p.fecha_entrega, p.fecha_esperada) as 'Días retraso'
FROM pedido p, cliente c
WHERE c.codigo_cliente = p.codigo_cliente 
AND p.fecha_entrega > p.fecha_esperada;

-- 22. Visualizar cuántos productos existen en cada línea de pedido. 
select dp.codigo_pedido ,sum(dp.cantidad) 
from detalle_pedido dp group by dp.codigo_pedido ;

-- 23. Visualizar un listado de los 20 códigos de productos más pedidos ordenado por
-- cantidad pedida. (pista: Usar el filtro LIMIT de MySQL o el filtro rownum de
-- Oracle.)

-- 24. Visualizar el número de pedido, código de cliente, fecha requerida y fecha de
-- entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes
-- de la fecha requerida. (pista: Usar la función addDate de MySQL o el operador
-- + de Oracle).
select p.codigo_pedido, p.fecha_esperada, p.fecha_entrega ,
DATEDIFF(fecha_esperada,fecha_entrega) as 'dias'
FROM pedido p 
where 
p.estado = 'Entregado' 
and p.fecha_entrega is not null
and DATEDIFF(fecha_esperada,fecha_entrega) >= 2 ;

-- 25. Visualizar la facturación que ha tenido la empresa en toda la historia, indicando
-- la base imponible, el IVA y el total facturado. NOTA: La base imponible se
-- calcula sumando el coste del producto por el número de unidades vendidas. El
-- IVA, es el 18% de la base imponible, y el total, la suma de los dos campos
-- anteriores.

-- 26. Visualizar la misma información que en la pregunta anterior, pero agrupada por
-- código de producto filtrada por los códigos que empiecen por FR.