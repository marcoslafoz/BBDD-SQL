select concat(apellido1, ' ', apellido2, ' ', nombre) as 'Nombre apellidos'
from empleado
where codigo_jefe != codigo_empleado && codigo_oficina = 'TAL-ES';
-- where codigo_oficina = 'TAL-ES' and codigo_jefe is not null