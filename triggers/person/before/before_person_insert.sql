DELIMITER $$
CREATE TRIGGER `Before_osoba_insert` BEFORE INSERT ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba dodania rekordu',NOW()); 
END$$
DELIMITER ;