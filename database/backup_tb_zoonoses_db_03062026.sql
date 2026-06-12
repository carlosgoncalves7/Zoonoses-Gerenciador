-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: zoonoses_db
-- ------------------------------------------------------
-- Server version	8.0.45

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

-- Table structure for table `admin`

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animais` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `especie` varchar(255) DEFAULT NULL,
  `raca` varchar(255) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `cor` varchar(255) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `id_tutor` int DEFAULT NULL,
  `id_funcionario_cadastro` int NOT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `id_tutor` (`id_tutor`),
  KEY `id_funcionario_cadastro` (`id_funcionario_cadastro`),
  CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`),
  CONSTRAINT `animais_ibfk_2` FOREIGN KEY (`id_funcionario_cadastro`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animais`
--

LOCK TABLES `animais` WRITE;
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
INSERT INTO `animais` VALUES (1,'Rex','Cachorro','Labrador',5,28.5,'Caramelo','Macho',1,1),(2,'Mimi','Gato','Siamês',3,4.2,'Branco','Fêmea',2,2),(3,'Thor','Cachorro','Pastor Alemão',7,35,'Preto e Marrom','Macho',3,1),(4,'Luna','Gato','Persa',2,3.8,'Cinza','Fêmea',4,3),(5,'Bob','Cachorro','Bulldog Francês',4,12.3,'Branco e Preto','Macho',5,2),(6,'Mel','Cachorro','Pinscher',1,2.1,'Marrom','Fêmea',NULL,1),(7,'Pingo','Gato','Siamês',2,0.3,'Amarelo','Macho',NULL,3),(8,'Nina','Cachorro','Poodle',6,8.7,'Branco','Fêmea',6,1),(9,'Fred','Gato','SRD',5,6.5,'Cinza Escuro','Macho',NULL,2),(10,'Pandora','Cachorro','Golden Retriever',3,30.2,'Dourado','Fêmea',7,3),(11,'Rex','Cachorro','Labrador',3,30.5,'Amarelo','Macho',11,1),(12,'Luna','Gato','Siames',2,4.2,'Bege','Femea',14,1),(13,'Mel','Cachorro','Poodle',5,6.8,'Branco','Femea',18,2),(14,'Thor','Cachorro','Vira-lata',4,15.2,'Caramelo','Macho',22,1),(15,'Mia','Gato','Persa',1,3.8,'Cinza','Femea',25,2),(16,'Bob','Cachorro','Golden Retriever',6,32,'Dourado','Macho',29,3),(17,'Pipoca','Gato','Vira-lata',2,4,'Preto e Branco','Femea',31,1),(18,'Fred','Cachorro','Bulldog',4,22.1,'Marrom','Macho',35,2),(19,'Nala','Gato','Angora',3,4.5,'Branco','Femea',12,1),(20,'Simba','Gato','Vira-lata',5,5.1,'Laranja','Macho',17,2),(21,'Meg','Cachorro','Pinscher',2,3.1,'Preto','Femea',20,1),(22,'Luke','Cachorro','Border Collie',3,19.5,'Preto e Branco','Macho',27,3),(23,'Oliver','Gato','Maine Coon',4,8.5,'Cinza','Macho',33,2),(24,'Amora','Cachorro','Shih Tzu',1,4.9,'Preto e Branco','Femea',15,1),(25,'Apollo','Cachorro','Pastor Alemao',7,36.4,'Capote','Macho',24,2);
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Ana Paula Ribeiro','ana.ribeiro@empresa.com','123456'),(2,'Marcos Vinicius Santos','marcos.santos@empresa.com','senha123'),(3,'Fernanda Costa Lima','fernanda.lima@empresa.com','admin789');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimentos`
--

DROP TABLE IF EXISTS `procedimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimentos` (
  `id_procedimento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_procedimento` varchar(40) NOT NULL DEFAULT '2026-06-02',
  `id_veterinario` int NOT NULL,
  `id_tutor` int NOT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id_procedimento`),
  KEY `id_veterinario` (`id_veterinario`),
  KEY `id_tutor` (`id_tutor`),
  KEY `id_animal` (`id_animal`),
  CONSTRAINT `procedimentos_ibfk_1` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinarios` (`id_veterinario`),
  CONSTRAINT `procedimentos_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `tutores` (`id_tutor`),
  CONSTRAINT `procedimentos_ibfk_3` FOREIGN KEY (`id_animal`) REFERENCES `animais` (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimentos`
--

LOCK TABLES `procedimentos` WRITE;
/*!40000 ALTER TABLE `procedimentos` DISABLE KEYS */;
INSERT INTO `procedimentos` VALUES (71,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-02',1,1,1),(72,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-02',2,2,2),(73,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-02',3,3,3),(74,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-03',1,4,4),(75,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-03',2,5,5),(76,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-03',3,6,8),(77,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-04',1,7,10),(78,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-04',2,11,11),(79,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-04',3,14,12),(80,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-05',1,18,13),(81,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-05',2,22,14),(82,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-05',3,25,15),(83,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-08',1,29,16),(84,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-08',2,31,17),(85,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-08',3,35,18),(86,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-09',1,12,19),(87,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-09',2,17,20),(88,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-09',3,20,21),(89,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-10',1,27,22),(90,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-10',2,33,23),(91,'Castração','Procedimento cirúrgico de castração (Ovariohisterectomia) - Fêmea','2026-06-10',3,15,24),(92,'Castração','Procedimento cirúrgico de castração (Orquiectomia) - Macho','2026-06-11',1,24,25);
/*!40000 ALTER TABLE `procedimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutores`
--

DROP TABLE IF EXISTS `tutores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutores` (
  `id_tutor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `rg` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_funcionario_cadastro` int NOT NULL,
  PRIMARY KEY (`id_tutor`),
  KEY `id_funcionario_cadastro` (`id_funcionario_cadastro`),
  CONSTRAINT `tutores_ibfk_1` FOREIGN KEY (`id_funcionario_cadastro`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutores`
--

LOCK TABLES `tutores` WRITE;
/*!40000 ALTER TABLE `tutores` DISABLE KEYS */;
INSERT INTO `tutores` VALUES (1,'Carlos Eduardo Silva','Rua das Palmeiras, 120 - São Paulo/SP','123.456.789-01','12.345.678-9','(11) 99999-1001','carlos.silva@email.com',1),(2,'Mariana Oliveira Souza','Av. Brasil, 450 - Campinas/SP','234.567.890-12','23.456.789-0','(19) 98888-2002','mariana.souza@email.com',2),(3,'Fernando Lima Costa','Rua XV de Novembro, 78 - Santos/SP','345.678.901-23','34.567.890-1','(13) 97777-3003','fernando.costa@email.com',1),(4,'Juliana Pereira Alves','Rua Central, 890 - Sorocaba/SP','456.789.012-34','45.678.901-2','(15) 96666-4004','juliana.alves@email.com',3),(5,'Ricardo Mendes Rocha','Av. Independência, 321 - Ribeirão Preto/SP','567.890.123-45','56.789.012-3','(16) 95555-5005','ricardo.rocha@email.com',2),(6,'Patrícia Gomes Ferreira','Rua Aurora, 654 - São José dos Campos/SP','678.901.234-56','67.890.123-4','(12) 94444-6006','patricia.ferreira@email.com',1),(7,'André Luiz Martins','Av. Paulista, 1500 - São Paulo/SP','789.012.345-67','78.901.234-5','(11) 93333-7007','andre.martins@email.com',1),(8,'Camila Rodrigues Melo','Rua do Comércio, 44 - Guarulhos/SP','890.123.456-78','89.012.345-6','(11) 92222-8008','camila.melo@email.com',3),(9,'Lucas Henrique Barros','Rua Bela Vista, 700 - Osasco/SP','901.234.567-89','90.123.456-7','(11) 91111-9009','lucas.barros@email.com',2),(10,'Beatriz Fernandes Lopes','Av. Europa, 980 - Santo André/SP','012.345.678-90','01.234.567-8','(11) 90000-1010','beatriz.lopes@email.com',1),(11,'Ana Silva','Rua das Flores, 123 - Centro','111.222.333-44','12.345.678-9','(11) 98765-4321','ana.silva@email.com',2),(12,'Carlos Oliveira','Av. Paulista, 1000 - Bela Vista','222.333.444-55','23.456.789-0','(11) 91234-5678','carlos.oliveira@email.com',3),(13,'Mariana Costa','Rua Augusta, 500 - Consolação','333.444.555-66','34.567.890-1','(11) 99876-5432','mariana.costa@email.com',1),(14,'João Pereira','Praça da Sé, s/n - Centro','444.555.666-77','45.678.901-2','(11) 97654-3210','joao.pereira@email.com',1),(15,'Beatriz Souza','Rua Oscar Freire, 200 - Jardins','555.666.777-88','56.789.012-3','(11) 96543-2109','beatriz.souza@email.com',3),(16,'Lucas Santos','Av. Brasil, 456 - Jd. Paulista','123.456.789-00','12.345.678-0','(11) 92345-6789','lucas.santos@email.com',1),(17,'Camila Rodrigues','Rua Voluntários da Pátria, 789 - Santana','234.567.890-11','23.456.789-1','(11) 93456-7890','camila.rod@email.com',2),(18,'Rafael Almeida','Av. Rebouças, 1200 - Pinheiros','345.678.901-22','34.567.890-2','(11) 94567-8901','rafael.almeida@email.com',3),(19,'Amanda Lima','Rua Domingos de Morais, 300 - Vila Mariana','456.789.012-33','45.678.901-3','(11) 95678-9012','amanda.lima@email.com',3),(20,'Diego Ribeiro','Av. Ipiranga, 850 - República','567.890.123-44','56.789.012-4','(11) 96789-0123','diego.ribeiro@email.com',1),(21,'Larissa Carvalho','Rua Pamplona, 410 - Jardim Paulista','678.901.234-55','67.789.012-5','(11) 97890-1234','larissa.c@email.com',2),(22,'Rodrigo Gomes','Alameda Lorena, 1500 - Cerqueira César','789.012.345-66','78.901.234-6','(11) 98901-2345','rodrigo.gomes@email.com',3),(23,'Juliana Martins','Av. Brigadeiro Luís Antônio, 2300 - Bela Vista','890.123.456-77','89.012.345-7','(11) 99012-3456','juliana.m@email.com',1),(24,'Gabriel Barbosa','Rua Clélia, 600 - Lapa','901.234.567-88','90.123.456-8','(11) 91122-3344','gabriel.b@email.com',1),(25,'Fernanda Rocha','Av. Jabaquara, 1400 - Saúde','012.345.678-99','01.234.567-9','(11) 92233-4455','fernanda.rocha@email.com',2),(26,'Bruno Costa','Rua Vergueiro, 3000 - Vila Mariana','135.246.357-11','11.223.344-5','(11) 93344-5566','bruno.costa@email.com',3),(27,'Letícia Dias','Av. Santo Amaro, 4500 - Brooklin','246.357.468-22','22.334.455-6','(11) 94455-6677','leticia.dias@email.com',2),(28,'Thiago Mendes','Rua Teodoro Sampaio, 800 - Pinheiros','357.468.579-33','33.445.566-7','(11) 95566-7788','thiago.m@email.com',1),(29,'Aline Teixeira','Av. Vital Brasil, 1100 - Butantã','468.579.680-44','44.556.677-8','(11) 96677-8899','aline.t@email.com',2),(30,'Felipe Cardoso','Rua Maria Antônia, 250 - Consolação','579.680.791-55','55.667.788-9','(11) 97788-9900','felipe.c@email.com',3),(31,'Patrícia Neves','Av. Eng. Luís Carlos Berrini, 900 - Brooklin','680.791.902-66','66.778.899-0','(11) 98899-0011','patricia.n@email.com',3),(32,'Gustavo Vieira','Rua Heitor Penteado, 1300 - Sumaré','791.902.013-77','77.889.900-1','(11) 99900-1122','gustavo.v@email.com',1),(33,'Bruna Marques','Av. Nova Cantareira, 500 - Tucuruvi','802.013.124-88','88.990.011-2','(11) 91234-4321','bruna.m@email.com',2),(34,'Leonardo Souza','Rua São Bento, 100 - Centro','913.124.235-99','89.012.123-4','(11) 92345-5432','leo.souza@email.com',3),(35,'Vanessa Araujo','Av. Cruzeiro do Sul, 2200 - Canindé','124.235.346-00','78.901.890-5','(11) 93456-6543','vanessa.a@email.com',1);
/*!40000 ALTER TABLE `tutores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarios` (
  `id_veterinario` int NOT NULL AUTO_INCREMENT,
  `crmv` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarios`
--

LOCK TABLES `veterinarios` WRITE;
/*!40000 ALTER TABLE `veterinarios` DISABLE KEYS */;
INSERT INTO `veterinarios` VALUES (1,12345,'Drª. Mariana Silva','mariana.silva@vet.com'),(2,67890,'Drª. Beatriz Souza','beatriz.souza@vet.com'),(3,54321,'Drª. Juliana Costa','juliana.costa@vet.com');
/*!40000 ALTER TABLE `veterinarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-03 16:25:54
