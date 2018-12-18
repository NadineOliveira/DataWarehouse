-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
-- Unidade Curricular de Bases de Dados
-- 2015/2016
-- Caso de Estudo: "Jonas Discos"
-- Povoamento inicial da base de dados
--

-- Indicação do esquema físico da base de dados
USE `Jonas Discos` ;

-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;


-- Povoamento da tabela `Jonas Discos`.`Loja`
INSERT INTO Loja 
	(total_fact,total_gasto,rua,cod_postal,localidade) 
	VALUES
	(0.0,0.0,'Rua dos Aliados','4400-000','Porto'),
    (100.0,200.0,'Rua da Ponte','2680-625','Lisboa'),
    (1500,300.0,'Avenida S.Joao','4710-100','Braga'),
    (1000.0,300.0,'Avenida da Liberdade','4820-100','Fafe'),
    (2000.0,250.0,'Rua Joao Crisostomo','4710-222','Braga'),
    (2200.0,200.0,'Rua Padre Joao','4805-100','Guimaraes'),
    (10000.0,2030.0,'Rua da Falesia','2420-100','Leiria'),
    (300.0,600.0,'Rua do Silencio','4423-232','Abacao'),
    (222.0,333.0,'Rua das Virtudes','7444-323','Faro'),
    (100.0,200.0,'Praça do Comércio','1100-148','Lisboa'),
    (250.0,200.0,'Rua de Santa Catarina','4000-450','Porto'),
    (100.0,200.0,'Rua de Carolina Michaellis ','4425-040 ','Maia'),
    (222.0,111.0,'Praça dos Pescadores','4450-222','Matosinhos'),
    (574.0,222.0,'Praça dos Forais ','4570-414','Rates'),
    (1003.0,100.0,'Praça dos Escritores ','4640-435','Santa Cruz do Douro'),
    (1233.0,200.0,'Praça dos Restauradores ','1250-188','Lisboa'),
    (1420.0,200.0,'Praça Augusto Lino dos Santos ','4400-029 ','Gaia'),
    (1420.0,200.0,'Travessa da Praça dos Forais ','4570-550','Rates'),
    (100.0,300.0,'Praça dos Combatentes da Guerra do Ultramar ','4630-188','Marco de Canaveses'),
    (100.0,250.0,'Rua Eira dos Lodos ','4600-540','Canadelo'),
    (100.0,330.0,'Rua dos Terreiros ','4485-404','Macieira da Maia'),
    (100.0,333.0,'Alameda Cidade de Lisboa ','4835-037','Guimaraes'),
    (111.0,222.0,'Rua João Serra ','7750-032','Alcaria Ruiva'),
    (1030.0,423.0,'Avenida da República ','2815-798','Sobredo'),
    (100.0,323.0,'Avenida Nássica ','4485-574','Modivas');


