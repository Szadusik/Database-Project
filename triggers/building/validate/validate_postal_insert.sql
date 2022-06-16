DELIMITER $$
CREATE TRIGGER `validate_postal_insert` BEFORE INSERT ON `budynek` FOR EACH ROW BEGIN
	CALL validate_postal_code(NEW.kod_pocztowy);
END$$
DELIMITER ;