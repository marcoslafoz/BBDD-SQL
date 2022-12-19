select concat(apellido1, ' ', apellido2, ' ', nombre) as 'Nombre apellidos'
from empleado
where codigo_oficina = 'TAL-ES';
-- Los que viven en TAL-ES