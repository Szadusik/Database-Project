DELIMITER $$
CREATE TRIGGER `Before_zameldowanie_insert` BEFORE INSERT ON `zameldowanie` FOR EACH ROW BEGIN INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Próba utworzenia nowego rekordu',NOW());
END$$
DELIMITER ;