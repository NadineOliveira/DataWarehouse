Use `jonas discos`;
DROP TRIGGER IF EXISTS trigger_insert_audcliente;
DELIMITER $$
CREATE TRIGGER trigger_insert_audcliente
AFTER INSERT ON `jonas discos`.cliente
FOR EACH ROW
	BEGIN
    DECLARE idc INT;
    DECLARE nm,em,lc VARCHAR(128);
    DECLARE op VARCHAR(10);
    DECLARE nd INT;
    DECLARE est ENUM('NORMAL','GOLDEN','PLATINUM');
	SET op = 'INSERT',
		idc = new.id,
		nm = new.nome,
        nd = new.nr_discos,
        est = new.estatuto;
        IF(new.email is null) THEN SET em = "N/A";
        ELSE SET em = new.email;
        END IF;
        IF(new.localidade is null) THEN SET lc = "N/A";
        ELSE SET lc = new.localidade;
        END IF;
	INSERT INTO `jonas discos`.audcliente(id,nome,email,localidade,nr_discos,estatuto,operation)
									values(idc,nm,em,lc,nd,est,op);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_audcompra;
DELIMITER $$
CREATE TRIGGER trigger_insert_audcompra
AFTER INSERT ON `jonas discos`.compra
FOR EACH ROW
	BEGIN
    DECLARE idc INT;
    DECLARE dt DATE;
    DECLARE ct FLOAT;
    DECLARE op VARCHAR(10);
	SET op = 'INSERT',
		ct = new.custo_total,
        dt = new.data_compra;
	INSERT INTO `jonas discos`.audcompra(id,data_compra,custo_total,operation)
									values(idc,dt,ct,op);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_auddisco;
DELIMITER $$
CREATE TRIGGER trigger_insert_auddisco
AFTER INSERT ON `jonas discos`.disco
FOR EACH ROW
	BEGIN
    DECLARE idD INT;
    DECLARE tt VARCHAR(128);
    DECLARE tp ENUM('EP','LP','SINGLE','MAXI','N/A');
    DECLARE pp,cp FLOAT;
    DECLARE op VARCHAR(10);
    DECLARE dt DATE;
	SET op = 'INSERT',
		tt = new.titulo,
        idD = new.id,
        pp = new.pvp;
        IF(new.tipo is null) THEN SET tp = 'N/A';
        ELSE SET tp = new.tipo;
        END IF;
        IF(new.compra_preco is null) THEN SET cp = -1.0;
        ELSE SET cp = new.compra_preco;
        END IF;
	SET dt = (SELECT C.data_compra FROM `jonas discos`.compra AS C
				WHERE C.id = new.compra);
	INSERT INTO `jonas discos`.auddisco(id,titulo,tipo,pvp,compra_preco,operation,data_compra)
								values(idD,tt,tp,pp,cp,op,dt);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_audloja;
DELIMITER $$
CREATE TRIGGER trigger_insert_audloja
AFTER INSERT ON `jonas discos`.loja
FOR EACH ROW
	BEGIN
    DECLARE idL INT;
    DECLARE lc VARCHAR(128);
    DECLARE op VARCHAR(10);
	SET op = 'INSERT',
		idL = new.id,
		lc = new.localidade;
        
	INSERT INTO `jonas discos`.audloja(id,localidade,operation) values(idL,lc,op);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_audartista;
DELIMITER $$
CREATE TRIGGER trigger_insert_audartista
AFTER INSERT ON `jonas discos`.disco_artista
FOR EACH ROW
	BEGIN
    DECLARE ar VARCHAR(128);
    DECLARE idD INT;
    DECLARE op VARCHAR(10);
	SET op = 'INSERT',
		ar = new.artista,
		idD = new.disco;
	INSERT INTO `jonas discos`.auddisco_artista(artista,audDisco_id,operation)
											values(ar,idD,op);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_audgenero;
DELIMITER $$
CREATE TRIGGER trigger_insert_audgenero
AFTER INSERT ON `jonas discos`.disco_genero
FOR EACH ROW
	BEGIN
    DECLARE ge VARCHAR(128);
    DECLARE idD INT;
    DECLARE op VARCHAR(10);
	SET op = 'INSERT',
		ge = new.genero,
		idD = new.disco;
	INSERT INTO `jonas discos`.auddisco_genero(genero,audDisco_id,operation)
										values(ge,idD,op);
	END$$
DELIMITER ;