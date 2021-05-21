CREATE DATABASE  IF NOT EXISTS `data_cie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `data_cie`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: data_cie
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `canjes`
--

DROP TABLE IF EXISTS `canjes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canjes` (
  `id_redencion` int NOT NULL AUTO_INCREMENT,
  `cliente_id` varchar(10) NOT NULL,
  `servicio_id` int NOT NULL,
  `fecha_redencion` datetime NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_redencion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canjes`
--

LOCK TABLES `canjes` WRITE;
/*!40000 ALTER TABLE `canjes` DISABLE KEYS */;
INSERT INTO `canjes` VALUES (3,'7',1,'2021-05-21 02:05:23',1),(4,'7',1,'2021-05-21 02:08:04',1);
/*!40000 ALTER TABLE `canjes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CC` varchar(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Primer_Apellido` varchar(15) NOT NULL,
  `Segundo_Apellido` varchar(15) NOT NULL,
  `Telefono` char(10) NOT NULL,
  `Correo` varchar(25) NOT NULL,
  PRIMARY KEY (`CC`),
  UNIQUE KEY `CC_UNIQUE` (`CC`),
  UNIQUE KEY `Telefono_UNIQUE` (`Telefono`),
  UNIQUE KEY `Correo_UNIQUE` (`Correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('22492789','Karina','Llain','Arenilla','3008561731','karina@gmail.com'),('3','Thanks','For','ChooseUs','1234567890','thanks@gmail.com'),('33','Eudes','Serpa','Martinez','3335559990','eudes@gmail.com'),('5','Unimag','Incluyente','Innovadora','0987654321','unimag@gmail.com'),('7','Serpa','Serpa','Serpa','0002223335','serpa@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(25) NOT NULL,
  `Precio` double NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_producto_UNIQUE` (`id_producto`),
  UNIQUE KEY `Nombre_producto_UNIQUE` (`Nombre_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'product1',55000),(2,'product2',123000),(3,'product3',222000),(4,'product4',333000);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `Nombre_servicio` varchar(25) NOT NULL,
  `Puntos` int NOT NULL,
  `Descripcion` tinytext NOT NULL,
  `Imagen` varchar(100) NOT NULL COMMENT 'Ruta de ubicacion de la imagen',
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `id_servicio_UNIQUE` (`id_servicio`),
  UNIQUE KEY `Nombre_servicio_UNIQUE` (`Nombre_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Servicio1',333,'Servicio #1 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png'),(2,'Servicio2',555,'Servicio #2 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png'),(3,'Servicio3',777,'Servicio #3 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png'),(4,'Servicio4',999,'Servicio #4 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png'),(5,'Servicio5',1555,'Servicio #5 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png'),(6,'Servicio6',3333,'Servicio #6 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png'),(7,'Servicio7',9999,'Servicio #7 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png'),(8,'Servicio8',100000,'Servicio #8 de tu Zupermercado','E:\\Eudes\\Programas\\Python\\CODIGOS\\TkinterExcel\\imagenes\\zuana.png');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vfvg`
--

DROP TABLE IF EXISTS `vfvg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vfvg` (
  `idventasFactura` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` varchar(10) NOT NULL,
  `factura` varchar(20) NOT NULL,
  `valor_total` varchar(10) NOT NULL,
  `puntos` int unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`idventasFactura`),
  UNIQUE KEY `factura_UNIQUE` (`factura`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vfvg`
--

LOCK TABLES `vfvg` WRITE;
/*!40000 ALTER TABLE `vfvg` DISABLE KEYS */;
INSERT INTO `vfvg` VALUES (1,'3','1a','9500',9,'2021-05-19 14:31:23',1),(2,'5','1b','500000',500,'2021-03-27 12:33:23',0),(10,'7','7a','950000',950,'2021-05-21 00:12:12',1),(11,'3','3e','11000',11,'2021-05-21 02:22:30',1),(12,'3','3h','5500',5,'2021-05-21 02:24:18',1),(13,'33','33e','100000',100,'2021-02-21 02:28:05',0),(14,'33','33f','33000',33,'2021-04-15 02:31:30',1),(15,'33','33g','55000',55,'2021-04-15 02:33:56',0),(16,'33','33h','99000',99,'2021-05-21 02:47:52',1),(17,'3','9a','33000',33,'2021-05-21 13:43:23',1);
/*!40000 ALTER TABLE `vfvg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'data_cie'
--
/*!50003 DROP FUNCTION IF EXISTS `fechaUltimaCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fechaUltimaCompra`(cedula INT) RETURNS datetime
    READS SQL DATA
BEGIN
	DECLARE fecha DATETIME;
    
    SELECT MAX(v.fecha) INTO fecha
		FROM ventasfactura AS v
		WHERE v.cliente_id = cedula;
RETURN fecha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getTotalPoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTotalPoints`(cedula INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE points INTEGER default 0;
    
	SELECT SUM(Puntos_ganados) INTO points
		FROM clientes AS c, 
		(
			SELECT SUM(v.puntos) AS Puntos_ganados
				FROM data_cie.ventasfactura AS v 
					INNER JOIN data_cie.clientes AS c
						ON v.cliente_id = c.CC
				WHERE c.CC = cedula
			UNION
			SELECT -(SUM(s.Puntos)) AS Puntos_redimidos
				FROM data_cie.servicios AS s
					INNER JOIN redenciones AS r 
					ON r.servicio_id = s.id_servicio
				WHERE r.cliente_id = cedula
		)AS Puntos_Totales
		WHERE c.CC = cedula;
        
	SET points = IFNULL(points, 0);
                
RETURN points;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `pointsWins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pointsWins`(cedula INT) RETURNS bigint
    READS SQL DATA
BEGIN
	-- PUNTOS CLIENTE -> VIGENTES

	-- Variables donde almacenar resultado del SELECT enlazado al cursor
	DECLARE v_puntos INT;
	DECLARE v_estado BOOLEAN;
    DECLARE v_suma_ganados BIGINT DEFAULT 0;
    DECLARE v_suma_canjeados BIGINT DEFAULT 0;
    DECLARE v_puntos_totales BIGINT DEFAULT 0;
    
	-- Variable para controlar el fin del bucle
	DECLARE fin INTEGER DEFAULT 0;

	-- El SELECT que vamos a ejecutar y enlazar al cursor
	DECLARE cursor_ventas CURSOR FOR
		SELECT puntos, estado 
			FROM data_cie.vfvg AS v 
			WHERE v.cliente_id = cedula
			ORDER BY fecha DESC;
            
    DECLARE cursor_canjes CURSOR FOR
		SELECT s.Puntos, canjes.estado
			FROM data_cie.servicios AS s
				INNER JOIN data_cie.canjes AS c 
					ON c.servicio_id = s.id_servicio,
				data_cie.canjes
			WHERE c.cliente_id = cedula
			ORDER BY canjes.fecha_redencion DESC;
	
	-- Condicion de salida por defecto: al terminar los resultados
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

	OPEN cursor_ventas;
    OPEN cursor_canjes;

	-- Bucles
	get_points: LOOP
        -- Resultado del SELECT
        FETCH cursor_ventas INTO v_puntos, v_estado;
        
        IF fin = 1 OR v_estado = 0 THEN
           LEAVE get_points;
		END IF;
        
		SET v_suma_ganados = v_suma_ganados + v_puntos;

	END LOOP get_points;
    
    SET fin = 0;
    get_points: LOOP
        FETCH cursor_canjes INTO v_puntos, v_estado;
        
        IF fin = 1 OR v_estado = 0 THEN
           LEAVE get_points;
		END IF;
        
		SET v_suma_canjeados = v_suma_canjeados + v_puntos;

	END LOOP get_points;

	SET v_puntos_totales = v_suma_ganados - v_suma_canjeados;

	CLOSE cursor_ventas;
    CLOSE cursor_canjes;
RETURN v_puntos_totales;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultExistence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultExistence`(IN cedula VARCHAR(10))
BEGIN        
	-- INFO DEL CLIENTE + FECHA ULTIMA COMPRA
    SELECT c.CC, c.Nombre, c.Primer_Apellido, c.Segundo_Apellido, c.Telefono, 
		c.Correo, ultima_fecha AS fecha_ultima_compra
		FROM data_cie.clientes AS c,
		(
			SELECT MAX(v.fecha) AS ultima_fecha
				FROM data_cie.vfvg AS v 
					INNER JOIN data_cie.clientes AS c
						ON v.cliente_id = c.CC
				WHERE c.CC = cedula
		) AS fecha	
	WHERE c.CC = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_client`(IN cedula VARCHAR(10), IN nombre VARCHAR(15), IN p_a VARCHAR(15),
	IN s_a VARCHAR(15), IN telf CHAR(10), IN email VARCHAR(25))
BEGIN

	INSERT INTO clientes (CC, Nombre, Primer_Apellido, Segundo_Apellido, Telefono, Correo) 
		VALUES (cedula, nombre, p_a, s_a, telf, email);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `infoventa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `infoventa`(IN CC VARCHAR(10), IN code_product INT, IN cantidad INT, IN puntos INT, in fecha DATETIME)
BEGIN        
	INSERT INTO data_cie.ventas(cliente_id, producto_id, Cantidad, Puntos, Fecha_venta)
		VALUES(CC, code_product, cantidad, puntos, fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `infoventa_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `infoventa_factura`(
	IN CC VARCHAR(10),
    IN numeroFactura VARCHAR(20),
    IN totalVenta VARCHAR(10),
    IN puntos INT UNSIGNED,
    IN fecha DATETIME
)
BEGIN 
	INSERT INTO data_cie.ventasfactura(cliente_id, factura, valor_total, puntos, fecha)
		VALUES(CC, numeroFactura, totalVenta, puntos, fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_client`(IN cedula VARCHAR(10))
BEGIN        
	SELECT c.CC, c.Nombre, c.Primer_Apellido, c.Segundo_Apellido, c.Telefono, 
		c.Correo, SUM(Puntos_ganados) AS Puntos 
		FROM data_cie.clientes AS c,
		(
			SELECT SUM(v.Puntos) AS Puntos_ganados
				FROM data_cie.ventas AS v 
					INNER JOIN data_cie.clientes AS c
						ON v.cliente_id = c.CC
				WHERE c.CC = cedula
			UNION
			SELECT -(SUM(s.Puntos)) AS Puntos_redimidos
				FROM data_cie.servicios AS s
					INNER JOIN redenciones AS r 
					ON r.servicio_id = s.id_servicio
				WHERE r.cliente_id = cedula
		) AS Points_red	
	WHERE c.CC = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_client_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_client_factura`(IN cedula VARCHAR(10))
BEGIN        
	SELECT c.CC, c.Nombre, c.Primer_Apellido, c.Segundo_Apellido, c.Telefono, 
		c.Correo, SUM(Puntos_ganados) AS Puntos 
		FROM data_cie.clientes AS c,
		(
			SELECT SUM(v.puntos) AS Puntos_ganados
				FROM data_cie.ventasfactura AS v 
					INNER JOIN data_cie.clientes AS c
						ON v.cliente_id = c.CC
				WHERE c.CC = cedula
			UNION
			SELECT -(SUM(s.Puntos)) AS Puntos_redimidos
				FROM data_cie.servicios AS s
					INNER JOIN redenciones AS r 
					ON r.servicio_id = s.id_servicio
				WHERE r.cliente_id = cedula
		) AS Points_red	
	WHERE c.CC = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_points_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_points_client`(IN cedula VARCHAR(10))
BEGIN        
	SELECT c.CC, c.Nombre, c.Primer_Apellido, c.Segundo_Apellido, c.Telefono, c.Correo, 
	SUM(v.Puntos) AS Puntos_ganados, Puntos_redimidos
	FROM data_cie.clientes AS c, data_cie.ventas AS v, 
	(
		SELECT -(SUM(s.Puntos)) AS Puntos_redimidos
			FROM data_cie.servicios AS s
				INNER JOIN redenciones AS r 
				ON r.servicio_id = s.id_servicio
			WHERE r.cliente_id = cedula
	) AS Points_red	
	WHERE c.CC = cedula AND v.cliente_id = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_product`(IN product VARCHAR(25))
BEGIN
	
    SELECT * FROM productos
		WHERE Nombre_producto = product;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `info_servicios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_servicios`()
BEGIN 

	SELECT * FROM data_cie.servicios;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCanje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCanje`(IN cc_cliente VARCHAR(10), IN code_servicio INT, IN fecha DATETIME)
BEGIN

	INSERT INTO data_cie.canjes(cliente_id, servicio_id, fecha_redencion)
		VALUES(cc_cliente, code_servicio, fecha);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertDataBilled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertDataBilled`(
	IN CC VARCHAR(10),
    IN numeroFactura VARCHAR(20),
    IN totalVenta VARCHAR(10),
    IN puntos INT UNSIGNED,
    IN fecha DATETIME
)
BEGIN 
	INSERT INTO data_cie.vfvg(cliente_id, factura, valor_total, puntos, fecha)
		VALUES(CC, numeroFactura, totalVenta, puntos, fecha);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_rendencion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_rendencion`(IN cc_cliente VARCHAR(10), IN code_servicio INT, IN fecha DATETIME)
BEGIN

	INSERT INTO data_cie.redenciones(cliente_id, servicio_id, Fecha_redencion)
		VALUES(cc_cliente, code_servicio, fecha);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pointsClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pointsClient`(
    IN cedula VARCHAR(10)
)
BEGIN
	-- PUNTOS CLIENTE -> VIGENTES

	-- Variables donde almacenar resultado del SELECT enlazado al cursor
	DECLARE v_puntos INT;
	DECLARE v_estado BOOLEAN;
    DECLARE v_suma_ganados BIGINT DEFAULT 0;
    DECLARE v_suma_canjeados BIGINT DEFAULT 0;
    DECLARE v_puntos_totales BIGINT DEFAULT 0;
    
	-- Variable para controlar el fin del bucle
	DECLARE fin INTEGER DEFAULT 0;

	-- El SELECT que vamos a ejecutar y enlazar al cursor
	DECLARE cursor_ventas CURSOR FOR
		SELECT puntos, estado 
			FROM data_cie.vfvg AS v 
			WHERE v.cliente_id = cedula
			ORDER BY fecha DESC;
            
    DECLARE cursor_canjes CURSOR FOR
		SELECT s.Puntos, c.estado
			FROM data_cie.servicios AS s
				INNER JOIN data_cie.canjes AS c 
					ON c.servicio_id = s.id_servicio
			WHERE c.cliente_id = cedula
			ORDER BY c.fecha_redencion DESC;
	
	-- Condicion de salida por defecto: al terminar los resultados
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

	OPEN cursor_ventas;
    OPEN cursor_canjes;

	-- Bucles
	get_points: LOOP
        -- Resultado del SELECT
        FETCH cursor_ventas INTO v_puntos, v_estado;
        
        IF fin = 1 OR v_estado = 0 THEN
           LEAVE get_points;
		END IF;
        
		SET v_suma_ganados = v_suma_ganados + v_puntos;

	END LOOP get_points;
    
    SET fin = 0;
    get_points: LOOP
        FETCH cursor_canjes INTO v_puntos, v_estado;
        
        IF fin = 1 OR v_estado = 0 THEN
           LEAVE get_points;
		END IF;
        
		SET v_suma_canjeados = v_suma_canjeados + v_puntos;

	END LOOP get_points;

	-- Puntos totales = ganados - redimidos
	SET v_puntos_totales = v_suma_ganados - v_suma_canjeados;

	SELECT v_puntos_totales AS PUNTOS;

	CLOSE cursor_ventas;
    CLOSE cursor_canjes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tra_consult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tra_consult`(IN cedula varchar(10))
BEGIN
	DECLARE ultimaCompra DATETIME;
	DECLARE dias INT;

	SET ultimaCompra = fechaUltimaCompra(cedula);
	SET dias = IFNULL(DATEDIFF( NOW(), ultimaCompra), 33);

	SELECT c.CC, c.Nombre, c.Primer_Apellido, c.Segundo_Apellido, c.Telefono, 
		c.Correo, IF( dias <= 30, PuntosT, 0) AS Puntos
		FROM data_cie.clientes AS c,
		(
			SELECT getTotalPoints(cedula) AS PuntosT
		) AS PuntosDesdeFuncion
		WHERE c.CC = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateVigencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateVigencia`(
	IN cedula VARCHAR(10)
)
BEGIN
	-- ACTUALIZAR LA VIGENCIA PARA LOS PUNTOS -> A VENCIDOS
    -- solo ultimas compras vencidas 
    
    -- ASIGNACION
    UPDATE data_cie.vfvg
		SET estado = 0
        WHERE cliente_id = cedula
        ORDER BY fecha DESC
        LIMIT 1;
        
	-- CANJE
    UPDATE data_cie.canjes
		SET estado = 0
        WHERE cliente_id = cedula
        ORDER BY fecha DESC
        LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-21 15:30:01
