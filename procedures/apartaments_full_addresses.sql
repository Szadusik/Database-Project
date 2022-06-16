DROP PROCEDURE IF EXISTS apartaments_full_addresses;
DELIMITER $$
CREATE PROCEDURE apartaments_full_addresses(
)
DETERMINISTIC
NO SQL
BEGIN
SELECT CONCAT('ul.',B.`ulica`,' ',B.`numer`,'/',L.`numer_lokalu`,' ',B.`kod_pocztowy`) FROM `budynek` B,`lokal` L where B.`ID_Budynku`= L.`ID_Budynku`;
END$$
DELIMITER ;
