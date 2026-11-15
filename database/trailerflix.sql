-- MySQL dump 10.13  Distrib 26.7.0, for Win64 (x86_64)
--
-- Host: localhost    Database: trailerflix
-- ------------------------------------------------------
-- Server version	26.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'afdeb674-c2a1-11f1-a710-8cb0e9579f6a:1-1269';

--
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_actor`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
INSERT INTO `actores` VALUES (88,'Aaron Paul'),(22,'Aidan Gallagher'),(112,'Alanna Ubach'),(85,'Alejandra Flechner'),(66,'├ülvaro Morte'),(133,'America Ferrera'),(73,'Andrea Pietra'),(89,'Anna Gunn'),(99,'Anna Torv'),(129,'Anne Hathaway'),(109,'Anthony Gonzalez'),(23,'Anya Taylor-Joy'),(74,'Ariel Staltari'),(97,'Bella Ramsey'),(55,'Ben Affleck'),(111,'Benjamin Bratt'),(27,'Bill Camp'),(91,'Bob Odenkirk'),(87,'Bryan Cranston'),(63,'Caleb McLaughlin'),(9,'Camila Mendes'),(15,'Carl Weathers'),(71,'Carla Peterson'),(93,'Catherine Zeta-Jones'),(72,'C├®sar Troncoso'),(37,'Chris Evans'),(39,'Chris Hemsworth'),(106,'Cillian Murphy'),(54,'Claire Forlani'),(1,'Claire Foy'),(10,'Cole Sprouse'),(48,'Colin Farrell'),(49,'Common'),(118,'Courteney Cox'),(77,'Dar├¡o Grandinetti'),(19,'David Casta├▒eda'),(43,'David Harbour'),(122,'David Schwimmer'),(90,'Dean Norris'),(115,'Don Rickles'),(127,'Ed Helms'),(17,'Elliot Page'),(107,'Emily Blunt'),(95,'Emma Myers'),(20,'Emmy Raver-Lampman'),(76,'├ërica Rivas'),(58,'Ezra Miller'),(61,'Finn Wolfhard'),(42,'Florence Pugh'),(35,'Frances Conroy'),(98,'Gabriel Luna'),(110,'Gael Garc├¡a Bernal'),(56,'Gal Gadot'),(62,'Gaten Matarazzo'),(50,'Geena Davis'),(14,'Giancarlo Esposito'),(13,'Gina Carano'),(81,'Guillermo Francella'),(96,'Gwendoline Christie'),(25,'Harry Melling'),(31,'Helena Bonham Carter'),(29,'Henry Cavill'),(3,'Imelda Staunton'),(67,'Itziar Itu├▒o'),(57,'Jason Momoa'),(83,'Javier Godino'),(126,'Jenna Fischer'),(92,'Jenna Ortega'),(117,'Jennifer Aniston'),(41,'Jeremy Renner'),(46,'Jessica Chastain'),(116,'Jim Varney'),(32,'Joaquin Phoenix'),(125,'John Krasinski'),(47,'John Malkovich'),(138,'J├Ârdis Triebel'),(105,'Josh Brolin'),(134,'Kate McKinnon'),(16,'Katee Sackhoff'),(7,'KJ Apa'),(75,'Leonardo Sbaraglia'),(8,'Lili Reinhart'),(119,'Lisa Kudrow'),(136,'Lisa Vicari'),(135,'Louis Hofmann'),(94,'Luis Guzm├ín'),(11,'Madelaine Petsch'),(139,'Maja Sch├Âne'),(131,'Margot Robbie'),(38,'Mark Ruffalo'),(108,'Matt Damon'),(120,'Matt LeBlanc'),(4,'Matt Smith'),(128,'Matthew McConaughey'),(121,'Matthew Perry'),(130,'Michael Caine'),(69,'Miguel Herr├ín'),(28,'Millie Bobby Brown'),(26,'Moses Ingram'),(100,'Nick Offerman'),(64,'Noah Schnapp'),(86,'Norman Briski'),(45,'O-T Fagbenle'),(137,'Oliver Masucci'),(2,'Olivia Colman'),(103,'Oscar Isaac'),(79,'Oscar Mart├¡nez'),(82,'Pablo Rago'),(68,'Pedro Alonso'),(12,'Pedro Pascal'),(84,'Peter Lanzani'),(53,'Rachael Leigh Cook'),(44,'Rachel Weisz'),(124,'Rainn Wilson'),(59,'Ray Fisher'),(102,'Rebecca Ferguson'),(70,'Ricardo Dar├¡n'),(78,'Rita Cortese'),(33,'Robert De Niro'),(36,'Robert Downey Jr.'),(21,'Robert Sheehan'),(132,'Ryan Gosling'),(51,'Ryan Phillippe'),(30,'Sam Claflin'),(40,'Scarlett Johansson'),(80,'Soledad Villamil'),(123,'Steve Carell'),(24,'Thomas Brodie-Sangster'),(114,'Tim Allen'),(52,'Tim Robbins'),(101,'Timoth├®e Chalamet'),(5,'Tobias Menzies'),(113,'Tom Hanks'),(18,'Tom Hopper'),(65,'├Ürsula Corber├│'),(6,'Vanessa Kirby'),(60,'Winona Ryder'),(34,'Zazie Beetz'),(104,'Zendaya');
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'Pel├¡cula'),(1,'Serie');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido` (
  `id_contenido` int NOT NULL,
  `titulo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sinopsis` text COLLATE utf8mb4_unicode_ci,
  `temporadas` int DEFAULT NULL,
  `trailer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_contenido`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido`
--

LOCK TABLES `contenido` WRITE;
/*!40000 ALTER TABLE `contenido` DISABLE KEYS */;
INSERT INTO `contenido` VALUES (1,'The Crown','Recorre el reinado de Isabel II desde su juventud, mostrando c├│mo la vida privada de la familia real choca con las obligaciones de la Corona y los grandes acontecimientos pol├¡ticos del siglo XX.',6,'https://www.youtube.com/results?search_query=The+Crown+trailer+oficial',1),(2,'Riverdale','Detr├ís de la fachada tranquila de un pueblo peque├▒o, un grupo de estudiantes investiga un crimen que deja al descubierto los secretos m├ís oscuros de sus familias y vecinos.',7,'https://www.youtube.com/results?search_query=Riverdale+trailer+oficial',1),(3,'The Mandalorian','Tras la ca├¡da del Imperio, un cazarrecompensas solitario recorre los confines de la galaxia y termina protegiendo a una misteriosa criatura que muchos quieren capturar.',3,'https://www.youtube.com/results?search_query=The+Mandalorian+trailer+oficial',1),(4,'The Umbrella Academy','Un grupo de hermanos adoptivos con poderes extraordinarios se reencuentra tras la muerte de su padre y descubre que tiene pocos d├¡as para evitar el fin del mundo.',4,'https://www.youtube.com/results?search_query=The+Umbrella+Academy+trailer+oficial',1),(5,'Gambito de Dama','Una hu├®rfana con un talento excepcional para el ajedrez se abre camino en un mundo dominado por hombres mientras lucha contra sus propias adicciones.',1,NULL,1),(6,'Enola Holmes','La hermana menor de Sherlock Holmes decide buscar por su cuenta a su madre desaparecida y, en el camino, se ve envuelta en una conspiraci├│n que involucra a un joven lord.',NULL,'https://www.youtube.com/results?search_query=Enola+Holmes+trailer+oficial',2),(7,'Guas├│n','Un comediante fracasado y marginado por la sociedad de Ciudad G├│tica atraviesa una espiral de violencia que lo transforma en uno de los criminales m├ís temidos.',NULL,'https://www.youtube.com/results?search_query=Guason+Joker+trailer+oficial',2),(8,'Avengers: Endgame','Despu├®s de perder a la mitad del universo, los Vengadores sobrevivientes se re├║nen para un ├║ltimo intento de revertir el da├▒o y enfrentar nuevamente a Thanos.',NULL,'https://www.youtube.com/results?search_query=Avengers+Endgame+trailer+oficial',2),(9,'Black Widow','Natasha Romanoff se enfrenta a su pasado cuando una peligrosa conspiraci├│n la obliga a reencontrarse con la familia que dej├│ atr├ís antes de convertirse en Vengadora.',NULL,'https://www.youtube.com/results?search_query=Black+Widow+trailer+oficial',2),(10,'AVA','Una asesina a sueldo que trabaja para una organizaci├│n secreta se convierte en blanco de sus propios jefes despu├®s de cuestionar una misi├│n que sale mal.',NULL,'https://www.youtube.com/results?search_query=AVA+2020+trailer+oficial',2),(11,'AntiTrust','Un joven programador talentoso consigue el trabajo de sus sue├▒os en una gran empresa de software, pero pronto sospecha que su jefe esconde algo muy peligroso.',NULL,NULL,2),(12,'La Liga de la Justicia de Zack Snyder','Batman y la Mujer Maravilla re├║nen a un equipo de h├®roes con habilidades ├║nicas para defender la Tierra de una amenaza de proporciones catastr├│ficas.',NULL,'https://www.youtube.com/results?search_query=Liga+de+la+Justicia+de+Zack+Snyder+trailer+oficial',2),(13,'Stranger Things','En un peque├▒o pueblo de los a├▒os ochenta, la desaparici├│n de un ni├▒o lleva a sus amigos a descubrir experimentos secretos, fuerzas sobrenaturales y a una misteriosa ni├▒a.',5,'https://www.youtube.com/results?search_query=Stranger+Things+trailer+oficial',1),(14,'La Casa de Papel','Un enigm├ítico profesor re├║ne a un grupo de delincuentes con alias de ciudades para ejecutar un atraco sin precedentes en la F├íbrica Nacional de Moneda y Timbre de Espa├▒a.',5,'https://www.youtube.com/results?search_query=La+Casa+de+Papel+trailer+oficial',1),(15,'El Eternauta','Una nevada t├│xica cae sobre Buenos Aires y mata a casi toda la poblaci├│n. Un grupo de sobrevivientes debe organizarse para resistir a una invasi├│n que reci├®n comienza.',1,'https://www.youtube.com/results?search_query=El+Eternauta+serie+trailer+oficial',1),(16,'Relatos Salvajes','Seis historias independientes muestran a personas comunes que, frente a una situaci├│n injusta o absurda, pierden el control y reaccionan de las formas m├ís extremas.',NULL,NULL,2),(17,'El Secreto de sus Ojos','Un empleado judicial retirado decide escribir una novela sobre un crimen que investig├│ d├®cadas atr├ís, y al hacerlo reabre heridas del caso y de un amor nunca confesado.',NULL,'https://www.youtube.com/results?search_query=El+Secreto+de+sus+Ojos+trailer+oficial',2),(18,'Argentina, 1985','Un fiscal y su joven equipo se enfrentan a amenazas y presiones mientras preparan el hist├│rico juicio a los responsables de la ├║ltima dictadura militar argentina.',NULL,NULL,2),(19,'Breaking Bad','Un profesor de qu├¡mica con una enfermedad terminal se asocia con un exalumno para fabricar metanfetamina y asegurar el futuro econ├│mico de su familia.',5,'https://www.youtube.com/results?search_query=Breaking+Bad+trailer+oficial',1),(20,'Merlina','Merlina Addams llega a una academia para j├│venes con habilidades especiales, donde intenta dominar sus poderes y resolver una serie de asesinatos que aterrorizan al pueblo.',2,'https://www.youtube.com/results?search_query=Merlina+Wednesday+trailer+oficial',1),(21,'The Last of Us','Veinte a├▒os despu├®s de una pandemia que devast├│ a la humanidad, un contrabandista endurecido debe escoltar a una adolescente a trav├®s de un pa├¡s en ruinas.',2,'https://www.youtube.com/results?search_query=The+Last+of+Us+serie+trailer+oficial',1),(22,'Duna','El heredero de una familia noble viaja al planeta des├®rtico m├ís peligroso del universo, fuente del recurso m├ís valioso de la galaxia, donde queda atrapado en una lucha por el poder.',NULL,'https://www.youtube.com/results?search_query=Duna+2021+trailer+oficial',2),(23,'Oppenheimer','Retrata la vida del f├¡sico que dirigi├│ el desarrollo de la primera bomba at├│mica y los dilemas morales y pol├¡ticos que lo persiguieron despu├®s.',NULL,'https://www.youtube.com/results?search_query=Oppenheimer+trailer+oficial',2),(24,'Coco','Un ni├▒o mexicano que sue├▒a con ser m├║sico viaja accidentalmente a la Tierra de los Muertos, donde busca a su tatarabuelo para descubrir la verdad sobre su familia.',NULL,NULL,2),(25,'Toy Story','Los juguetes de un ni├▒o cobran vida cuando nadie los ve, y la llegada de un moderno guardi├ín espacial pone en jaque el liderazgo de un vaquero de trapo.',NULL,NULL,2),(26,'Friends','Seis amigos que viven en Nueva York comparten trabajos, romances, mudanzas y tardes interminables en su cafeter├¡a favorita.',10,'https://www.youtube.com/results?search_query=Friends+serie+trailer',1),(27,'The Office','Un falso documental sigue el d├¡a a d├¡a de los empleados de una distribuidora de papel y de su jefe, tan bienintencionado como inc├│modo.',9,NULL,1),(28,'Interestelar','Con la Tierra al borde del colapso, un expiloto se une a una misi├│n que atraviesa un agujero de gusano en busca de un nuevo hogar para la humanidad.',NULL,'https://www.youtube.com/results?search_query=Interestelar+trailer+oficial',2),(29,'Barbie','Tras una crisis existencial, Barbie abandona su mundo perfecto y viaja junto a Ken al mundo real, donde descubre que las cosas no son como imaginaba.',NULL,'https://www.youtube.com/results?search_query=Barbie+2023+trailer+oficial',2),(30,'Dark','La desaparici├│n de dos ni├▒os en un pueblo alem├ín revela los v├¡nculos ocultos entre cuatro familias y un misterio que se extiende a lo largo de varias generaciones.',3,NULL,1);
/*!40000 ALTER TABLE `contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido_actores`
--

DROP TABLE IF EXISTS `contenido_actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido_actores` (
  `id_contenido` int NOT NULL,
  `id_actor` int NOT NULL,
  PRIMARY KEY (`id_contenido`,`id_actor`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `contenido_actores_ibfk_1` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id_contenido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contenido_actores_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id_actor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido_actores`
--

LOCK TABLES `contenido_actores` WRITE;
/*!40000 ALTER TABLE `contenido_actores` DISABLE KEYS */;
INSERT INTO `contenido_actores` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,7),(2,8),(2,9),(2,10),(2,11),(3,12),(21,12),(3,13),(3,14),(19,14),(3,15),(3,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(5,23),(5,24),(5,25),(5,26),(5,27),(6,28),(13,28),(6,29),(12,29),(6,30),(6,31),(7,32),(7,33),(7,34),(7,35),(8,36),(23,36),(8,37),(8,38),(8,39),(8,40),(9,40),(8,41),(9,42),(23,42),(9,43),(13,43),(9,44),(9,45),(10,46),(28,46),(10,47),(10,48),(10,49),(10,50),(11,51),(11,52),(11,53),(11,54),(12,55),(12,56),(12,57),(22,57),(12,58),(12,59),(13,60),(13,61),(13,62),(13,63),(13,64),(14,65),(14,66),(14,67),(14,68),(14,69),(15,70),(16,70),(17,70),(18,70),(15,71),(15,72),(15,73),(15,74),(16,75),(16,76),(16,77),(16,78),(16,79),(17,80),(17,81),(17,82),(17,83),(18,84),(18,85),(18,86),(19,87),(19,88),(19,89),(19,90),(19,91),(20,92),(20,93),(20,94),(20,95),(20,96),(21,97),(21,98),(21,99),(21,100),(22,101),(22,102),(22,103),(22,104),(22,105),(23,106),(23,107),(23,108),(28,108),(24,109),(24,110),(24,111),(24,112),(25,113),(25,114),(25,115),(25,116),(26,117),(26,118),(26,119),(26,120),(26,121),(26,122),(27,123),(27,124),(27,125),(27,126),(27,127),(28,128),(28,129),(28,130),(29,131),(29,132),(29,133),(29,134),(30,135),(30,136),(30,137),(30,138),(30,139);
/*!40000 ALTER TABLE `contenido_actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido_generos`
--

DROP TABLE IF EXISTS `contenido_generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido_generos` (
  `id_contenido` int NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id_contenido`,`id_genero`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `contenido_generos_ibfk_1` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id_contenido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contenido_generos_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido_generos`
--

LOCK TABLES `contenido_generos` WRITE;
/*!40000 ALTER TABLE `contenido_generos` DISABLE KEYS */;
INSERT INTO `contenido_generos` VALUES (1,1),(2,1),(5,1),(7,1),(11,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(21,1),(23,1),(28,1),(30,1),(1,2),(18,2),(23,2),(2,3),(6,3),(20,3),(30,3),(2,4),(7,4),(10,4),(11,4),(14,4),(15,4),(16,4),(17,4),(19,4),(3,5),(4,5),(8,5),(13,5),(15,5),(21,5),(22,5),(28,5),(30,5),(3,6),(6,6),(8,6),(9,6),(12,6),(22,6),(24,6),(28,6),(3,7),(4,7),(8,7),(9,7),(10,7),(12,7),(14,7),(4,8),(6,8),(16,8),(20,8),(25,8),(26,8),(27,8),(29,8),(12,9),(20,9),(29,9),(13,10),(21,10),(17,11),(24,12),(25,12),(24,13),(25,13);
/*!40000 ALTER TABLE `contenido_generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_genero`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (7,'Acci├│n'),(12,'Animaci├│n'),(6,'Aventura'),(5,'Ciencia Ficci├│n'),(8,'Comedia'),(1,'Drama'),(13,'Familia'),(9,'Fantas├¡a'),(2,'Hechos ver├¡dicos'),(3,'Misterio'),(11,'Romance'),(4,'Suspenso'),(10,'Terror');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-15 17:47:25
