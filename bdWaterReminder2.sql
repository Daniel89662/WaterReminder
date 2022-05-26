-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: waterreminder
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `alarmas`
--

DROP TABLE IF EXISTS `alarmas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarmas` (
  `idAlarmas` int NOT NULL AUTO_INCREMENT,
  `Alarma` varchar(45) DEFAULT NULL,
  `Persona_idPersona` int NOT NULL,
  PRIMARY KEY (`idAlarmas`,`Persona_idPersona`),
  KEY `fk_Alarmas_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Alarmas_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmas`
--

LOCK TABLES `alarmas` WRITE;
/*!40000 ALTER TABLE `alarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `alarmas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo_agua`
--

DROP TABLE IF EXISTS `consumo_agua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo_agua` (
  `idConsumo_Agua` int NOT NULL AUTO_INCREMENT,
  `Consumo_Total` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Persona_idPersona` int NOT NULL,
  PRIMARY KEY (`idConsumo_Agua`,`Persona_idPersona`),
  KEY `fk_Consumo_Agua_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Consumo_Agua_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo_agua`
--

LOCK TABLES `consumo_agua` WRITE;
/*!40000 ALTER TABLE `consumo_agua` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo_agua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctipo_bebida`
--

DROP TABLE IF EXISTS `ctipo_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctipo_bebida` (
  `idCTipo_bebida` int NOT NULL,
  `tipo_bebida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCTipo_bebida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctipo_bebida`
--

LOCK TABLES `ctipo_bebida` WRITE;
/*!40000 ALTER TABLE `ctipo_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctipo_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_bebida`
--

DROP TABLE IF EXISTS `datos_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_bebida` (
  `idRegistro_bebida` int NOT NULL,
  `agua_bebida` int DEFAULT NULL,
  `cal_bebida` int DEFAULT NULL,
  `azucar_bebida` int DEFAULT NULL,
  `ml` int DEFAULT NULL,
  `CTipo_bebida_idCTipo_bebida` int NOT NULL,
  PRIMARY KEY (`idRegistro_bebida`,`CTipo_bebida_idCTipo_bebida`),
  KEY `fk_Registro_bebida_CTipo_bebida1_idx` (`CTipo_bebida_idCTipo_bebida`),
  CONSTRAINT `fk_Registro_bebida_CTipo_bebida1` FOREIGN KEY (`CTipo_bebida_idCTipo_bebida`) REFERENCES `ctipo_bebida` (`idCTipo_bebida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_bebida`
--

LOCK TABLES `datos_bebida` WRITE;
/*!40000 ALTER TABLE `datos_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `peso` int DEFAULT NULL,
  `altura` varchar(10) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `meta_agua` varchar(45) DEFAULT NULL,
  `hora_desp` varchar(45) DEFAULT NULL,
  `hora_dormir` varchar(45) DEFAULT NULL,
  `Sexo_idsexo` int NOT NULL,
  `Privilegio_idPrivilegio` int NOT NULL,
  `Rol_idRol` int NOT NULL,
  PRIMARY KEY (`idPersona`,`Sexo_idsexo`,`Privilegio_idPrivilegio`,`Rol_idRol`),
  KEY `fk_Persona_Sexo1_idx` (`Sexo_idsexo`),
  KEY `fk_Persona_Privilegio1_idx` (`Privilegio_idPrivilegio`),
  KEY `fk_Persona_Rol1_idx` (`Rol_idRol`),
  CONSTRAINT `fk_Persona_Privilegio1` FOREIGN KEY (`Privilegio_idPrivilegio`) REFERENCES `privilegio` (`idPrivilegio`),
  CONSTRAINT `fk_Persona_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`),
  CONSTRAINT `fk_Persona_Sexo1` FOREIGN KEY (`Sexo_idsexo`) REFERENCES `sexo` (`idsexo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (5,'admin','123',1,'1',16,'40','17:51','17:51',1,1,1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegio`
--

DROP TABLE IF EXISTS `privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilegio` (
  `idPrivilegio` int NOT NULL AUTO_INCREMENT,
  `privilegio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPrivilegio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegio`
--

LOCK TABLES `privilegio` WRITE;
/*!40000 ALTER TABLE `privilegio` DISABLE KEYS */;
INSERT INTO `privilegio` VALUES (1,'usuario');
/*!40000 ALTER TABLE `privilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `idsexo` int NOT NULL AUTO_INCREMENT,
  `sexo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsexo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'hombre'),(2,'mujer');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taza`
--

DROP TABLE IF EXISTS `taza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taza` (
  `idTaza` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `Persona_idPersona` int NOT NULL,
  PRIMARY KEY (`idTaza`,`Persona_idPersona`),
  KEY `fk_Taza_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Taza_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taza`
--

LOCK TABLES `taza` WRITE;
/*!40000 ALTER TABLE `taza` DISABLE KEYS */;
/*!40000 ALTER TABLE `taza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-25 23:47:02
