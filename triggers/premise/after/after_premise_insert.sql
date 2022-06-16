DELIMITER $$
CREATE TRIGGER `After_lokal_insert` AFTER INSERT ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Dodano nowy rekord',NOW()); 
END$$
DELIMITER ;