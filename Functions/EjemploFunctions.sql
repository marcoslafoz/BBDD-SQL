/*Ejemplo 1*/       SELECT contar_productos('Frutales');

DELIMITER $$

DROP FUNCTION IF EXISTS contar_productos$$
CREATE FUNCTION contar_productos(gama VARCHAR(50))
RETURNS INT UNSIGNED
BEGIN

-- Paso 1. Declaramos una variable local
DECLARE total INT UNSIGNED;
-- Paso 2. Contamos los productos
SET total = (
    SELECT COUNT(*)
    FROM producto
    WHERE producto.gama = gama
);
-- Paso 3. Devolvemos el resultado
RETURN total;

END

$$ DELIMITER ; 