-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: metrobus
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `alergia`
--

DROP TABLE IF EXISTS `alergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergia` (
  `id_alergia` int NOT NULL AUTO_INCREMENT,
  `tipo_elergia` varchar(100) NOT NULL,
  `nivel_alergia` int NOT NULL,
  `id_historial_clinico_fk` int NOT NULL,
  PRIMARY KEY (`id_alergia`),
  KEY `fk_alergia_historial_clinico1_idx` (`id_historial_clinico_fk`),
  CONSTRAINT `fk_alergia_historial_clinico1` FOREIGN KEY (`id_historial_clinico_fk`) REFERENCES `historial_clinico` (`id_historial_clinico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergia`
--

LOCK TABLES `alergia` WRITE;
/*!40000 ALTER TABLE `alergia` DISABLE KEYS */;
INSERT INTO `alergia` VALUES (1,'Polen',2,1),(2,'Medicamentos',1,3),(3,'Asma',3,1),(4,'Camarones',2,2),(5,'Abejas',1,5);
/*!40000 ALTER TABLE `alergia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `id_authority` int NOT NULL AUTO_INCREMENT,
  `authority` varchar(100) NOT NULL,
  PRIMARY KEY (`id_authority`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority_has_user`
--

DROP TABLE IF EXISTS `authority_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority_has_user` (
  `id_authority_fk` int NOT NULL,
  `id_user_fk` int NOT NULL,
  PRIMARY KEY (`id_authority_fk`,`id_user_fk`),
  KEY `authority_has_user_x2_idx` (`id_user_fk`),
  CONSTRAINT `authority_has_user_x1` FOREIGN KEY (`id_authority_fk`) REFERENCES `authority` (`id_authority`),
  CONSTRAINT `authority_has_user_x2` FOREIGN KEY (`id_user_fk`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority_has_user`
--

LOCK TABLES `authority_has_user` WRITE;
/*!40000 ALTER TABLE `authority_has_user` DISABLE KEYS */;
INSERT INTO `authority_has_user` VALUES (2,1),(2,2);
/*!40000 ALTER TABLE `authority_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobus`
--

DROP TABLE IF EXISTS `autobus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autobus` (
  `id_autobus` int NOT NULL AUTO_INCREMENT,
  `modelo_autobus` varchar(100) NOT NULL,
  `id_tipo_autobus_fk` int NOT NULL,
  `id_empleado_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_autobus`),
  KEY `fk_autobus_tipo_autobus1_idx` (`id_tipo_autobus_fk`),
  KEY `fk_autobus_empleado1_idx` (`id_empleado_fk`),
  KEY `fk_modelo_autobus_idx` (`modelo_autobus`),
  CONSTRAINT `fk_autobus_empleado1` FOREIGN KEY (`id_empleado_fk`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `fk_autobus_tipo_autobus1` FOREIGN KEY (`id_tipo_autobus_fk`) REFERENCES `tipo_autobus` (`id_tipo_autobus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobus`
--

LOCK TABLES `autobus` WRITE;
/*!40000 ALTER TABLE `autobus` DISABLE KEYS */;
INSERT INTO `autobus` VALUES (1,'Enviro 500',4,2),(2,'Volvo 7300 BRT',2,8),(3,'Scania Neobus Mega BRt',2,8),(4,'Scania-Comil',3,9),(5,'Mercedes-Benz Gran Viale',2,10);
/*!40000 ALTER TABLE `autobus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificado`
--

DROP TABLE IF EXISTS `certificado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificado` (
  `id_certificado` int NOT NULL AUTO_INCREMENT,
  `tipo_certificado` varchar(100) NOT NULL,
  `organizacion` varchar(1000) NOT NULL,
  `fecha_entrega` date NOT NULL,
  `id_empleado_fk` int NOT NULL,
  PRIMARY KEY (`id_certificado`),
  KEY `fk_certificado_empleado1_idx` (`id_empleado_fk`),
  CONSTRAINT `fk_certificado_empleado1` FOREIGN KEY (`id_empleado_fk`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificado`
--

LOCK TABLES `certificado` WRITE;
/*!40000 ALTER TABLE `certificado` DISABLE KEYS */;
INSERT INTO `certificado` VALUES (1,'CAP','Castilla La Mancha','2019-05-06',2),(2,'Manejo seguro','Mi chofer','2018-08-24',5),(3,'Manejo ahorrativo','Mi chofe','2019-01-12',8),(4,'Manejo seguro','Mi chofer','2020-06-23',2),(5,'CAP','Castilla La Mancha','2015-05-30',10);
/*!40000 ALTER TABLE `certificado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cirugia`
--

DROP TABLE IF EXISTS `cirugia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cirugia` (
  `id_cirugia` int NOT NULL AUTO_INCREMENT,
  `tipo_cirugia` varchar(100) NOT NULL,
  `fecha_internacion` date NOT NULL,
  `fecha_cirugia` date NOT NULL,
  `tiempo_incapacitacion` date NOT NULL,
  `costo_cirugia` float NOT NULL,
  `id_historial_clinico_fk` int NOT NULL,
  PRIMARY KEY (`id_cirugia`),
  KEY `fk_cirugia_historial_clinico1_idx` (`id_historial_clinico_fk`),
  CONSTRAINT `fk_cirugia_historial_clinico1` FOREIGN KEY (`id_historial_clinico_fk`) REFERENCES `historial_clinico` (`id_historial_clinico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cirugia`
--

LOCK TABLES `cirugia` WRITE;
/*!40000 ALTER TABLE `cirugia` DISABLE KEYS */;
INSERT INTO `cirugia` VALUES (1,'Mayor','2019-06-12','2019-06-16','2019-06-30',25000,1),(2,'Menor','2020-03-12','2020-03-12','2019-03-20',50000,1),(3,'Electiva','2018-05-30','2018-06-01','2018-06-02',35000,3),(4,'Emergencia','2019-09-28','2019-09-28','2019-10-10',75000,5),(5,'Emergencia','2020-01-22','2020-01-22','2020-02-15',100000,4);
/*!40000 ALTER TABLE `cirugia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id_ciudad` int NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'CDMX'),(2,'Toluca');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colonia`
--

DROP TABLE IF EXISTS `colonia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colonia` (
  `id_colonia` int NOT NULL AUTO_INCREMENT,
  `nombre_colonia` varchar(45) DEFAULT NULL,
  `id_ciudad_fk` int NOT NULL,
  PRIMARY KEY (`id_colonia`),
  KEY `fk_colonia_ciudad_idx` (`id_ciudad_fk`),
  CONSTRAINT `fk_colonia_ciudad` FOREIGN KEY (`id_ciudad_fk`) REFERENCES `ciudad` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonia`
--

LOCK TABLES `colonia` WRITE;
/*!40000 ALTER TABLE `colonia` DISABLE KEYS */;
INSERT INTO `colonia` VALUES (1,'Doctores',1),(2,'Navarte',1),(3,'Altavista',1),(4,'San Jerónimo',1),(5,'San Bartolo Ameyalco',1),(6,'Amp Granada',1),(7,'Sector Popular',2),(8,'El Seminario Quinta Secc',2),(9,'Benito Juárez',1),(10,'San Lorenzo Tepaltitlan',2),(11,'Reforma Politica',1),(12,'Granjas Modernas',1),(13,'Ex hacienda de Tarango',1),(14,'Lomas de Vista',1),(15,'Cuauhtémoc',1),(16,'Miguel Hidalgo',1),(17,'Iztapalapa',1),(18,'Santa Fe',1),(19,'Refineria',1),(20,'Santafe',1),(21,'Saltillo',1);
/*!40000 ALTER TABLE `colonia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_emergencia`
--

DROP TABLE IF EXISTS `contacto_emergencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_emergencia` (
  `id_contacto_emergencia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  `id_direccion_fk` int NOT NULL,
  PRIMARY KEY (`id_contacto_emergencia`),
  KEY `fk_contacto_emergencia_direccion1_idx` (`id_direccion_fk`),
  CONSTRAINT `fk_contacto_emergencia_direccion1` FOREIGN KEY (`id_direccion_fk`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_emergencia`
--

LOCK TABLES `contacto_emergencia` WRITE;
/*!40000 ALTER TABLE `contacto_emergencia` DISABLE KEYS */;
INSERT INTO `contacto_emergencia` VALUES (1,'Daniel','Ramirez','Lazaro','5548791321',6),(2,'Fabricio','Escobedo','Reyes','5568972134',3),(3,'Pablo','Villa','Rosas','5549843214',5),(4,'Luis','Cordoba','Rubio','5568732148',10),(5,'Raul','de la Cruz','Jimenez','5532154897',16);
/*!40000 ALTER TABLE `contacto_emergencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteoincidentes`
--

DROP TABLE IF EXISTS `conteoincidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteoincidentes` (
  `incidente` varchar(100) DEFAULT NULL,
  `total` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteoincidentes`
--

LOCK TABLES `conteoincidentes` WRITE;
/*!40000 ALTER TABLE `conteoincidentes` DISABLE KEYS */;
INSERT INTO `conteoincidentes` VALUES ('Choque de costado',1),('Goteras',1),('Choque frontal',1),('Llanta ponchada',1),('Choque trasero',2),('Choque trasero',2);
/*!40000 ALTER TABLE `conteoincidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) NOT NULL,
  `numero_exterior` int NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `id_colonia_fk` int NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_colonia1_idx` (`id_colonia_fk`),
  CONSTRAINT `fk_direccion_colonia1` FOREIGN KEY (`id_colonia_fk`) REFERENCES `colonia` (`id_colonia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Av. Cuauhtémoc',16,'06720',1),(2,'Cumbres de Maltran',361,'03020',2),(3,'Río hondo',1,'01080',3),(4,'Av. San Jeronimo',819,'10200',4),(5,'Camino Viejo a Mixcoac',48,'01800',9),(6,'Lago Zurich',245,'11529',6),(7,'Lerma',401,'50040',7),(8,'Tebago',711,'50040',7),(9,'Lago Ochoa',204,'50170',8),(10,'S. Pablo Guelatao',507,'50190',9),(11,'Dr Nicolas San Juan',0,'50010',10),(12,'Dr. Balmis',148,'06720',1),(13,'Reforma Aeronática',3018,'09730',11),(14,'Calz. San Juan De Aragón',285,'07460',12),(15,'Prol 5 de mayo',3170,'01620',13),(16,'Bosque de Toronjos',27,'05100',14),(17,'Colima',378,'06700',15),(18,'Rio Lerma',232,'06500',15),(19,'Av. Thiers',287,'11590',16),(20,'Laguna de Terminos',204,'11320',16),(21,'Enrique Contel',38,'09208',17),(22,'Priv. Polvora',43,'01210',20),(23,'Av. Reforma',520,'12369',21);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id_doctor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellid_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id_doctor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Joaquin','Manzano','Peralta','5513547863'),(2,'Samuel','Cruz','Sanchez','5545678987'),(3,'Francisco','Pineda','Peralta','5568789564'),(4,'Karen','Cruz','Ramirez','5548796543'),(5,'Johan','Perez','Armin','5544786654');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_has_historial_clinico`
--

DROP TABLE IF EXISTS `doctor_has_historial_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_has_historial_clinico` (
  `id_doctor_fk` int NOT NULL,
  `id_historial_clinico_fk` int NOT NULL,
  PRIMARY KEY (`id_doctor_fk`,`id_historial_clinico_fk`),
  KEY `fk_doctor_has_historial_clinico_historial_clinico1_idx` (`id_historial_clinico_fk`),
  KEY `fk_doctor_has_historial_clinico_doctor1_idx` (`id_doctor_fk`),
  CONSTRAINT `fk_doctor_has_historial_clinico_doctor1` FOREIGN KEY (`id_doctor_fk`) REFERENCES `doctor` (`id_doctor`),
  CONSTRAINT `fk_doctor_has_historial_clinico_historial_clinico1` FOREIGN KEY (`id_historial_clinico_fk`) REFERENCES `historial_clinico` (`id_historial_clinico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_has_historial_clinico`
--

LOCK TABLES `doctor_has_historial_clinico` WRITE;
/*!40000 ALTER TABLE `doctor_has_historial_clinico` DISABLE KEYS */;
INSERT INTO `doctor_has_historial_clinico` VALUES (5,1),(3,2),(3,3),(4,4),(2,5);
/*!40000 ALTER TABLE `doctor_has_historial_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(100) NOT NULL,
  `apellido_paterno` varchar(100) NOT NULL,
  `apellido_materno` varchar(100) DEFAULT '',
  `email` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `sueldo` float NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `id_direccion_fk` int NOT NULL,
  `id_tipo_empleado_fk` int NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_empleado_direccion1_idx` (`id_direccion_fk`),
  KEY `fk_empleado_tipo_empleado1_idx` (`id_tipo_empleado_fk`),
  CONSTRAINT `fk_empleado_direccion1` FOREIGN KEY (`id_direccion_fk`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `fk_empleado_tipo_empleado1` FOREIGN KEY (`id_tipo_empleado_fk`) REFERENCES `tipo_empleado` (`id_tipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Karla','Hernandez','Perez','karlaH@metrobus.com','1985-02-01','5519361485',12000,'2018-06-22',4,9),(2,'Jose','Fuentes','Cruz','JoseC@metrobus.com','2000-06-29','5549321478',14000,'2020-03-13',6,1),(3,'Leon','Escobedo','Garcia','LeonG@metrobus.com','1973-05-12','5549872313',9500,'2016-02-15',7,10),(4,'Kojima','Hideo','','KojimaH@metrobus.com','1979-01-28','5549875312',20000,'2015-09-22',9,10),(5,'Markus','Persson','','MarkusP@metrobus.com','1997-05-08','5548795321',12000,'2009-05-17',3,1),(6,'Napoleon','Bonaparte','','NapoleonB@metrobus.com','1988-09-25','5549843214',12000,'2010-05-05',2,9),(7,'Sebastian','Del Monte','Cruz','Sebastian@metrobus.com','2001-05-14','5548973214',10000,'2012-03-02',8,10),(8,'Yazmin','Miranda','Cruz','YazmizC@metrobus.com','1993-07-21','5588798151',14000,'2012-06-20',5,1),(9,'Juan','de la Cruz','Lazaro','JuanL@metrobus.com','1988-09-24','5598762148',14000,'2016-08-30',10,1),(10,'Francisco','Martin','Moreno','FranciscoM@metrobus.com','1987-04-09','5587423479',14000,'2015-07-25',16,1),(15,'Santiago','Del','Monte','santiagoG@metrobus.com','1990-04-07','5563289756',11000,'2020-06-25',4,7),(16,'Adrian','Salmora','Jimenez','adrianJ@metrobus.com','1992-02-03','5513548798',12000,'2018-08-26',3,9),(18,'Dilan','Juarez','Ugalde','DilanU@metrobus.com','1988-11-25','5548798756',12000,'2016-08-21',18,9),(19,'Mauricio','Agilar','Martinez','MauricioM@metrobus.com','1995-12-16','5548786532',12000,'2019-09-25',19,9),(20,'Frida','Salazar','','FridaS@metrobus.com','1995-08-18','5548796845',12000,'2015-06-01',20,10),(21,'Adrian','Fernadez','','AdrianF@metrobus.com','1999-06-12','5513245789',12500,'2016-08-04',20,6),(23,'Diego','Salazar','Fuentes','DiegoSalaza@metrobus.com','2002-06-15','5589786583',12500,'2020-07-11',23,8),(24,'Fernanda','Ramirez','Lazaro','fake1234@gmial.com','1995-06-12','5589635894',15000,'2021-03-16',18,10);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `empleadoscompleto`
--

DROP TABLE IF EXISTS `empleadoscompleto`;
/*!50001 DROP VIEW IF EXISTS `empleadoscompleto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleadoscompleto` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre_completo`,
 1 AS `email`,
 1 AS `fecha_nacimiento`,
 1 AS `telefono`,
 1 AS `sueldo`,
 1 AS `fecha_contratacion`,
 1 AS `tipo_empleado`,
 1 AS `direccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion` (
  `id_estacion` int NOT NULL AUTO_INCREMENT,
  `nombre_estacion` varchar(100) NOT NULL,
  `tiempo_siguiente_estacion` time NOT NULL,
  `id_linea_fk` int NOT NULL,
  `id_empleado_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_estacion`),
  KEY `fk_estacion_linea1_idx` (`id_linea_fk`),
  KEY `id_empleado_fk_idx` (`id_empleado_fk`),
  CONSTRAINT `fk_estacion_linea1` FOREIGN KEY (`id_linea_fk`) REFERENCES `linea` (`id_linea`),
  CONSTRAINT `id_empleado_fk` FOREIGN KEY (`id_empleado_fk`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion`
--

LOCK TABLES `estacion` WRITE;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` VALUES (1,'Indios Verdes','00:05:00',1,7),(2,'Insurgentes','00:07:00',1,7),(3,'El Rosario','00:01:00',4,3),(4,'Dr. Gálvez','00:05:00',1,7),(5,'Buenavista','00:04:00',1,20),(6,'Villa de Aragón','00:08:00',4,4),(7,'Gran Canal','00:06:00',4,4),(8,'Deportivo 18 de Marzo','00:05:00',1,3),(9,'Euzkaro','00:03:00',1,20);
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacion_mantenimiento`
--

DROP TABLE IF EXISTS `estacion_mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion_mantenimiento` (
  `id_estacion_mantenimiento` int NOT NULL AUTO_INCREMENT,
  `nombre_estacion_mantenimiento` varchar(100) NOT NULL,
  `capacidad_autobuces` int NOT NULL,
  `id_metrobus_fk` int NOT NULL,
  `id_direccion_fk` int NOT NULL,
  PRIMARY KEY (`id_estacion_mantenimiento`),
  KEY `fk_estacion_mantenimiento_metrobus1_idx` (`id_metrobus_fk`),
  KEY `fk_estacion_mantenimiento_direccion1_idx` (`id_direccion_fk`),
  CONSTRAINT `fk_estacion_mantenimiento_direccion1` FOREIGN KEY (`id_direccion_fk`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `fk_estacion_mantenimiento_metrobus1` FOREIGN KEY (`id_metrobus_fk`) REFERENCES `metrobus` (`id_metrobus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion_mantenimiento`
--

LOCK TABLES `estacion_mantenimiento` WRITE;
/*!40000 ALTER TABLE `estacion_mantenimiento` DISABLE KEYS */;
INSERT INTO `estacion_mantenimiento` VALUES (1,'Almacen General RTP',50,1,21);
/*!40000 ALTER TABLE `estacion_mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_clinico`
--

DROP TABLE IF EXISTS `historial_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_clinico` (
  `id_historial_clinico` int NOT NULL AUTO_INCREMENT,
  `numero_afiliacion_medica` varchar(14) NOT NULL,
  `tipo_sangre` varchar(3) NOT NULL,
  `enfermedades_importantes` text NOT NULL,
  `discapacidades` varchar(500) NOT NULL,
  `nivel_vision_ojo_derecho` int NOT NULL,
  `nivel_vision_ojo_izquierdo` int NOT NULL,
  `id_contacto_emergencia_fk` int NOT NULL,
  `id_empleado_fk` int NOT NULL,
  `id_hospital_asignado_fk` int NOT NULL,
  PRIMARY KEY (`id_historial_clinico`),
  KEY `fk_historial_clinico_contacto_emergencia1_idx` (`id_contacto_emergencia_fk`),
  KEY `fk_historial_clinico_empleado1_idx` (`id_empleado_fk`),
  KEY `fk_historial_clinico_hospital_asignado1_idx` (`id_hospital_asignado_fk`),
  CONSTRAINT `fk_historial_clinico_contacto_emergencia1` FOREIGN KEY (`id_contacto_emergencia_fk`) REFERENCES `contacto_emergencia` (`id_contacto_emergencia`),
  CONSTRAINT `fk_historial_clinico_empleado1` FOREIGN KEY (`id_empleado_fk`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `fk_historial_clinico_hospital_asignado1` FOREIGN KEY (`id_hospital_asignado_fk`) REFERENCES `hospital_asignado` (`id_hospital_asignado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_clinico`
--

LOCK TABLES `historial_clinico` WRITE;
/*!40000 ALTER TABLE `historial_clinico` DISABLE KEYS */;
INSERT INTO `historial_clinico` VALUES (1,'12346576514351','O+','Ninguna','Ninguna',20,20,1,2,1),(2,'24687651457465','O+','Diabetes','Amputacion',20,20,2,5,1),(3,'15479845643214','B+','Diabetes','Ninguna',20,20,3,8,3),(4,'13548652132483','B+','Ninguna','Depresion',20,20,4,9,2),(5,'13548765131487','O+','Diabetes','Depresion',20,20,5,10,5),(8,'12345648798','B-','Diabetes','Ninguna',20,20,2,4,4);
/*!40000 ALTER TABLE `historial_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `historialclinicocompleto`
--

DROP TABLE IF EXISTS `historialclinicocompleto`;
/*!50001 DROP VIEW IF EXISTS `historialclinicocompleto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `historialclinicocompleto` AS SELECT 
 1 AS `id_historial_clinico`,
 1 AS `id_empleado`,
 1 AS `nombre`,
 1 AS `numero_afiliacion_medica`,
 1 AS `tipo_sangre`,
 1 AS `enfermedades_importantes`,
 1 AS `discapacidades`,
 1 AS `nivel_vision_ojo_derecho`,
 1 AS `nivel_vision_ojo_izquierdo`,
 1 AS `nombre_hospital`,
 1 AS `doctor`,
 1 AS `contactoEmergancia`,
 1 AS `telefono`,
 1 AS `direccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora_llegada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `usuarios_ingresados` int NOT NULL DEFAULT '0',
  `usuarios_egresados` int NOT NULL DEFAULT '0',
  `id_estacion_llegada_fk` int NOT NULL,
  `id_estacion_destino_fk` int NOT NULL,
  `id_autobus_fk` int NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `fk_id_autobus_idx` (`id_autobus_fk`),
  KEY `fk_id_estacion_llegada_idx` (`id_estacion_llegada_fk`),
  KEY `fk_estacion_destino_idx` (`id_estacion_destino_fk`),
  CONSTRAINT `fk_estacion_destino` FOREIGN KEY (`id_estacion_destino_fk`) REFERENCES `estacion` (`id_estacion`),
  CONSTRAINT `fk_id_autobus` FOREIGN KEY (`id_autobus_fk`) REFERENCES `autobus` (`id_autobus`),
  CONSTRAINT `fk_id_estacion_llegada` FOREIGN KEY (`id_estacion_llegada_fk`) REFERENCES `estacion` (`id_estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'2020-10-21','15:45:00','15:47:00',25,0,1,8,1),(2,'2020-10-21','15:52:00','15:55:00',10,5,8,9,1),(3,'2018-05-16','08:15:00','08:20:00',30,20,7,5,4),(4,'2015-12-25','12:30:00','12:40:00',15,5,2,3,5),(5,'2015-12-25','19:05:00','19:25:00',30,10,5,6,3),(6,'2020-10-24','14:25:00','14:27:00',5,10,5,6,3),(7,'2020-10-26','15:45:00','15:47:00',14,0,1,8,1),(11,'2020-11-23','03:38:00','03:42:00',20,35,1,3,1);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horariosautobus`
--

DROP TABLE IF EXISTS `horariosautobus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horariosautobus` (
  `id_autobus` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `estacion_llegada` varchar(100) DEFAULT NULL,
  `estacion_destino` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horariosautobus`
--

LOCK TABLES `horariosautobus` WRITE;
/*!40000 ALTER TABLE `horariosautobus` DISABLE KEYS */;
INSERT INTO `horariosautobus` VALUES (1,'2020-10-21','15:45:00','15:47:00','Indios Verdes','Deportivo 18 de Marzo'),(1,'2020-10-21','15:52:00','15:55:00','Deportivo 18 de Marzo','Euzkaro'),(1,'2020-10-21','15:52:00','15:55:00','Deportivo 18 de Marzo','Euzkaro');
/*!40000 ALTER TABLE `horariosautobus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `horarioscompletos`
--

DROP TABLE IF EXISTS `horarioscompletos`;
/*!50001 DROP VIEW IF EXISTS `horarioscompletos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `horarioscompletos` AS SELECT 
 1 AS `id_horario`,
 1 AS `fecha`,
 1 AS `hora_llegada`,
 1 AS `hora_salida`,
 1 AS `usuarios_ingresados`,
 1 AS `usuarios_egresados`,
 1 AS `estacion_llegada`,
 1 AS `estacion_destino`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `horariosdeldia`
--

DROP TABLE IF EXISTS `horariosdeldia`;
/*!50001 DROP VIEW IF EXISTS `horariosdeldia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `horariosdeldia` AS SELECT 
 1 AS `hora_llegada`,
 1 AS `hora_salida`,
 1 AS `usuarios_ingresados`,
 1 AS `usuarios_egresados`,
 1 AS `estacion_llegada`,
 1 AS `estacion_destino`,
 1 AS `ID_autobus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hospital_asignado`
--

DROP TABLE IF EXISTS `hospital_asignado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_asignado` (
  `id_hospital_asignado` int NOT NULL AUTO_INCREMENT,
  `nombre_hospital` varchar(100) NOT NULL,
  `id_direccion_fk` int NOT NULL,
  PRIMARY KEY (`id_hospital_asignado`),
  KEY `fk_hospital_asignado_direccion1_idx` (`id_direccion_fk`),
  CONSTRAINT `fk_hospital_asignado_direccion1` FOREIGN KEY (`id_direccion_fk`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_asignado`
--

LOCK TABLES `hospital_asignado` WRITE;
/*!40000 ALTER TABLE `hospital_asignado` DISABLE KEYS */;
INSERT INTO `hospital_asignado` VALUES (1,'ISSEMYM Hospital Regional de Toluca',11),(2,'Hospital General de México Dr. Eduardo Liceaga',12),(3,'Hospistal General Dr. Juan Ramón de la Fuente',13),(4,'Hospital General La Villa',14),(5,'Hospital General Dr. Enrique Cabrera',15);
/*!40000 ALTER TABLE `hospital_asignado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidente`
--

DROP TABLE IF EXISTS `incidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidente` (
  `id_incidente` int NOT NULL AUTO_INCREMENT,
  `descripcion_incidente` text NOT NULL,
  `hora_siniestro` time NOT NULL,
  `fecha_incidente` date NOT NULL,
  `nombre_conductor_responsable` varchar(100) DEFAULT '',
  `apellido_paterno` varchar(100) DEFAULT '',
  `apellido_materno` varchar(100) DEFAULT '',
  `telefono_chofer_responsable` varchar(45) DEFAULT '',
  `id_autobus_fk` int NOT NULL,
  `id_chofer_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_incidente`),
  KEY `fk_incidente_autobus1_idx` (`id_autobus_fk`),
  KEY `fk_id_empleado_idx` (`id_chofer_fk`),
  CONSTRAINT `fk_incidente_autobus1` FOREIGN KEY (`id_autobus_fk`) REFERENCES `autobus` (`id_autobus`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidente`
--

LOCK TABLES `incidente` WRITE;
/*!40000 ALTER TABLE `incidente` DISABLE KEYS */;
INSERT INTO `incidente` VALUES (1,'Choque de costado','08:16:00','2018-05-16','Daniel','Ramirez','Lazaro','5548765131',4,2),(2,'Goteras','19:27:00','2015-12-25','','','','',3,10),(3,'Choque frontal','17:25:00','2018-12-16','Diego','Smith','Cruz','5513248786',1,5),(4,'Llanta ponchada','09:15:00','2015-11-25','','','','',1,8),(5,'Choque trasero','15:21:00','2016-07-27','Hazel','Rodriguez','Lozano','5515348798',2,9),(6,'Choque trasero','15:30:00','2019-08-28','Emmanuel','Manzano','Rodriguez','5548798612',3,10);
/*!40000 ALTER TABLE `incidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidentebuscado`
--

DROP TABLE IF EXISTS `incidentebuscado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidentebuscado` (
  `id_incidente` int DEFAULT NULL,
  `id_autobus` int DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `hora_siniestro` time DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `conductor_responsable` varchar(100) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidentebuscado`
--

LOCK TABLES `incidentebuscado` WRITE;
/*!40000 ALTER TABLE `incidentebuscado` DISABLE KEYS */;
INSERT INTO `incidentebuscado` VALUES (5,2,'Choque trasero','15:21:00','2016-07-27','Hazel Rodriguez Lozano','5515348798'),(6,3,'Choque trasero','15:30:00','2019-08-28','Emmanuel Manzano Rodriguez','5548798612'),(6,3,'Choque trasero','15:30:00','2019-08-28','Emmanuel Manzano Rodriguez','5548798612');
/*!40000 ALTER TABLE `incidentebuscado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidenteschofer`
--

DROP TABLE IF EXISTS `incidenteschofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidenteschofer` (
  `id_chofer` int DEFAULT NULL,
  `nombre_chofer` varchar(100) DEFAULT NULL,
  `total_incidentes` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidenteschofer`
--

LOCK TABLES `incidenteschofer` WRITE;
/*!40000 ALTER TABLE `incidenteschofer` DISABLE KEYS */;
INSERT INTO `incidenteschofer` VALUES (2,'Jose Fuentes Cruz',1),(5,'Markus Persson ',1),(8,'Yazmin Miranda Cruz',1),(9,'Juan de la Cruz Lazaro',1),(10,'Francisco Martin Moreno',2),(10,'Francisco Martin Moreno',2);
/*!40000 ALTER TABLE `incidenteschofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `incidentescompletos`
--

DROP TABLE IF EXISTS `incidentescompletos`;
/*!50001 DROP VIEW IF EXISTS `incidentescompletos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `incidentescompletos` AS SELECT 
 1 AS `incidente`,
 1 AS `hora`,
 1 AS `fecha`,
 1 AS `conductor_responsable`,
 1 AS `telefono_conductor_responsable`,
 1 AS `autobus_afectado`,
 1 AS `nombre_chofer(autobus)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `licencia_manejo`
--

DROP TABLE IF EXISTS `licencia_manejo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licencia_manejo` (
  `id_licencia_manejo` int NOT NULL AUTO_INCREMENT,
  `tipo_licencia` char(1) NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `fecha_emision` date NOT NULL,
  `id_empleado_fk` int NOT NULL,
  PRIMARY KEY (`id_licencia_manejo`),
  KEY `fk_licencia_manejo_empleado1_idx` (`id_empleado_fk`),
  CONSTRAINT `fk_licencia_manejo_empleado1` FOREIGN KEY (`id_empleado_fk`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencia_manejo`
--

LOCK TABLES `licencia_manejo` WRITE;
/*!40000 ALTER TABLE `licencia_manejo` DISABLE KEYS */;
INSERT INTO `licencia_manejo` VALUES (1,'C','2021-06-15','2019-06-15',2),(2,'C','2022-09-17','2020-09-17',5),(3,'C','2023-10-02','2020-10-02',8),(4,'C','2020-10-30','2018-10-30',9),(5,'C','2025-10-22','2020-12-22',10);
/*!40000 ALTER TABLE `licencia_manejo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea`
--

DROP TABLE IF EXISTS `linea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linea` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `color_linea` varchar(50) NOT NULL,
  `numero_paradas` int NOT NULL,
  `tiempo_recorrido` time NOT NULL,
  `autobuces_linea` int NOT NULL,
  `encargado_linea_fk` int NOT NULL,
  `id_metrobus_fk` int NOT NULL,
  PRIMARY KEY (`id_linea`),
  KEY `fk_linea_metrobus1_idx` (`id_metrobus_fk`),
  KEY `fk_linea_metrobus2_idx` (`encargado_linea_fk`),
  CONSTRAINT `fk_linea_metrobus1` FOREIGN KEY (`id_metrobus_fk`) REFERENCES `metrobus` (`id_metrobus`),
  CONSTRAINT `fk_linea_metrobus2` FOREIGN KEY (`encargado_linea_fk`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea`
--

LOCK TABLES `linea` WRITE;
/*!40000 ALTER TABLE `linea` DISABLE KEYS */;
INSERT INTO `linea` VALUES (1,'Rojo',47,'02:00:00',60,1,1),(2,'Morada',37,'01:30:00',45,16,1),(3,'Verde',30,'01:20:00',40,18,1),(4,'Rosa',37,'01:30:00',45,21,1),(5,'Azul',33,'01:25:00',42,19,1);
/*!40000 ALTER TABLE `linea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mantenimentoscompletos`
--

DROP TABLE IF EXISTS `mantenimentoscompletos`;
/*!50001 DROP VIEW IF EXISTS `mantenimentoscompletos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mantenimentoscompletos` AS SELECT 
 1 AS `piezas_cambiadas`,
 1 AS `fecha_mantenimiento`,
 1 AS `costo_mantenimiento`,
 1 AS `descripcion_mantenimiento`,
 1 AS `estacion_mantenimiento`,
 1 AS `descripcion_incidente`,
 1 AS `autobus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int NOT NULL AUTO_INCREMENT,
  `piezas_cambiadas` text NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `costo_mantenimiento` float NOT NULL,
  `descripcion_mantenimiento` text NOT NULL,
  `id_estacion_mantenimiento_fk` int NOT NULL,
  `id_incidente_fk` int NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  KEY `fk_mantenimiento_estacion_mantenimiento1_idx` (`id_estacion_mantenimiento_fk`),
  KEY `fk_mantenimiento_incidente1_idx` (`id_incidente_fk`),
  CONSTRAINT `fk_mantenimiento_estacion_mantenimiento1` FOREIGN KEY (`id_estacion_mantenimiento_fk`) REFERENCES `estacion_mantenimiento` (`id_estacion_mantenimiento`),
  CONSTRAINT `fk_mantenimiento_incidente1` FOREIGN KEY (`id_incidente_fk`) REFERENCES `incidente` (`id_incidente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
INSERT INTO `mantenimiento` VALUES (1,'Puerta A1 y 1 llanta','2018-05-20',3000,'Se cambiaron las puertas dañadas al igual que se acomodaron los rines',1,1),(2,'Aislante del tencho','2015-01-25',2500,'Se reviso el techo de la unidad y se cambio el sello aislante',1,2),(3,'Chasis','2018-12-20',3200,'Cambio del chasis dañado junto revison del motor',1,3),(4,'Tubo de escape','2016-08-12',4000,'Reparacion en la parte trasera de la unidad como cambio de las piezas dañadas',1,5),(5,'1 llanta','2015-12-05',1200,'Cambio de una llanta ponchada por una nueva',1,4);
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento_has_empleado`
--

DROP TABLE IF EXISTS `mantenimiento_has_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento_has_empleado` (
  `id_mantenimiento_fk` int NOT NULL,
  `id_empleado_fk` int NOT NULL,
  PRIMARY KEY (`id_mantenimiento_fk`,`id_empleado_fk`),
  KEY `fk_mantenimiento_has_empleado_empleado1_idx` (`id_empleado_fk`),
  KEY `fk_mantenimiento_has_empleado_mantenimiento1_idx` (`id_mantenimiento_fk`),
  CONSTRAINT `fk_mantenimiento_has_empleado_empleado1` FOREIGN KEY (`id_empleado_fk`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `fk_mantenimiento_has_empleado_mantenimiento1` FOREIGN KEY (`id_mantenimiento_fk`) REFERENCES `mantenimiento` (`id_mantenimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento_has_empleado`
--

LOCK TABLES `mantenimiento_has_empleado` WRITE;
/*!40000 ALTER TABLE `mantenimiento_has_empleado` DISABLE KEYS */;
INSERT INTO `mantenimiento_has_empleado` VALUES (1,6),(2,6),(3,6),(4,6),(5,6),(2,7);
/*!40000 ALTER TABLE `mantenimiento_has_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrobus`
--

DROP TABLE IF EXISTS `metrobus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrobus` (
  `id_metrobus` int NOT NULL AUTO_INCREMENT,
  `nombre_metrobus` varchar(100) NOT NULL,
  `id_direccion_fk` int NOT NULL,
  PRIMARY KEY (`id_metrobus`),
  KEY `fk_metrobus_direccion1_idx` (`id_direccion_fk`),
  CONSTRAINT `fk_metrobus_direccion1` FOREIGN KEY (`id_direccion_fk`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrobus`
--

LOCK TABLES `metrobus` WRITE;
/*!40000 ALTER TABLE `metrobus` DISABLE KEYS */;
INSERT INTO `metrobus` VALUES (1,'Metrobus_CDMX',1);
/*!40000 ALTER TABLE `metrobus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promedio_estacion_ingresados`
--

DROP TABLE IF EXISTS `promedio_estacion_ingresados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promedio_estacion_ingresados` (
  `estacion` varchar(100) DEFAULT NULL,
  `promedio_ingresados` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promedio_estacion_ingresados`
--

LOCK TABLES `promedio_estacion_ingresados` WRITE;
/*!40000 ALTER TABLE `promedio_estacion_ingresados` DISABLE KEYS */;
INSERT INTO `promedio_estacion_ingresados` VALUES ('Indios Verdes',25),('Insurgentes',15),('El Rosario',NULL),('Dr. Gálvez',NULL),('Buenavista',17.5),('Villa de Aragón',NULL),('Gran Canal',30),('Deportivo 18 de Marzo',10),('Euzkaro',NULL),('Euzkaro',NULL);
/*!40000 ALTER TABLE `promedio_estacion_ingresados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_autobus`
--

DROP TABLE IF EXISTS `tipo_autobus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_autobus` (
  `id_tipo_autobus` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(100) NOT NULL,
  `largo` int NOT NULL,
  `capacidad_pasajeros` int NOT NULL,
  `tipo_combustible` varchar(100) NOT NULL,
  `kilometros_litro` float NOT NULL,
  PRIMARY KEY (`id_tipo_autobus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_autobus`
--

LOCK TABLES `tipo_autobus` WRITE;
/*!40000 ALTER TABLE `tipo_autobus` DISABLE KEYS */;
INSERT INTO `tipo_autobus` VALUES (1,'Articulado',18,160,'Diesel',4.8),(2,'Bi-articulado',24,240,'Diesel',4),(3,'12 metros',12,100,'hibrido',5),(4,'Doble piso',12,130,'Diesel',8.9);
/*!40000 ALTER TABLE `tipo_autobus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_empleado` (
  `id_tipo_empleado` int NOT NULL AUTO_INCREMENT,
  `tipo_empleado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleado`
--

LOCK TABLES `tipo_empleado` WRITE;
/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` VALUES (1,'Chofer'),(2,'Administrativo'),(3,'Intendencia'),(4,'Contador'),(5,'Secretario'),(6,'Ingeniero Mecanico'),(7,'Ingeniero Electrico'),(8,'Cajero'),(9,'Encargado linea'),(10,'Encargado estación');
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `totalcirugias`
--

DROP TABLE IF EXISTS `totalcirugias`;
/*!50001 DROP VIEW IF EXISTS `totalcirugias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalcirugias` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre`,
 1 AS `cirugias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `totalmantenimientos`
--

DROP TABLE IF EXISTS `totalmantenimientos`;
/*!50001 DROP VIEW IF EXISTS `totalmantenimientos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalmantenimientos` AS SELECT 
 1 AS `id_autobus`,
 1 AS `Total_mantenimientos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','$2a$04$D/ZOOO2xDkHCJgI3AEB36uwFYxyls5PX4fq8M.nl/bveUHzGrgkHS'),(2,'fake1234','$2a$04$D/ZOOO2xDkHCJgI3AEB36uwFYxyls5PX4fq8M.nl/bveUHzGrgkHS'),(3,'admin','$2a$04$D/ZOOO2xDkHCJgI3AEB36uwFYxyls5PX4fq8M.nl/bveUHzGrgkHS');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'metrobus'
--

--
-- Dumping routines for database 'metrobus'
--
/*!50003 DROP FUNCTION IF EXISTS `cirugiaEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cirugiaEmpleado`(empleadoBuscado integer) RETURNS int
    COMMENT 'Procedimiento que muestra a cuantas cirugias a sido sometido un empleado'
begin 
	declare totalCir integer;
		select count(t1.id_historial_clinico_fk) from cirugia as t1
		inner join historial_clinico as t2 on t1.id_historial_clinico_fk = t2.id_historial_clinico
		where t2.id_empleado_fk = empleadoBuscado into totalCir;
	return totalCir;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `promedioPersonasIngresadas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `promedioPersonasIngresadas`(estacionBuscada integer) RETURNS float
begin 
		declare promedio float;
			select avg(t1.usuarios_ingresados) from horario as t1 
            inner join estacion as t2 on t1.id_estacion_llegada_fk = t2.id_estacion
            where t1.id_estacion_llegada_fk = estacionBuscada into promedio;
		return promedio;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `totalMantenimientos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `totalMantenimientos`(autobusBuscado integer) RETURNS int
begin 
		declare totalM integer;
			select count(t1.id_autobus_fk) from incidente as t1 
			where t1.id_autobus_fk = autobusBuscado into totalM;
        return totalM;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarEmpleadoDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarEmpleadoDireccion`(idEmpleadoActualizado integer, nombreAct varchar(100), apePaAct varchar(100), apeMaAct varchar(100), emailAct varchar(100), fechaNamAct Date, telefonoAct VARCHAR(10),
        sueldoAct float, fechaConAct date, tipoEmpleadoAct integer, calleAct varchar(100), numExtAct integer, cpAct varchar(5), coloniaAct varchar(100), ciudadAct integer)
begin
        declare idDi, idCo, idCiu, coloniaAux integer;
        declare cur1 cursor for select distinctrow t1.id_direccion, t2.id_colonia, t3.id_ciudad from direccion as t1
            inner join colonia t2 on t1.id_colonia_fk = t2.id_colonia
            inner join ciudad t3 on t2.id_ciudad_fk = t3.id_ciudad where id_direccion in (select id_direccion_fk from empleado where id_empleado = idEmpleadoActualizado);
        OPEN cur1;
        fetch cur1 into idDi, idCo, idCiu;
        /*Actualizacion de dirección*/

            /*Actualizar ciudad*/
        if (select count(id_ciudad) from ciudad where id_ciudad = ciudadAct) >= 1 then
            update colonia set id_ciudad_fk = ciudadAct where id_colonia = idCo;
        end if;

            /*Actualizar Colonia*/
        if (select count(id_colonia) from colonia where nombre_colonia = coloniaAct) >= 1 then
            select distinct id_colonia into coloniaAux from colonia where nombre_colonia = coloniaAct;
            update direccion set id_colonia_fk = coloniaAux where id_direccion in (select distinctrow id_direccion_fk from empleado where id_empleado = idEmpleadoActualizado);
        else
            insert into colonia (id_colonia, nombre_colonia, id_ciudad_fk) value (default, coloniaAct, ciudadAct);
            select id_colonia into coloniaAux from colonia order by id_colonia desc limit 1;
            update direccion set id_colonia_fk = coloniaAux where id_direccion in (select distinctrow id_direccion_fk from empleado where id_empleado = idEmpleadoActualizado);
        end if;

            /*Actualizar calle, codigo postal y numeroExterior*/
        IF ((select count(calle) from direccion as t1 where id_direccion = idDi) + (select count(codigo_postal) from direccion as t1 where id_direccion = idDi) + (select count(numero_exterior) from direccion where id_direccion = idDi)) >= 1 then
            update direccion set calle = calleAct, codigo_postal = cpAct, numero_exterior = numExtAct where id_direccion = idDi;
        end if;

        CLOSE cur1;

        /*Actualizacion tipo empleado (Cargo)*/
        if (select count(id_tipo_empleado) from tipo_empleado where id_tipo_empleado = tipoEmpleadoAct) >= 1 then
            update empleado set id_tipo_empleado_fk = tipoEmpleadoAct where id_tipo_empleado_fk = id_empleado = idEmpleadoActualizado;
        end if;

        /*Actualizacion de empleado*/
        update empleado set nombre_empleado = nombreAct, apellido_paterno = apePaAct, apellido_materno = apeMaAct,
                            email = emailAct, fecha_nacimiento = fechaNamAct, telefono = telefonoAct, sueldo = sueldoAct,
                            fecha_contratacion = fechaConAct where id_empleado = idEmpleadoActualizado;

    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarHorario`(idHorarioAct integer, fechaAct date, horaLLegAct varchar(8), horaSalAct varchar(8), usuIngAtc integer, usuEgrAct integer, estLLegAct integer, estDesAct integer)
update horario set fecha = fechaAct, hora_llegada = horaLLegAct, hora_salida = horaSalAct, usuarios_ingresados = usuIngAtc, usuarios_egresados = usuEgrAct, id_estacion_llegada_fk = estLLegAct, id_estacion_destino_fk = estDesAct where id_horario = idHorarioAct ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualziarHistorialClinico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualziarHistorialClinico`(idHistorialClinicoAct integer, numAfiliacionMecAct varchar(14), tipoSangreAct varchar(3), enfermedadesAct varchar(100), discapacidadesAct varchar(100), visionOjoDerAct integer, visionOjoIzqAct integer, hospitalAct integer, doctorAct integer)
begin
    declare contadorAux integer;
    set contadorAux = (select count(id_historial_clinico_fk) from doctor_has_historial_clinico where id_historial_clinico_fk = idHistorialClinicoAct and id_doctor_fk = doctorAct) + (select count(id_doctor_fk) from doctor_has_historial_clinico where id_historial_clinico_fk = idHistorialClinicoAct and id_doctor_fk = doctorAct);
    if contadorAux >= 1 then
        update doctor_has_historial_clinico set id_doctor_fk = doctorAct, id_historial_clinico_fk = idHistorialClinicoAct where id_doctor_fk = doctorAct and id_historial_clinico_fk = idHistorialClinicoAct;
    else
        delete from doctor_has_historial_clinico where id_historial_clinico_fk = idHistorialClinicoAct;
        insert into doctor_has_historial_clinico(id_doctor_fk, id_historial_clinico_fk) VALUES (doctorAct, idHistorialClinicoAct);
    end if;

    update historial_clinico set numero_afiliacion_medica = numAfiliacionMecAct, tipo_sangre = tipoSangreAct, enfermedades_importantes = enfermedadesAct, discapacidades = discapacidadesAct, nivel_vision_ojo_derecho = visionOjoDerAct, nivel_vision_ojo_izquierdo = visionOjoIzqAct, id_hospital_asignado_fk = hospitalAct where id_historial_clinico = idHistorialClinicoAct;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConteoIncidentes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConteoIncidentes`()
begin
	declare done int default false;
    declare totalInc integer;
    declare descrip varchar(100);

	declare cur1 cursor for select distinctrow t1.descripcion_incidente, (select count(t2.id_incidente) from incidente as t2 where t1.descripcion_incidente = t2.descripcion_incidente) total_Incidentes from incidente as t1;
	declare continue handler for not found set done = true;
	drop table if exists ConteoIncidentes;
	create table ConteoIncidentes (incidente varchar(100), total integer);
	open cur1;
	read_loop: loop
		fetch cur1 into descrip, totalInc;
		insert into ConteoIncidentes () values (descrip, totalInc);
	if done then leave read_loop;
	end if;
    end loop;
    close cur1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarEmpleado`(IN empleadoBuscado int)
    COMMENT 'Procedimiento que elimina a un empleado'
begin
    if (select count(t1.id_tipo_empleado_fk) from empleado as t1 where t1.id_empleado = empleadoBuscado and t1.id_tipo_empleado_fk = 1) > 0 then
        delete from autobus where id_empleado_fk = empleadoBuscado;
        delete from licencia_manejo where id_empleado_fk = empleadoBuscado;
        delete from alergia where id_historial_clinico_fk in (select id_historial_clinico from historial_clinico where id_empleado_fk = empleadoBuscado);
        delete from doctor_has_historial_clinico where id_historial_clinico_fk in (select id_historial_clinico from historial_clinico where id_empleado_fk = empleadoBuscado);
        delete from historial_clinico where id_empleado_fk = empleadoBuscado;
        delete from certificado where id_empleado_fk = empleadoBuscado;
        delete from empleado where id_empleado = empleadoBuscado;

    elseif (select count(t1.id_tipo_empleado_fk) from empleado as t1 where t1.id_empleado = empleadoBuscado and t1.id_tipo_empleado_fk = 10) > 0 then
        delete from estacion where id_empleado_fk = empleadoBuscado;
        delete from empleado where id_empleado = empleadoBuscado;

    elseif (select count(t1.id_tipo_empleado_fk) from empleado as t1 where t1.id_empleado = empleadoBuscado and t1.id_tipo_empleado_fk = 9) > 0 then
        delete from linea where encargado_linea = empleadoBuscado;
        delete from empleado where id_empleado = empleadoBuscado;

    elseif (select count(t1.id_tipo_empleado_fk) from empleado as t1 where t1.id_empleado = empleadoBuscado and t1.id_tipo_empleado_fk = 6) > 0 then
        delete from mantenimiento_has_empleado where id_empleado_fk = empleadoBuscado;
        delete from empleado where id_empleado = empleadoBuscado;

    elseif (select count(t1.id_tipo_empleado_fk) from empleado as t1 where t1.id_empleado = empleadoBuscado and t1.id_tipo_empleado_fk = 7) > 0 then
        delete from mantenimiento_has_empleado where id_empleado_fk = empleadoBuscado;
        delete from empleado where id_empleado = empleadoBuscado;
    else
        delete from empleado where id_empleado = empleadoBuscado;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarHistorialClinico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarHistorialClinico`(doctorAct integer, historialAct integer)
begin
    delete from doctor_has_historial_clinico where id_doctor_fk = doctorAct and id_historial_clinico_fk = historialAct;
    delete from historial_clinico where id_historial_clinico = historialAct;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarHorario`(idHorarioAct integer)
begin
    delete from horario where id_horario = idHorarioAct;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HorarioAutobus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HorarioAutobus`(diaBuscado date, autobusBuscado integer)
begin
	declare done int default false;
    declare estlleg, estDes varchar(100);
	declare auto integer;
	declare fech date;
    declare horlleg, horSal time;
	declare cur1 cursor for select t1.id_autobus_fk, t1.fecha, t1.hora_llegada, t1.hora_salida, t2.nombre_estacion as estacion_llegada, t3.nombre_estacion as estacion_destino from horario as t1
    inner join estacion as t2 on t1.id_estacion_llegada_fk = t2.id_estacion
    inner join estacion as t3 on t1.id_estacion_destino_fk = t3.id_estacion 
    where t1.id_autobus_fk = autobusBuscado and t1.fecha = diaBuscado limit 10;
	declare continue handler for not found set done = true;
	drop table if exists HorariosAutobus;
	create table HorariosAutobus (id_autobus integer, fecha date, hora_llegada time, hora_salida time, estacion_llegada varchar(100), estacion_destino varchar(100));
	open cur1;
	read_loop: loop
		fetch cur1 into auto, fech, horlleg, horSal, estlleg, estDes;
		insert into HorariosAutobus (id_autobus, fecha, hora_llegada, hora_salida, estacion_llegada, estacion_destino) value (auto, fech, horlleg, horSal, estlleg, estDes);
	if done then leave read_loop;
	end if;
    end loop;
    close cur1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IncidenteBuscado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IncidenteBuscado`(incidenteBuscado varchar(100))
begin
	declare done int default false;
    declare idinc, idauto integer;
    declare descrip, nom, tel varchar(100);
    declare horsi time;
    declare fech date;
	declare cur1 cursor for select distinctrow t1.id_incidente, t1.id_autobus_fk, t1.descripcion_incidente, t1.hora_siniestro, t1.fecha_incidente, 
    concat(t1.nombre_conductor_responsable, ' ', t1.apellido_paterno,  ' ', t1.apellido_materno), t1.telefono_chofer_responsable 
    from incidente as t1 where t1.descripcion_incidente = incidenteBuscado limit 10;
	declare continue handler for not found set done = true;
	drop table if exists IncidenteBuscado;
	create table IncidenteBuscado (id_incidente integer, id_autobus integer ,descripcion varchar(100), hora_siniestro time, fecha date, conductor_responsable varchar(100), telefono varchar(10));
	open cur1;
	read_loop: loop
		fetch cur1 into idinc, idauto, descrip, horsi, fech, nom, tel;
		insert into IncidenteBuscado (id_incidente, id_autobus, descripcion, hora_siniestro, fecha, conductor_responsable, telefono) values (idinc, idauto, descrip, horsi, fech, nom, tel);
	if done then leave read_loop;
	end if;
    end loop;
    close cur1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IncidentesChofer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IncidentesChofer`()
begin
	declare done int default false;
    declare idemp, incto integer;
    declare nom varchar(100);
	declare cur1 cursor for select distinctrow t1.id_empleado, concat(t1.nombre_empleado, ' ', t1.apellido_paterno, ' ', ifnull(t1.apellido_materno, '')) nombre_Completo, 
    (select count(t2.id_incidente) from incidente as t2 where t1.id_empleado = t2.id_chofer_fk) total_Incidentes  from empleado as t1 
    inner join incidente as t2 on t1.id_empleado = t2.id_chofer_fk limit 10;
	declare continue handler for not found set done = true;
	drop table if exists IncidentesChofer;
	create table IncidentesChofer (id_chofer integer, nombre_chofer varchar(100), total_incidentes integer);
	open cur1;
	read_loop: loop
		fetch cur1 into idemp, nom, incto;
		insert into IncidentesChofer (id_chofer, nombre_chofer, total_incidentes) value (idemp, nom, incto);
	if done then leave read_loop;
	end if;
    end loop;
    close cur1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevoChoferAutobus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoChoferAutobus`(nuevoChofer integer, choferActual integer)
    COMMENT 'Procedimiento que modifica el chofer asignado a un autobus'
begin
	update autobus set id_empleado_fk = nuevoChofer where id_empleado_fk = choferActual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevoEmpleadoCompleto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoEmpleadoCompleto`(nombreAct varchar(100), apePaAct varchar(100), apeMaAct varchar(100), emailAct varchar(100), fechaNamAct Date, telefonoAct VARCHAR(10),
    sueldoAct float, fechaConAct date, tipoEmpleadoAct integer, calleAct varchar(100), numExtAct integer, cpAct varchar(5), coloniaAct varchar(100), ciudadAct integer)
begin
        declare coloniaAux, direccionAux integer;

        if (select count(id_colonia) from colonia where nombre_colonia = coloniaAct) >= 1 then
            select distinct id_colonia into coloniaAux from colonia where nombre_colonia = coloniaAct;
        else
            insert into colonia (id_colonia, nombre_colonia, id_ciudad_fk) value (default, coloniaAct, ciudadAct);
            select id_colonia into coloniaAux from colonia order by id_colonia desc limit 1;
        end if;

        insert into direccion (id_direccion, calle, numero_exterior, codigo_postal, id_colonia_fk)
        values (default, calleAct, numExtAct, cpAct, coloniaAux);

        select distinct id_direccion into direccionAux from direccion as t1 where t1.calle = calleAct and t1.codigo_postal = cpAct and t1.numero_exterior = numExtAct and t1.id_colonia_fk = coloniaAux;

        insert into empleado (id_empleado, nombre_empleado, apellido_paterno, apellido_materno, email, fecha_nacimiento, telefono, sueldo, fecha_contratacion, id_direccion_fk, id_tipo_empleado_fk)
        values (DEFAULT, nombreAct, apePaAct, apeMaAct, emailAct, fechaNamAct, telefonoAct, sueldoAct, fechaConAct, direccionAux, tipoEmpleadoAct);

    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevoEncargadoEstacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoEncargadoEstacion`(nuevoEncargado integer, encargadoActual integer)
    COMMENT 'Procedimiento que modifica el empleado encargado de una estacion'
begin
	update estacion set id_empleado_fk = nuevoEncargado where id_empleado_fk = encargadoActual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevoEncargadoLinea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoEncargadoLinea`(nuevoEncargado integer, encargadoActual integer)
    COMMENT 'Procedimiento que modifica el empleado encargado de una linea'
begin
	update linea set encargado_linea = nuevoEncargado where encargado_linea = encargadoActual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevoHistorialClinico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoHistorialClinico`(numAfiliacionMecAct varchar(14), tipoSangreAct varchar(3), enfermedadesAct varchar(100), discapacidadesAct varchar(100), visionOjoDerAct integer, visionOjoIzqAct integer, hospitalAct integer, doctorAct integer)
begin
        declare historialAux integer;
        insert into historial_clinico (id_historial_clinico, numero_afiliacion_medica, tipo_sangre, enfermedades_importantes, discapacidades, nivel_vision_ojo_derecho, nivel_vision_ojo_izquierdo, id_contacto_emergencia_fk, id_empleado_fk, id_hospital_asignado_fk)
        values (default, numAfiliacionMecAct, tipoSangreAct, enfermedadesAct, discapacidadesAct, visionOjoDerAct, visionOjoIzqAct, 2, 4, hospitalAct);

        select distinct id_historial_clinico into historialAux from historial_clinico order by id_historial_clinico desc limit 1;

        insert into doctor_has_historial_clinico (id_doctor_fk, id_historial_clinico_fk) VALUES (doctorAct, historialAux);
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuevoHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoHorario`(fechaAct date, horaLLegAct varchar(8), horaSalAct varchar(8), usuIngAtc integer, usuEgrAct integer, estLLegAct integer, estDesAct integer)
begin
    insert into horario (id_horario, fecha, hora_llegada, hora_salida, usuarios_ingresados, usuarios_egresados, id_estacion_llegada_fk, id_estacion_destino_fk, id_autobus_fk)
    VALUES (default, fechaAct, horaLLegAct, horaSalAct, usuIngAtc, usuEgrAct, estLLegAct, estDesAct, 1);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `promedioPersonasIngesadasXEstacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `promedioPersonasIngesadasXEstacion`()
    COMMENT 'Es un procedimiento para crear una tabla que te muestra el promedio de personas que ingresan a una estacion'
begin 
		declare done int default false;
        declare nom varchar(100);
        declare prom float;
        declare cur1 cursor for select t1.nombre_estacion, promedioPersonasIngresadas(t1.id_estacion) from estacion as t1;
        declare continue handler for not found set done = true;
        drop table if exists promedio_estacion_ingresados;
        create table promedio_estacion_ingresados (estacion varchar(100), promedio_ingresados float);
        open cur1;
        read_loop: loop
			fetch cur1 into nom, prom;
			insert into promedio_estacion_ingresados value (nom, prom);
		if done then leave read_loop;
		end if;
    end loop;
    close cur1;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `empleadoscompleto`
--

/*!50001 DROP VIEW IF EXISTS `empleadoscompleto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleadoscompleto` AS select `t1`.`id_empleado` AS `id_empleado`,concat(`t1`.`nombre_empleado`,' ',ifnull(`t1`.`apellido_paterno`,''),' ',`t1`.`apellido_materno`) AS `nombre_completo`,`t1`.`email` AS `email`,`t1`.`fecha_nacimiento` AS `fecha_nacimiento`,`t1`.`telefono` AS `telefono`,`t1`.`sueldo` AS `sueldo`,`t1`.`fecha_contratacion` AS `fecha_contratacion`,`t5`.`tipo_empleado` AS `tipo_empleado`,concat(`t2`.`calle`,', ',`t2`.`numero_exterior`,', ',`t2`.`codigo_postal`,', ',`t3`.`nombre_colonia`,', ',`t4`.`nombre_ciudad`) AS `direccion` from ((((`empleado` `t1` join `direccion` `t2` on((`t1`.`id_direccion_fk` = `t2`.`id_direccion`))) join `colonia` `t3` on((`t2`.`id_colonia_fk` = `t3`.`id_colonia`))) join `ciudad` `t4` on((`t3`.`id_ciudad_fk` = `t4`.`id_ciudad`))) join `tipo_empleado` `t5` on((`t1`.`id_tipo_empleado_fk` = `t5`.`id_tipo_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `historialclinicocompleto`
--

/*!50001 DROP VIEW IF EXISTS `historialclinicocompleto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `historialclinicocompleto` AS select `t1`.`id_historial_clinico` AS `id_historial_clinico`,`t1`.`id_empleado_fk` AS `id_empleado`,concat(`t2`.`nombre_empleado`,' ',`t2`.`apellido_paterno`,' ',ifnull(`t2`.`apellido_materno`,'')) AS `nombre`,`t1`.`numero_afiliacion_medica` AS `numero_afiliacion_medica`,`t1`.`tipo_sangre` AS `tipo_sangre`,`t1`.`enfermedades_importantes` AS `enfermedades_importantes`,`t1`.`discapacidades` AS `discapacidades`,`t1`.`nivel_vision_ojo_derecho` AS `nivel_vision_ojo_derecho`,`t1`.`nivel_vision_ojo_izquierdo` AS `nivel_vision_ojo_izquierdo`,`t4`.`nombre_hospital` AS `nombre_hospital`,concat(`t6`.`nombre`,' ',`t6`.`apellid_paterno`,' ',ifnull(`t6`.`apellido_materno`,'')) AS `doctor`,concat(`t7`.`nombre`,' ',`t7`.`apellido_paterno`,' ',ifnull(`t7`.`apellido_materno`,'')) AS `contactoEmergancia`,`t7`.`telefono` AS `telefono`,concat(`t8`.`calle`,', ',`t8`.`numero_exterior`,', ',`t8`.`codigo_postal`,', ',`t9`.`nombre_colonia`,', ',`t10`.`nombre_ciudad`) AS `direccion` from ((((((((`historial_clinico` `t1` join `empleado` `t2` on((`t1`.`id_empleado_fk` = `t2`.`id_empleado`))) join `hospital_asignado` `t4` on((`t1`.`id_hospital_asignado_fk` = `t4`.`id_hospital_asignado`))) join `doctor_has_historial_clinico` `t5` on((`t1`.`id_historial_clinico` = `t5`.`id_historial_clinico_fk`))) join `doctor` `t6` on((`t5`.`id_doctor_fk` = `t6`.`id_doctor`))) join `contacto_emergencia` `t7` on((`t1`.`id_contacto_emergencia_fk` = `t7`.`id_contacto_emergencia`))) join `direccion` `t8` on((`t7`.`id_direccion_fk` = `t8`.`id_direccion`))) join `colonia` `t9` on((`t8`.`id_colonia_fk` = `t9`.`id_colonia`))) join `ciudad` `t10` on((`t9`.`id_ciudad_fk` = `t10`.`id_ciudad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `horarioscompletos`
--

/*!50001 DROP VIEW IF EXISTS `horarioscompletos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `horarioscompletos` AS select `t1`.`id_horario` AS `id_horario`,`t1`.`fecha` AS `fecha`,`t1`.`hora_llegada` AS `hora_llegada`,`t1`.`hora_salida` AS `hora_salida`,`t1`.`usuarios_ingresados` AS `usuarios_ingresados`,`t1`.`usuarios_egresados` AS `usuarios_egresados`,`t2`.`nombre_estacion` AS `estacion_llegada`,`t3`.`nombre_estacion` AS `estacion_destino` from ((`horario` `t1` join `estacion` `t2` on((`t1`.`id_estacion_llegada_fk` = `t2`.`id_estacion`))) join `estacion` `t3` on((`t3`.`id_estacion` = `t1`.`id_estacion_destino_fk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `horariosdeldia`
--

/*!50001 DROP VIEW IF EXISTS `horariosdeldia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `horariosdeldia` AS select `t1`.`hora_llegada` AS `hora_llegada`,`t1`.`hora_salida` AS `hora_salida`,`t1`.`usuarios_ingresados` AS `usuarios_ingresados`,`t1`.`usuarios_egresados` AS `usuarios_egresados`,`t2`.`nombre_estacion` AS `estacion_llegada`,`t3`.`nombre_estacion` AS `estacion_destino`,`t1`.`id_autobus_fk` AS `ID_autobus` from ((`horario` `t1` join `estacion` `t2` on((`t1`.`id_estacion_llegada_fk` = `t2`.`id_estacion`))) join `estacion` `t3` on((`t1`.`id_estacion_destino_fk` = `t3`.`id_estacion`))) where (`t1`.`fecha` = curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidentescompletos`
--

/*!50001 DROP VIEW IF EXISTS `incidentescompletos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidentescompletos` AS select `t1`.`descripcion_incidente` AS `incidente`,`t1`.`hora_siniestro` AS `hora`,`t1`.`fecha_incidente` AS `fecha`,concat(ifnull(`t1`.`nombre_conductor_responsable`,''),' ',ifnull(`t1`.`apellido_paterno`,''),' ',ifnull(`t1`.`apellido_materno`,'')) AS `conductor_responsable`,`t1`.`telefono_chofer_responsable` AS `telefono_conductor_responsable`,`t2`.`id_autobus` AS `autobus_afectado`,concat(`t3`.`nombre_empleado`,' ',ifnull(`t3`.`apellido_paterno`,''),' ',`t3`.`apellido_materno`) AS `nombre_chofer(autobus)` from ((`incidente` `t1` join `autobus` `t2` on((`t1`.`id_autobus_fk` = `t2`.`id_autobus`))) join `empleado` `t3` on((`t1`.`id_chofer_fk` = `t3`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mantenimentoscompletos`
--

/*!50001 DROP VIEW IF EXISTS `mantenimentoscompletos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mantenimentoscompletos` AS select `t1`.`piezas_cambiadas` AS `piezas_cambiadas`,`t1`.`fecha_mantenimiento` AS `fecha_mantenimiento`,`t1`.`costo_mantenimiento` AS `costo_mantenimiento`,`t1`.`descripcion_mantenimiento` AS `descripcion_mantenimiento`,`t2`.`nombre_estacion_mantenimiento` AS `estacion_mantenimiento`,`t3`.`descripcion_incidente` AS `descripcion_incidente`,`t3`.`id_autobus_fk` AS `autobus` from ((`mantenimiento` `t1` join `estacion_mantenimiento` `t2` on((`t1`.`id_estacion_mantenimiento_fk` = `t2`.`id_estacion_mantenimiento`))) join `incidente` `t3` on((`t1`.`id_incidente_fk` = `t3`.`id_incidente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalcirugias`
--

/*!50001 DROP VIEW IF EXISTS `totalcirugias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalcirugias` AS select `t1`.`id_empleado` AS `id_empleado`,concat(`t1`.`nombre_empleado`,' ',ifnull(`t1`.`apellido_paterno`,''),' ',`t1`.`apellido_materno`) AS `nombre`,`cirugiaEmpleado`(`t1`.`id_empleado`) AS `cirugias` from (`empleado` `t1` join `historial_clinico` `t2` on((`t1`.`id_empleado` = `t2`.`id_empleado_fk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalmantenimientos`
--

/*!50001 DROP VIEW IF EXISTS `totalmantenimientos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalmantenimientos` AS select `t1`.`id_autobus` AS `id_autobus`,`totalMantenimientos`(`t1`.`id_autobus`) AS `Total_mantenimientos` from `autobus` `t1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-21 18:47:08
