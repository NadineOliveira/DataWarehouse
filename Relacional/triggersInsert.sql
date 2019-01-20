Use `jonas discos`;
DROP TRIGGER IF EXISTS trigger_insert_audcliente;
DELIMITER $$
CREATE TRIGGER trigger_insert_audcliente
AFTER INSERT ON `jonas discos`.cliente
FOR EACH ROW
	BEGIN
    DECLARE nm,em,lc VARCHAR(128);
    DECLARE op VARCHAR(10);
    DECLARE nd INT;
    DECLARE est ENUM('NORMAL','GOLDEN','PLATINUM');
	SET op = 'INSERT',
		nm = new.nome,
        nd = new.nr_discos,
        est = new.estatuto;
        IF(new.email is null) THEN SET em = "N/A";
        ELSE SET em = new.email;
        END IF;
        IF(new.localidade is null) THEN SET lc = "N/A";
        ELSE SET lc = new.localidade;
        END IF;
	INSERT INTO `jonas discos`.audcliente values(nm,em,lc,nd,est,op);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_audcompra;
DELIMITER $$
CREATE TRIGGER trigger_insert_audcompra
AFTER INSERT ON `jonas discos`.compra
FOR EACH ROW
	BEGIN
    DECLARE dt DATE;
    DECLARE ct FLOAT;
    DECLARE op VARCHAR(10);
	SET op = 'INSERT',
		ct = new.custo_total,
        dt = new.data_compra;
	INSERT INTO `jonas discos`.audcompra values(dt,ct,op);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_auddisco;
DELIMITER $$
CREATE TRIGGER trigger_insert_auddisco
AFTER INSERT ON `jonas discos`.disco
FOR EACH ROW
	BEGIN
    DECLARE tt VARCHAR(128);
    DECLARE tp ENUM('EP','LP','SINGLE','MAXI');
    DECLARE pp,cp FLOAT;
    DECLARE op VARCHAR(10);
	SET op = 'INSERT',
		tt = new.titulo,
        pp = new.pvp;
        IF(new.tipo is null) THEN SET tp = "N/A";
        ELSE SET tp = new.tipo;
        END IF;
        IF(new.compra_preco is null) THEN SET cp = "N/A";
        ELSE SET cp = new.compra_preco;
        END IF;
	INSERT INTO `jonas discos`.auddisco values(tt,tp,pp,cp,op);
	END$$
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_insert_audloja;
DELIMITER $$
CREATE TRIGGER trigger_insert_audloja
AFTER INSERT ON `jonas discos`.compra
FOR EACH ROW
	BEGIN
    DECLARE lc VARCHAR(128);
    DECLARE dc DATE;
    DECLARE op VARCHAR(10);
	SET op = 'INSERT',
		dc = new.data_compra;
		IF(new.loja is null) THEN SET lc = "N/A";
        ELSE SET
		lc = (SELECT L.localidade FROM `jonas discos`.loja AS L
				WHERE L.id = new.loja);
		END IF;
        
	INSERT INTO `jonas discos`.audloja values(dc,lc,op);
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
	INSERT INTO `jonas discos`.auddisco_artista values(ar,idD,op);
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
	INSERT INTO `jonas discos`.auddisco_genero values(ge,idD,op);
	END$$
DELIMITER ;