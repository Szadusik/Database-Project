DELIMITER $$
CREATE TRIGGER `Before_lokal_insert` BEFORE INSERT ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba dodania rekordu',NOW()); 
END$$
DELIMITER ;