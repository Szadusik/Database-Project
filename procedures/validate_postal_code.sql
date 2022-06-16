DROP PROCEDURE IF EXISTS validate_postal_code;
DELIMITER $$
CREATE PROCEDURE validate_postal_code(
	IN cod VARCHAR(6)
)
DETERMINISTIC
NO SQL
BEGIN
IF NOT (SUBSTRING(cod,1,2) REGEXP '^[0-9]+$') THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'First part of postal code is not a number when it has to be';
    END IF;
    
    IF NOT (SUBSTRING(cod,4,3) REGEXP '^[0-9]+$') THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Second part of postal code is not a number when it has to be';
    END IF;
    
    IF (SUBSTRING(cod,3,1) != '-') THEN
           SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Could not find a "-" sign in correct place which separates two parts';
    END IF;
END$$
DELIMITER ;