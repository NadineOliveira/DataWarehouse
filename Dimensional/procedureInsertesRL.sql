USE `dw-ar`;
DROP procedure IF EXISTS `sp_up_insert_cliente`;
DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_up_insert_cliente`(p_id_Cliente_source INT, p_email VARCHAR(128),
p_nome VARCHAR(45),p_localidade VARCHAR(45), p_estatuto VARCHAR(45), p_nr_discos INT)
BEGIN
DECLARE existe INT;
SET existe = (SELECT idDimCliente FROM `dw-dw`.dimcliente WHERE iddimCliente = p_id_Cliente_source);
IF (existe is null) THEN
INSERT INTO `dw-dw`.dimcliente VALUES(p_id_Cliente_source,p_email,p_nome,p_localidade,p_estatuto,p_nr_discos);
END IF;
END$$
DELIMITER ;

DROP procedure IF EXISTS `sp_up_insert_disco`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_up_insert_disco`(p_id_disco_source INT,p_titulo VARCHAR(128),
									p_compra_preco FLOAT, p_tipo VARCHAR(128), p_pvp FLOAT,p_data_compra DATE)
BEGIN
DECLARE existe INT;
SET existe = (SELECT idDimDisco FROM `dw-dw`.dimDisco WHERE iddimDisco = p_id_disco_source);

IF (p_data_compra is not null and existe is null) THEN
	INSERT INTO `dw-dw`.dimdisco values(p_id_disco_source,p_titulo,p_compra_preco,p_tipo,p_pvp,p_data_compra);
END IF;
END$$