-- Povoamento da tabela `Joans Discos`.`Cliente`
INSERT INTO Cliente 
	(nome,email,cod_postal,rua,localidade,nr_discos,estatuto)
	VALUES
	('João Faria','joaofaria@gmail.com','4232-123','Rua Americana','Porto',1,'NORMAL'),
    ('João Cunha','joaocunha@gmail.com','2323-323','Rua da Inglaterra','Lisboa',52,'GOLDEN'),
    ('António Alves','antonioalves@gmail.com','535-123','Rua Amarela','Porto',102,'PLATINUM'),
    ('João Silva','joaosilva@gmail.com','0023-123','Rua das Flores','Porto',2,'NORMAL'),
    ('Sérgio Abreu','sergioabreu@gmail.com','3234-100','Rua das Tulipas','Lisboa',55,'GOLDEN'),
    ('João Abrantes','joaoabrantes@gmail.com','6563-000','Rua Azul ','Amarante',1,'NORMAL'),
    ('Jose Goncalves','josegoncalces@gmail.com','2313-333','Rua Cidade','Lisboa',3,'NORMAL'),
    ('Antonio Pais Cunha','antoniopaiscunha@gmail.com','2300-543','Rua Sempre em frente','Santarém',54,'GOLDEN'),
    ('Afonso Semedo','afonsosemedo@gmail.com','5433-222','Rua das Curvas','Porto',7,'NORMAL'),
    ('Flávio Silva','flaviosilva@gmail.com','2993-111','Rua número 2','Lisboa',101,'PLATINUM'),
    ('Antonio Vasconcelos','antoniovasconcelos@gmail.com','5353-424','Rua Assombrada','Porto',3,'NORMAL'),
    ('Alfredo Costa','alfredocosta@gmail.com','1241-524','Rua numero 4','Porto',3,'NORMAL'),
    ('João Servente','joaoservente@gmail.com','3252-520','Avenida Sampaio da Nóvoa','Porto',132,'PLATINUM'),
    ('Carlos Freitas','carlosfreitas@gmail.com','4820-300','Rua Cidade Guimarães','Fafe',3,'NORMAL'),
    ('Filipe Soares','filipesoares@gmail.com','4423-100','Rua da Bélgica','Porto',3,'NORMAL'),
	('Ana Freitas','anafreitas@gmail.com','1324-888','Rua do Cotovelos','Fafe',1,'NORMAL'),
    ('Joana Alves','joanaalves@gmail.com','5363-664','Rua do Labrego','Santarém',1,'NORMAL'),
    ('Isabel Silva','isabelsilva@gmail.com','4800-300','Rua Central','Guimaraes',1,'NORMAL'),
    ('Sónia Vasconcelos','sóniavasconcelos@gmail.com','2424-300','Rua Cidade Evora','Evora',2,'NORMAL'),
    ('Diana Afonso','dianaafonso@gmail.com','3232-300','Rua Adelaide Gomes','Setubal',5,'NORMAL'),
    ('Samanta Morais','samantamorais@gmail.com','6666-666','Rua do Demónio','Amarante',6,'NORMAL'),
    ('Rita Von Doellinger','ritavondoellinger@gmail.com','8666-434','Rua Faria Guimarães','Cabeceiras de Basto',9,'NORMAL'),
    ('Soraia Freitas','soraiafreitas@gmail.com','5353-300','Rua Conde Guimarães','Celorico de Basto',2,'NORMAL'),
    ('Juliana Michaellis','julianamichaellis@gmail.com','4820-300','Rua Cidade Guimarães','Fafe',1,'NORMAL'),
    ('Filipa Vaz','filipavaz@gmail.com','3334-300','Rua Padre Vieira de Castro','Povoa de Lanhoso',1,'NORMAL'),
    ('Cristina Machado','cristinamachado@gmail.com','3424-300','Rua Simpatica','Lisboa',32,'NORMAL'),
    ('Catarina Santos','catarinasantos@gmail.com','3232-300','Rua Azul','Faro',2,'NORMAL'),
    ('Susete Fernandes','susetefernandes@gmail.com','6654-100','Rua Cidade Guimarães','Portimao',3,'NORMAL'),
    ('Susana Subtil','susanasubtil@gmail.com','4785-300','Avenida Central','Trofa',112,'PLATINUM'),
    ('Adriana Duarte','adrianaduarte@gmail.com','5754-001','Rua dos Tomates','Albufeira',5,'NORMAL'),
    ('Carla Ribeiro','carlaribeiro@gmail.com','2424-757','Rua das Laranjas','Santarém',2,'NORMAL'),
    ('Ana Fontão','anafontão@gmail.com','4747-100','Rua dos Pêssegos','Felgueiras',1,'NORMAL'),
    ('Soraia Lopes','soraialopes@gmail.com','2033-300','Rua Padre José','Porto',3,'NORMAL');


-- Povoamento da tabela `Jonas Discos`.`Telefone_Cliente`
INSERT INTO Telefone_Cliente
	(numero,cliente)
	VALUES
	(919191919,1),
    (918923764,1),
    (969863398,2),
    (923423975,15),
    (923684764,16),
    (924857384,15),
    (912374964,10),
    (938436578,4),
    (912891394,4),
    (923413875,8);


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
    ('2014-01-18',3000,3,2),
    ('2015-01-19',4400,3,3),
    ('2016-01-20',3978,3,3),
    ('2016-01-20',4200,3,2);


-- Povoamento da tabela `Jonas Discos`.`Abastecimento` 
INSERT INTO Compra 
	(data_Compra,custo_total,loja,cliente)
	VALUES
	('2014-03-02',120.0, 17, 30),
	('2013-01-19',30.0, 17, 4),
    ('2012-12-20',25.0, 12, 8),
    ('2010-06-06',40.0, 17, 16),
    ('2015-05-05',24.0, 12, 15),
    ('2014-04-04',100.0, 1, 23),
    ('2013-03-03',19.0, 1, 10),
    ('2012-02-02',5.0, 2, 4),
    ('2011-01-01',30.0, 17, 30),
    ('2011-09-19',45.0, 20, 30),
    ('2011-11-11',60.0, 17, 15),
    ('2008-03-02',53.0, 20, 15),
    ('2011-07-24',55.0, 20, 18),
    ('2012-03-04',14.0, 11, 8),
    ('2012-05-07',48.0, 10, 3);


