DELIMITER $$
CREATE TRIGGER `Before_lokal_delete` BEFORE DELETE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba usunięcia rekordu',NOW()); 
END$$
DELIMITER ;