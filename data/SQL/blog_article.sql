-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `category` varchar(45) NOT NULL,
  `author` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_user` (`author`),
  CONSTRAINT `fk_article_user` FOREIGN KEY (`author`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Le Coeur de Voh !','https://images.france.fr/zeaejvyq9bhj/3r7AgvIyLmwyS4qaIIwIoq/06b96ad0dcc1892722dde938e4d4dbad/article_ImP-CoeurCelebreMondeNouvelle-Caledonie_1120x490.jpg?w=1120&h=490&q=70&fm=webp&fit=fill','Le Cœur de Voh est une formation végétale naturelle de la commune de Voh, au nord-ouest de la Grande Terre de Nouvelle-Calédonie. Il s\'agit d’une clairière naturelle de quatre hectares dans la mangrove bordant le lagon calédonien, ce qui en fait un tanne tout à fait classique à ceci près qu\'il a, vu d\'en haut, la forme d\'un cœur stylisé1','Terre',NULL),(2,'La Poule de Hienghène !','https://lh3.googleusercontent.com/p/AF1QipMjEwLRDng7JfCui72GAPnbcrBR7Hw64U4rlD70=s680-w680-h510','Les Roches et la Poule de Hienghène se trouvent dans le lagon au large de Hienghène. On les admire depuis la route ou en s’approchant en bateau, kayak ou stand-up paddle. Pour vous rendre au village de Hienghène depuis Nouméa, le mieux est de louer une voiture pour remonter vers le nord en direction de Koné (3h20), avant d’emprunter la route Koné-Tiwaka.','Terre',NULL),(3,'Le bac de la Ouaième','https://woody.cloudly.space/app/uploads/nouvelle-caledonie/2022/12/thumbs/Bac-de-la-Ouaieme-%C2%A9-Guy-Michel-NCT-2-1920x960-crop-1670968730.jpg','Le Bac de la Ouaième est situé sur la côte Est de Nouvelle-Calédonie, à 15 min du centre de Hienghène au sud et 1h de Pouébo au nord. Pour rejoindre la côte Est depuis Nouméa, l’itinéraire idéal consiste à remonter vers le nord en direction de Koné (3h20), avant d’emprunter la route Koné-Tiwaka.','Mer',NULL),(4,'Maré (Nengone)','https://woody.cloudly.space/app/uploads/nouvelle-caledonie/2022/12/thumbs/Pehde-Mare-%C2%A9-NCT-640x480.jpg','Maré (dans la langue kanak nengone) est la deuxième île et commune des îles Loyauté (Nouvelle-Calédonie) pour ce qui est de la superficie et de la population, venant juste après Lifou. La commune fait partie de l\'aire coutumière Nengone comprenant huit districts et vingt-neuf tribus.','Mer',NULL),(5,'L\'antenne téléphonique Montravel','https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Tour_Montravel_%C3%A0_Noum%C3%A9a%2C_Province_Sud%2C_Nouvelle-Cal%C3%A9donie.jpg/1536px-Tour_Montravel_%C3%A0_Noum%C3%A9a%2C_Province_Sud%2C_Nouvelle-Cal%C3%A9donie.jpg','Sur les hauteurs de Nouméa, les curieux, au prix d\'un slalom entre les nids de poule, trouveront au pied de la tour Mobilis un point de vue à 360° sur la ville...et ce en toute quiétude, l\'endroit étant peu fréquenté. Un des mes endroits favoris pour méditer en prenant de la hauteur ^^ (accessible par la route du parc forestier )','Urbain',NULL),(6,'Lifou (Drehu)','https://upload.wikimedia.org/wikipedia/commons/5/52/Santal_Bay%2C_Lifou%2C_2007_%283%29.JPG','Lifou (en drehu : Drehu) est une île de la mer de Corail qui fait partie des îles Loyauté, dont elle est la plus importante. C\'est une commune française ainsi qu\'une aire coutumière de la Nouvelle-Calédonie.','Mer',NULL),(7,'Le Coeur de Farino','https://live.staticflickr.com/2886/8875341828_564e500932_b.jpg','Découvrez ce trou d\'eau à la forme particulière à l\'occasion d\'une randonnée dans l\'un des plus beaux parcs naturels de Nouvelle-Calédonie !','Terre',NULL),(8,'Les canons de Ouémo','http://img.over-blog.com/500x374/5/54/75/63/enfants/P1020365.JPG','La Nouvelle Calédonie commémore cette année le 70ème anniversaire du débarquement des Américains sur l\'île. En effet, le 12 mars 1942, 17 000 soldats américains débarquaient ici pour contrer l’avancée japonaise dans le Pacifique Sud : Nouméa était la plus grande base de la Navy après Pearl Harbour.','Urbain',NULL),(9,'La FOL','https://storage.googleapis.com/rrb-strapi/article/la_fol_n_existera_bientot_plus_72a65a82ca.jpeg','La Fédération des Œuvres Laïques est une association de loi 1901, créée autour des valeurs de partage, de solidarité, de justice, d’égalité, de mixité, de respect, et de fraternité. C’est une composante de la Ligue de l’Enseignement, un mouvement d\'Éducation Populaire.','Urbain',NULL),(13,'Ouv&eacute;a (Uv&eacute;a)','https://woody.cloudly.space/app/uploads/nouvelle-caledonie/2022/11/thumbs/Barefoot-Ouvea-%C2%A9-Dean-Cropp-Access-All-Angles-NCT2-1920x960-crop-1672047521.jpg','Ouv&eacute;a (en iaai : Iaai ; en fagauvea : Uvea) est un atoll de la mer de Corail, le plus septentrional de l\'archipel des &icirc;les Loyaut&eacute;, au nord-est de la Grande Terre de la Nouvelle-Cal&eacute;donie. Ouv&eacute;a est &eacute;galement une commune fran&ccedil;aise dont le centre administratif et d&eacute;mographique est Fayaou&eacute; au centre de l\'&icirc;le. Peupl&eacute;e par des populations kanak et polyn&eacute;siennes (dont des Wallisiens), Ouv&eacute;a voit s\'installer des missionnaires catholiques et protestants &agrave; partir de la seconde moiti&eacute; du xixe si&egrave;cle, mais elle ne devient pas colonie de peuplement. Elle a &eacute;t&eacute; le th&eacute;&acirc;tre de la prise d\'otages d\'Ouv&eacute;a en 1988.','Mer',2),(16,'Anse-Vata','https://www.aircalin.com/sites/default/files/styles/destination_description/public/2022-09/Noum%C3%A9a-min.PNG?h=94cc99f1&itok=Hh_iRi58','Le quartier s\'organise autour de la baie et de la plage de l\'Anse Vata qui lui donne son nom. Cette anse constitue le littoral sud-ouest de la presqu\'&icirc;le noum&eacute;enne, s\'&eacute;tendant sur plus de 2 km du rocher &agrave; la Voile &agrave; l\'ouest jusqu\'&agrave; la pointe Magnin (ou du Ch&acirc;teau Royal) au sud-est, et est &eacute;galement long&eacute;e par la Promenade Roger Laroque.\r\n\r\nLe nom d\'Anse Vata est aussi donn&eacute; &agrave; la plaine qui s\'&eacute;tend &agrave; l\'int&eacute;rieur des terres jusqu\'au Receiving et au Motor Pool, ainsi qu\'&agrave; la route qui en constitue le principal axe de communication avec la promenade Roger Laroque et qui relie du sud au nord la plage au centre-ville (au niveau de la Vall&eacute;e du G&eacute;nie).\r\n\r\nComme la baie des Citrons voisine, elle a une fonction avant tout baln&eacute;aire et touristique.\r\n','Mer',6);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 13:35:19
