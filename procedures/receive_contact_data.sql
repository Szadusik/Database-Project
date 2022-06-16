DROP PROCEDURE IF EXISTS receive_contact_data;
DELIMITER $$
CREATE PROCEDURE receive_contact_data()
DETERMINISTIC
BEGIN
SELECT O.PESEL,O.imie,O.nazwisko,M.numer_telefonu FROM `osoba` O, `mieszkaniec` M where O.PESEL = M.PESEL;
END$$
DELIMITER ;