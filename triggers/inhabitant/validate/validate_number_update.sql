DELIMITER $$
CREATE TRIGGER `validate_number_update` BEFORE UPDATE ON `mieszkaniec` FOR EACH ROW BEGIN 
	CALL validate_phone_number(NEW.numer_telefonu);
END$$
DELIMITER ;