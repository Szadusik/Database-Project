DELIMITER $$
CREATE TRIGGER `After_osoba_insert` AFTER INSERT ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Dodano nowy rekord',NOW()); 
END$$
DELIMITER ;