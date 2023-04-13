Anuncio: "DROP FUNCTION IF EXISTS…" Dario Axel Ureña García Fecha de creación: 30 mar30 mar DROP FUNCTION IF EXISTS jardineria.alta_empleado;
DELIMITER $$$$ CREATE DEFINER = `root` @`%` FUNCTION `jardineria`.`alta_empleado`(
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    puesto varchar(50),
    ciudadOficina varchar(50)
) RETURNS tinyint(1) BEGIN
DECLARE next_codempleado TYPE OF empleado.codigo_empleado;
DECLARE email TYPE OF empleado.email;
DECLARE codOficina TYPE OF oficina.codigo_oficina;
DECLARE codJefe TYPE OF empleado.codigo_empleado;
-- Vamos a insertar un nuevo empleado
select max(e.codigo_empleado) + 1 into next_codempleado
from empleado e;
select lower(
        concat(
            substring(nombre, 1, 1),
            apellido1,
            '@jardineria.es'
        )
    ) into email;
select o.codigo_oficina into codOficina
from oficina o
where o.ciudad = ciudadOficina;
if puesto = 'Director Oficina' then
select e.codigo_jefe into codJefe
from empleado e
where e.codigo_oficina = codOficina
    and e.puesto = 'Director Oficina';
insert into empleado
values (
        next_codempleado,
        nombre,
        apellido1,
        apellido2,
        '666',
        email,
        codOficina,
        codJefe,
        puesto
    );
update empleado e
set e.codigo_jefe = next_codempleado
where e.codigo_oficina = codOficina
    and e.codigo_empleado != next_codempleado;
else if puesto = 'Director General' then -- lo que sea necesario hacer
else -- aquí si es cualquier puesto normal
select e.codigo_empleado into codJefe
from empleado e
where e.codigo_oficina = codOficina
    and e.puesto = 'Director Oficina';
insert into empleado
values (
        next_codempleado,
        nombre,
        apellido1,
        apellido2,
        '666',
        email,
        codOficina,
        codJefe,
        puesto
    );
end if;
end if;
return TRUE;
END $$ DELIMITER;