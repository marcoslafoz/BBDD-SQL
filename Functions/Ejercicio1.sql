/**
 * https://josejuansanchez.org/bd/unidad-12-teoria/index.pdf
 */

-- Ejercicio 1.8.7 

DELIMITER //

CREATE DEFINER=`%`@`%` FUNCTION `jardineria`.`lista_emails`() RETURNS TEXT
BEGIN
    DECLARE emails TEXT DEFAULT ' ';
    DECLARE final_bucle bool default 0;
    DECLARE userEmail VARCHAR(55) DEFAULT ' ';
    DECLARE anyemail CURSOR FOR SELECT email FROM empleado;
    DECLARE continue handler for not found set final_bucle = 1;
    OPEN anyemail;
    read_loop: LOOP 
        FETCH anyemail INTO userEmail;
        if final_bucle = 1 then
       	leave read_loop;
       end if;
    set emails = concat(emails, userEmail);
    END LOOP;
    CLOSE anyemail;
    RETURN emails;
END//

DELIMITER ;

