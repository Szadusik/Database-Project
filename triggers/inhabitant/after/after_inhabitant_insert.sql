DELIMITER $$
CREATE TRIGGER `After_insert_mieszkaniec` AFTER INSERT ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Dodano nowy rekord',NOW()); 
END$$
DELIMITER ;