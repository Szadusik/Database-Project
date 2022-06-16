DELIMITER $$
CREATE TRIGGER `After_zameldowanie_delete` AFTER DELETE ON `zameldowanie` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Usunięto rekord',NOW()); 
END$$
DELIMITER ;