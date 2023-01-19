-- 5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
SELECT codigo_empleado as 'C.Empleado' , CONCAT(nombre , ' ' , apellido1 , ' ' , apellido2) as 'Nombre empleado'  
from empleado e 
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas 
where c.nombre_cliente is null;

-- 6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con
-- los datos de la oficina donde trabajan.
SELECT codigo_empleado as 'C.Empleado' , CONCAT(nombre , ' ' , apellido1 , ' ' , apellido2) as 'Nombre empleado' , o.*
from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
inner JOIN oficina o on e.codigo_oficina = o.codigo_oficina
where c.nombre_cliente is null;

-- 7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen
-- un cliente asociado.
SELECT codigo_empleado as 'C.Empleado' , CONCAT(nombre , ' ' , apellido1 , ' ' , apellido2) as 'Nombre empleado' , e.codigo_oficina 
from empleado e 
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas 
WHERE  c.nombre_cliente is null and e.codigo_oficina is null;

-- 8. Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT p.codigo_producto , p.nombre , dp.codigo_pedido  
from detalle_pedido dp
right join producto p on dp.codigo_producto = p.codigo_producto 
WHERE dp.codigo_pedido is null;

-- 9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar
-- el nombre, la descripción y la imagen del producto. 
SELECT p.nombre , p.descripcion , gp.gama , gp.imagen  
from detalle_pedido dp
right join producto p on dp.codigo_producto = p.codigo_producto 
inner JOIN gama_producto gp on gp.gama = p.gama
WHERE dp.codigo_pedido is null ;

-- 10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes
-- de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

-- 11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
SELECT c.codigo_cliente , c.nombre_cliente   
FROM cliente c 
left join pedido p ON p.codigo_cliente = c.codigo_cliente 
inner join pago p2 ON p2.codigo_cliente = p.codigo_cliente 
WHERE p2.id_transaccion is NULL 
GROUP by c.codigo_cliente;

-- 12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
SELECT e.codigo_empleado as 'C.Empleado' , CONCAT(e.nombre , ' ' , e.apellido1 , ' ' , e.apellido2) as 'Nombre empleado' , e.codigo_jefe , e2.nombre  
from empleado e 
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
INNER  join empleado e2 on e.codigo_jefe = e2.codigo_empleado 
where c.nombre_cliente is null ;