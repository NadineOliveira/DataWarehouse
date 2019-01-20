USE `dw-ar`;
DROP procedure IF EXISTS `sp_insert_disco`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_disco`(p_id_disco_source INT, p_source_id VARCHAR(45),p_titulo VARCHAR(128),
									p_compra_preco FLOAT, p_tipo VARCHAR(128), p_pvp FLOAT)
BEGIN
INSERT INTO lk_disco(id_disco_source,source_id) VALUES (p_id_disco_source,p_source_id);
INSERT INTO `dw-ar`.dimdisco(titulo,compra_preco,tipo,pvp) values(p_titulo,p_compra_preco,p_tipo,p_pvp);
END$$

DELIMITER ;

DROP procedure IF EXISTS `sp_insert_cliente`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_cliente`(p_id_Cliente_source INT, p_source_id VARCHAR(45),p_email VARCHAR(128),
p_nome VARCHAR(45),p_localidade VARCHAR(45), p_estatuto VARCHAR(45), p_nr_discos INT)
BEGIN
DECLARE id, existe INT;
SET id = (SELECT LK.id FROM lk_cliente AS LK
			WHERE LK.email = p_email
            AND p_source_id like LK.source_id);
            
IF(id is null) THEN/*id nao existe na tabela lookup*/
START TRANSACTION;
INSERT INTO lk_cliente(id_Cliente_source,source_id,email) VALUES(p_id_Cliente_source,p_source_id,p_email);
SET id = (SELECT LK.id FROM lk_cliente AS LK
			WHERE LK.email = p_email
            AND p_source_id like LK.source_id);
COMMIT; 
END IF;
SET existe = (SELECT idDimCliente FROM dimcliente WHERE iddimCliente = id);
IF (existe is null) THEN
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
DECLARE id, existe INT;
SET id = (SELECT LK.id FROM lk_loja AS LK
			WHERE LK.data_compra = p_data_compra
            AND p_source_id like LK.source_id
            AND p_localidade like LK.localidade);

IF(id is null) THEN
START TRANSACTION;
INSERT INTO lk_loja(id_loja_source,source_id,data_compra,localidade) VALUES(p_idpre_dim_loja,p_source_id,p_data_compra,p_localidade);
SET id = (SELECT LK.id FROM lk_loja AS LK 
			WHERE LK.data_compra = p_data_compra
            AND p_source_id like LK.source_id
            AND p_localidade like p_localidade);
COMMIT;
END IF;

SET existe = (SELECT iddimLoja FROM dimloja WHERE iddimLoja = id);
IF (existe is null) THEN
INSERT INTO dimloja VALUES(id,p_localidade,p_data_compra);
END IF;
END$$

DELIMITER ;

DROP procedure IF EXISTS `sp_insert_artista`;

DELIMITER $$
USE `dw-ar`$$
CREATE PROCEDURE `sp_insert_artista` (p_source_id VARCHAR(45), 
p_nome VARCHAR(128),p_id_disco INT)
BEGIN
DECLARE idA, idD, existe INT;
SET idA = (SELECT LK.id FROM lk_artista AS LK
			WHERE LK.nome = p_nome
            AND p_source_id like LK.source);
SET idD = (SELECT LKD.id FROM lk_disco AS LKD
			WHERE LKD.id_disco_source = p_id_disco
            AND p_source_id like LKD.source_id);

IF(idA is null) THEN
START TRANSACTION;
INSERT INTO lk_artista(id_disco_source,source,nome) VALUES(p_id_disco,p_source_id,p_nome);
SET idA = (SELECT LK.id FROM lk_artista AS LK
			WHERE LK.nome = p_nome
            AND p_source_id like LK.source);
COMMIT;
END IF;

SET existe = (SELECT idDimArtista FROM dimartista WHERE iddimArtista = idA);
IF (existe is null) THEN
INSERT INTO dimArtista VALUES(idA,p_nome,idD);
END IF;
END$$

DELIMITER ;


DROP procedure IF EXISTS `sp_insert_genero`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_genero`(p_source_id VARCHAR(45), 
p_genero VARCHAR(128),p_id_disco INT)
BEGIN
DECLARE idG, idD, existe INT;
SET idG = (SELECT LK.id FROM lk_genero AS LK
			WHERE LK.genero = p_genero
            AND p_source_id like LK.source_id);
SET idD = (SELECT LKD.id FROM lk_disco AS LKD
			WHERE LKD.id_disco_source = p_id_disco
            AND p_source_id like LKD.source_id);

IF(idG is null) THEN
START TRANSACTION;
INSERT INTO lk_genero(id_disco_source,source_id,genero) VALUES(p_id_disco,p_source_id,p_genero);
SET idG = (SELECT LK.id FROM lk_genero AS LK
			WHERE LK.genero = p_genero
            AND p_source_id like LK.source_id);
COMMIT; 
END IF;
SET existe = (SELECT idDimGenero FROM dimgenero WHERE iddimGenero = idG);
IF (existe is null) THEN
INSERT INTO dimGenero VALUES(idG,p_genero,idD);
END IF;
END$$

DELIMITER ;


