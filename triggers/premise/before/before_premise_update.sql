CREATE TRIGGER `Before_lokal_update` BEFORE UPDATE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba aktualizacji rekordu',NOW()); 
END$$
DELIMITER ;