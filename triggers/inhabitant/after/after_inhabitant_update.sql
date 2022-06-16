DELIMITER $$
CREATE TRIGGER `After_update_mieszkaniec` AFTER UPDATE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Rekord został zaktualizowany',NOW()); 
END$$
DELIMITER ;