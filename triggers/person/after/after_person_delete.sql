DELIMITER $$
CREATE TRIGGER `After_osoba_delete` AFTER DELETE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Usunięto rekord',NOW()); 
END$$
DELIMITER ;