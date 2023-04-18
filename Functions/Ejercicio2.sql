/**
 * Si intento crear detalle_pedido y si no hay suficiente stock no hacer nada 
 * y si hay stock lo actualizo, resto la cantidad que se vende
 */

DELIMITER //
CREATE FUNCTION verificar_stock(codigo_producto VARCHAR(50)) RETURNS BOOLEAN
BEGIN
    DECLARE stock INT;
    SELECT cantidad_en_stock INTO stock FROM jardineria.producto WHERE codigo_producto = codigo_producto;
    IF stock > 0 THEN
        INSERT INTO jardineria.detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea)
        SELECT IFNULL(MAX(codigo_pedido), 0) + 1, codigo_producto, 0, 0, 0 FROM jardineria.detalle_pedido LIMIT 1;
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;

-- SELECT verificar_stock(123);


