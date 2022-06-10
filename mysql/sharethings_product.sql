-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sharethings
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productNo` int NOT NULL AUTO_INCREMENT,
  `customerNo` int DEFAULT NULL,
  `productCategory` varchar(45) DEFAULT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `productImgURL` varchar(200) DEFAULT NULL,
  `lendingPeriod` varchar(20) DEFAULT NULL,
  `exchangeProduct` varchar(50) DEFAULT NULL,
  `productInformation` varchar(300) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `productLike` int DEFAULT '0',
  `deal` tinyint(1) DEFAULT '0',
  `opponentproduct` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productNo`),
  KEY `customerNo` (`customerNo`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`customerNo`) REFERENCES `customer` (`customerNo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'clothing','가디건','가디건.jpg','50일',NULL,'가디건 10일 동안 대여해드려요. 언제든지 연락주세요','10000원','2020-12-13 19:10:21',0,0,NULL),(2,1,'clothing','구두','구두.jpg','10일',NULL,'구두 대여해드려요. 30일동안 90000만원입니다. 원가 매우 비싸니 대여 추천드려요.','3000원','2020-12-13 19:11:22',0,0,NULL),(3,1,'clothing','빨간구두','구두1.jpg','20일',NULL,'빨간구두와 검정구두 교환해요. 20일 정도 교환 원합니다. 언제든지 연락주세요',NULL,'2020-12-13 19:11:59',0,0,'검정구두'),(4,1,'tool','블루투스키보드','블루투스 키보드.jpg','48일',NULL,'지금 유선 키보드가 급히 필요합니다. 블루투스 키보드 갖고 있으니 유선 키보드가 있으신 분은 언제든지 연락주세요. 오후에는 언제든 바로 답장드려요.',NULL,'2020-12-13 19:12:46',0,0,'유선키보드'),(5,1,'others','스타벅스 텀블러','스타벅스텀블러.jpg','14일',NULL,'스타벅스만 아니면 돼요. 아무 텀블러나 괜찮으니 연락주세요',NULL,'2020-12-13 19:13:18',1,0,'텀블러'),(6,2,'furniture','회색소파','소파3.jpg','22일',NULL,'회색소파 대여해드려요. 세련된 소파 원하시는 분은 연락주세요.','19000원','2020-12-13 19:14:05',0,0,NULL),(7,2,'furniture','소파','소파1.jpg','35일',NULL,'검은색 소파만 아니면 아무거나 상관없으니 교환해요.',NULL,'2020-12-13 19:14:56',0,0,'소파'),(8,2,'electronics','블루투스 기계식 키보드','노랑키보드.png','43일',NULL,'80일 동안 대여해드릴 수 있어요. 언제든 연락주세요.','7000원','2020-12-13 19:15:32',0,0,NULL),(9,2,'electronics','아이폰','아이폰.jpg','43일',NULL,'아이폰 대여해드려요.','5000원','2020-12-13 19:15:52',0,0,NULL),(10,2,'electronics','삼성 노트북','삼성노트북.jpg','60일',NULL,'엘지 노트북 구해요. 제발 교환해주세요.',NULL,'2020-12-13 19:16:24',0,0,'엘지 노트북'),(11,1,'clothing','청바지','청바지.jpg','18일',NULL,'청바지 대여해드려요. 사이즈는 L사이즈이고 기장 93입니다.','2000원','2020-12-13 20:20:56',0,0,NULL),(12,1,'clothing','원피스','원피스.jpg','7일',NULL,'전체적인 컬러가 노란색인 원피스 구해요!!',NULL,'2020-12-13 20:21:26',0,0,'노란 원피스'),(13,1,'clothing','마우스','마이크로소프트 마우스.jpg','123일',NULL,'마이크로소프트 마우스 하루정도 빌려드려요.','12000원','2020-12-13 20:21:59',0,0,NULL),(14,1,'furniture','책상','책상.jpg','123일',NULL,'책상 빌려드려요. 공간이 넓어서 쓰기 편리해요.','25000원','2020-12-13 20:22:38',0,0,NULL),(15,1,'others','3인용 소파','소파11.jpg','233일',NULL,'3인용 소파이고 대여해드려요. 오전에는 답장이 느릴 수 있으니 오후에 연락을 주시면 정말 감사하겠습니다.','30000원','2020-12-13 20:24:01',0,0,NULL),(16,1,'clothing','목도리','목도리.jpg','71일',NULL,'목도리 대여해드려요','3000원','2020-12-13 20:24:28',0,0,NULL),(17,1,'electronics','일반 노트북','일반 노트북.jpg','22일',NULL,'맥북 구해요. 노메이커이지만 기능 매우 좋아요. 제발 맥북과 교환해 주세요.!!! 언제든 답장 가능하니, 편한시간에 연락 주세요.',NULL,'2020-12-13 20:25:24',0,0,'맥북'),(18,1,'clothing','텀블러','예쁜텀블러.jpg','60일',NULL,'색상별로 있어요!! 정말 예뻐요. 대여해드립니다. 연락주세요.','1400원','2020-12-13 20:26:24',0,0,NULL),(19,1,'clothing','투피스 정장 세트','투피스정장세트.gif','5일',NULL,'핑크색 예쁜 남자용 정장 구해요.',NULL,'2020-12-13 20:27:11',0,0,'핑크색 정장'),(20,3,'others','책','책.jpg','55일',NULL,'에눌 가능해요 꼭 연락주세요.','1600원','2020-12-13 20:28:11',0,0,NULL),(21,1,'clothing','꼬부기마우스','꼬부기마우스.jpg','10일',NULL,'하루에 8000원으로 대여해드려요. 완전 귀여워요!! 추천합니다.','8000원','2020-12-13 20:44:07',0,0,NULL),(22,2,'clothing','청록색 소파','소파.jpg','39일',NULL,'청록색이에요. 실제는 사진보다 좀 어둡고 예뻐요.','20000원','2020-12-13 22:26:24',0,0,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13 22:39:49
