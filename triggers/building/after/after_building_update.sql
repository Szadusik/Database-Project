DELIMITER $$
CREATE TRIGGER `After_budynek_update` AFTER UPDATE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Zaktualizowano rekord',NOW()); 
END$$
DELIMITER ;