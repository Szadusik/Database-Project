DELIMITER $$
CREATE TRIGGER `After_delete_mieszkaniec` AFTER DELETE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Usunięto rekord',NOW()); 
END$$
DELIMITER ;