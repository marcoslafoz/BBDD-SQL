-- 1. Obtener el nombre del cliente con mayor límite de crédito.
SELECT codigo_cliente , nombre_cliente, limite_credito
from cliente c order by limite_credito desc limit 1;

-- 2. Obtener el nombre, apellido1 y cargo de los empleados que no
--representan a ningún cliente.
SELECT * from empleado e 
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas 
and c.nombre_cliente is null;

-- 3. Obtener el nombre del producto más caro
SELECT nombre , precio_venta 
FROM producto p 
order by  precio_venta desc limit 1;

-- 4. Obtener el nombre del producto del que más unidades se hayan vendido
--en un mismo pedido.
SELECT p.codigo_producto , p.nombre from producto p ;
SELECT * from detalle_pedido dp2;
SELECT p.codigo_producto , p.nombre , dp.codigo_pedido , dp.cantidad 
from producto p 
join detalle_pedido dp on p.codigo_producto = dp.codigo_producto 
order by dp.codigo_pedido, dp.codigo_producto;

-- 5. Obtener los clientes cuya línea de crédito sea mayor que los pagos que
--haya realizado.
SELECT * from pago p;
SELECT c.codigo_cliente , c.nombre_cliente , c.limite_credito , p.id_transaccion ,sum(p.total)
from cliente c 
join pago p on c.codigo_cliente = p.codigo_cliente 
GROUP by codigo_cliente 
HAVING sum (p.total) < c.limite_credito ;

-- 6. Obtener el nombre y las unidades en stock de los productos que más unidades
--tienen en stock y de los que menos unidades tienen.
(SELECT nombre  as 'Nombre', cantidad_en_stock as 'STOCK' from producto order by cantidad_en_stock  limit 5)
union 
(select nombre as 'Nombre', cantidad_en_stock as 'STOCK' from producto order by cantidad_en_stock  DESC limit 5);

SELECT * from producto p WHERE p.cantidad_en_stock = (SELECT max(p2.cantidad_en_stock) from producto p2)
or p.cantidad_en_stock = (SELECT min(cantidad_en_stock) FROM producto p3) order by cantidad_en_stock ;

-- 7. Obtener el nombre de los productos cuya gama pertenezca a plantas vistosas.
SELECT p.codigo_producto , p.nombre , p.dimensiones , gp.gama , gp.descripcion_texto 
FROM producto p , gama_producto gp 
WHERE gp.gama like "Ornamentales";

-- 8. Obtener el nombre y el teléfono de los clientes a los que no se les ha
--entregado algún pedido.
SELECT c.codigo_cliente as 'C.C', c.nombre_cliente as 'Nombre cliente' , c.telefono as 'Telefono' , p.estado as 'Estado'
FROM cliente c , pedido p 
WHERE p.estado LIKE "Pendiente"
GROUP BY c.codigo_cliente ;