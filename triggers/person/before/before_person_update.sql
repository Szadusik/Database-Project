DELIMITER $$
CREATE TRIGGER `Before_osoba_update` BEFORE UPDATE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba aktualizacji rekordu',NOW()); 
END$$
DELIMITER ;