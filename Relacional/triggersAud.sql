Use `jonas discos`;

DELIMITER $$
CREATE TRIGGER trigger_insert_client
AFTER INSERT ON `jonas discos`.cliente
FOR EACH ROW
	BEGIN
	INSERT INTO `jonas discos`.audcliente
    SET operation = 'INSERT',
		id = new.id,
        nome = new.nome,
        localidade = new.localidade,
        nr_discos = new.nr_discos,
        estatuto = new.estatuto;
	END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_insert_loja
AFTER INSERT ON `jonas discos`.compra
FOR EACH ROW
	BEGIN
	INSERT INTO `jonas discos`.audloja
    SET operation = 'INSERT',
		id = new.id,
        data_compra = new.data_Compra,
        localidade = (SELECT loja.localidade FROM loja
						where loja.id = new.compra.loja);
	END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_insert_disco
AFTER INSERT ON `jonas discos`.disco
FOR EACH ROW
	BEGIN
	INSERT INTO `jonas discos`.auddisco
    SET operation = 'INSERT',
		id = new.id,
        titulo = new.titulo,
        tipo = new.tipo,
        pvp = new.pvp,
        compra_preco = new.compra_preco,
        compra = new.compra;
	END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_insert_disco_art
AFTER INSERT ON `jonas discos`.disco_artista
FOR EACH ROW
	BEGIN
	INSERT INTO `jonas discos`.auddisco_artista
    SET operation = 'INSERT',
		audDisco_id = new.disco,
        artista = new.artista;
	END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_insert_disco_gen
AFTER INSERT ON `jonas discos`.disco_genero
FOR EACH ROW
	BEGIN
	INSERT INTO `jonas discos`.auddisco_genero
    SET operation = 'INSERT',
		audDisco_id = new.genero,
        genero = new.genero;
	END$$
DELIMITER ;