DELIMITER $$
CREATE TRIGGER `After_zameldowanie_insert` AFTER INSERT ON `zameldowanie` FOR EACH ROW BEGIN INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Utworzono nowy rekord',NOW()); 
END$$
DELIMITER ;