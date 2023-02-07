-- https://josejuansanchez.org/bd/unidad-11-teoria/index.pdf

-- 1. Inserta una nueva oficina en Almería.
INSERT INTO jardineria.oficina
(codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
VALUES('ALM-ES', 'Almeria', 'España', 'Andalucia', '00000', '+34 123455789', 'Batalla de lepanto, 3', NULL);

-- 2. Inserta un empleado para la oficina de Almería que sea representante de ventas.
INSERT INTO jardineria.empleado
(codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto)
VALUES(33, 'Mariano', 'Perez', 'Rivera', '2442', 'marianoperez@jardineria.com', 'ALM-ES', NULL, 'Representante de ventas');

-- 3. Inserta un cliente que tenga como representante de ventas el empleado que hemos creado en el paso anterior.
INSERT INTO jardineria.cliente
(codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito)
VALUES(39, 'Repsol', 'Jorge', 'García', '+34 987654321', '916421755', 'Dr. Fleming', NULL, 'Almeria', NULL, NULL, NULL, 33, NULL);

-- 4. Inserte un pedido para el cliente que acabamos de crear, que contenga al menos dos productos diferentes.
INSERT INTO jardineria.pedido
(codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente)
VALUES(130, '2023-01-07', '2023-01-09', NULL, 'Pendiente', NULL, 39);

INSERT INTO jardineria.detalle_pedido
(codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea)
VALUES(130, 'AR-004', 2, 5, 1);

INSERT INTO jardineria.detalle_pedido
(codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea)
VALUES(130, 'AR-005', 5, 3, 4);

-- 5. Actualiza el código del cliente que hemos creado en el paso anterior y averigua si hubo cambios en las tablas relacionadas.
-- 6. Borra el cliente y averigua si hubo cambios en las tablas relacionadas.
-- 7. Elimina los clientes que no hayan realizado ningún pedido

-- 8. Incrementa en un 20% el precio de los productos que no tengan pedidos.

UPDATE producto
set p.precio_venta = (precio_venta * 1.2)
where(
SELECT *
FROM producto p 
left join detalle_pedido dp on p.codigo_producto = dp.codigo_producto 
where dp.codigo_producto is NULL
);

-- 9. Borra los pagos del cliente con menor límite de crédito.

-- 10. Establece a 0 el límite de crédito del cliente que menos unidades pedidas tenga del producto 11679.

-- 11. Modifica la tabla detalle_pedido para insertar un campo numérico llamado iva. Mediante una transacción, 
-- establece el valor de ese campo a 18 para aquellos registros cuyo pedido tenga fecha a partir de
-- Enero de 2009. A continuación actualiza el resto de pedidos estableciendo el iva al 21.

-- 12. Modifica la tabla detalle_pedido para incorporar un campo numérico llamado total_linea y actualiza todos sus registros para 
-- calcular su valor con la fórmula:
