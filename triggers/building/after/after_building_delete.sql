DELIMITER $$
CREATE TRIGGER `After_budynek_delete` AFTER DELETE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Usunięto rekord',NOW()); 
END$$
DELIMITER ;