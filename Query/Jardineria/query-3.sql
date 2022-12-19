SELECT *
from cliente;
SELECT DISTINCT codigo_oficina,
    nombre
from empleado;
SELECT c.nombre_cliente as 'Nombre Cliente',
    telefono,
    nombre,
    apellido1,
    email
from cliente c,
    empleado e;