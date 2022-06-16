DROP PROCEDURE IF EXISTS receive_recent_checkins;
DELIMITER $$
CREATE PROCEDURE receive_recent_checkins(
	IN beginYear DATE,
	IN endYear DATE
)
DETERMINISTIC
BEGIN
SELECT CONCAT('ul.',B.ulica,' ',B.numer,'/',L.numer_lokalu) as 'Mieszkanie',CONCAT(O.imie,' ',O.nazwisko),Z.data_zameldowania  from `zameldowanie` Z, `osoba` O, `mieszkaniec` M, `budynek` B, `lokal` L where M.PESEL = Z.PESEL and O.PESEL = M.PESEL and L.ID_lokalu = Z.Lokal and B.ID_Budynku = L.ID_budynku AND (Z.data_zameldowania BETWEEN beginYear and endYear);
END$$
DELIMITER ;