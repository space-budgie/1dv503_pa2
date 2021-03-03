-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: AuctionHouseDB
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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

--
-- Table structure for table `Artwork`
--

DROP DATABASE IF EXISTS `AuctionHouseDB`;
CREATE DATABASE `AuctionHouseDB` DEFAULT CHARACTER SET `utf8`;
USE `AuctionHouseDB`;

DROP TABLE IF EXISTS `Artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artwork` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(61) NOT NULL,
  `artist` varchar(30) NOT NULL,
  `year` int DEFAULT NULL,
  `medium` varchar(70) DEFAULT NULL,
  `dimensions` varchar(79) DEFAULT NULL,
  `url` varchar(109) DEFAULT NULL,
  `initialPrice` int DEFAULT NULL,
  `sold` tinyint(1) DEFAULT NULL,
  `location` mediumint unsigned NOT NULL,
  `seller` mediumint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `seller` (`seller`),
  CONSTRAINT `Artwork_ibfk_1` FOREIGN KEY (`location`) REFERENCES `AuctionHouse` (`id`),
  CONSTRAINT `Artwork_ibfk_2` FOREIGN KEY (`seller`) REFERENCES `Seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artwork`
--

LOCK TABLES `Artwork` WRITE;
/*!40000 ALTER TABLE `Artwork` DISABLE KEYS */;
INSERT INTO `Artwork` VALUES (1,'Woman with Fur Wrap','Penagos, Rafael',1976,'Lithograph on paper','image: 775 x 575 mm','http://www.tate.org.uk/art/artworks/penagos-woman-with-fur-wrap-p06740',42062361,1,7,1),(2,'Wall Drawing #1136','LeWitt, Sol',2004,'Paint on wall','Overall display dimensions variable','http://www.tate.org.uk/art/artworks/lewitt-wall-drawing-1136-ar00165',58912733,1,1,2),(3,'Two Hunters with a Groom','Agasse, Jacques Laurent',1805,'Oil paint on canvas','support: 638 x 759 mm frame: 805 x 925 x 87 mm','http://www.tate.org.uk/art/artworks/agasse-two-hunters-with-a-groom-t02350',3447206,0,1,3),(4,'The Struggle','Afro',1951,'Crayon, watercolour and gouache on paper','support: 267 x 210 mm','http://www.tate.org.uk/art/artworks/afro-the-struggle-t00017',87173716,1,9,4),(5,'The Musician','Levy, Simon',1925,'Oil paint on canvas','support: 1213 x 857 mm frame: 1315 x 966 x 78 mm','http://www.tate.org.uk/art/artworks/levy-the-musician-n05032',28233686,1,4,5),(6,'The Big Step','Pertz, Markus',1968,'Oil paint on canvas','support (right): 3005 x 1518 x 30 mm support (left): 3003 x 1523 x 30 mm','http://www.tate.org.uk/art/artworks/lupertz-the-big-step-t12056',43788340,1,7,6),(7,'Table and Pillar','Ai, Weiwei',2002,NULL,'unconfirmed: 4600 x 900 x 900 mm','http://www.tate.org.uk/art/artworks/ai-table-and-pillar-t12809',64633519,1,8,7),(8,'Study for Homage to Watteau','Lhote, Andr�',1918,'Oil paint on canvas','support: 333 x 360 mm','http://www.tate.org.uk/art/artworks/lhote-study-for-homage-to-watteau-n05073',77162878,1,4,8),(9,'Ruins at Torre Wood','Penley, Aaron Edwin',1842,'Graphite on paper',NULL,'http://www.tate.org.uk/art/artworks/penley-ruins-at-torre-wood-n02391',56820830,1,7,9),(10,'Red Apples, New York','Penn, Irving',1985,'Photograph, colour, on paper','support: 235 x 186 mm frame: 383 x 324 x 25 mm','http://www.tate.org.uk/art/artworks/penn-red-apples-new-york-p13084',55554279,1,1,10),(11,'Mrs Elizabeth Graves','Penny, Edward',NULL,'Gouache on canvas','support: 368 x 318 mm','http://www.tate.org.uk/art/artworks/penny-mrs-elizabeth-graves-n03570',94956426,1,7,11),(12,'Morning after the Flood','Adshead, Mary',1928,'Tempera on canvas','support: 515 x 427 mm frame: 630 x 540 x 65 mm','http://www.tate.org.uk/art/artworks/adshead-morning-after-the-flood-t07228',14651643,0,9,12),(13,'London with Mr H','Percy, Lady Susan Elizabeth',1796,'Graphite and watercolour on paper',NULL,'http://www.tate.org.uk/art/artworks/percy-london-with-mr-h-cut-t10694',41050064,1,3,13),(14,'Le Grand Jour','Penrose, Sir Roland',1938,'Oil paint on canvas','support: 762 x 1010 mm frame: 851 x 1110 x 55 mm','http://www.tate.org.uk/art/artworks/penrose-le-grand-jour-t00671',81679114,1,9,14),(15,'Large Bear','Lucy and Eegyudluk',1961,'Lithograph on paper','image: 368 x 549 mm','http://www.tate.org.uk/art/artworks/lucy-and-eegyudluk-large-bear-p01892',37281905,1,6,15),(16,'In Snowdonia','Percy, Sidney Richard',1853,'Oil paint on canvas','unconfirmed: 552 x 789 mm frame: 890 x 1135 x 110 mm','http://www.tate.org.uk/art/artworks/percy-in-snowdonia-t07049',64844587,1,3,16),(17,'Hereford, from the Haywood, Noon','Lewis, George Robert',1815,'Oil paint on canvas',NULL,'http://www.tate.org.uk/art/artworks/lewis-hereford-from-the-haywood-noon-n02960',86050584,0,6,17),(18,'Head of Dylan Thomas','Agar, Eileen',1960,NULL,'support: 600 x 435 mm frame: 875 x 628 x 29 mm','http://www.tate.org.uk/art/artworks/agar-head-of-dylan-thomas-t00492',7518857,1,2,18),(19,'Edfu, Upper Egypt','Lewis, John Frederick',1860,'Oil paint on mahogany',NULL,'http://www.tate.org.uk/art/artworks/lewis-edfu-upper-egypt-n01405',74063020,1,6,19),(20,'Dwelling, Ordsall Lane, Salford','Lowry, L.S.',1927,'Oil paint on wood','support: 432 x 533 mm','http://www.tate.org.uk/art/artworks/lowry-dwelling-ordsall-lane-salford-n05003',2904574,0,5,20),(21,'Dulcimer','Scott, Tim',1961,'Wood, fibreglass and glass','object: 914 x 3048 x 914 mm','http://www.tate.org.uk/art/artworks/scott-dulcimer-t01212',1201973,1,7,2),(22,'Cut Bottle Relief','Adzak, Roy',NULL,'Acrylic paint on brass','object: 330 x 406 x 73 mm','http://www.tate.org.uk/art/artworks/adzak-cut-bottle-relief-t00875',55724628,0,1,9),(23,'Consolation Service','Ahtila, Eija-Liisa',1999,'Video, 2 projections, colour and sound (stereo)','variable','http://www.tate.org.uk/art/artworks/ahtila-consolation-service-t07783',37488908,1,5,7),(24,'Calligraphic Book','Li, Yuan-chia',1993,'Paint on fabric on paper','105 x 460 mm','http://www.tate.org.uk/art/artworks/li-calligraphic-book-t11868',1682716,1,6,5),(25,'Woman in Red','Lundquist, Evert',1956,'Oil paint on canvas','support: 1000 x 902 mm','http://www.tate.org.uk/art/artworks/lundquist-woman-in-red-t00208',52012217,0,7,4),(26,'Venus and Adonis','Lozoff, Abrasha',1925,NULL,'object: 1118 x 838 x 495 mm','http://www.tate.org.uk/art/artworks/lozoff-venus-and-adonis-t00255',90904175,1,1,15),(27,'To Unroll One Skin','Penone, Giuseppe',1970,'648 photographs, gelatin silver print on paper, mounted onto 18 panels','panel, each: 535 x 735 x 25 mm','http://www.tate.org.uk/art/artworks/penone-to-unroll-ones-skin-p80079',82567563,1,6,6),(28,'Three-part Space Construction','Peri, Peter',1923,'Lithograph on paper',NULL,'http://www.tate.org.uk/art/artworks/peri-three-part-space-construction-p13020',83282318,1,1,2),(29,'The Rag and Bone Man','Lewis, A. Neville',1937,'Graphite on paper','support: 381 x 279 mm','http://www.tate.org.uk/art/artworks/lewis-the-rag-and-bone-man-n03641',1406715,1,4,3),(30,'The Path by the River','Peppercorn, Arthur Douglas',NULL,'Oil paint on canvas','support: 925 x 1378 mm','http://www.tate.org.uk/art/artworks/peppercorn-the-path-by-the-river-n03035',56037330,1,9,14),(31,'The Eve of the Deluge','Scott, William Bell',1865,'Oil paint on canvas','support: 324 x 445 mm frame: 620 x 745 x 115 mm','http://www.tate.org.uk/art/artworks/scott-the-eve-of-the-deluge-n01322',88027486,0,6,8),(32,'The Crofters Team','Macallum, Hamilton',1896,'Oil paint on canvas',NULL,'http://www.tate.org.uk/art/artworks/macallum-the-crofters-team-n01502',69155357,1,7,16),(33,'Subtitled Public','Lozano-Hemmer, Rafael',2005,NULL,'display dimensions variable','http://www.tate.org.uk/art/artworks/lozano-hemmer-subtitled-public-t12565',21259992,1,1,19),(34,'Sod You Gits','Lucas, Sarah',1991,'4 photocopies on paper on wooden panel','image: 305 x 406 mm image: 305 x 406 mm image: 305 x 406 mm image: 305 x 406 mm','http://www.tate.org.uk/art/artworks/lucas-sod-you-gits-p78205',32067288,0,5,19),(35,'Red Scene','Lewis, Wyndham',1933,'Oil paint on canvas','support: 711 x 914 mm frame: 925 x 1125 x 85 mm','http://www.tate.org.uk/art/artworks/lewis-red-scene-n04913',99972568,1,7,9),(36,'Rails I','Pearsh, Kevin',1976,NULL,'image: 260 x 349 mm','http://www.tate.org.uk/art/artworks/pearsh-rails-i-p01809',5483719,0,4,12),(37,'Quay Street, Ireland','Lewis, Morland',1937,'Oil paint on board','support: 222 x 270 mm','http://www.tate.org.uk/art/artworks/lewis-quay-street-ireland-n05561',77605755,1,1,16),(38,'Panel 21','Lucio',1959,'Oil paint on wood','support: 698 x 1089 mm','http://www.tate.org.uk/art/artworks/lucio-panel-21-t00476',58847438,1,8,15),(39,'Neighbourhood Witch','Periton, Simon',2008,'Silkscreen on paper','image: 360 x 300 mm','http://www.tate.org.uk/art/artworks/periton-neighbourhood-witch-p79392',79129389,1,6,5),(40,'Moorland Landscape with Cottages','Macartney, Carlile Henry Hayes',NULL,'Watercolour on paper','support: 236 x 333 mm','http://www.tate.org.uk/art/artworks/macartney-moorland-landscape-with-cottages-t08609',49670879,1,6,18),(41,'Moonscape','Lichtenstein, Roy',1965,NULL,'unconfirmed: 508 x 610 mm','http://www.tate.org.uk/art/artworks/lichtenstein-moonscape-p01795',51284390,1,3,12),(42,'Mackerel on a Plate','Scott, William',1951,'Oil paint on canvas','support: 559 x 762 mm frame: 752 x 960 x 100 mm','http://www.tate.org.uk/art/artworks/scott-mackerel-on-a-plate-n06245',44799178,0,1,19),(43,'Liza','Perera, Ed',1977,'Lithograph on paper',NULL,'http://www.tate.org.uk/art/artworks/perera-liza-p06801',40017766,0,7,10),(44,'Ignis Fatuus','Pegram, Henry Alfred',NULL,'Bronze','displayed: 720 x 720 x 140 mm','http://www.tate.org.uk/art/artworks/pegram-ignis-fatuus-n01756',59820365,1,7,17),(45,'How to Train Little Girls','Libera, Zbigniew',1987,'Video, monitor, colour and sound','unconfirmed: 16min, 52sec Overall display dimensions variable','http://www.tate.org.uk/art/artworks/libera-how-to-train-little-girls-t13228',80358735,1,9,5),(46,'Dartsman and Organ Grinder','Lowndes, Alan',1972,'Lithograph on paper','image: 505 x 657 mm','http://www.tate.org.uk/art/artworks/lowndes-dartsman-and-organ-grinder-p06334',9755693,1,6,16),(47,'Communication','Penck, A.R.',1983,'Engraving and aquatint on paper',NULL,'http://www.tate.org.uk/art/artworks/penck-communication-p77019',41333,1,7,8),(48,'Burn Hole','Peeters, Henk',1961,'Plastic and wood','support: 800 x 1010 mm','http://www.tate.org.uk/art/artworks/peeters-burn-hole-t13407',5007620,1,8,13),(49,'After Culloden, Rebel Hunting','Lucas, John Seymour',1884,'Oil paint on canvas','support: 1426 x 1962 mm','http://www.tate.org.uk/art/artworks/lucas-after-culloden-rebel-hunting-n01620',98690140,1,9,9),(50,'A Barge Seen from aft of the Port Beam, with a Pram Alongside','Scott, Samuel',NULL,NULL,NULL,'http://www.tate.org.uk/art/artworks/scott-a-barge-seen-from-aft-of-the-port-beam-with-a-pram-alongside-d36334',30119505,0,8,11);
/*!40000 ALTER TABLE `Artwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuctionHouse`
--

DROP TABLE IF EXISTS `AuctionHouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuctionHouse` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuctionHouse`
--

LOCK TABLES `AuctionHouse` WRITE;
/*!40000 ALTER TABLE `AuctionHouse` DISABLE KEYS */;
INSERT INTO `AuctionHouse` VALUES (1,'Aliquam Auctor Velit Company','54989343438','Dover','D6 9CW','United Kingdom'),(2,'Tempus Scelerisque Lorem LLC','40802325375','Rezzoaglio','86444','Italy'),(3,'Ut Nec Urna Incorporated','01439682272','Knighton','P1 8AN','United Kingdom'),(4,'Vel Mauris Integer Associates','22813771565','Utrecht','8037 XX','Netherlands'),(5,'Feugiat Nec PC','34148112765','Sannazzaro de\' Burgondi','38665','Italy'),(6,'Amet Industries','54824973061','Perinaldo','47847','Italy'),(7,'Phasellus LLC','99392234105','Colledimacine','11913','Italy'),(8,'Proin Dolor Company','14895704616','Macerata','70575','Italy'),(9,'Eleifend Company','58107604115','Newcastle-upon-Tyne','I43 0FR','United Kingdom'),(10,'Aliquam Eu Accumsan Institute','65969107592','Heusden','8733 CY','Netherlands');
/*!40000 ALTER TABLE `AuctionHouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Buyer`
--

DROP TABLE IF EXISTS `Buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buyer` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `CreditCard` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buyer`
--

LOCK TABLES `Buyer` WRITE;
/*!40000 ALTER TABLE `Buyer` DISABLE KEYS */;
INSERT INTO `Buyer` VALUES (1,'Judah Gregory','75356079880','Dumfries','ZI7R 2BO','United Kingdom','5380035693993755'),(2,'Marcia Ruiz','62706341362','Meppel','6251 RM','Netherlands','5431146329090103'),(3,'Yvonne Galloway','08847503082','Trinità d\'Agultu e Vignola','79250','Italy','5393039190826315'),(4,'Thaddeus Martin','68498819978','Hastings','R18 2CY','United Kingdom','5440699551222157'),(5,'Lenore Welch','15333841392','Challand-Saint-Victor','56736','Italy','5432603871262729'),(6,'Gillian Copeland','73889949533','Zeist','1396 UD','Netherlands','5569004860209091'),(7,'Riley Phelps','37765601692','Amsterdam','7759 QQ','Netherlands','5516258490805173'),(8,'Hayes Holcomb','38476478201','Almere','7549 RO','Netherlands','5584473534230489'),(9,'Gillian Dodson','00154269712','Scunthorpe','H9R 1LP','United Kingdom','5326079104629506'),(10,'Anthony Cortez','32044894318','Leicester','N4K 2YX','United Kingdom','5401938832352681'),(11,'Amos Faulkner','01234362391','San Clemente','52592','Italy','5323075284155000'),(12,'Bertha Massey','63711589787','Milford Haven','N6A 8TS','United Kingdom','5253481641637488'),(13,'Elijah Dominguez','06866150394','Bionaz','42591','Italy','5112594128630080'),(14,'Cathleen Garza','87812936909','Acquasanta Terme','11189','Italy','5315291653941033'),(15,'Zephania Hartman','53297237197','Hengelo','6917 GW','Netherlands','5476637852729360'),(16,'Dale Harvey','58374961003','Meeuwen','7833 EI','Netherlands','5229862651734656'),(17,'Bree Hardin','42976782088','Napoli','89825','Italy','5131943845862707'),(18,'Barry Rasmussen','40578244557','Anzi','09771','Italy','5269886620861192'),(19,'Hashim Cotton','21418349847','Brechin','U4H 8NF','United Kingdom','5397362545126793'),(20,'Yoko Pollard','29769706384','Halesowen','PM7S 4LX','United Kingdom','5264600131583293');
/*!40000 ALTER TABLE `Buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receipts`
--

DROP TABLE IF EXISTS `Receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Receipts` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `finalPrice` bigint NOT NULL,
  `artwork` mediumint unsigned NOT NULL,
  `auctionHouse` mediumint unsigned NOT NULL,
  `buyer` mediumint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `artwork` (`artwork`),
  KEY `auctionHouse` (`auctionHouse`),
  KEY `buyer` (`buyer`),
  CONSTRAINT `Receipts_ibfk_1` FOREIGN KEY (`artwork`) REFERENCES `Artwork` (`id`),
  CONSTRAINT `Receipts_ibfk_2` FOREIGN KEY (`auctionHouse`) REFERENCES `AuctionHouse` (`id`),
  CONSTRAINT `Receipts_ibfk_3` FOREIGN KEY (`buyer`) REFERENCES `Buyer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receipts`
--

LOCK TABLES `Receipts` WRITE;
/*!40000 ALTER TABLE `Receipts` DISABLE KEYS */;
INSERT INTO `Receipts` VALUES (1,'1998-11-17',47630139,1,7,1),(2,'1993-02-03',61183041,2,1,2),(3,'1995-04-17',91282880,4,9,3),(4,'2005-08-04',30277172,5,4,4),(5,'1993-03-18',50677923,6,7,5),(6,'2007-10-14',65419604,7,8,6),(7,'1995-02-07',85621701,8,4,7),(8,'2014-01-04',61955007,9,7,8),(9,'2002-05-05',59266697,10,1,9),(10,'2003-05-02',100804689,11,7,10),(11,'2015-09-24',48441774,13,3,11),(12,'1991-02-24',83084589,14,9,12),(13,'1995-07-15',41931175,15,6,13),(14,'2014-11-22',73090934,16,3,14),(15,'2011-02-23',11129633,18,2,15),(16,'2014-07-28',76707546,19,6,16),(17,'2014-07-20',7177663,21,7,17),(18,'2003-04-16',43799521,23,5,18),(19,'2000-11-26',1973045,24,6,19),(20,'2019-11-12',92401712,26,1,20),(21,'1999-10-24',87258220,27,6,1),(22,'2016-11-15',92801436,28,1,5),(23,'1996-02-15',9723862,29,4,18),(24,'2009-10-20',58710055,30,9,6),(25,'2003-12-16',75099944,32,7,16),(26,'2009-11-01',21689613,33,1,19),(27,'1998-10-19',108128822,35,7,8),(28,'1992-04-19',85382699,37,1,13),(29,'1995-05-24',61491677,38,8,13),(30,'2002-01-01',84218167,39,6,2),(31,'2008-04-08',50660004,40,6,14),(32,'1992-07-16',60391862,41,3,5),(33,'1993-04-19',64652591,44,7,19),(34,'2007-02-03',82970875,45,9,9),(35,'1990-07-05',11402208,46,6,16),(36,'2013-06-16',2313107,47,7,6),(37,'1991-03-08',11575496,48,8,17),(38,'1997-02-19',103815483,49,9,3);
/*!40000 ALTER TABLE `Receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seller`
--

DROP TABLE IF EXISTS `Seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seller` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `BankAccount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seller`
--

LOCK TABLES `Seller` WRITE;
/*!40000 ALTER TABLE `Seller` DISABLE KEYS */;
INSERT INTO `Seller` VALUES (1,'Gareth Porter','33087283415','Bonvicino','33423','Italy','5452089674066613'),(2,'Matthew Conner','49698566788','Pomarolo','59680','Italy','5149089407843527'),(3,'Ezekiel Cunningham','43364708915','Harlingen','1311 LS','Netherlands','5549374821457872'),(4,'Karleigh Price','33089163063','Nuneaton','MB1C 0VY','United Kingdom','5194125538622549'),(5,'Aileen Mann','03242227399','Maltignano','22319','Italy','5514702754315694'),(6,'Porter Collier','13263750690','Woerden','7185 YK','Netherlands','5153070509030208'),(7,'Kiona Fowler','71639868446','Solesino','30903','Italy','5281668561562789'),(8,'Whitney Townsend','11379539720','Acquasparta','96512','Italy','5495227157386160'),(9,'Fredericka Nguyen','17518634146','Sorgà','34433','Italy','5119917354796841'),(10,'Vance Guerrero','87891151655','Altamura','52753','Italy','5532437967886243'),(11,'Quentin Donaldson','41109870250','Nijmegen','9034 QM','Netherlands','5232695081631653'),(12,'Colleen Beasley','44528345632','Durham','OG99 5HW','United Kingdom','5253704180892812'),(13,'Plato Dejesus','35944002858','Ammanford','O67 5MM','United Kingdom','5173130912451882'),(14,'Shannon Crane','88944393075','Horsham','U6H 0QE','United Kingdom','5423153620926522'),(15,'Kiara Barber','83294798634','Tufo','41043','Italy','5387761556721792'),(16,'Linda Bennett','15688682764','Helmond','9027 ZI','Netherlands','5438937611822788'),(17,'Knox Kline','01911767574','Milton Keynes','Z9V 0EZ','United Kingdom','5370108109589277'),(18,'Barclay Carpenter','88383697963','Helmond','6738 JV','Netherlands','5559509741837490'),(19,'Kareem Paul','42245508839','Portofino','71240','Italy','5502544796121183'),(20,'Petra Browning','27046804517','Montese','57379','Italy','5356059943555727');
/*!40000 ALTER TABLE `Seller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-03 18:43:53
