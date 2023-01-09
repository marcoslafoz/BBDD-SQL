-- 1. Visualizar cuántos clientes tienen límite de crédito superior a 100000.
SELECT codigo_cliente,
    nombre_cliente,
    limite_credito
FROM cliente
WHERE limite_credito > 100000;

-- 2. Visualizar todos los datos de los clientes que tienen límite de crédito
--superior a 100000 ordenados por límite de crédito.
SELECT codigo_cliente,
    nombre_cliente,
    limite_credito
FROM cliente
WHERE limite_credito > 100000
ORDER BY limite_credito;

-- 3. Visualizar todos los datos de los clientes de los que se desconoce la región.
select *
from cliente
where region is null;

-- 4. Visualizar todos los datos de los empleados que no pertenezcan a oficinas españolas.
SELECT * 
FROM empleado
WHERE codigo_oficina =! "*-ES"