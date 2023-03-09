/* 1.5.6 Consultas multitabla (Composición externa) 
 *Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
 */

-- 1 Devuelve un listado con los nombres de  los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que 
-- no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre*/

 SELECT p2.nombre , p2.apellido1 , p2.apellido2 , d.nombre 
from profesor p
left join persona p2 ON p2.id = p.id_profesor
RIGHT join departamento d on d.id = p.id_departamento
where p2.nombre is not null;

-- 2 Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT * from profesor p WHERE id_departamento is null;

-- 3 Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT d.id , d.nombre  from departamento d 
left join profesor p on p.id_departamento = d.id 
where p.id_departamento is null;

-- 4 Devuelve un listado con los profesores que no imparten ninguna asignatura.

SELECT p.id_profesor , a.id as 'id_asignatura' FROM profesor p 
left join asignatura a on a.id_profesor = p.id_profesor 
where a.id_profesor  is null;

-- 5 Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT id , nombre , id_profesor  FROM asignatura a where id_profesor is null;

/*1.5.7 Consultas resumen*/

-- 1 Devuelve el número total de  alumnas que hay.

SELECT COUNT(id) as 'nAlumnas'  FROM persona p where sexo like 'M' and tipo like 'alumno';

-- 2 Calcula cuántos alumnos nacieron en 1999.

SELECT COUNT(id) as 'nAlumnos(1999)'  from persona p where tipo like 'alumno' and YEAR(fecha_nacimiento) like 1999; 

-- 3 Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y 
-- otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y 
-- deberá estar ordenado de mayor a menor por el número de profesores.

SELECT  d.nombre as nombreDepartamento , COUNT(p.id_profesor) as 'nProfesores' from departamento d 
left join profesor p ON p.id_departamento = d.id 
group by d.id
HAVING nProfesores > 0
ORDER BY nProfesores DESC;

-- 4 Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden
-- existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

SELECT  d.nombre as nombreDepartamento , COUNT(p.id_profesor) as 'nProfesores' from departamento d 
left join profesor p ON p.id_departamento = d.id 
group by d.id
ORDER BY nProfesores DESC;

-- 5 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
-- Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. 
-- Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

SELECT g.nombre , COUNT(a.id) as nAsignaturas FROM grado g 
left join asignatura a on a.id_grado = g.id 
group by g.id
ORDER BY nAsignaturas DESC;

-- 6 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas
-- que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

SELECT g.nombre , COUNT(a.id) as nAsignaturas FROM grado g 
left join asignatura a on a.id_grado = g.id 
group by g.id
HAVING nAsignaturas > 40;

-- 7 Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. 
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
-- Ordene el resultado de mayor a menor por el número total de crédidos.

SELECT g.nombre , a.tipo , SUM(a.creditos) as total_creditos
FROM grado g
INNER JOIN asignatura a ON g.id = a.id
GROUP BY g.nombre , a.tipo 
ORDER BY total_creditos DESC;

-- 8  Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
-- El resultado deberá mostrar dos columnas,  una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

SELECT COUNT(asma.id_alumno) as nAlumnos , ce.anyo_inicio 
from alumno_se_matricula_asignatura asma 
left join curso_escolar ce on ce.id = asma.id_curso_escolar 
group by ce.anyo_inicio ;

-- 9 Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
-- El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
-- El resultado estará ordenado de mayor a menor por el número de asignaturas.

SELECT  p.id_profesor , p2.nombre , p2.apellido1 , p2.apellido2 , COUNT(p.id_profesor) as 'nAsignaturas'
from profesor p 
join persona p2 on p2.id = p.id_profesor 
left  join asignatura a on a.id_profesor = p.id_profesor 
GROUP by p.id_profesor 
ORDER by nAsignaturas DESC ;