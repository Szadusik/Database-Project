DELIMITER $$
CREATE TRIGGER `Before_osoba_delete` BEFORE DELETE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba usunięcia rekordu',NOW()); 
END$$
DELIMITER ;