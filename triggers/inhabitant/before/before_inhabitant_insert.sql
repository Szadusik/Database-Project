DELIMITER $$
CREATE TRIGGER `Before_insert_mieszkaniec` BEFORE INSERT ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Próba dodania nowego rekordu',NOW()); 
END$$
DELIMITER ;