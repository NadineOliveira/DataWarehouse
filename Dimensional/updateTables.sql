USE `dw-ar`;
DROP procedure IF EXISTS `sp_update_clientes`;

DELIMITER $$
USE `dw-ar`$$
CREATE PROCEDURE `sp_update_clientes` (p_id_Cliente_source INT,p_source_id VARCHAR(45),p_email VARCHAR(128), p_nome VARCHAR(128),
p_localidade VARCHAR(128),p_estatuto VARCHAR(128),p_nr_discos INT,p_data_update DATETIME,p_operation VARCHAR(45))
BEGIN
DECLARE idS INT;
IF(p_operation like 'UPDATE')THEN
START TRANSACTION;
SET idS = (SELECT LK.id FROM lk_cliente AS LK
			WHERE LK.email = p_email);
INSERT INTO `dw-ar`.updateCliente VALUES(idS,p_nome,p_email,p_localidade,p_estatuto,p_nr_discos,p_data_update);
COMMIT;
END IF;
IF(p_operation like 'INSERT')THEN
START TRANSACTION;
SET idS = (SELECT LK.id FROM lk_cliente AS LK
			WHERE LK.email = p_email);
IF(idS is null) THEN
	START TRANSACTION;
	INSERT INTO `dw-ar`.lk_cliente(id_Cliente_source,source_id,email) VALUES(p_id_Cliente_source,p_source_id,p_email);
    SET idS = (SELECT LK.id FROM lk_cliente AS LK
				WHERE LK.email = p_email);
	COMMIT;
END IF;
INSERT INTO dimcliente VALUES(idS,p_email,p_nome,p_localidade,p_estatuto,p_nr_discos);
COMMIT;
END IF;
END$$

DELIMITER ;

USE `dw-ar`;
DROP procedure IF EXISTS `sp_update_discos`;

DELIMITER $$
USE `dw-ar`$$
CREATE PROCEDURE `sp_update_discos` (p_id_disco_source INT, p_source_id VARCHAR(45),
p_titulo VARCHAR(128),p_compra_preco FLOAT, p_tipo enum('EP','LP','SINGLE','MAXI','N/A'), p_pvp FLOAT,
p_operation VARCHAR(45), p_data_update DATETIME, p_data_compra DATETIME)
BEGIN
DECLARE idS INT;
IF(p_operation like 'UPDATE')THEN
START TRANSACTION;
SET idS = (SELECT LK.id FROM lk_disco AS LK
			WHERE LK.id_disco_source = p_id_disco_source AND LK.data_compra = p_data_compra);
INSERT INTO `dw-ar`.updatedisco VALUES(idS,p_titulo,p_compra_preco,p_tipo,p_pvp,p_data_update);
COMMIT;
END IF;
IF(p_operation like 'INSERT')THEN
START TRANSACTION;
SET idS = (SELECT LK.id FROM lk_disco AS LK
			WHERE LK.id_disco_source = p_id_disco_source AND LK.data_compra = p_data_compra);
IF(idS is null) THEN
	START TRANSACTION;
	INSERT INTO `dw-ar`.lk_disco(id_disco_source,source_id,data_compra) VALUES(p_id_disco_source,p_source_id,p_data_compra);
    SET idS = (SELECT LK.id FROM lk_disco AS LK
			WHERE LK.id_disco_source = p_id_disco_source AND LK.data_compra = p_data_compra);
	COMMIT;
END IF;
INSERT INTO dimdisco VALUES(idS,p_titulo,p_compra_preco,p_tipo,p_pvp,p_data_compra);
COMMIT;
END IF;
END$$

DELIMITER ;

