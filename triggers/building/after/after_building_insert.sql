DELIMITER $$
CREATE TRIGGER `After_budynek_insert` AFTER INSERT ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Dodano nowy rekord',NOW()); 
END$$
DELIMITER ;