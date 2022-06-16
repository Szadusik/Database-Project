DELIMITER $$
CREATE TRIGGER `After_lokal_update` AFTER UPDATE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Zaktualizowano rekord',NOW()); 
END$$
DELIMITER ;