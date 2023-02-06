-- Ejemplo UPDATE

SELECT * from pedido p ;
SELECT CURDATE();
UPDATE pedido p 
set p.fecha_entrega = CURDATE(), estado = 'Pendiente'
where p.codigo_pedido = 4;

-- Si un pedido tiene fecha de entrega y esta rechazado, entonces el estado debe ser 'Devuelto'

UPDATE pedido p 
set estado = 'Devuelto'
WHERE p.fecha_entrega is not null and p.estado like 'Rech%';
SELECT * from pedido where estado like 'De%';

-- Ejemplo

UPDATE empleado set codigo_jefe = 778 WHERE codigo_empleado = 779;