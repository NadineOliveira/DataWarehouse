USE `dw-ar`;
DROP procedure IF EXISTS `sp_insert_disco`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_disco`(p_id_disco_source INT, p_source_id VARCHAR(45),p_titulo VARCHAR(128),
									p_compra_preco FLOAT, p_tipo VARCHAR(128), p_pvp FLOAT)
BEGIN
DECLARE id INT;
SET id = (SELECT LK.id+1 FROM lk_disco AS LK ORDER BY LK.id Limit 1);
IF(id is null) THEN SET id = 1;
END IF;

INSERT INTO `dw-ar`.dimdisco values(id,p_titulo,p_compra_preco,p_tipo,p_pvp);
END$$
DELIMITER ;

DROP procedure IF EXISTS `sp_insert_cliente`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente`(p_id_Cliente_source INT, p_source_id VARCHAR(45),p_email VARCHAR(128),
p_nome VARCHAR(45),p_localidade VARCHAR(45), p_estatuto VARCHAR(45), p_nr_discos INT)
BEGIN
DECLARE id INT;
SET id = (SELECT LK.id FROM lk_cliente AS LK
			WHERE LK.email = p_email
            AND p_source_id like LK.source_id);
            
IF(id is null) THEN/*id nao existe na tabela lookup*/
START TRANSACTION;
INSERT INTO lk_cliente VALUES(p_id_Cliente_source,p_source_id,p_email);
SET id = (SELECT LK.id FROM lk_cliente AS LK
			WHERE LK.email = p_email
            AND p_source_id like LK.source_id);
COMMIT;

INSERT INTO dimcliente VALUES(id,p_email,p_nome,p_localidade,p_estatuto,p_nr_discos);
END IF;
END$$
DELIMITER ;

DROP procedure IF EXISTS `sp_insert_loja`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_loja`(p_idpre_dim_loja INT, p_source_id VARCHAR(45),
p_localidade VARCHAR(45),p_data_compra DATETIME)
BEGIN
DECLARE id INT;
SET id = (SELECT LK.id FROM lk_loja AS LK
			WHERE LK.p_data_compra = p_data_compra
            AND p_source_id like LK.source_id);

IF(id is null) THEN
START TRANSACTION;
INSERT INTO lk_loja VALUES(p_idpre_dim_loja,p_source_id,p_data_compra);
SET id = (SELECT LK.id FROM lk_loja AS LK
			WHERE LK.data_compra = p_data_compra
            AND p_source_id like LK.source_id);
COMMIT;
END IF; 

INSERT INTO dimloja VALUES(id,p_localidade,p_data_compra);
END$$

DELIMITER ;




DROP procedure IF EXISTS `sp_insert_artista`;

DELIMITER $$
USE `dw-ar`$$
CREATE PROCEDURE `sp_insert_artista` (p_idpre_dim_Artista INT,
p_source_id VARCHAR(45), p_nome VARCHAR(128),p_id_disco INT)
BEGIN
DECLARE idA, idD INT;
SET idA = (SELECT LK.id FROM lk_artista AS LK
			WHERE LK.nome = p_nome
            AND p_source_id like LK.source_id);
SET idD = (SELECT LKD.id FROM lk_disco AS LKD
			WHERE LKD.id_disco_source = p_id_disco
            AND p_source_id like LK.source_id);

IF(idA is null) THEN
START TRANSACTION;
INSERT INTO lk_artista VALUES(p_idpre_dim_Artista,p_source_id,p_nome);
SET idA = (SELECT LK.id FROM lk_artista AS LK
			WHERE LK.nome = p_nome
            AND p_source_id like LK.source_id);
COMMIT;
END IF;

INSERT INTO dimArtista VALUES(idA,p_nome,idD);
END$$

DELIMITER ;


DROP procedure IF EXISTS `sp_insert_genero`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_genero`(p_idpre_dim_Genero INT,
p_source_id VARCHAR(45), p_genero VARCHAR(128),p_id_disco INT)
BEGIN
DECLARE idG, idD INT;
SET idG = (SELECT LK.id FROM lk_genero AS LK
			WHERE LK.genero = p_genero
            AND p_source_id like LK.source_id);
SET idD = (SELECT LKD.id FROM lk_disco AS LKD
			WHERE LKD.id_disco_source = p_id_disco
            AND p_source_id like LK.source_id);

IF(idG is null) THEN
START TRANSACTION;
INSERT INTO lk_artista VALUES(p_idpre_dim_Genero,p_source_id,p_genero);
SET idG = (SELECT LK.id FROM lk_genero AS LK
			WHERE LK.genero = p_genero
            AND p_source_id like LK.source_id);
COMMIT; 
END IF;

INSERT INTO dimGenero VALUES(idG,p_nome,idD);
END$$

DELIMITER ;

