/*Procedure test*/     call test(5);

	CREATE PROCEDURE jardineria.test(in codigo_cliente int(11))
	BEGIN
			
		-- Obtener el listado de pedidos y el total del valor e cada uno de ellos para el cliente que se busque
		SELECT c.codigo_cliente , c.nombre_cliente , p.codigo_pedido , sum(dp.cantidad * dp.precio_unidad)
		FROM cliente c
		join pedido p on c.codigo_cliente = p.codigo_cliente
		join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido 
		where c.codigo_cliente = codigo_cliente 
		GROUP by p.codigo_pedido;

	END

/*Procedure 1*/		call p1(2009, @totalPedidos , @totalPagos) ; SELECT @totalPedidos , @totalPagos ;

	CREATE PROCEDURE jardineria.p1(in anno year, out total_vendido int(6), out pagos_recibidos int(6))
	BEGIN	
		
		SELECT sum(dp.cantidad * dp.precio_unidad) into total_vendido
		from pedido p 
		join detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
		where year(p.fecha_pedido) = anno ;

		SELECT sum(p.total) into pagos_recibidos 
		from pago p 
		where year(p.fecha_pago) = anno;

	END

/*Procedure 2*/		call p2(1, @nombre , @apellidos); SELECT @nombre , @apellidos;

	CREATE PROCEDURE jardineria.p2( in codigo_empleado int(11), out nombre varchar(255), out apellidos varchar(255))
	BEGIN
		
		SELECT e.nombre , concat(e.apellido1, ' ', e.apellido2) into nombre , apellidos 
		FROM empleado e 
		where e.codigo_empleado = codigo_empleado ;
		
	END