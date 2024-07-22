-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: tynuev_db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add battery',1,'add_battery'),(2,'Can change battery',1,'change_battery'),(3,'Can delete battery',1,'delete_battery'),(4,'Can view battery',1,'view_battery'),(5,'Can add bike',2,'add_bike'),(6,'Can change bike',2,'change_bike'),(7,'Can delete bike',2,'delete_bike'),(8,'Can view bike',2,'view_bike'),(9,'Can add id tracker',3,'add_idtracker'),(10,'Can change id tracker',3,'change_idtracker'),(11,'Can delete id tracker',3,'delete_idtracker'),(12,'Can view id tracker',3,'view_idtracker'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add rider',5,'add_rider'),(18,'Can change rider',5,'change_rider'),(19,'Can delete rider',5,'delete_rider'),(20,'Can view rider',5,'view_rider'),(21,'Can add record',6,'add_record'),(22,'Can change record',6,'change_record'),(23,'Can delete record',6,'delete_record'),(24,'Can view record',6,'view_record'),(25,'Can add kin guarantor info',7,'add_kinguarantorinfo'),(26,'Can change kin guarantor info',7,'change_kinguarantorinfo'),(27,'Can delete kin guarantor info',7,'delete_kinguarantorinfo'),(28,'Can view kin guarantor info',7,'view_kinguarantorinfo'),(29,'Can add log entry',8,'add_logentry'),(30,'Can change log entry',8,'change_logentry'),(31,'Can delete log entry',8,'delete_logentry'),(32,'Can view log entry',8,'view_logentry'),(33,'Can add permission',9,'add_permission'),(34,'Can change permission',9,'change_permission'),(35,'Can delete permission',9,'delete_permission'),(36,'Can view permission',9,'view_permission'),(37,'Can add group',10,'add_group'),(38,'Can change group',10,'change_group'),(39,'Can delete group',10,'delete_group'),(40,'Can view group',10,'view_group'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add content type',12,'add_contenttype'),(46,'Can change content type',12,'change_contenttype'),(47,'Can delete content type',12,'delete_contenttype'),(48,'Can view content type',12,'view_contenttype'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'bcrypt_sha256$$2b$12$bT.1oNYLVWuDhuplsYiQpeuZbnL3eEXMCvso25Bd29e93KIGy7166',NULL,0,'testuser','','','test@example.com',0,1,'2024-07-15 18:52:04.178776');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'admin','logentry'),(10,'auth','group'),(9,'auth','permission'),(11,'auth','user'),(12,'contenttypes','contenttype'),(1,'records','battery'),(2,'records','bike'),(3,'records','idtracker'),(7,'records','kinguarantorinfo'),(6,'records','record'),(5,'records','rider'),(4,'records','user'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-07-14 09:18:32.966094'),(2,'auth','0001_initial','2024-07-14 09:18:34.875706'),(3,'admin','0001_initial','2024-07-14 09:18:35.229700'),(4,'admin','0002_logentry_remove_auto_add','2024-07-14 09:18:35.254929'),(5,'admin','0003_logentry_add_action_flag_choices','2024-07-14 09:18:35.279766'),(6,'contenttypes','0002_remove_content_type_name','2024-07-14 09:18:35.481451'),(7,'auth','0002_alter_permission_name_max_length','2024-07-14 09:18:35.671417'),(8,'auth','0003_alter_user_email_max_length','2024-07-14 09:18:35.802701'),(9,'auth','0004_alter_user_username_opts','2024-07-14 09:18:35.850844'),(10,'auth','0005_alter_user_last_login_null','2024-07-14 09:18:36.170237'),(11,'auth','0006_require_contenttypes_0002','2024-07-14 09:18:36.228117'),(12,'auth','0007_alter_validators_add_error_messages','2024-07-14 09:18:36.277168'),(13,'auth','0008_alter_user_username_max_length','2024-07-14 09:18:36.551597'),(14,'auth','0009_alter_user_last_name_max_length','2024-07-14 09:18:36.826808'),(15,'auth','0010_alter_group_name_max_length','2024-07-14 09:18:36.944155'),(16,'auth','0011_update_proxy_permissions','2024-07-14 09:18:36.978385'),(17,'auth','0012_alter_user_first_name_max_length','2024-07-14 09:18:37.320519'),(18,'records','0001_initial','2024-07-14 09:18:39.682513'),(19,'sessions','0001_initial','2024-07-14 09:18:39.886170'),(20,'records','0002_alter_user_phone_number','2024-07-15 18:51:07.039861'),(21,'records','0003_user_is_auth_alter_user_is_active','2024-07-16 03:56:53.116030'),(22,'records','0004_alter_rider_user','2024-07-16 04:10:13.804185'),(23,'records','0005_alter_kinguarantorinfo_user_and_more','2024-07-16 07:10:50.882278'),(24,'records','0006_rider_bike','2024-07-19 22:34:48.976404');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2ajz27tko1phfj69wxekj6s6sup68gbz','e30:1sTQtv:FG_IodaZmRSV3D2abGZvgIbvncam7opbgxrsn3wkP_I','2024-07-29 18:58:19.980297'),('3espo8stz0tewrfmbvdjuavtftzx03i4','e30:1sTRJt:vE12U5CesdXCE4p-C-_IFsW04QjVvCrrDr7_Xc7bgYI','2024-07-29 19:25:09.894997'),('6y4tmmywz0rpnix5sfnkt6ztvjm8v0m0','e30:1sTSHX:XP06S0E89EPjvHOzTEpOQ7hfaDidrWsGPVh1clei6TI','2024-07-15 23:48:23.987113'),('d5o95akx4mt3p4cob0ntxbsho5ckcit6','e30:1sTQzc:y9xw_1s3CQtQ-dJPZ_EsO7PkVmbi5wUgwxmd9XmuvXA','2024-07-29 19:04:12.433273'),('e5jdpf89c6kwvgpkllvr6u9s7tjrsmld','e30:1sTSbo:EUo0mSsP8HX1DqBdMdiJ8S-A4klDNL2OzIb7AZhe04M','2024-07-16 00:09:20.325000'),('hj5invtp58rwumxcp1o9zti93k3s7x4m','.eJyNjjsKwzAQRO-iOjLS6ut0CeQcZne1xiYfgxVXIXePDS6SLkw3vDfMS3W4PIduqTJ3Y1FHBdxb8By0jYG1z0E0gXUaqWT2gMCC6vCtEfJVHps7C09zqc3e1OZyx_F2WsnzzvyIA9ZhtRDJGd5iHQuAcya5TFEySgymdT5TCCahAWgzxr6HbIXApJIKUVhH_3_-_gBye0mT:1sUpUh:mDnjzk3kj_FUFsoi-cXo1QhvA09bLobSI8imyZip_QM','2024-07-19 18:47:39.498837'),('hlilll1cunxcg2b0vrl9wzkapk9i6h52','.eJyNjzsKwzAQRO-iOjLS6ut0CeQcZne1xiY_sOIq5O6xwUXSmemGecPMW3U4v4ZurjJ1Y1FHBdxb8By0jYG1z0E0gXUaqWT2gMCC6vCLEfJVHis7CT-nUpvNqc3ljuPttCTPW-YPHLAOC4VIzvAq61gAnDPJZYqSUWIwrfOZQjAJDUCbMfY9ZCsEJpVUiMJSutbt377_5-cL1PNV_w:1sTSlS:Vzo6qlQtkCrHDmq4nTQz5mHHGTAdV8GDWCgEq0nWd6M','2024-07-16 00:19:18.862091'),('ikgul1il27wczmpmerncixm55lx27kbc','.eJyNjjsKwzAQRO-iOjLS6ut0CeQcZne1xiYfgxVXIXePDS6SLkw3vDfMS3W4PIduqTJ3Y1FHBdxb8By0jYG1z0E0gXUaqWT2gMCC6vCtEfJVHps7C09zqc3e1OZyx_F2WsnzzvyIA9ZhtRDJGd5iHQuAcya5TFEySgymdT5TCCahAWgzxr6HbIXApJIKUVhH_3_-_gBye0mT:1sV4PF:C5rJLdYETqimzpD-15IDHxdjn_iWfAiuxLO7jcfJjeM','2024-07-20 10:43:01.524658'),('ild0sk615y91d7nfaip1cou251kn22v1','e30:1sTRLZ:4FsvZ9f9j1WWaDAWPPzuSMxkLiv5hI_MbKjTLvZ9VV0','2024-07-29 19:26:53.992636'),('mw9lkothf8e3um1ruiwmp9fcq7s6epz0','.eJyNjjsKwzAQRO-iOjLS6ut0CeQcZne1xiYfgxVXIXePDS6SLkw3vDfMS3W4PIduqTJ3Y1FHBdxb8By0jYG1z0E0gXUaqWT2gMCC6vCtEfJVHps7C09zqc3e1OZyx_F2WsnzzvyIA9ZhtRDJGd5iHQuAcya5TFEySgymdT5TCCahAWgzxr6HbIXApJIKUVhH_3_-_gBye0mT:1sVAvC:rAIe90ylFCazIBfq3sBgqR8m68ApWgc0To0L_v-X9iA','2024-07-20 17:40:26.109659'),('mxib9dhrohci01mmc7xwx8xwqzuv5ecx','e30:1sTSco:laKAsT8L55reZTH-Wh7pUefeC3mhmwcVZkNHkXX6jRI','2024-07-16 00:10:22.627790'),('n5rwp4q7tvovwxgr1046u0ixyzu4qyhb','e30:1sTQz0:Oyc0hX6nz2w1WPPKV1JnBInGzJc8N8LOxsAAYj8Etxk','2024-07-29 19:03:34.817103'),('nw02k1r1osbat4ob5ud9xrcyq02eei8y','e30:1sTRM6:C7sRhSyB1--YZrr1JWie4-8I5WMrg8lMkte7BcjSN9o','2024-07-29 19:27:26.311904'),('ps9bfgcnl0jg4a2xaqbkb1lbqruzgarn','e30:1sTSYo:M3lQSJXGFnySO6c2j98bCLyoitdSGEVXC8YFVg_1qWc','2024-07-16 00:06:14.440962'),('r623bbf3fso35hv2ofav903w4n6vnm1o','e30:1sTSdx:W6Dsp-2cyZjqoe-QG4TjdPt51dx4JO83iJVqHQQjYBg','2024-07-16 00:11:33.307687'),('rsb2l625aj2fyqog04ta8w3zxo7t867h','.eJyNjjsKwzAQRO-iOjLS6ut0CeQcZne1xiYfgxVXIXePDS6SLkw3vDfMS3W4PIduqTJ3Y1FHBdxb8By0jYG1z0E0gXUaqWT2gMCC6vCtEfJVHps7C09zqc3e1OZyx_F2WsnzzvyIA9ZhtRDJGd5iHQuAcya5TFEySgymdT5TCCahAWgzxr6HbIXApJIKUVhH_3_-_gBye0mT:1sV2VN:3tOPTcwKKVimVvXKMwzWfo5z7m8Jy648QhxcOG3zisI','2024-07-20 08:41:13.560238'),('sqm12mgq83bn55371peddqqz43lbnncn','e30:1sTSNY:CVSIHS_4jUoy4wGuqWwbXYzJqjEVVQ8_0A94UGQFHOA','2024-07-15 23:54:36.955669'),('vdtisq5sdjlqvze59yz4ppm9xpktr6zd','e30:1sTSPX:oQWi_sOTeO7mUUnruO_wOZ1wJmhKaalf_NzV2Me8CDk','2024-07-15 23:56:39.831816'),('x5nmuob0fljiukqbmyzqzumnp0ci7k2w','.eJyNjjsKwzAQRO-iOjLS6ut0CeQcZne1xiYfgxVXIXePDS6SLkw3vDfMS3W4PIduqTJ3Y1FHBdxb8By0jYG1z0E0gXUaqWT2gMCC6vCtEfJVHps7C09zqc3e1OZyx_F2WsnzzvyIA9ZhtRDJGd5iHQuAcya5TFEySgymdT5TCCahAWgzxr6HbIXApJIKUVhH_3_-_gBye0mT:1sUw8C:XoreAlPLUwlovlo8FgBUPCNDW9J33rTfAEg319KPczg','2024-07-20 01:52:52.141017'),('zlrqurhdhucjxnjg203j6lfxaomdv4fc','e30:1sTSSS:G9YjLo4ra0hE7MUJxcZa125_6lFgBaUVXOjUPQGVZh0','2024-07-15 23:59:40.205553');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_battery`
--

