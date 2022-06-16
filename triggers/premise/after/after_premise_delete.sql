DELIMITER $$
CREATE TRIGGER `After_lokal_delete` AFTER DELETE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Usunięto rekord',NOW()); 
END$$
DELIMITER ;