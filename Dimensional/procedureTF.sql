USE `dw-ar`;
DROP procedure IF EXISTS `sp_insert_factos`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_factos`(p_localidade VARCHAR(128),
p_data_compra DATE, p_custo_total FLOAT, p_id_disco INT,
p_email VARCHAR(128))
BEGIN	
DECLARE loc, disco,cliente,calendario VARCHAR(128);
	SET loc = (SELECT L.id FROM `dw-ar`.lk_loja AS L
					WHERE L.localidade like p_localidade);
	SET disco = (SELECT D.id FROM `dw-ar`.lk_disco AS D
					WHERE D.id_disco_source = p_id_disco
                    AND D.data_compra = p_data_compra);
	SET cliente = (SELECT C.id FROM `dw-ar`.lk_cliente AS C
					WHERE C.email = p_email);
    SET calendario = (SELECT CAL.idDimCalendario FROM `dw-ar`.dimcalendario AS CAL
						WHERE CAL.data = p_data_compra);  
                        
	INSERT INTO tf_vendas(valor,calendarioFK,clienteFK,discoFK,lojaFK)
				VALUES(p_custo_total,calendario,cliente,disco,loc);
END$$

DELIMITER ;