DROP TABLE IF EXISTS `records_battery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_battery` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `battery_model` varchar(100) NOT NULL,
  `battery_serial_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `battery_serial_number` (`battery_serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_battery`
--

LOCK TABLES `records_battery` WRITE;
/*!40000 ALTER TABLE `records_battery` DISABLE KEYS */;
INSERT INTO `records_battery` VALUES ('5480b925eba24c0da9135df9327b5294','2024-07-19 19:30:55.779921','2024-07-19 19:30:55.779980','Model I','SN123464'),('669beb2822c94ea08a4d89da92fb2bdc','2024-07-19 19:30:55.726421','2024-07-19 19:30:55.726486','Model F','SN123461'),('86f657f300eb432da03ab75536899b6c','2024-07-19 19:30:55.805740','2024-07-19 19:30:55.805789','Model J','SN123465'),('c2dc168f548644888f0039c5f00ffe05','2024-07-19 19:30:55.741997','2024-07-19 19:30:55.742066','Model G','SN123462'),('eea38bfa898a49ec9555eb0d0ec0abd8','2024-07-19 19:30:55.764363','2024-07-19 19:30:55.764411','Model H','SN123463');
/*!40000 ALTER TABLE `records_battery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_bike`
--

DROP TABLE IF EXISTS `records_bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_bike` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bike_model` varchar(100) NOT NULL,
  `bike_serial_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bike_serial_number` (`bike_serial_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_bike`
--

LOCK TABLES `records_bike` WRITE;
/*!40000 ALTER TABLE `records_bike` DISABLE KEYS */;
INSERT INTO `records_bike` VALUES ('0a95c2e1170b48229692ca1718187c94','2024-07-16 05:36:44.984218','2024-07-16 05:36:44.984394','Model1','3'),('2320bdb65bb34d888b35f2e062316fb4','2024-07-19 22:43:10.880917','2024-07-19 22:43:10.881051','Model A','SN10001'),('5762a9256ab84d4a86dc4a47a4811e22','2024-07-16 05:21:36.560051','2024-07-16 05:21:36.560185','',''),('6db3b220051846d49d379eeb52fde95f','2024-07-16 05:35:10.113831','2024-07-16 05:35:10.113918','Model1','2'),('85b38d82ffd8480480f667f11865f35f','2024-07-19 22:43:10.914406','2024-07-19 22:43:10.914565','Model B','SN10002'),('8bc62860c92f420a9ca68efd55999f1b','2024-07-19 22:43:10.990002','2024-07-19 22:43:10.990143','Model D','SN10004'),('a0375fa2521641cd998117236476d8df','2024-07-19 22:43:11.023765','2024-07-19 22:43:11.023842','Model E','SN10005'),('a720e977e5b5482590dee2a308cf0f29','2024-07-16 05:23:21.986443','2024-07-16 05:23:21.986550','Model1','1'),('b7045d6f4fa64b16bb67e5c6b62e69b4','2024-07-19 22:43:10.966977','2024-07-19 22:43:10.967074','Model C','SN10003');
/*!40000 ALTER TABLE `records_bike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_idtracker`
--

DROP TABLE IF EXISTS `records_idtracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_idtracker` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `last_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_idtracker`
--

LOCK TABLES `records_idtracker` WRITE;
/*!40000 ALTER TABLE `records_idtracker` DISABLE KEYS */;
INSERT INTO `records_idtracker` VALUES ('00000000000000000000000000000001','2024-07-16 05:43:31.103773','2024-07-16 05:51:52.205660',7);
/*!40000 ALTER TABLE `records_idtracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_kinguarantorinfo`
--

DROP TABLE IF EXISTS `records_kinguarantorinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_kinguarantorinfo` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `next_of_kin_name` varchar(100) DEFAULT NULL,
  `next_of_kin_contact_number` varchar(15) DEFAULT NULL,
  `next_of_kin_email` varchar(100) DEFAULT NULL,
  `next_of_kin_home_address` longtext,
  `next_of_kin_relationship` varchar(50) DEFAULT NULL,
  `next_of_kin_passport` varchar(100) DEFAULT NULL,
  `guarantor_full_name` varchar(100) DEFAULT NULL,
  `guarantor_relationship` varchar(50) DEFAULT NULL,
  `guarantor_contact_number` varchar(15) DEFAULT NULL,
  `guarantor_email` varchar(100) DEFAULT NULL,
  `guarantor_home_address` longtext,
  `guarantor_profession` varchar(100) DEFAULT NULL,
  `guarantor_id` varchar(100) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `records_kinguarantorinfo_user_id_0d06f668_uniq` (`user_id`),
  CONSTRAINT `records_kinguarantorinfo_user_id_0d06f668_fk_records_user_id` FOREIGN KEY (`user_id`) REFERENCES `records_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_kinguarantorinfo`
--

LOCK TABLES `records_kinguarantorinfo` WRITE;
/*!40000 ALTER TABLE `records_kinguarantorinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `records_kinguarantorinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_record`
--

DROP TABLE IF EXISTS `records_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_record` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `kilometer` decimal(10,2) NOT NULL,
  `battery_id` char(32) DEFAULT NULL,
  `bike_id` char(32) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `records_record_battery_id_195c72bd_fk_records_battery_id` (`battery_id`),
  KEY `records_record_bike_id_433d5616_fk_records_bike_id` (`bike_id`),
  KEY `records_record_user_id_96fecca6_fk_records_user_id` (`user_id`),
  CONSTRAINT `records_record_battery_id_195c72bd_fk_records_battery_id` FOREIGN KEY (`battery_id`) REFERENCES `records_battery` (`id`),
  CONSTRAINT `records_record_bike_id_433d5616_fk_records_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `records_bike` (`id`),
  CONSTRAINT `records_record_user_id_96fecca6_fk_records_user_id` FOREIGN KEY (`user_id`) REFERENCES `records_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_record`
--

LOCK TABLES `records_record` WRITE;
/*!40000 ALTER TABLE `records_record` DISABLE KEYS */;
INSERT INTO `records_record` VALUES ('08d2ce7f50a24ec5ac302b7ad2ce8894','2024-07-20 05:45:12.443605','2024-07-20 05:45:12.443659','2024-07-20 06:45:00.000000',8.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('137218e5926c494b9cf01020c8397be9','2024-07-20 05:17:04.902963','2024-07-20 05:17:04.903022','2024-07-20 06:16:00.000000',96.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('1e0fba4e3605407e91f0e09335921be4','2024-07-20 04:42:03.065127','2024-07-20 04:42:03.065178','2024-07-20 04:41:00.000000',10009.00,'5480b925eba24c0da9135df9327b5294',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('1fc727ff369442b3a6fa08ba04738cdf','2024-07-19 20:22:19.460300','2024-07-19 20:22:19.476339','2024-07-19 20:22:00.000000',33.00,'eea38bfa898a49ec9555eb0d0ec0abd8',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('2d676ce6f3f1494c98ea14b577b9da4d','2024-07-20 04:35:14.211276','2024-07-20 04:35:14.211315','2024-07-20 04:35:00.000000',222.00,'eea38bfa898a49ec9555eb0d0ec0abd8',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('2dd349e030814aae928255d2e0d1dc9b','2024-07-20 04:46:43.826952','2024-07-20 04:46:43.827019','2024-07-20 04:46:00.000000',1.00,'5480b925eba24c0da9135df9327b5294',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('3294d56922114fa8947ad64b173f1f38','2024-07-20 14:21:21.408635','2024-07-20 14:21:21.408705','2024-07-20 15:21:00.000000',77777.00,'5480b925eba24c0da9135df9327b5294',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('364bb8759a37423cabb922abe75099a2','2024-07-20 06:23:25.671048','2024-07-20 06:23:25.671104','2024-07-20 07:23:00.000000',6.00,'669beb2822c94ea08a4d89da92fb2bdc',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('3de3ebf5cdc74a8f9ceb07283867e83e','2024-07-20 05:03:11.434084','2024-07-20 05:03:11.434152','2024-07-20 06:03:00.000000',76.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('423b51057da5444bbf5e6ea326c9206e','2024-07-20 05:16:55.375775','2024-07-20 05:16:55.375816','2024-07-20 06:16:00.000000',25.00,'eea38bfa898a49ec9555eb0d0ec0abd8',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('46aa033560de4812bc09594ba84b180d','2024-07-20 04:36:18.356058','2024-07-20 04:36:18.356098','2024-07-20 04:35:00.000000',22.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('5a36939495ad4da5bee31208e5739d91','2024-07-20 05:00:43.979104','2024-07-20 05:00:43.979142','2024-07-20 05:00:00.000000',78.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('6803580ef8c948d8b70635081cd8b127','2024-07-20 05:20:24.830439','2024-07-20 05:20:24.830516','2010-02-06 08:19:00.000000',8.00,'eea38bfa898a49ec9555eb0d0ec0abd8',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('6939dc5ca5a943dba642d3d39d987707','2024-07-20 07:21:51.974977','2024-07-20 07:21:51.975255','2024-07-21 08:21:00.000000',65.00,'c2dc168f548644888f0039c5f00ffe05',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('8642fcc125844fcf930059b778e057fc','2024-07-20 05:50:42.922452','2024-07-20 05:50:42.922496','2012-03-17 20:49:00.000000',69.00,'c2dc168f548644888f0039c5f00ffe05',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('8c13364c034d40fdb1725d563661f9b6','2024-07-19 20:23:17.993826','2024-07-19 20:23:18.015403','2024-07-19 20:23:00.000000',344.00,'eea38bfa898a49ec9555eb0d0ec0abd8',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('9713ff5a03b34ccb91c8bf002853e952','2024-07-20 05:49:59.096883','2024-07-20 05:49:59.096928','2024-07-20 06:49:00.000000',23.00,'669beb2822c94ea08a4d89da92fb2bdc',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('9a0c6da75c6d40eeae09f60bfe43c4c6','2024-07-20 04:47:42.274905','2024-07-20 04:47:42.274947','2024-07-20 04:47:00.000000',78.00,'669beb2822c94ea08a4d89da92fb2bdc',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('a5499d6ad4db4b54bcf002449021d03d','2024-07-20 04:43:02.768417','2024-07-20 04:43:02.768462','2024-07-20 04:42:00.000000',13.00,'5480b925eba24c0da9135df9327b5294',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('a60d29ecd4c84e87ace4315b8a61288f','2024-07-20 04:32:28.849248','2024-07-20 04:32:28.849299','2024-07-20 04:32:00.000000',67.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('a6df8ff043f040c0b37e0ac78605e1e6','2024-07-20 14:21:11.430136','2024-07-20 14:21:11.430246','2024-07-20 15:21:00.000000',77.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('af507f53afe946d89a3f119b9202fbfb','2024-07-20 04:34:54.954350','2024-07-20 04:34:54.954424','2024-07-20 04:34:00.000000',222.00,'669beb2822c94ea08a4d89da92fb2bdc',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('b475e1de2036447a8c192026bbf8d24a','2024-07-19 21:32:01.925926','2024-07-19 21:32:01.939873','2024-07-19 21:31:00.000000',787867.00,'c2dc168f548644888f0039c5f00ffe05',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('b6090cca8b974b49aa3d08305fd837f3','2024-07-20 07:20:06.444393','2024-07-20 07:20:06.444462','2024-07-20 08:19:00.000000',346.00,'c2dc168f548644888f0039c5f00ffe05',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('d4d9ebc8306c4dcca59bf06c7ed586bb','2024-07-19 20:14:18.858426','2024-07-19 20:14:18.884789','2024-07-19 20:14:00.000000',666.00,'5480b925eba24c0da9135df9327b5294',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('db82af5536d2495fa6f30115d01c141c','2024-07-20 06:16:03.328897','2024-07-20 06:16:03.328946','2024-07-20 07:15:00.000000',36.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('dfb3f998137743bf81dd09e29b24b13b','2024-07-20 04:56:08.408030','2024-07-20 04:56:08.408070','2024-07-20 04:56:00.000000',0.00,'86f657f300eb432da03ab75536899b6c',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('e6b2717199844fb0a1f7f96fabc8caf6','2024-07-20 05:20:37.790027','2024-07-20 05:20:37.790123','2024-07-20 06:20:00.000000',58.00,'c2dc168f548644888f0039c5f00ffe05',NULL,'2cf124c5165c485eb213abd8c42a2cea'),('e722184c60e14f5c893a5c1355c4392e','2024-07-20 06:36:05.536581','2024-07-20 06:36:05.536645','2024-07-20 07:35:00.000000',33.00,'5480b925eba24c0da9135df9327b5294',NULL,'2cf124c5165c485eb213abd8c42a2cea');
/*!40000 ALTER TABLE `records_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_rider`
--

DROP TABLE IF EXISTS `records_rider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_rider` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `rider_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` longtext,
  `phone_number` varchar(15) DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `complexion` varchar(50) DEFAULT NULL,
  `hair_color` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `state_of_origin` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `contact_number_alternate` varchar(15) DEFAULT NULL,
  `permanent_home_address` longtext,
  `emergency_contact_name` varchar(100) DEFAULT NULL,
  `emergency_contact_number` varchar(15) DEFAULT NULL,
  `emergency_contact_relationship` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  `bvn` varchar(11) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `headshot` varchar(100) DEFAULT NULL,
  `s_card` varchar(100) DEFAULT NULL,
  `government_id` varchar(100) DEFAULT NULL,
  `proof_of_residency` varchar(100) DEFAULT NULL,
  `marital_status` varchar(20) DEFAULT NULL,
  `delivery_companies` varchar(255) DEFAULT NULL,
  `avg_deliveries_per_day` int DEFAULT NULL,
  `avg_weekly_earnings` decimal(10,2) DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  `bike_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `records_rider_user_id_1d509d7d_uniq` (`user_id`),
  UNIQUE KEY `rider_id` (`rider_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `bike_id` (`bike_id`),
  CONSTRAINT `records_rider_bike_id_70b9aeb3_fk_records_bike_id` FOREIGN KEY (`bike_id`) REFERENCES `records_bike` (`id`),
  CONSTRAINT `records_rider_user_id_1d509d7d_fk_records_user_id` FOREIGN KEY (`user_id`) REFERENCES `records_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_rider`
--

LOCK TABLES `records_rider` WRITE;
/*!40000 ALTER TABLE `records_rider` DISABLE KEYS */;
INSERT INTO `records_rider` VALUES ('7244e59b32614ce4b5bf2e5c3961c3c2','2024-07-16 05:51:52.221035','2024-07-16 06:06:07.355631','TEV240716007','','','2024-07-16','eheheheh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL,10,NULL,'611f74506e9842fa85a9c412741054a6',NULL),('ea71cc295c27454b987345de1c16b727','2024-07-16 04:18:48.091101','2024-07-16 04:18:48.091238','98','','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL,10,NULL,'3af228e5c7884c3190159fba911e4f0e',NULL);
/*!40000 ALTER TABLE `records_rider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_user`
--

DROP TABLE IF EXISTS `records_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_auth` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_user`
--

LOCK TABLES `records_user` WRITE;
/*!40000 ALTER TABLE `records_user` DISABLE KEYS */;
INSERT INTO `records_user` VALUES ('bcrypt_sha256$$2b$12$vgc4QKrGHEVNKIbe04UL2ua75U0YDohhHmns7lxLoZS0..NROmr2y',NULL,0,'1905f94d3d8d4b00a7b64dcb9d5dbbcd','2024-07-14 13:56:25.428830','2024-07-14 13:56:25.428896','kachy@qw.com','Onyedikachi1','ms','',1,0,0),('bcrypt_sha256$$2b$12$J76QwXNGOX28IqslsCqFg.009h9IGyzgzh6vvorw3waa9dHJF2JRy',NULL,0,'2b3561830dda4888be104690f1f10547','2024-07-14 14:17:23.450285','2024-07-14 14:17:23.450401','ejimovc9@gmail.com','Onyedikachi1','s','',1,0,0),('bcrypt_sha256$$2b$12$KeoiHNF3A/FC75KMaKQZN.8oUgYLt6tQecuFo7Ax88TraDIy/aFG6','2024-07-20 14:18:50.097506',0,'2cf124c5165c485eb213abd8c42a2cea','2024-07-14 11:48:56.533225','2024-07-14 11:48:56.533294','ejimovc@gmail.com9','ONYEDIKACHI','VINCENT EJIM','08134989184',1,0,0),('bcrypt_sha256$$2b$12$DYFbNz5Ud.0IbPtLhFseUusGhv4w.JSmP4yIlgOM5KGYZwxyOQK8K',NULL,0,'2fe93aef971d40d0aa3429c41b17f0a6','2024-07-14 12:13:20.961423','2024-07-14 12:13:20.961526','ejimovc@gmail.co','q','q','q',1,0,0),('bcrypt_sha256$$2b$12$TOP8Tjf6JV7k2t.BHw6ODuTiWcT7PdXsqvobBWu2GkJ27LUEfKjS6',NULL,0,'3af228e5c7884c3190159fba911e4f0e','2024-07-14 09:22:49.665778','2024-07-14 09:22:49.665833','ejimovc@gmail.com','ONYEDIKACHI','VINCENT EJIM','08134989184',1,0,0),('bcrypt_sha256$$2b$12$pD1m842oy9XS.YlO.cQXf.RMEHcLVr06HDundMNINkBUVN/sMueT6',NULL,0,'3dfad679641a44f89ffadbbfaba65f88','2024-07-15 15:38:04.468927','2024-07-15 15:38:04.469047','patient0@example.com','ONYEDIKACHI','VINCENT EJIM','',1,0,0),('bcrypt_sha256$$2b$12$YWcngeNjUyiAnoYTatconOXkYEL4r8HNHnoViX73XX.gqtHPX4NgS',NULL,0,'4209a2d05ab348deacaa5c7e3c593635','2024-07-15 05:44:03.832066','2024-07-15 05:44:03.832149','ejimovc@gmail102.com','ONYEDIKACHI','VINCENT EJIM','+2348134989181',1,0,0),('bcrypt_sha256$$2b$12$K6TP7x9EVwGd3mO7YbAJHOP3DS5qZ4ZFrA14H3MbQ05002nMbBgeO',NULL,0,'432e011254cf48008584b3b6fdb83394','2024-07-15 15:39:24.458009','2024-07-15 15:39:24.458071','ejimovc@gmail.com91','Onyedikachi1','Ejim','',1,0,0),('bcrypt_sha256$$2b$12$EfznMfA9m6UsmTekuzNz2OzxYysXtRuzRxhySWXeSHwTNSL7YXPEW',NULL,0,'55c12b244012429789702731d0b92678','2024-07-14 14:35:08.424507','2024-07-14 14:35:08.424582','ejimovc9@gmail2.com','Onyedikachi','VINCENT EJIM','',1,0,0),('!AFOwuZ0eVlW1zGoldSgY4fMiTeTx2d2hKBxFg1kT',NULL,0,'611f74506e9842fa85a9c412741054a6','2024-07-16 05:51:18.601256','2024-07-16 05:51:18.601357','ejejej','','','',0,0,0),('bcrypt_sha256$$2b$12$zE7LtrnmdwbDibcqli38Fuv97RX.8gfvbi3DIRh8tH1KlAILzDRvi',NULL,0,'c3c9a107fed64a83aa09d687d2d1eb58','2024-07-15 05:05:32.893354','2024-07-15 05:05:32.893440','ejimovc@gmail101.com','ONYEDIKACHI','VINCENT EJIM','',1,0,0),('bcrypt_sha256$$2b$12$OxaCmVCwdwIQKrMNL325Lep9MYG7glkqDNtlpkuKMW2JCNazsbxby','2024-07-15 19:04:12.445899',0,'cfebda06c70b43228b129633ea31348a','2024-07-15 18:19:13.241413','2024-07-15 18:19:13.241510','ejimovc1@gmail.com','Emmanuel','Ejim','',1,0,0);
/*!40000 ALTER TABLE `records_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_user_groups`
--

DROP TABLE IF EXISTS `records_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `records_user_groups_user_id_group_id_24d3635e_uniq` (`user_id`,`group_id`),
  KEY `records_user_groups_group_id_1aa2a240_fk_auth_group_id` (`group_id`),
  CONSTRAINT `records_user_groups_group_id_1aa2a240_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `records_user_groups_user_id_b9d9aee9_fk_records_user_id` FOREIGN KEY (`user_id`) REFERENCES `records_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_user_groups`
--

LOCK TABLES `records_user_groups` WRITE;
/*!40000 ALTER TABLE `records_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `records_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records_user_user_permissions`
--

DROP TABLE IF EXISTS `records_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` char(32) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `records_user_user_permis_user_id_permission_id_db7ee893_uniq` (`user_id`,`permission_id`),
  KEY `records_user_user_pe_permission_id_b23b15f1_fk_auth_perm` (`permission_id`),
  CONSTRAINT `records_user_user_pe_permission_id_b23b15f1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `records_user_user_pe_user_id_9f19acea_fk_records_u` FOREIGN KEY (`user_id`) REFERENCES `records_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records_user_user_permissions`
--

LOCK TABLES `records_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `records_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `records_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-20 14:45:16
