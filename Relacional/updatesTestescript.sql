-- Indicação do esquema físico da base de dados
USE `Jonas Discos` ;

-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

-- Povoamento da tabela `Joans Discos`.`Cliente`
INSERT INTO Cliente 
	(nome,email,cod_postal,rua,localidade,nr_discos,estatuto)
	VALUES
	('Rafael Ferreira','rafael@gmail.com','4232-123','Rua Americana','Porto',1,'NORMAL');

UPDATE `jonas discos`.`cliente`
SET
`nome` = "Novo cliente"
WHERE `id` = 2;

-- Povoamento da tabela `Jonas Discos`.`Abastecimento` 
INSERT INTO Compra 
	(data_Compra,custo_total,loja,cliente)
	VALUES
	('2018-12-12',50.0, 2, 3);

UPDATE `jonas discos`.`compra`
SET
`custo_total` = 300.0
WHERE `id` = 1;

-- Povoamento da tabela  `Jonas Discos`.`Disco`
INSERT INTO Disco 
	(titulo,nr_faixas,duracao,rpm,tipo,pvp,compra_preco,abastecimento_custo,compra,abastecimento,loja)
	VALUES
	('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, 30,20,1,1,2);
    
UPDATE `jonas discos`.`disco`
SET
`titulo` = "Maria Albertina",
`nr_faixas` = 44
WHERE `id` = 1;


-- Povoamento da tabela  `Jonas Discos`.`Disco_Artista`
INSERT INTO Disco_Artista
	(artista,disco)
    VALUES
    ('Artista Novo',1);
    
UPDATE `jonas discos`.`disco_artista`
SET
`artista` = "Novo",
`disco` = 4
WHERE `artista` = "Queen" AND `disco` = 10;


-- Povoamento da tabela  `Jonas Discos`.`Disco_Genero`
INSERT INTO Disco_Genero
	(genero,disco)
    VALUES
    ('Genero Novo',1);

UPDATE `jonas discos`.`disco_genero`
SET
`genero` = "novoGen"
WHERE `genero` = "Pop Rock"AND `disco` = 10;


    
-- Inibição das operações de remoção de dados.
SET SQL_SAFE_UPDATES = 1;    