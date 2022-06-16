DROP PROCEDURE IF EXISTS validate_phone_number;
DELIMITER $$
CREATE PROCEDURE validate_phone_number(
	IN telephone VARCHAR(12)
)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE i INT;
    SET i = 2;
	IF  SUBSTRING(telephone,1,1) != '+' THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Telephone number has to begin with "+" sign';
    END IF;
    
    loop_label: LOOP
    	IF (i > 12) THEN
        	LEAVE  loop_label;
        END IF;
        
        IF NOT (SUBSTRING(telephone,i,1) REGEXP '^[0-9]+$') THEN
        	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Telephone number can consists of only numbers (except "+" sign at the
            beginning)';
        END IF;
        SET i = i + 1;
    END LOOP;
END$$
DELIMITER ;