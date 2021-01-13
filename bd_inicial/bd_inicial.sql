-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: recursosocial
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB-1:10.4.17+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_data`
--

DROP TABLE IF EXISTS `audit_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` blob DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_data_entry_id` (`entry_id`),
  CONSTRAINT `fk_audit_data_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_data`
--

LOCK TABLES `audit_data` WRITE;
/*!40000 ALTER TABLE `audit_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_entry`
--

DROP TABLE IF EXISTS `audit_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `duration` float DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `request_method` varchar(16) DEFAULT NULL,
  `ajax` int(1) NOT NULL DEFAULT 0,
  `route` varchar(255) DEFAULT NULL,
  `memory_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_route` (`route`)
) ENGINE=InnoDB AUTO_INCREMENT=10528 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_entry`
--

LOCK TABLES `audit_entry` WRITE;
/*!40000 ALTER TABLE `audit_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_error`
--

DROP TABLE IF EXISTS `audit_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `message` text NOT NULL,
  `code` int(11) DEFAULT 0,
  `file` varchar(512) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `trace` blob DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `emailed` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_audit_error_entry_id` (`entry_id`),
  KEY `idx_file` (`file`(180)),
  KEY `idx_emailed` (`emailed`),
  CONSTRAINT `fk_audit_error_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_error`
--

LOCK TABLES `audit_error` WRITE;
/*!40000 ALTER TABLE `audit_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_javascript`
--

DROP TABLE IF EXISTS `audit_javascript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_javascript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `origin` varchar(512) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_javascript_entry_id` (`entry_id`),
  CONSTRAINT `fk_audit_javascript_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_javascript`
--

LOCK TABLES `audit_javascript` WRITE;
/*!40000 ALTER TABLE `audit_javascript` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_javascript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_mail`
--

DROP TABLE IF EXISTS `audit_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `successful` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `text` blob DEFAULT NULL,
  `html` blob DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_mail_entry_id` (`entry_id`),
  CONSTRAINT `fk_audit_mail_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_mail`
--

LOCK TABLES `audit_mail` WRITE;
/*!40000 ALTER TABLE `audit_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `model_id` varchar(255) NOT NULL,
  `field` varchar(255) DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_audit_trail_entry_id` (`entry_id`),
  KEY `idx_audit_user_id` (`user_id`),
  KEY `idx_audit_trail_field` (`model`,`model_id`,`field`),
  KEY `idx_audit_trail_action` (`action`),
  CONSTRAINT `fk_audit_trail_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail`
--

LOCK TABLES `audit_trail` WRITE;
/*!40000 ALTER TABLE `audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `recursoid` int(11) NOT NULL,
  `alumnoid` int(11) NOT NULL,
  PRIMARY KEY (`recursoid`,`alumnoid`),
  CONSTRAINT `fk_aula_recursoid` FOREIGN KEY (`recursoid`) REFERENCES `recurso` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (61,50),(61,51),(61,52),(61,53),(61,54),(61,55),(61,56),(61,57),(61,58),(61,59),(61,60),(61,61),(64,62),(64,63),(64,64),(64,65),(64,66),(64,67),(64,68),(64,69),(67,70),(67,71),(67,72),(67,73),(67,74),(67,75),(67,76),(67,77),(67,78),(70,79),(70,80),(70,81),(70,82),(70,83),(70,84),(70,85),(93,50),(93,51),(93,52),(93,53),(93,54),(93,55),(93,56),(93,57),(94,58),(94,59),(94,60),(94,61),(94,62),(94,63),(94,64),(94,65),(94,66),(94,67),(95,68),(95,69),(95,70),(95,71),(95,72),(95,73),(95,74),(95,75),(95,76),(96,77),(96,78),(96,79),(96,80),(96,81),(96,82),(96,83),(97,50),(97,51),(97,52),(97,53),(97,54),(97,84),(97,85),(98,55),(98,56),(98,57),(98,58),(98,59),(98,60),(98,61),(98,62),(98,63),(99,64),(99,65),(99,66),(99,67),(99,68),(99,69),(99,70),(99,71),(100,72),(100,73),(100,74),(100,75),(100,76),(100,77);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('admin','2',1610454491),('admin','4',1610457322),('admin','47',1610117969),('admin','7',1610460865),('admin','8',1610549131),('prestacion_acreditar','2',1610454491),('prestacion_baja','2',1610454491),('prestacion_crear','15',1609951741),('prestacion_crear','2',1610031583),('prestacion_ver','15',1609951741),('prestacion_ver','2',1610031583),('usuario','15',1609951741);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('admin',1,'',NULL,NULL,1609168922,1610453779),('persona_crear',2,'Permite registrar una persona',NULL,NULL,1609162941,1610454384),('prestacion_acreditar',2,'Permite acreditar prestaciones de su programa','prestacion_rule',NULL,1609162941,1610454397),('prestacion_baja',2,'Permite dar de baja prestaciones de su programa','prestacion_rule',NULL,1609162941,1610454413),('prestacion_crear',2,'Permite crear una prestaciones de su programa','prestacion_rule',NULL,1609162941,1610454431),('prestacion_ver',2,'Permite ver prestaciones de su programa','prestacion_rule',NULL,1609162941,1609343873),('soporte',1,'',NULL,NULL,1609244989,1609244989),('usuario',1,'',NULL,NULL,1609168970,1609168970);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('admin','soporte'),('admin','usuario'),('prestacion_acreditar','prestacion_ver'),('prestacion_baja','prestacion_ver'),('prestacion_crear','persona_crear'),('prestacion_crear','prestacion_ver');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES ('prestacion_rule','O:23:\"app\\rbac\\PrestacionRule\":3:{s:4:\"name\";s:15:\"prestacion_rule\";s:9:\"createdAt\";i:1609338654;s:9:\"updatedAt\";i:1609338654;}',1609338654,1609338654);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1552672687),('m190724_153500_deleteProgramaHasTipoRecurso',1607700037),('m190730_144525_add_localidadid_to_recurso_social',1607700037),('m200411_221328_tipo_responsable',1607700037),('m200413_171649_responsable_entrega',1607700037),('m200413_181257_modulo_alimenticio',1607700037),('m200414_020356_programa_has_tipo_recurso',1607700037),('m200420_185346_fk_reponsable_to_tipo_responsable',1607700037),('m200421_071947_fix_table_responsable',1607700037),('m200421_230417_add_fecha_entrega_to_recurso',1607700037),('m200429_165019_programaColor',1607700037),('m201223_123304_permisos',1609162941),('m201228_135012_programaHasUsuario',1609244609),('m210108_123238_user_persona',1610459239),('m210108_152639_user_baja',1610119903);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  `color` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` VALUES (1,'Subsidio',NULL,'#FF6B37'),(2,'Río Negro Presente',NULL,'#ABDF7D'),(3,'Emprender',NULL,'#FFC837'),(4,'Micro Emprendimiento',NULL,'#FFF637'),(5,'Hábitat',NULL,'#4AF9C1'),(6,'Modulo Alimenticio',NULL,'#7DDEFF');
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa_has_tipo_recurso`
--

DROP TABLE IF EXISTS `programa_has_tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa_has_tipo_recurso` (
  `tipo_recursoid` int(11) NOT NULL,
  `programaid` int(11) NOT NULL,
  PRIMARY KEY (`tipo_recursoid`,`programaid`),
  KEY `fk_tipo_recurso_has_programa_programa1_idx` (`programaid`),
  KEY `fk_tipo_recurso_has_programa_tipo_recurso1_idx` (`tipo_recursoid`),
  CONSTRAINT `fk_tipo_recurso_has_programa_programa1` FOREIGN KEY (`programaid`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_recurso_has_programa_tipo_recurso1` FOREIGN KEY (`tipo_recursoid`) REFERENCES `tipo_recurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_has_tipo_recurso`
--

LOCK TABLES `programa_has_tipo_recurso` WRITE;
/*!40000 ALTER TABLE `programa_has_tipo_recurso` DISABLE KEYS */;
INSERT INTO `programa_has_tipo_recurso` VALUES (1,1),(1,2),(2,2),(2,3),(2,4),(3,1),(3,2),(3,5),(4,6);
/*!40000 ALTER TABLE `programa_has_tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa_has_usuario`
--

DROP TABLE IF EXISTS `programa_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa_has_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `programaid` int(11) DEFAULT NULL,
  `permiso` varchar(64) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_programa` (`programaid`),
  KEY `fk_user` (`userid`),
  CONSTRAINT `fk_programa` FOREIGN KEY (`programaid`) REFERENCES `programa` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_has_usuario`
--

LOCK TABLES `programa_has_usuario` WRITE;
/*!40000 ALTER TABLE `programa_has_usuario` DISABLE KEYS */;
INSERT INTO `programa_has_usuario` VALUES (12,2,6,'prestacion_ver','2021-01-07 14:59:43'),(13,2,6,'prestacion_crear','2021-01-07 14:59:43');
/*!40000 ALTER TABLE `programa_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicial` date NOT NULL,
  `fecha_alta` date NOT NULL,
  `monto` double NOT NULL,
  `observacion` text DEFAULT NULL COMMENT '\n',
  `proposito` text DEFAULT NULL,
  `programaid` int(11) NOT NULL,
  `tipo_recursoid` int(11) NOT NULL,
  `personaid` int(11) NOT NULL COMMENT 'Este atributo hace referencia a una persona del sistema Registral',
  `fecha_baja` date DEFAULT NULL,
  `fecha_acreditacion` date DEFAULT NULL,
  `descripcion_baja` text DEFAULT NULL,
  `localidadid` int(11) DEFAULT NULL COMMENT 'Este atributo hace referencia al sistema Lugar (interoperabilidad)',
  `responsable_entregaid` int(11) DEFAULT NULL,
  `cant_modulo` int(11) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL COMMENT 'Este atributo nos indica la fecha de entrega de la prestacion',
  PRIMARY KEY (`id`),
  KEY `fk_recurso_programa1_idx` (`programaid`),
  KEY `fk_recurso_tipo_recurso1_idx` (`tipo_recursoid`),
  CONSTRAINT `fk_recurso_programa1` FOREIGN KEY (`programaid`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recurso_tipo_recurso1` FOREIGN KEY (`tipo_recursoid`) REFERENCES `tipo_recurso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (1,'2016-01-30','2014-10-07',3212.23,'Observacion Fixture 1','Un proposito hecho con fixtures 1',3,1,1,NULL,'2014-11-07',NULL,2640,NULL,NULL,NULL),(2,'2019-01-06','2014-10-06',14500,'Se solicita un subcidio para pagar deudas personales','Pagar deudas',1,1,2,NULL,'2019-01-06',NULL,2539,NULL,NULL,NULL),(3,'2019-01-06','2014-10-05',13245.5,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,3,NULL,'2019-01-10',NULL,2576,NULL,NULL,NULL),(4,'2016-01-27','2014-10-04',9365.99,'Observacion Fixture 4','Busquedad laboral',3,2,4,NULL,'2014-11-04',NULL,2586,NULL,NULL,NULL),(5,'2016-01-26','2014-10-03',18123.7,'Observacion Fixture 5','Un proposito hecho con fixtures 5',1,2,5,NULL,'2014-11-03',NULL,2577,NULL,NULL,NULL),(6,'2016-01-25','2014-10-02',16456.9,'Observacion Fixture 6','Un proposito hecho con fixtures 6',2,3,6,NULL,'2014-11-02',NULL,2599,NULL,NULL,NULL),(7,'2016-01-24','2014-10-01',15789.64,'Observacion Fixture 7','Un proposito hecho con fixtures 7',3,1,7,NULL,'2014-11-01',NULL,2587,NULL,NULL,NULL),(8,'2016-01-23','2016-05-01',14456,'Observacion Fixture 8','Un proposito hecho con fixtures 8',1,2,8,NULL,'2016-05-10',NULL,2600,NULL,NULL,NULL),(9,'2016-01-22','2016-05-30',19789.8,'Observacion Fixture 9','Un proposito hecho con fixtures 9',2,3,9,NULL,'2016-06-30',NULL,2626,NULL,NULL,NULL),(10,'2016-01-21','2016-05-29',23123.12,'Observacion Fixture 10','Un proposito hecho con fixtures 10',3,1,10,NULL,'2016-06-29',NULL,3976,NULL,NULL,NULL),(11,'2016-01-20','2016-05-28',16789.6,'Observacion Fixture 11','Un proposito hecho con fixtures 11',1,2,1,NULL,'2016-06-28',NULL,2640,NULL,NULL,NULL),(12,'2016-01-19','2016-05-27',65412,'Observacion Fixture 12','Un proposito hecho con fixtures 12',2,3,2,NULL,'2016-06-27',NULL,2539,NULL,NULL,NULL),(13,'2016-01-18','2016-05-26',15000,'Observacion Fixture 13','Un proposito hecho con fixtures 13',3,1,3,NULL,'2016-06-26',NULL,2576,NULL,NULL,NULL),(14,'2016-01-17','2016-05-25',32123.23,'Observacion Fixture 14','Un proposito hecho con fixtures 14',1,2,4,NULL,'2016-06-25',NULL,2586,NULL,NULL,NULL),(15,'2016-01-16','2016-05-24',3212.23,'Observacion Fixture 15','Un proposito hecho con fixtures 15',2,3,5,NULL,'2016-06-24',NULL,2577,NULL,NULL,NULL),(16,'2016-01-15','2016-05-23',20000.16,'Observacion Fixture 16','Un proposito hecho con fixtures 16',3,1,6,NULL,'2016-06-23',NULL,2640,NULL,NULL,NULL),(17,'2016-01-14','2016-05-22',13245.5,'Observacion Fixture 17','Un proposito hecho con fixtures 17',1,2,7,NULL,'2016-06-22',NULL,2539,NULL,NULL,NULL),(18,'2016-01-13','2016-05-21',9365.99,'Observacion Fixture 18','Un proposito hecho con fixtures 18',2,3,8,NULL,'2016-06-21',NULL,2576,NULL,NULL,NULL),(19,'2016-01-12','2016-05-20',18123.7,'Observacion Fixture 19','Un proposito hecho con fixtures 19',3,1,9,NULL,'2016-06-20',NULL,2586,NULL,NULL,NULL),(20,'2016-01-11','2016-05-19',16456.9,'Observacion Fixture 20','Un proposito hecho con fixtures 20',1,2,10,'2016-06-19','2016-06-19','Esto es un argumento de baja',2577,NULL,NULL,NULL),(21,'2016-01-10','2016-05-18',15789.64,'Observacion Fixture 21','Un proposito hecho con fixtures 21',2,3,1,'2016-06-18',NULL,'Esto es un argumento de baja',2599,NULL,NULL,NULL),(22,'2016-01-09','2016-05-17',14456,'Observacion Fixture 22','Un proposito hecho con fixtures 22',3,1,2,'2016-06-17',NULL,'Esto es un argumento de baja',2587,NULL,NULL,NULL),(23,'2016-01-08','2016-05-16',19789.8,'Observacion Fixture 23','Un proposito hecho con fixtures 23',1,2,3,'2016-06-16',NULL,'Esto es un argumento de baja',2600,NULL,NULL,NULL),(24,'2016-01-07','2016-05-15',23123.12,'Observacion Fixture 24','Un proposito hecho con fixtures 24',2,3,4,'2016-06-15','2016-06-15','Esto es un argumento de baja',2626,NULL,NULL,NULL),(25,'2016-01-06','2016-05-14',16789.6,'Observacion Fixture 25','Un proposito hecho con fixtures 25',3,1,5,'2016-06-14',NULL,'Esto es un argumento de baja',3976,NULL,NULL,NULL),(26,'2016-01-05','2016-05-13',65412,'Observacion Fixture 26','Un proposito hecho con fixtures 26',1,2,6,'2016-06-13',NULL,'Esto es un argumento de baja',2640,NULL,NULL,NULL),(27,'2016-01-04','2016-05-12',15000,'Observacion Fixture 27','Un proposito hecho con fixtures 27',2,3,7,'2016-06-12',NULL,'Esto es un argumento de baja',2539,NULL,NULL,NULL),(28,'2016-01-03','2016-05-11',32123.23,'Observacion Fixture 28','Un proposito hecho con fixtures 28',3,1,8,'2016-06-11','2016-06-11','Esto es un argumento de baja',2576,NULL,NULL,NULL),(29,'2016-01-02','2016-05-10',3212.23,'Observacion Fixture 29','Un proposito hecho con fixtures 29',1,2,9,'2016-06-10',NULL,'Esto es un argumento de baja',2586,NULL,NULL,NULL),(30,'2016-01-01','2016-05-09',20000.16,'Observacion Fixture 30','Un proposito hecho con fixtures 30',2,3,10,'2016-05-10','2016-05-10','Esto es un argumento de baja',2577,NULL,NULL,NULL),(31,'2017-12-10','2016-05-08',13245.5,'Observacion Fixture 31','Un proposito hecho con fixtures 31',3,1,1,'2018-01-09','2016-05-09','Esto es un argumento de baja',2640,NULL,NULL,NULL),(32,'2017-12-09','2016-05-07',9365.99,'Observacion Fixture 32','Un proposito hecho con fixtures 32',1,2,2,'2018-01-08',NULL,'Esto es un argumento de baja',2539,NULL,NULL,NULL),(33,'2017-12-08','2016-05-06',18123.7,'Observacion Fixture 33','Un proposito hecho con fixtures 33',2,3,3,'2018-01-07','2016-05-07','Esto es un argumento de baja',2576,NULL,NULL,NULL),(34,'2017-12-07','2016-05-05',16456.9,'Observacion Fixture 34','Un proposito hecho con fixtures 34',3,1,4,'2018-01-06','2016-05-06','Esto es un argumento de baja',2586,NULL,NULL,NULL),(35,'2017-12-06','2016-05-04',15789.64,'Observacion Fixture 35','Un proposito hecho con fixtures 35',1,2,5,'2018-01-05',NULL,'Esto es un argumento de baja',2577,NULL,NULL,NULL),(36,'2017-12-05','2016-05-03',14456,'Observacion Fixture 36','Un proposito hecho con fixtures 36',2,3,6,'2018-01-04','2016-05-04','Esto es un argumento de baja',2599,NULL,NULL,NULL),(37,'2017-12-04','2016-05-02',9365.99,'Observacion Fixture 37','Un proposito hecho con fixtures 37',3,2,11,'2018-01-03',NULL,'Esto es un argumento de baja',2587,NULL,NULL,NULL),(38,'2017-12-03','2016-05-01',18123.7,'Observacion Fixture 38','Un proposito hecho con fixtures 38',1,3,12,'2018-01-02',NULL,'Esto es un argumento de baja',2600,NULL,NULL,NULL),(39,'2017-12-02','2018-05-12',16456.9,'Observacion Fixture 39','Un proposito hecho con fixtures 39',2,1,13,'2018-01-15',NULL,'Esto es un argumento de baja',2626,NULL,NULL,NULL),(40,'2017-12-01','2018-05-11',15789.64,'Observacion Fixture 40','Un proposito hecho con fixtures 40',3,2,14,'2018-01-14','2018-05-14','Esto es un argumento de baja',3976,NULL,NULL,NULL),(41,'2017-11-30','2018-05-10',14456,'Observacion Fixture 41','Un proposito hecho con fixtures 41',1,3,15,'2018-01-13','2018-05-13','Esto es un argumento de baja',2640,NULL,NULL,NULL),(42,'2017-11-29','2018-05-09',19789.8,'Observacion Fixture 42','Un proposito hecho con fixtures 42',2,1,16,'2018-01-12','2018-05-12','Esto es un argumento de baja',2539,NULL,NULL,NULL),(43,'2017-11-28','2018-05-08',23123.12,'Observacion Fixture 43','Un proposito hecho con fixtures 43',3,2,17,'2018-01-11','2018-05-11','Esto es un argumento de baja',2576,NULL,NULL,NULL),(44,'2017-11-27','2018-05-07',16789.6,'Observacion Fixture 44','Un proposito hecho con fixtures 44',1,3,18,'2018-01-10','2018-05-10','Esto es un argumento de baja',2586,NULL,NULL,NULL),(45,'2017-11-26','2018-05-06',65412,'Observacion Fixture 45','Un proposito hecho con fixtures 45',2,1,19,'2018-01-09','2018-05-09','Esto es un argumento de baja',2577,NULL,NULL,NULL),(46,'2017-11-25','2018-05-05',15000,'Observacion Fixture 46','Un proposito hecho con fixtures 46',3,2,20,'2018-01-08','2018-05-08','Esto es un argumento de baja',2640,NULL,NULL,NULL),(47,'2017-11-24','2018-05-04',32123.23,'Observacion Fixture 47','Un proposito hecho con fixtures 47',1,3,21,NULL,'2018-05-07',NULL,2539,NULL,NULL,NULL),(48,'2017-11-23','2018-05-03',3212.23,'Observacion Fixture 48','Un proposito hecho con fixtures 48',2,1,22,NULL,'2018-05-06',NULL,2576,NULL,NULL,NULL),(49,'2017-11-22','2018-05-02',20000.16,'Observacion Fixture 49','Un proposito hecho con fixtures 49',3,2,23,NULL,'2018-05-05',NULL,2586,NULL,NULL,NULL),(50,'2017-11-21','2018-05-01',13245.5,'Observacion Fixture 50','Un proposito hecho con fixtures 50',1,3,24,NULL,'2018-05-04',NULL,2577,NULL,NULL,NULL),(51,'2017-11-20','2018-09-10',9365.99,'Observacion Fixture 51','Un proposito hecho con fixtures 51',2,1,25,NULL,'2018-09-15',NULL,2599,NULL,NULL,NULL),(52,'2017-11-19','2018-09-09',18123.7,'Observacion Fixture 52','Un proposito hecho con fixtures 52',3,2,26,NULL,'2018-09-14',NULL,2587,NULL,NULL,NULL),(53,'2017-11-18','2018-09-08',16456.9,'Observacion Fixture 53','Un proposito hecho con fixtures 53',1,3,27,NULL,'2018-09-13',NULL,2600,NULL,NULL,NULL),(54,'2017-11-17','2018-09-07',15789.64,'Observacion Fixture 54','Un proposito hecho con fixtures 54',2,2,1,NULL,'2018-09-12',NULL,2626,NULL,NULL,NULL),(55,'2017-11-16','2018-09-06',14456,'Observacion Fixture 55','Un proposito hecho con fixtures 55',3,3,2,NULL,'2018-09-11',NULL,3976,NULL,NULL,NULL),(56,'2017-11-15','2018-09-05',9365.99,'Observacion Fixture 56','Un proposito hecho con fixtures 56',1,1,3,NULL,'2018-09-10',NULL,2640,NULL,NULL,NULL),(57,'2017-11-14','2018-09-04',18123.7,'Observacion Fixture 57','Un proposito hecho con fixtures 57',2,2,4,NULL,'2018-09-09',NULL,2539,NULL,NULL,NULL),(58,'2017-11-13','2018-09-03',16456.9,'Observacion Fixture 58','Un proposito hecho con fixtures 58',3,3,5,NULL,'2018-09-08',NULL,2576,NULL,NULL,NULL),(59,'2017-11-12','2018-09-02',15789.64,'Observacion Fixture 59','Un proposito hecho con fixtures 59',1,1,6,NULL,'2018-09-07',NULL,2586,NULL,NULL,NULL),(60,'2017-11-11','2018-05-08',14456,'Observacion Fixture 60','Un proposito hecho con fixtures 60',2,2,11,NULL,NULL,NULL,2577,NULL,NULL,NULL),(61,'2017-11-10','2018-05-07',19789.8,'Observacion Fixture 61','Un proposito hecho con fixtures 61',3,3,12,NULL,NULL,NULL,2640,NULL,NULL,NULL),(62,'2018-03-30','2018-05-06',23123.12,'Observacion Fixture 62','Un proposito hecho con fixtures 62',1,1,13,NULL,NULL,NULL,2539,NULL,NULL,NULL),(63,'2018-03-29','2018-05-05',16789.6,'Observacion Fixture 63','Un proposito hecho con fixtures 63',2,2,14,NULL,NULL,NULL,2576,NULL,NULL,NULL),(64,'2018-03-28','2018-05-04',65412,'Observacion Fixture 64','Un proposito hecho con fixtures 64',3,3,15,NULL,NULL,NULL,2586,NULL,NULL,NULL),(65,'2018-03-27','2018-05-03',15000,'Observacion Fixture 65','Un proposito hecho con fixtures 65',1,1,16,NULL,NULL,NULL,2577,NULL,NULL,NULL),(66,'2018-03-26','2018-05-02',32123.23,'Observacion Fixture 66','Un proposito hecho con fixtures 66',2,2,17,NULL,NULL,NULL,2599,NULL,NULL,NULL),(67,'2018-03-25','2018-05-01',3212.23,'Observacion Fixture 67','Un proposito hecho con fixtures 67',3,3,18,NULL,NULL,NULL,2587,NULL,NULL,NULL),(68,'2018-03-24','2018-09-10',20000.16,'Observacion Fixture 68','Un proposito hecho con fixtures 68',1,1,19,NULL,NULL,NULL,2600,NULL,NULL,NULL),(69,'2018-03-23','2018-09-09',13245.5,'Observacion Fixture 69','Un proposito hecho con fixtures 69',2,2,20,NULL,NULL,NULL,2626,NULL,NULL,NULL),(70,'2018-03-22','2018-09-08',9365.99,'Observacion Fixture 70','Un proposito hecho con fixtures 70',3,3,21,NULL,NULL,NULL,3976,NULL,NULL,NULL),(71,'2018-03-21','2018-09-07',18123.7,'Observacion Fixture 71','Un proposito hecho con fixtures 71',1,2,22,NULL,NULL,NULL,2640,NULL,NULL,NULL),(72,'2019-01-06','2019-01-06',14500,'Se solicita un subcidio para pagar deudas personales','Pagar deudas',1,1,36,NULL,'2019-01-06',NULL,2539,NULL,NULL,NULL),(73,'2019-01-06','2019-01-06',13245.5,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,37,NULL,'2019-01-10',NULL,2576,NULL,NULL,NULL),(74,'2019-01-07','2019-01-07',5500,'La persona esta desocupada','Busquedad laboral',3,2,38,NULL,'2019-01-07',NULL,2586,NULL,NULL,NULL),(75,'2019-01-07','2019-01-07',15000,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',1,3,39,NULL,'2019-01-07',NULL,2577,NULL,NULL,NULL),(76,'2019-01-07','2019-01-07',16456.5,'Ayuda económica','Necesidad alimentaria',2,1,40,NULL,'2019-01-07',NULL,2640,NULL,NULL,NULL),(77,'2019-01-07','2019-01-07',6000,'Taller de ceramica','Busquedad laboral',3,2,41,NULL,'2019-01-07',NULL,2539,NULL,NULL,NULL),(78,'2019-01-07','2019-01-07',14456,'Cuota 3 – Mejora habitacional','Ampliación de vivienda',1,3,42,NULL,'2019-01-07',NULL,2576,NULL,NULL,NULL),(79,'2019-01-06','2019-01-06',13789.8,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',1,3,43,NULL,'2019-01-06',NULL,2586,NULL,NULL,NULL),(80,'2019-01-05','2019-01-05',12123.12,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',1,3,44,NULL,'2019-01-05',NULL,2577,NULL,NULL,NULL),(81,'2019-01-04','2019-01-04',11789.6,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',1,3,45,NULL,'2019-01-04',NULL,2599,NULL,NULL,NULL),(82,'2019-01-03','2019-01-03',6412,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',1,3,46,NULL,'2019-01-03',NULL,2587,NULL,NULL,NULL),(83,'2019-01-02','2019-01-02',15000,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',1,3,47,NULL,'2019-01-02',NULL,2600,NULL,NULL,NULL),(84,'2019-05-25','2019-05-25',9365.99,'Se solicita una ayuda alimentaria','Necesidad alimentaria',1,1,48,NULL,'2019-05-25',NULL,2626,NULL,NULL,NULL),(85,'2019-05-24','2019-05-24',12233,'Se solicita una ayuda alimentaria','Necesidad alimentaria',1,1,49,NULL,'2019-05-24',NULL,3976,NULL,NULL,NULL),(86,'2019-05-23','2019-05-23',13234,'Se solicita una ayuda económica','Gastos por salud',1,1,50,NULL,'2019-05-23',NULL,2640,NULL,NULL,NULL),(87,'2019-05-22','2019-05-22',14235,'Se solicita una ayuda económica','Gastos por salud',1,1,36,NULL,'2019-05-22',NULL,2539,NULL,NULL,NULL),(88,'2019-05-21','2019-05-21',11236,'Se solicita una ayuda económica','Gastos por salud',1,1,37,NULL,'2019-05-21',NULL,2576,NULL,NULL,NULL),(89,'2019-05-20','2019-05-20',15237,'Se solicita una ayuda económica','Gastos por salud',1,1,38,NULL,'2019-05-20',NULL,2586,NULL,NULL,NULL),(90,'2019-05-19','2019-03-19',12000,'Se solicita una ayuda económica','Gastos por salud',1,1,39,'2019-05-19','2019-05-19','El beneficiario no cumple con las condiciones necesarias',2577,NULL,NULL,NULL),(91,'2019-05-18','2019-05-18',9239,'Se solicita una ayuda económica','Gastos por salud',1,1,40,'2019-05-18','2019-05-18','El beneficiario no cumple con las condiciones necesarias',2640,NULL,NULL,NULL),(92,'2019-05-17','2019-06-17',7240,'Se solicita una ayuda económica','Gastos por salud',1,1,41,'2019-05-17','2019-05-17','El beneficiario no cumple con las condiciones necesarias',2539,NULL,NULL,NULL),(93,'2019-01-07','2019-01-07',5500,'La persona esta desocupada','Busquedad laboral',3,2,42,'2019-01-07','2019-01-07','El beneficiario no cumple con las condiciones necesarias',2576,NULL,NULL,NULL),(94,'2019-05-19','2019-05-19',6000,'La persona esta desocupada','Busquedad laboral',3,2,43,NULL,'2019-05-19',NULL,2586,NULL,NULL,NULL),(95,'2019-03-18','2019-03-18',4569,'La persona esta desocupada','Busquedad laboral',3,2,44,NULL,NULL,NULL,2577,NULL,NULL,NULL),(96,'2019-05-17','2019-05-17',5321,'La persona esta desocupada','Busquedad laboral',3,2,45,NULL,NULL,NULL,2599,NULL,NULL,NULL),(97,'2019-06-16','2019-06-16',3000,'La persona esta desocupada','Busquedad laboral',3,2,46,NULL,NULL,NULL,2587,NULL,NULL,NULL),(98,'2019-01-06','2019-01-06',4563,'La persona esta desocupada','Busquedad laboral',3,2,47,NULL,NULL,NULL,2600,NULL,NULL,NULL),(99,'2019-05-18','2019-05-18',4570,'La persona esta desocupada','Busquedad laboral',3,2,48,NULL,NULL,NULL,2626,NULL,NULL,NULL),(100,'2019-03-17','2019-03-17',5322,'La persona esta desocupada','Busquedad laboral',3,2,49,NULL,NULL,NULL,3976,NULL,NULL,NULL),(101,'2019-01-06','2019-01-06',13789.8,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',5,3,50,NULL,NULL,NULL,2640,NULL,NULL,NULL),(102,'2019-01-07','2019-01-07',12233,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',5,3,36,NULL,NULL,NULL,2539,NULL,NULL,NULL),(103,'2019-05-19','2019-05-19',13234,'Cuota 1 – Mejora habitacional','Ampliación de vivienda',5,3,37,NULL,NULL,NULL,2576,NULL,NULL,NULL),(104,'2019-03-18','2019-03-18',14235,'Cuota 2 – Mejora habitacional','Ampliación de vivienda',5,3,38,NULL,NULL,NULL,2586,NULL,NULL,NULL),(105,'2019-02-17','2019-02-17',11236,'Cuota 3 – Mejora habitacional','Ampliación de vivienda',5,3,39,NULL,NULL,NULL,2577,NULL,NULL,NULL),(106,'2019-06-16','2019-06-16',20000,'Cuota 4 – Mejora habitacional','Refacción de vivienda',5,3,40,NULL,'2019-06-16',NULL,2640,NULL,NULL,NULL),(107,'2019-01-06','2019-01-06',19500,'Cuota 5 – Mejora habitacional','Refacción de vivienda',5,3,41,NULL,'2019-01-06',NULL,2539,NULL,NULL,NULL),(108,'2019-05-18','2019-05-18',17000,'Cuota 6 – Mejora habitacional','Refacción de vivienda',5,3,42,NULL,'2019-05-18',NULL,2576,NULL,NULL,NULL),(109,'2019-03-17','2019-03-17',20000,'Cuota 3 – Mejora habitacional','Refacción de vivienda',5,3,43,NULL,'2019-03-17',NULL,2586,NULL,NULL,NULL),(110,'2019-01-06','2019-01-06',19500,'Cuota 3 – Mejora habitacional','Refacción de vivienda',5,3,44,NULL,'2019-01-06',NULL,2577,NULL,NULL,NULL),(111,'2019-04-06','2019-04-06',13245.5,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,45,NULL,'2019-01-10',NULL,2599,NULL,NULL,NULL),(112,'2019-02-17','2019-02-17',12233,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,46,NULL,'2019-04-06',NULL,2587,NULL,NULL,NULL),(113,'2019-06-16','2019-06-16',13234,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,47,NULL,NULL,NULL,2600,NULL,NULL,NULL),(114,'2019-01-06','2019-01-06',14235,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,48,NULL,NULL,NULL,2626,NULL,NULL,NULL),(115,'2019-05-18','2019-05-18',11236,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,49,NULL,NULL,NULL,3976,NULL,NULL,NULL),(116,'2019-03-17','2019-03-17',12233,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,50,NULL,NULL,NULL,2640,NULL,NULL,NULL),(117,'2019-01-06','2019-01-06',13234,'Se solicita una ayuda alimentaria','Necesidad alimentaria',2,1,36,NULL,'2019-03-17',NULL,2539,NULL,NULL,NULL),(118,'2019-01-06','2020-01-02',0,NULL,'Necesidad alimentaria',6,4,36,NULL,NULL,NULL,2539,1,4,NULL);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable_entrega`
--

DROP TABLE IF EXISTS `responsable_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsable_entrega` (
  `tipo_responsableid` int(11) NOT NULL COMMENT 'esto nos permite tener multiples tipos de responsables. ej municipio, delegacion, comision de fomente,etc',
  `recursoid` int(11) NOT NULL AUTO_INCREMENT,
  `responsable_entregaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`recursoid`),
  KEY `fk_tipo_responsableid` (`tipo_responsableid`),
  CONSTRAINT `fk_recurso` FOREIGN KEY (`recursoid`) REFERENCES `recurso` (`id`),
  CONSTRAINT `fk_tipo_responsableid` FOREIGN KEY (`tipo_responsableid`) REFERENCES `tipo_responsable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable_entrega`
--

LOCK TABLES `responsable_entrega` WRITE;
/*!40000 ALTER TABLE `responsable_entrega` DISABLE KEYS */;
INSERT INTO `responsable_entrega` VALUES (2,1,2);
/*!40000 ALTER TABLE `responsable_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_account`
--

DROP TABLE IF EXISTS `social_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_account`
--

LOCK TABLES `social_account` WRITE;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_recurso`
--

DROP TABLE IF EXISTS `tipo_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_recurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_recurso`
--

LOCK TABLES `tipo_recurso` WRITE;
/*!40000 ALTER TABLE `tipo_recurso` DISABLE KEYS */;
INSERT INTO `tipo_recurso` VALUES (1,'Alimentación'),(2,'Empleo/Formación Laboral'),(3,'Mejora Habitacional'),(4,'Emergencia');
/*!40000 ALTER TABLE `tipo_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_responsable`
--

DROP TABLE IF EXISTS `tipo_responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_responsable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_responsable`
--

LOCK TABLES `tipo_responsable` WRITE;
/*!40000 ALTER TABLE `tipo_responsable` DISABLE KEYS */;
INSERT INTO `tipo_responsable` VALUES (1,'municipio'),(2,'delegacion'),(3,'comision de fomento');
/*!40000 ALTER TABLE `tipo_responsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  `baja` tinyint(3) DEFAULT 0,
  `descripcion_baja` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','admin@correo.com','$2y$10$MnF9LJCnya.NrXIQBN4YGuRIdIuGtOSsGqqZTpby9RnFp7Chb4qEm','maXx0ibz2Br9UEfP06TVcltr0uOiWl4B',1556894840,NULL,NULL,'172.18.0.2',1556894840,1607700159,0,1610453141,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_persona`
--

DROP TABLE IF EXISTS `user_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_persona` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `personaid` int(11) NOT NULL,
  `localidadid` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `fk_user_persona` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_persona`
--

LOCK TABLES `user_persona` WRITE;
/*!40000 ALTER TABLE `user_persona` DISABLE KEYS */;
INSERT INTO `user_persona` VALUES (2,1,2626);
/*!40000 ALTER TABLE `user_persona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13 15:08:57
