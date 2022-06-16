DELIMITER $$
CREATE TRIGGER `Before_budynek_update` BEFORE UPDATE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Próba zaktualizowania rekordu',NOW()); 
END$$
DELIMITER ;