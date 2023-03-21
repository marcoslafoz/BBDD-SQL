/*Practica Apartado 2.1*/

-- Crear oficina en Zaragoza, 

INSERT INTO jardineria.oficina
(codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
VALUES('ZGZ-ES', 'Zaragoza', 'España', 'Aragon', '50008', '9679981', 'Batalla del Salado, 23', 'Edificio izq, planta baja');

-- Modificamos a los empleados de la oficina de Paris

UPDATE jardineria.empleado
SET email= (SELECT REPLACE(email , '@gardening.com' , '@jardineria.es')), codigo_oficina='ZGZ-ES'
WHERE codigo_oficina = 'PAR-FR';

-- El director de la oficina dependera del director general

UPDATE jardineria.empleado
SET codigo_jefe= (SELECT codigo_empleado FROM empleado where puesto = 'Director General')
WHERE codigo_oficina = 'ZGZ-ES' AND puesto = 'Director Oficina';

-- Crear vista
 
CREATE VIEW clientes_empleados_oficina_zaragoza as (
SELECT o.codigo_oficina , o.ciudad  ,o.linea_direccion1 , o.telefono as 'telefonoOficina' , e.nombre , e.apellido1 , e.email , c.codigo_cliente , c.nombre_cliente , c.telefono , c.fax  
from oficina o , empleado e, cliente c 
where o.codigo_oficina like 'ZGZ-ES' and e.codigo_oficina like 'ZGZ-ES');

/*Practica 2.2*/

-- Ejercicio A (2.2)

CREATE view unidades_vendidas_productos_año_pasado as 
select dp.codigo_producto , p2.nombre , p2.gama , p2.descripcion  , SUM(dp.cantidad) as 'cantidad', p.fecha_pedido  
FROM detalle_pedido dp 
left join pedido p ON dp.codigo_pedido = p.codigo_pedido
right join producto p2 ON dp.codigo_producto = p2.codigo_producto 
where YEAR(p.fecha_pedido) like '2022'
group by dp.codigo_producto ;

-- Ejercicio B (2.2)

CREATE view pedido_empleados_talavera_ultimo_mes as
SELECT 
	o.ciudad , o.region , o.telefono , 
	CONCAT(e.nombre, ' ' , e.apellido1 , ' ' , e.apellido2  ) as nombreApellidosEmpleados 
FROM oficina o , empleado e ;



/*Apartado 2.3*/

-- Ejercicio A (2.3)
    
(SELECT (SELECT '@jardineria.es') as 'host'  , count(e.codigo_empleado) as 'nEmpleados'
from empleado e 
where e.email like '%@jardineria.es')
UNION 
(SELECT (SELECT '@gardening.com') as 'host' , count(e.codigo_empleado) as 'nEmpleados'
from empleado e 
where e.email like '%@gardening.com');


