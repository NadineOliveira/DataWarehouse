USE `dw-ar`;
DROP procedure IF EXISTS `inc_datas`;

DELIMITER $$
USE `dw-ar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inc_datas`()
BEGIN

SET @startDate = (SELECT MIN(data_compra) FROM pre_dim_disco);
SET @endDate = (SELECT MAX(data_compra) FROM pre_dim_disco);
	
    while @startDate<=@endDate DO
		SET @m = (SELECT MONTH(@startDate));
		SET @ano = (SELECT YEAR(@startDate));
		SET @mes = concat(@m,"-",@ano);
		SET @dia = dayname(@startDate);
        SET @s = (SELECT WEEK(@startDate));
        SET @sem = concat(@s,"-",@ano);
		select 
		CASE WHEN dayofweek(@startDate) IN (7,1) THEN 'S'
			ELSE 'N'
			END
		INTO @fds;
		INSERT INTO `dw-ar`.dimcalendario(`fim-de-semana`,mes,semana,dia,data)
		VALUES(@fds,@mes,@sem,@dia,@startDate);
		
		SET @startDate = DATE_ADD(@startDate, INTERVAL 1 DAY);
	END WHILE;

		SET @m = (SELECT MONTH(@startDate));
		SET @ano = (SELECT YEAR(@startDate));
		SET @mes = concat(@m,"-",@ano);
		SET @dia = dayname(@startDate);
        SET @s = (SELECT WEEK(@startDate));
        SET @sem = concat(@s,"-",@ano);
		select 
		CASE WHEN dayofweek(@startDate) IN (7,1) THEN 'S'
			ELSE 'N'
			END 
		INTO @fds;
		INSERT INTO `dw-ar`.dimcalendario(`fim-de-semana`,mes,semana,dia,data)
		VALUES(@fds,@mes,@sem,@dia,@startDate);
END$$

DELIMITER ;
