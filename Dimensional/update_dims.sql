USE `dw-ar`;
DROP procedure IF EXISTS `sp_dim_update_cliente`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dim_update_cliente`(p_idCliente INT, p_nome VARCHAR(128),
p_email VARCHAR(128),p_localidade VARCHAR(128),p_estatuto varchar(128),
p_nr_discos INT,p_data_update DATETIME)
BEGIN
    IF(p_data_update is null) THEN SET @du = '0000-00-00';
    ELSE SET @du = p_data_update;
    END IF;
    INSERT INTO `dw-dw`.histcliente (select idDimCliente, nome,
									localidade,estatuto,nr_discos,email,@du,
                                    idDimCliente
                                    FROM dimcliente
                                    Where idDimCliente = p_idCliente);
    
    UPDATE `dw-dw`.`dimcliente`
		SET
		`idDimCliente` = p_idCliente,
		`Nome` = p_nome,
		`Localidade` = p_email,
		`Estatuto` = p_estatuto,
		`nr_discos` = p_nr_discos,
		`email` = p_email
		WHERE `idDimCliente` = p_idCliente;

END$$

DELIMITER ;

USE `dw-ar`;
DROP procedure IF EXISTS `sp_dim_update_disco`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dim_update_disco`(p_idDisco INT, p_titulo VARCHAR(128),
p_compra_preco FLOAT, p_tipo enum('EP','LP','SINGLE','MAXI','N/A'), p_pvp FLOAT, p_data_update DATETIME)
BEGIN
    IF(p_data_update is null) THEN SET @du = '0000-00-00';
    ELSE SET @du = p_data_update;
    END IF;
    INSERT INTO `dw-dw`.histdisco (select idDimDisco, pvp,idDimDisco,@du
                                    FROM dimdisco
                                    Where idDimDisco = p_idDisco);
    
	UPDATE `dw-dw`.`dimdisco`
	SET
	`idDimDisco` = p_idDisco,
	`titulo` = p_titulo,
	`compra_preco` = p_compra_preco,
	`tipo` = p_tipo,
	`pvp` = p_pvp
	WHERE `idDimDisco` = p_idDisco;


END$$

DELIMITER ;



