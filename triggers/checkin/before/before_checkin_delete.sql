DELIMITER $$
CREATE TRIGGER `Before_zameldowanie_delete` BEFORE DELETE ON `zameldowanie` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Próba usunięcia rekordu',NOW()); 
END$$
DELIMITER ;