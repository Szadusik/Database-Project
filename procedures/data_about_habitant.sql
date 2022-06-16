DROP PROCEDURE IF EXISTS data_about_habitant;
DELIMITER $$
CREATE PROCEDURE data_about_habitant(
	IN PESEL VARCHAR(11)
)
DETERMINISTIC
BEGIN
CALL validate_PESEL(PESEL);
SELECT CONCAT(O.imie,' ',O.nazwisko) as "Imie i nazwisko", M.numer_telefonu, CONCAT('ul.',B.ulica,' ',B.numer,'/',L.numer_lokalu,' ', B.kod_pocztowy) as "Zameldowany w",Z.data_zameldowania from `osoba` O, `mieszkaniec` M, `zameldowanie` Z, `budynek` B, `lokal` L where M.PESEL = Z.PESEL and O.PESEL = M.PESEL and L.ID_lokalu = Z.Lokal and B.ID_Budynku = L.ID_budynku and BINARY O.PESEL = BINARY PESEL;
END$$
DELIMITER ;