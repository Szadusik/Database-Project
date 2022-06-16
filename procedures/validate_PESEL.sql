DROP PROCEDURE IF EXISTS validate_PESEL;
DELIMITER $$
CREATE PROCEDURE validate_PESEL(
	IN PESEL VARCHAR(11)
)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE i INT;
    DECLARE checks INT;
    DECLARE factors VARCHAR(10);
    SET i = 1;
    SET factors = '1379137913';
    SET checks = 0;
    
    loop_label: LOOP
    	IF (i > 10) THEN
        	LEAVE  loop_label;
        END IF;
        
        IF (SUBSTRING(PESEL,i,1) REGEXP '^[0-9]+$') THEN
        	SET checks = checks + CAST(SUBSTRING(factors,i,1) AS UNSIGNED)*CAST(SUBSTRING(PESEL,i,1) AS UNSIGNED);
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Given string is not a PESEL (PESEL consists only numerical values)';
        END IF;
        SET i = i + 1;
    END LOOP;
    IF (checks mod 10 != 10 - CAST(SUBSTRING(PESEL,11,1) AS UNSIGNED)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Given PESEL is wrong (validation did not pass)';
    END IF;
END$$
DELIMITER ;