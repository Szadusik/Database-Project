DELIMITER $$
CREATE TRIGGER `Before_budynek_delete` BEFORE DELETE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Próba usunięcia rekordu',NOW()); 
END$$
DELIMITER ;