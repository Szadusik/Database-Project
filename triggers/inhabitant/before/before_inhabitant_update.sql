DELIMITER $$
CREATE TRIGGER `Before_update_mieszkaniec` BEFORE UPDATE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Próba aktualizacji rekordu',NOW()); 
END$$
DELIMITER ;