-- Povoamento da tabela  `Jonas Discos`.`Disco`
INSERT INTO Disco 
	(titulo,nr_faixas,duracao,rpm,tipo,pvp,compra_preco,abastecimento_custo,compra,abastecimento,loja)
	VALUES
	('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, 30,20,1,1,17),
    ('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, 25,20,3,1,12),
    ('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, null,20,null,1,2),
    ('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, null,20,null,1,1),
    ('Another Brick in the Wall',20,'1:03:56',33,'LP',34.90, null,20,null,1,3),
    ('The Darkside of the Moon',20,'1:02:20',33,'LP',99.90, null,50,null,1,1),
    ('The Darkside of the Moon',20,'1:02:20',33,'LP',99.90, null,50,null,1,2),
    ('The Darkside of the Moon',20,'1:02:20',33,'LP',99.90, 90,50,1,1,17),
    ('Obscured by Clouds',15,'0:59:56',33,'LP',34.90, null,20,null,1,1),
    ('Obscured by Clouds',15,'0:59:56',33,'LP',34.90, null,20,null,1,2),
    ('Obscured by Clouds',15,'0:59:56',33,'LP',34.90, null,20,null,1,1),
    ('Atom Mother Earth',10,'0:44:30',33,'EP',14.90, null,10,null,4,1),
    ('Atom Mother Earth',10,'0:44:30',33,'EP',14.90, null,10,null,4,1),
    ('Atom Mother Earth',10,'0:44:30',33,'EP',14.90, null,10,null,2,2),
    ('Atom Mother Earth',10,'0:44:30',33,'EP',14.90, null,10,null,2,3),
    ('Atom Mother Earth',10,'0:44:30',33,'EP',14.90, null,10,null,2,2),
    ('Atom Mother Earth',10,'0:44:30',33,'EP',14.90, null,10,null,2,2),
    ('Meddle',20,'01:20:00',33,'LP',34.90, null,20,null,1,1),
    ('Meddle',20,'01:20:00',33,'LP',34.90, null,20,null,1,1),
    ('Meddle',20,'01:20:00',33,'LP',34.90, null,20,null,1,2),
	('Greatest Hits',18,'01:00:32',33,'LP',35, null,22,null,3,2),
    ('Greatest Hits',18,'01:00:32',33,'LP',35, null,22,null,3,1),
    ('Greatest Hits',18,'01:00:32',33,'LP',35, null,22,null,3,2);

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
    ('Pink Floyd',7),
    ('Pink Floyd',8),
    ('Pink Floyd',9),
    ('Pink Floyd',10),
    ('Pink Floyd',11),
    ('Pink Floyd',12),
	('Pink Floyd',13),
    ('Pink Floyd',14),
    ('Pink Floyd',15),
    ('Pink Floyd',16),
    ('Elvis Presley',17),
    ('Pink Floyd',17),
    ('Elvis Presley',18),
    ('Pink Floyd',18),
    ('Elvis Presley',19),
    ('Pink Floyd',19),
    ('Queen',20),
    ('Queen',21),
    ('Queen',22);


-- Povoamento da tabela  `Jonas Discos`.`Disco_Genero`
INSERT INTO Disco_Genero
	(genero,disco)
    VALUES
    ('Rock Classico',1),
    ('Rock Classico',2),
    ('Rock Classico',3),
    ('Rock Classico',4),
    ('Rock Classico',5),
    ('Hard Rock',6),
    ('Hard Rock',7),
    ('Hard Rock',8),
    ('Rock Progressivo',9),
    ('Rock Progressivo',10),
    ('Rock Progressivo',11),
    ('Rock Progressivo',12),
	('Rock Progressivo',13),
    ('Blues',14),
    ('Blues',15),
    ('Blues',16),
    ('Jazz',17),
    ('Jazz Fusion',17),
    ('Jazz',18),
    ('Jazz Fusion',18),
    ('Jazz',19),
    ('Jazz Fusion',19),
    ('Pop Rock',20),
    ('Pop Rock',21),
    ('Pop Rock',22);
    

-- Inibição das operações de remoção de dados.
SET SQL_SAFE_UPDATES = 1;