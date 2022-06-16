DELIMITER $$
CREATE TRIGGER `Before_delete_mieszkaniec` BEFORE DELETE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Próba usunięcia rekordu',NOW()); 
END$$
DELIMITER ;