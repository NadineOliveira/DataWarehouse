-- Indicação do esquema físico da base de dados
USE `Jonas Discos` ;

-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

INSERT INTO Loja 
	(total_fact,total_gasto,rua,cod_postal,localidade) 
	VALUES
	(0.0,0.0,'Rua dos Aliados','4400-000','Porto'),
	(1500,300.0,'Avenida S.Joao','4710-100','Braga');

-- Povoamento da tabela `Joans Discos`.`Cliente`
INSERT INTO Cliente 
	(nome,email,cod_postal,rua,localidade,nr_discos,estatuto)
	VALUES
	('João Faria','joaofaria@gmail.com','4232-123','Rua Americana','Porto',1,'NORMAL'),
    ('João Cunha','joaocunha@gmail.com','2323-323','Rua da Inglaterra','Braga',52,'GOLDEN'),
    ('António Alves','antonioalves@gmail.com','535-123','Rua Amarela','Porto',102,'PLATINUM'),
    ('João Silva','joaosilva@gmail.com','0023-123','Rua das Flores','Porto',2,'NORMAL'),
    ('Sérgio Abreu','sergioabreu@gmail.com','3234-100','Rua das Tulipas','Ponte de Lima',55,'NORMAL'),
    ('João Abrantes','joaoabrantes@gmail.com','6563-000','Rua Azul ','Guimaraes',1,'NORMAL');
    
INSERT INTO Telefone_Cliente
	(numero,cliente)
	VALUES
	(919191919,1),
    (918923764,2),
    (969863398,3),
    (923423975,4),
    (923684764,5),
    (924857384,6);

-- Povoamento da tabela `Jonas Discos`.`Fornecedor` 
INSERT INTO Fornecedor 
	(email,nome)
	VALUES
	('discos80@gmail.com','Discos 80s'),
    ('disconight@gmail.com','Disco Night!'),
    ('bertodiscos@gmail.com','Berto Discos');

-- Povoamento da tabela `Jonas Discos`.`Telefone_Fornecedor`
INSERT INTO Telefone_Fornecedor
	(numero,fornecedor)
	VALUES
	(229062659,1),
    (229400939,1),
    (219049235,2);

-- Povoamento da tabela `Jonas Discos`.`Abastecimento`
	INSERT INTO Abastecimento 
	(data_abastecimento,custo_total,loja,fornecedor)
	VALUES
	('2015-01-01',2000,1,1),
    ('2014-01-18',3000,1,2),
    ('2015-01-19',4400,1,1),
    ('2016-01-20',3978,2,2),
    ('2016-01-20',4200,1,2);

-- Povoamento da tabela `Jonas Discos`.`Abastecimento` 
INSERT INTO Compra 
	(data_Compra,custo_total,loja,cliente)
	VALUES
	('2014-03-02',120.0, 2, 2),
	('2013-01-19',30.0, 1, 1),
    ('2012-12-20',25.0, 1, 3),
    ('2010-06-06',40.0, 1, 4),
    ('2015-05-05',24.0, 2, 5),
    ('2014-04-04',100.0,1, 3),
    ('2013-03-03',19.0, 2, 6),
    ('2012-02-02',5.0, 1, 4),
    ('2011-01-01',30.0, 1, 3),
    ('2011-09-19',45.0, 1, 3),
    ('2011-11-11',60.0, 2, 2),
    ('2008-03-02',53.0, 2, 2),
    ('2011-07-24',55.0, 2, 2),
    ('2012-03-04',14.0, 1, 3),
    ('2012-05-07',48.0, 1, 3);

-- Povoamento da tabela  `Jonas Discos`.`Disco`
INSERT INTO Disco 
	(titulo,nr_faixas,duracao,rpm,tipo,pvp,compra_preco,abastecimento_custo,compra,abastecimento,loja)
	VALUES
	('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, 30,20,1,1,2),
    ('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, 25,20,3,1,1),
    ('The Darkside of the Moon',20,'1:02:20',33,'LP',99.90, null,50,2,1,1),
    ('The Darkside of the Moon',20,'1:02:20',33,'LP',99.90, null,50,4,1,1),
	('Obscured by Clouds',15,'0:59:56',33,'LP',34.90, null,20,6,1,1),
	('Atom Mother Earth',10,'0:44:30',33,'EP',14.90, null,10,5,4,2),
    ('Meddle',20,'01:20:00',33,'LP',34.90, null,20,10,1,1),
    ('Meddle',20,'01:20:00',33,'LP',34.90, null,20,11,1,2),
    ('Meddle',20,'01:20:00',33,'LP',34.90, null,20,8,1,1),
    ('Greatest Hits',18,'01:00:32',33,'LP',35, null,22,9,3,1),
    ('Greatest Hits',18,'01:00:32',33,'LP',35, null,22,3,3,1),
    ('Greatest Hits',18,'01:00:32',33,'LP',35, null,22,3,3,1);

-- Povoamento da tabela  `Jonas Discos`.`Disco_Artista`
INSERT INTO Disco_Artista
	(artista,disco)
    VALUES
    ('Pink Floyd',1),
    ('Pink Floyd',2),
    ('Pink Floyd',3),
    ('Pink Floyd',4),
    ('Pink Floyd',5),
    ('Pink Floyd',6),
    ('Elvis Presley',7),
    ('Pink Floyd',7),
    ('Elvis Presley',8),
    ('Pink Floyd',8),
    ('Elvis Presley',9),
    ('Pink Floyd',9),
    ('Queen',10),
    ('Queen',11),
    ('Queen',12);

-- Povoamento da tabela  `Jonas Discos`.`Disco_Genero`
INSERT INTO Disco_Genero
	(genero,disco)
    VALUES
    ('Rock Classico',1),
    ('Rock Classico',2),
    ('Hard Rock',3),
    ('Hard Rock',4),
    ('Rock Progressivo',5),
    ('Rock Progressivo',6),
    ('Jazz',7),
    ('Jazz Fusion',7),
    ('Jazz',8),
    ('Jazz Fusion',8),
    ('Jazz',9),
    ('Jazz Fusion',9),
    ('Pop Rock',10),
    ('Pop Rock',11),
    ('Pop Rock',12);
    

-- Inibição das operações de remoção de dados.
SET SQL_SAFE_UPDATES = 1;    