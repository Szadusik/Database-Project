DELIMITER $$
CREATE TRIGGER `Before_budynek_insert` BEFORE INSERT ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Próba dodania rekordu',NOW()); 
END
$$
DELIMITER ;