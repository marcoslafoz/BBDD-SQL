-- INSERT SOBRE JARDINERIA
-- Crea para hoy un nuevo pedido de 30 arboles de picota para el cliente Dardenas S.A. 
-- a 7€ la unidad que deja pagado y se le entregara pasado mañana

SELECT * FROM cliente c where nombre_cliente like 'Darde%';
-- codigo cliente  Dardenas = "14"
SELECT p.codigo_pedido  FROM pedido p order by p.codigo_pedido DESC ;
-- codigo del pedido "129"

INSERT into pedido (codigo_cliente, codigo_pedido, fecha_pedido, fecha_esperada, estado) 
    values (14, 129, '2023-01-01', '2023-01-04', 'Pendiente');
    
INSERT into detalle_pedido 
    values (129, 'FR-28', 30, 7, 1);