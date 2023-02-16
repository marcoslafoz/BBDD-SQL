-- 1.7.1 Base de datos: Jardinería

-- 1 Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los clientes y los pagos que ha realizado cada uno de ellos. 
-- La vista deberá tener las siguientes columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la transacción
CREATE  VIEW listado_pagos_clientes AS 
SELECT concat(c.nombre_cliente, ' ', c.apellido_contacto)  as "Nombre cliente", c.telefono , c.ciudad , c.pais , p.fecha_pago , p.total , p.id_transaccion 
FROM cliente c
join pago p on c.codigo_cliente = p.codigo_cliente ;

--  2 Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de ellos. 
-- La vista deráber tener las siguientes columnas: nombre y apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido, fecha del pedido, fecha esperada, 
-- fecha de entrega y la cantidad total del pedido, que será la suma del producto de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.
 CREATE  VIEW listado_pedidos_clientes AS 
SELECT concat(c.nombre_cliente, ' ', c.apellido_contacto)  as "Nombre cliente", c.telefono , c.ciudad , c.pais , p.codigo_pedido , p.fecha_pedido , p.fecha_esperada ,
 p.fecha_entrega , (dp.cantidad*dp.precio_unidad) as 'Total'
FROM cliente c 
 join pedido p 
inner  join detalle_pedido dp ;

--  3 Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de la ciudad de Madrid que han realizado pagos.
SELECT  * from listado_pedidos_clientes lpc 
WHERE ciudad like 'madrid';

--  4 Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes que todavía no han recibido su pedido.
SELECT * from listado_pedidos_clientes lpc 
where lpc.estado_pedido like 'pendiente'
;
--  5 Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha realizado cada uno de los clientes.
;
-- 6 Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del pedido máximo y mínimo que ha realizado cada cliente.
;
-- 7 Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos. 
;
-- 8 Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de la vista para comprobar que sigue funcionando correctamente.
;
-- 9 Elimine las vistas que ha creado en los pasos anteriores.
DROP VIEW listado_pagos_clientes ,  listado_pedidos_clientes ;