DELIMITER $$
CREATE TRIGGER `After_osoba_update` AFTER UPDATE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Zaktualizowano rekord',NOW()); 
END$$
DELIMITER ;