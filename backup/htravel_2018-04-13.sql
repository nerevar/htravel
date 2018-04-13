# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.12)
# Database: htravel
# Generation Time: 2018-04-13 07:41:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add permission',2,'add_permission'),
	(5,'Can change permission',2,'change_permission'),
	(6,'Can delete permission',2,'delete_permission'),
	(7,'Can add group',3,'add_group'),
	(8,'Can change group',3,'change_group'),
	(9,'Can delete group',3,'delete_group'),
	(10,'Can add user',4,'add_user'),
	(11,'Can change user',4,'change_user'),
	(12,'Can delete user',4,'delete_user'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add post',7,'add_post'),
	(20,'Can change post',7,'change_post'),
	(21,'Can delete post',7,'delete_post'),
	(22,'Can add city',8,'add_city'),
	(23,'Can change city',8,'change_city'),
	(24,'Can delete city',8,'delete_city'),
	(25,'Can add country',9,'add_country'),
	(26,'Can change country',9,'change_country'),
	(27,'Can delete country',9,'delete_country'),
	(28,'Can add route',10,'add_route'),
	(29,'Can change route',10,'change_route'),
	(30,'Can delete route',10,'delete_route'),
	(31,'Can add trip',11,'add_trip'),
	(32,'Can change trip',11,'change_trip'),
	(33,'Can delete trip',11,'delete_trip'),
	(34,'Can add price',12,'add_price'),
	(35,'Can change price',12,'change_price'),
	(36,'Can delete price',12,'delete_price'),
	(37,'Can add way',13,'add_way'),
	(38,'Can change way',13,'change_way'),
	(39,'Can delete way',13,'delete_way'),
	(40,'Can add train',14,'add_train'),
	(41,'Can change train',14,'change_train'),
	(42,'Can delete train',14,'delete_train'),
	(43,'Can add json dump',15,'add_jsondump'),
	(44,'Can change json dump',15,'change_jsondump'),
	(45,'Can delete json dump',15,'delete_jsondump'),
	(46,'Can add route archive',16,'add_routearchive'),
	(47,'Can change route archive',16,'change_routearchive'),
	(48,'Can delete route archive',16,'delete_routearchive');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$100000$x1IPihSsv330$YB3ts8ej9y5ambWi1J1l7R2vNdDtSoeQ/CaWzWIuq1c=','2018-03-29 08:33:42.135841',1,'nerevar','','','mail@nerevar.ru',1,1,'2018-02-24 15:16:30.412476');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2018-02-24 15:29:45.478385','1','Пост 1',1,'[{\"added\": {}}]',7,1),
	(2,'2018-02-24 15:30:01.565133','2','Пост 2',1,'[{\"added\": {}}]',7,1),
	(3,'2018-02-24 15:30:17.262842','3','Пост 3',1,'[{\"added\": {}}]',7,1),
	(4,'2018-02-24 15:30:18.414098','3','Пост 3',2,'[]',7,1),
	(5,'2018-02-24 18:43:35.100786','1','Российская Федерация',1,'[{\"added\": {}}]',9,1),
	(6,'2018-02-24 18:43:45.654519','2','Беларусь',1,'[{\"added\": {}}]',9,1),
	(7,'2018-02-24 18:44:49.154990','3','Литва',1,'[{\"added\": {}}]',9,1),
	(8,'2018-02-24 18:47:04.049159','1','Москва',1,'[{\"added\": {}}]',8,1),
	(9,'2018-02-24 18:47:27.881767','2','Казань',1,'[{\"added\": {}}]',8,1),
	(10,'2018-02-24 18:47:41.219167','3','Санкт-Петербург',1,'[{\"added\": {}}]',8,1),
	(11,'2018-02-24 18:47:50.967646','4','Ростов-на-Дону',1,'[{\"added\": {}}]',8,1),
	(12,'2018-02-24 18:47:59.166050','5','Сочи',1,'[{\"added\": {}}]',8,1),
	(13,'2018-02-24 18:49:11.799482','6','Новочеркасск',1,'[{\"added\": {}}]',8,1),
	(14,'2018-02-24 18:49:43.531880','7','Минск',1,'[{\"added\": {}}]',8,1),
	(15,'2018-02-24 18:49:54.270036','8','Чернышевское',1,'[{\"added\": {}}]',8,1),
	(16,'2018-02-24 18:50:03.658985','9','Нестеров',1,'[{\"added\": {}}]',8,1),
	(17,'2018-02-24 18:50:41.680375','10','Краснодар',1,'[{\"added\": {}}]',8,1),
	(18,'2018-02-24 18:51:29.416319','4','Эстония',1,'[{\"added\": {}}]',9,1),
	(19,'2018-02-24 18:51:38.649439','11','Таллин',1,'[{\"added\": {}}]',8,1),
	(20,'2018-02-24 19:23:05.223824','1','TRAIN: Москва - Санкт-Петербург',1,'[{\"added\": {}}]',10,1),
	(21,'2018-02-24 19:23:10.126157','2','TRAIN: Санкт-Петербург - Москва',1,'[{\"added\": {}}]',10,1),
	(22,'2018-02-25 09:51:22.663926','1','TRAIN: Москва - Санкт-Петербург',1,'[{\"added\": {}}]',13,1),
	(23,'2018-02-25 09:51:27.314506','2','TRAIN: Санкт-Петербург - Москва',1,'[{\"added\": {}}]',13,1),
	(24,'2018-02-27 19:19:08.900239','3','TRAIN: Москва - Казань',1,'[{\"added\": {}}]',13,1),
	(25,'2018-02-27 19:19:13.440733','4','TRAIN: Казань - Москва',1,'[{\"added\": {}}]',13,1),
	(26,'2018-02-27 19:28:17.467272','3','Санкт-Петербург',2,'[{\"changed\": {\"fields\": [\"descr\"]}}]',8,1),
	(27,'2018-02-27 19:28:28.142887','1','Москва',2,'[{\"changed\": {\"fields\": [\"descr\"]}}]',8,1),
	(28,'2018-02-27 19:28:41.047452','2','Казань',2,'[{\"changed\": {\"fields\": [\"descr\"]}}]',8,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(7,'blog','post'),
	(5,'contenttypes','contenttype'),
	(8,'robot','city'),
	(9,'robot','country'),
	(15,'robot','jsondump'),
	(12,'robot','price'),
	(10,'robot','route'),
	(16,'robot','routearchive'),
	(14,'robot','train'),
	(11,'robot','trip'),
	(13,'robot','way'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2018-02-24 15:15:53.883290'),
	(2,'auth','0001_initial','2018-02-24 15:15:54.220922'),
	(3,'admin','0001_initial','2018-02-24 15:15:54.290318'),
	(4,'admin','0002_logentry_remove_auto_add','2018-02-24 15:15:54.313286'),
	(5,'contenttypes','0002_remove_content_type_name','2018-02-24 15:15:54.407294'),
	(6,'auth','0002_alter_permission_name_max_length','2018-02-24 15:15:54.431127'),
	(7,'auth','0003_alter_user_email_max_length','2018-02-24 15:15:54.469236'),
	(8,'auth','0004_alter_user_username_opts','2018-02-24 15:15:54.493513'),
	(9,'auth','0005_alter_user_last_login_null','2018-02-24 15:15:54.533709'),
	(10,'auth','0006_require_contenttypes_0002','2018-02-24 15:15:54.535935'),
	(11,'auth','0007_alter_validators_add_error_messages','2018-02-24 15:15:54.559873'),
	(12,'auth','0008_alter_user_username_max_length','2018-02-24 15:15:54.642313'),
	(13,'auth','0009_alter_user_last_name_max_length','2018-02-24 15:15:54.675255'),
	(14,'sessions','0001_initial','2018-02-24 15:15:54.714570'),
	(15,'blog','0001_initial','2018-02-24 15:28:20.947138'),
	(16,'robot','0001_initial','2018-02-24 18:41:17.560245'),
	(17,'robot','0002_auto_20180224_2149','2018-02-24 18:49:02.824822'),
	(18,'robot','0003_route','2018-02-24 19:22:36.868145'),
	(19,'robot','0004_auto_20180224_2245','2018-02-24 19:46:20.118436'),
	(20,'robot','0005_auto_20180225_1207','2018-02-25 09:07:33.748547'),
	(21,'robot','0006_auto_20180225_1223','2018-02-25 09:23:29.034451'),
	(22,'robot','0007_auto_20180225_1245','2018-02-25 09:46:02.124145'),
	(23,'robot','0008_auto_20180225_1336','2018-02-25 10:36:33.707998'),
	(24,'robot','0009_auto_20180227_2227','2018-02-27 19:27:58.154943'),
	(25,'robot','0010_city_name','2018-03-11 14:02:06.552633'),
	(26,'robot','0011_auto_20180328_2052','2018-03-28 17:53:06.336719'),
	(27,'robot','0012_auto_20180330_2022','2018-03-30 17:22:29.892055'),
	(28,'robot','0013_train','2018-04-02 09:13:34.107093'),
	(29,'robot','0013_auto_20180403_0954','2018-04-03 06:55:28.800871'),
	(30,'robot','0014_train_way','2018-04-03 09:19:10.445113'),
	(31,'robot','0015_auto_20180403_1220','2018-04-03 09:20:34.675396'),
	(32,'robot','0016_jsondump','2018-04-05 08:04:07.604578'),
	(33,'robot','0017_auto_20180406_1117','2018-04-06 08:18:06.279661'),
	(34,'robot','0017_jsondump_routearchive','2018-04-11 05:28:43.912095'),
	(35,'robot','0018_auto_20180411_1122','2018-04-11 08:22:42.883567'),
	(36,'robot','0019_auto_20180411_1141','2018-04-11 08:41:22.031746');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('hp8urv4hxybwd59rr04jph5ce9soc44p','NjE2MjlkMjM4ZGZjOTc5M2QyMWQ1Zjk3MmE1YzI0MWRiOGYyZDE4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZjlhMDUyMjNlMTE0NzZlZWRjNDkwYTdlMTg1ZWYwM2FlYzdmYTBiIn0=','2018-04-12 08:33:42.137797'),
	('y2tv6l3hj1jh5ko173c0tjghet0ngm8d','NjE2MjlkMjM4ZGZjOTc5M2QyMWQ1Zjk3MmE1YzI0MWRiOGYyZDE4Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZjlhMDUyMjNlMTE0NzZlZWRjNDkwYTdlMTg1ZWYwM2FlYzdmYTBiIn0=','2018-03-10 15:18:38.761406');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table robot_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `robot_city`;

CREATE TABLE `robot_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `iata_code` varchar(3) DEFAULT NULL,
  `rzd_code` varchar(10) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `descr` longtext,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_city_country_id_b4551025_fk_robot_country_id` (`country_id`),
  CONSTRAINT `robot_city_country_id_b4551025_fk_robot_country_id` FOREIGN KEY (`country_id`) REFERENCES `robot_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `robot_city` WRITE;
/*!40000 ALTER TABLE `robot_city` DISABLE KEYS */;

INSERT INTO `robot_city` (`id`, `title`, `iata_code`, `rzd_code`, `country_id`, `descr`, `name`)
VALUES
	(1,'Москва','MOW','2000000',1,'Столица нашей Родины','moscow'),
	(2,'Казань','KZN','2060615',1,'Спортивная столица России','kazan'),
	(3,'Санкт-Петербург','LED','2004000',1,'Город на Неве','spb'),
	(4,'Ростов-на-Дону','ROV','2064001',1,NULL,'rostov'),
	(5,'Сочи','AER','2064130',1,NULL,'sochi'),
	(6,'Новочеркасск',NULL,'2064230',1,NULL,'novocherkassk'),
	(7,'Минск','MSQ','2100000',2,NULL,'minsk'),
	(8,'Чернышевское',NULL,'2058034',1,NULL,'chernyshevskoe'),
	(9,'Нестеров',NULL,'2058434',1,NULL,'nesterov'),
	(10,'Краснодар','KRR','2064788',1,NULL,'krasnodar'),
	(11,'Таллин','TLL','2600000',4,NULL,'tallin');

/*!40000 ALTER TABLE `robot_city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table robot_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `robot_country`;

CREATE TABLE `robot_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `robot_country` WRITE;
/*!40000 ALTER TABLE `robot_country` DISABLE KEYS */;

INSERT INTO `robot_country` (`id`, `title`, `code`)
VALUES
	(1,'Российская Федерация','RU'),
	(2,'Беларусь','BY'),
	(3,'Литва','LT'),
	(4,'Эстония','EE');

/*!40000 ALTER TABLE `robot_country` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table robot_jsondump
# ------------------------------------------------------------

DROP TABLE IF EXISTS `robot_jsondump`;

CREATE TABLE `robot_jsondump` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` datetime(6) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `trains_to_count` smallint(5) unsigned DEFAULT NULL,
  `trains_from_count` smallint(5) unsigned DEFAULT NULL,
  `way_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_jsondump_way_id_435b0383_fk_robot_way_id` (`way_id`),
  CONSTRAINT `robot_jsondump_way_id_435b0383_fk_robot_way_id` FOREIGN KEY (`way_id`) REFERENCES `robot_way` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table robot_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `robot_route`;

CREATE TABLE `robot_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arrive` datetime(6) DEFAULT NULL,
  `departure` datetime(6) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `request_date` datetime(6),
  `way_id` int(11) DEFAULT NULL,
  `min_price` decimal(8,2) DEFAULT NULL,
  `departure_time` time(6) DEFAULT NULL,
  `train_id` varchar(6) DEFAULT NULL,
  `price_coupe` decimal(8,2) DEFAULT NULL,
  `price_platzkart` decimal(8,2) DEFAULT NULL,
  `price_seated` decimal(8,2) DEFAULT NULL,
  `seats_coupe` smallint(5) unsigned DEFAULT NULL,
  `seats_platzkart` smallint(5) unsigned DEFAULT NULL,
  `seats_seated` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_route_way_id_67c27215_fk_robot_way_id` (`way_id`),
  KEY `robot_route_train_id_5bea2af1_fk_robot_train_number` (`train_id`),
  CONSTRAINT `robot_route_train_id_5bea2af1_fk_robot_train_number` FOREIGN KEY (`train_id`) REFERENCES `robot_train` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=1934 DEFAULT CHARSET=utf8;

LOCK TABLES `robot_route` WRITE;
/*!40000 ALTER TABLE `robot_route` DISABLE KEYS */;

INSERT INTO `robot_route` (`id`, `arrive`, `departure`, `duration`, `request_date`, `way_id`, `min_price`, `departure_time`, `train_id`, `price_coupe`, `price_platzkart`, `price_seated`, `seats_coupe`, `seats_platzkart`, `seats_seated`)
VALUES
	(1190,'2018-04-06 22:56:00.000000','2018-04-06 10:05:00.000000',46260000000,'2018-03-29 08:25:21.787000',3,1393.00,'13:05:00.000000','082И',1801.00,1393.00,NULL,21,17,NULL),
	(1191,'2018-04-07 02:10:00.000000','2018-04-06 13:35:00.000000',45300000000,'2018-03-29 08:25:21.787000',3,1291.00,'16:35:00.000000','016Е',4367.00,1291.00,NULL,78,68,NULL),
	(1192,'2018-04-07 02:57:00.000000','2018-04-06 14:38:00.000000',44340000000,'2018-03-29 08:25:21.787000',3,2059.00,'17:38:00.000000','026Г',4623.00,2059.00,NULL,87,5,NULL),
	(1193,'2018-04-07 04:38:00.000000','2018-04-06 15:50:00.000000',46080000000,'2018-03-29 08:25:21.787000',3,906.00,'18:50:00.000000','136М',2474.00,906.00,NULL,36,1,NULL),
	(1194,'2018-04-07 04:48:00.000000','2018-04-06 16:20:00.000000',44880000000,'2018-03-29 08:25:21.787000',3,2632.00,'19:20:00.000000','080У',2632.00,NULL,NULL,7,NULL,NULL),
	(1195,'2018-04-07 05:00:00.000000','2018-04-06 17:48:00.000000',40320000000,'2018-03-29 08:25:21.787000',3,4894.00,'20:48:00.000000','002Й',4894.00,NULL,NULL,157,NULL,NULL),
	(1196,'2018-04-07 07:45:00.000000','2018-04-06 20:08:00.000000',41820000000,'2018-03-29 08:25:21.787000',3,3177.00,'23:08:00.000000','024М',3177.00,NULL,NULL,215,NULL,NULL),
	(1197,'2018-04-07 09:47:00.000000','2018-04-06 20:38:00.000000',47340000000,'2018-03-29 08:25:21.787000',3,1977.00,'23:38:00.000000','112М',1977.00,NULL,782.00,50,NULL,84),
	(1198,'2018-04-09 01:42:00.000000','2018-04-08 12:55:00.000000',46020000000,'2018-03-29 08:25:21.787000',4,1853.00,'15:55:00.000000','075Э',1853.00,NULL,NULL,45,NULL,NULL),
	(1199,'2018-04-09 01:57:00.000000','2018-04-08 13:13:00.000000',45840000000,'2018-03-29 08:25:21.787000',4,2384.00,'16:13:00.000000','089У',2384.00,NULL,NULL,18,NULL,NULL),
	(1200,'2018-04-09 02:38:00.000000','2018-04-08 13:30:00.000000',47280000000,'2018-03-29 08:25:21.787000',4,1853.00,'16:30:00.000000','117Н',1853.00,NULL,NULL,16,NULL,NULL),
	(1201,'2018-04-09 02:46:00.000000','2018-04-08 13:42:00.000000',47040000000,'2018-03-29 08:25:21.787000',4,2173.00,'16:42:00.000000','095Н',2173.00,NULL,NULL,34,NULL,NULL),
	(1202,'2018-04-09 03:37:00.000000','2018-04-08 15:11:00.000000',44760000000,'2018-03-29 08:25:21.787000',4,3177.00,'18:11:00.000000','023Г',3177.00,NULL,NULL,178,NULL,NULL),
	(1203,'2018-04-09 04:10:00.000000','2018-04-08 17:00:00.000000',40200000000,'2018-03-29 08:25:21.787000',4,4894.00,'20:00:00.000000','001Г',4894.00,NULL,NULL,178,NULL,NULL),
	(1204,'2018-04-09 07:15:00.000000','2018-04-08 18:41:00.000000',45240000000,'2018-03-29 08:25:21.787000',4,2059.00,'21:41:00.000000','025Г',5388.00,2059.00,NULL,35,1,NULL),
	(1205,'2018-04-09 06:23:00.000000','2018-04-08 18:57:00.000000',41160000000,'2018-03-29 08:25:21.787000',4,4367.00,'21:57:00.000000','015Е',4367.00,NULL,NULL,76,NULL,NULL),
	(1206,'2018-04-13 22:56:00.000000','2018-04-13 10:05:00.000000',46260000000,'2018-03-29 08:25:27.428000',3,891.00,'13:05:00.000000','076Э',1814.00,891.00,NULL,57,66,NULL),
	(1207,'2018-04-13 23:07:00.000000','2018-04-13 10:13:00.000000',46440000000,'2018-03-29 08:25:27.428000',3,906.00,'13:13:00.000000','118Н',1814.00,906.00,NULL,90,56,NULL),
	(1208,'2018-04-14 02:10:00.000000','2018-04-13 13:35:00.000000',45300000000,'2018-03-29 08:25:27.428000',3,1291.00,'16:35:00.000000','060У',3701.00,1291.00,NULL,75,151,NULL),
	(1209,'2018-04-14 02:57:00.000000','2018-04-13 14:38:00.000000',44340000000,'2018-03-29 08:25:27.428000',3,1291.00,'17:38:00.000000','026Г',4532.00,1291.00,NULL,86,200,NULL),
	(1210,'2018-04-14 04:38:00.000000','2018-04-13 15:50:00.000000',46080000000,'2018-03-29 08:25:27.428000',3,2096.00,'18:50:00.000000','096Н',2096.00,NULL,NULL,36,NULL,NULL),
	(1211,'2018-04-14 04:48:00.000000','2018-04-13 16:20:00.000000',44880000000,'2018-03-29 08:25:27.428000',3,3120.00,'19:20:00.000000','090У',3120.00,NULL,NULL,12,NULL,NULL),
	(1212,'2018-04-14 05:00:00.000000','2018-04-13 17:48:00.000000',40320000000,'2018-03-29 08:25:27.428000',3,4797.00,'20:48:00.000000','002Й',4797.00,NULL,NULL,182,NULL,NULL),
	(1213,'2018-04-14 07:45:00.000000','2018-04-13 20:08:00.000000',41820000000,'2018-03-29 08:25:27.428000',3,3103.00,'23:08:00.000000','024М',3103.00,NULL,NULL,378,NULL,NULL),
	(1214,'2018-04-14 09:47:00.000000','2018-04-13 20:38:00.000000',47340000000,'2018-03-29 08:25:27.428000',3,1853.00,'23:38:00.000000','112М',1853.00,NULL,782.00,114,NULL,197),
	(1215,'2018-04-16 01:42:00.000000','2018-04-15 12:55:00.000000',46020000000,'2018-03-29 08:25:27.428000',4,1762.00,'15:55:00.000000','081И',1762.00,NULL,NULL,36,NULL,NULL),
	(1216,'2018-04-16 01:57:00.000000','2018-04-15 13:13:00.000000',45840000000,'2018-03-29 08:25:27.428000',4,1743.00,'16:13:00.000000','079У',1743.00,NULL,782.00,24,NULL,43),
	(1217,'2018-04-16 03:37:00.000000','2018-04-15 15:11:00.000000',44760000000,'2018-03-29 08:25:27.428000',4,1547.00,'18:11:00.000000','023Г',1547.00,NULL,NULL,298,NULL,NULL),
	(1218,'2018-04-16 04:10:00.000000','2018-04-15 17:00:00.000000',40200000000,'2018-03-29 08:25:27.428000',4,4797.00,'20:00:00.000000','001Г',4797.00,NULL,NULL,186,NULL,NULL),
	(1219,'2018-04-16 07:15:00.000000','2018-04-15 18:41:00.000000',45240000000,'2018-03-29 08:25:27.428000',4,1291.00,'21:41:00.000000','025Г',4184.00,1291.00,NULL,78,10,NULL),
	(1220,'2018-04-16 06:23:00.000000','2018-04-15 18:57:00.000000',41160000000,'2018-03-29 08:25:27.428000',4,3722.00,'21:57:00.000000','059Е',3722.00,NULL,NULL,58,NULL,NULL),
	(1221,'2018-04-20 22:56:00.000000','2018-04-20 10:10:00.000000',45960000000,'2018-03-29 08:25:34.496000',3,1393.00,'13:10:00.000000','082И',1715.00,1393.00,NULL,79,63,NULL),
	(1222,'2018-04-21 02:10:00.000000','2018-04-20 13:38:00.000000',45120000000,'2018-03-29 08:25:34.496000',3,1291.00,'16:38:00.000000','016Е',4176.00,1291.00,NULL,86,178,NULL),
	(1223,'2018-04-21 02:57:00.000000','2018-04-20 14:38:00.000000',44340000000,'2018-03-29 08:25:34.496000',3,1291.00,'17:38:00.000000','026Г',4419.00,1291.00,NULL,90,215,NULL),
	(1224,'2018-04-21 04:38:00.000000','2018-04-20 15:50:00.000000',46080000000,'2018-03-29 08:25:34.496000',3,1419.00,'18:50:00.000000','136М',2512.00,1419.00,NULL,30,8,NULL),
	(1225,'2018-04-21 04:48:00.000000','2018-04-20 16:20:00.000000',44880000000,'2018-03-29 08:25:34.496000',3,2410.00,'19:20:00.000000','080У',2410.00,NULL,782.00,27,NULL,39),
	(1226,'2018-04-21 05:00:00.000000','2018-04-20 17:48:00.000000',40320000000,'2018-03-29 08:25:34.496000',3,1291.00,'20:48:00.000000','002Й',4676.00,1291.00,NULL,182,7,NULL),
	(1227,'2018-04-21 07:45:00.000000','2018-04-20 20:08:00.000000',41820000000,'2018-03-29 08:25:34.496000',3,3378.00,'23:08:00.000000','024М',3378.00,NULL,NULL,271,NULL,NULL),
	(1228,'2018-04-21 09:47:00.000000','2018-04-20 20:38:00.000000',47340000000,'2018-03-29 08:25:34.496000',3,906.00,'23:38:00.000000','112М',1803.00,906.00,782.00,134,58,215),
	(1229,'2018-04-23 01:42:00.000000','2018-04-22 12:55:00.000000',46020000000,'2018-03-29 08:25:34.496000',4,891.00,'15:55:00.000000','075Э',1764.00,891.00,NULL,52,22,NULL),
	(1230,'2018-04-23 01:57:00.000000','2018-04-22 13:13:00.000000',45840000000,'2018-03-29 08:25:34.496000',4,906.00,'16:13:00.000000','089У',3383.00,906.00,NULL,18,1,NULL),
	(1231,'2018-04-23 02:38:00.000000','2018-04-22 13:30:00.000000',47280000000,'2018-03-29 08:25:34.496000',4,1393.00,'16:30:00.000000','117Н',1926.00,1393.00,NULL,17,9,NULL),
	(1232,'2018-04-23 02:46:00.000000','2018-04-22 13:42:00.000000',47040000000,'2018-03-29 08:25:34.496000',4,1393.00,'16:42:00.000000','095Н',2152.00,1393.00,NULL,30,6,NULL),
	(1233,'2018-04-23 03:37:00.000000','2018-04-22 15:11:00.000000',44760000000,'2018-03-29 08:25:34.496000',4,3753.00,'18:11:00.000000','023Г',3753.00,NULL,NULL,113,NULL,NULL),
	(1234,'2018-04-23 04:10:00.000000','2018-04-22 17:00:00.000000',40200000000,'2018-03-29 08:25:34.496000',4,5738.00,'20:00:00.000000','001Г',5738.00,NULL,NULL,137,NULL,NULL),
	(1235,'2018-04-23 07:08:00.000000','2018-04-22 18:41:00.000000',44820000000,'2018-03-29 08:25:34.496000',4,4242.00,'21:41:00.000000','025Г',4242.00,NULL,NULL,75,NULL,NULL),
	(1236,'2018-04-23 06:23:00.000000','2018-04-22 18:57:00.000000',41160000000,'2018-03-29 08:25:34.496000',4,4482.00,'21:57:00.000000','015Е',4482.00,NULL,NULL,68,NULL,NULL),
	(1237,'2018-04-27 20:47:00.000000','2018-04-27 07:10:00.000000',49020000000,'2018-03-29 08:28:43.813000',3,1077.00,'10:10:00.000000','268В',1551.00,1077.00,NULL,81,618,NULL),
	(1238,'2018-04-27 22:56:00.000000','2018-04-27 10:10:00.000000',45960000000,'2018-03-29 08:28:43.813000',3,1672.00,'13:10:00.000000','076Э',1765.00,1672.00,NULL,41,23,NULL),
	(1239,'2018-04-27 23:07:00.000000','2018-04-27 10:18:00.000000',46140000000,'2018-03-29 08:28:43.813000',3,1672.00,'13:18:00.000000','118Н',1927.00,1672.00,NULL,59,22,NULL),
	(1240,'2018-04-28 02:10:00.000000','2018-04-27 13:38:00.000000',45120000000,'2018-03-29 08:28:43.813000',3,1547.00,'16:38:00.000000','060У',3262.00,1547.00,NULL,133,63,NULL),
	(1241,'2018-04-28 02:57:00.000000','2018-04-27 14:38:00.000000',44340000000,'2018-03-29 08:28:43.813000',3,2486.00,'17:38:00.000000','026Г',5412.00,2486.00,NULL,65,2,NULL),
	(1242,'2018-04-28 04:38:00.000000','2018-04-27 15:50:00.000000',46080000000,'2018-03-29 08:28:43.813000',3,5304.00,'18:50:00.000000','096Н',5304.00,NULL,NULL,4,NULL,NULL),
	(1243,'2018-04-28 04:48:00.000000','2018-04-27 16:20:00.000000',44880000000,'2018-03-29 08:28:43.813000',3,3048.00,'19:20:00.000000','090У',3048.00,NULL,NULL,2,NULL,NULL),
	(1244,'2018-04-28 06:25:00.000000','2018-04-27 16:40:00.000000',49500000000,'2018-03-29 08:28:43.813000',3,2959.00,'19:40:00.000000','272Х',2959.00,NULL,NULL,55,NULL,NULL),
	(1245,'2018-04-28 05:00:00.000000','2018-04-27 17:48:00.000000',40320000000,'2018-03-29 08:28:43.813000',3,5738.00,'20:48:00.000000','002Й',5738.00,NULL,NULL,142,NULL,NULL),
	(1246,'2018-04-28 07:45:00.000000','2018-04-27 20:08:00.000000',41820000000,'2018-03-29 08:28:43.813000',3,3753.00,'23:08:00.000000','024М',3753.00,NULL,NULL,329,NULL,NULL),
	(1247,'2018-04-28 10:08:00.000000','2018-04-27 20:38:00.000000',48600000000,'2018-03-29 08:28:43.813000',3,3328.00,'23:38:00.000000','112М',3328.00,NULL,955.00,42,NULL,79),
	(1248,'2018-04-30 01:42:00.000000','2018-04-29 12:55:00.000000',46020000000,'2018-03-29 08:28:43.813000',4,1672.00,'15:55:00.000000','081И',1743.00,1672.00,NULL,67,99,NULL),
	(1249,'2018-04-30 01:57:00.000000','2018-04-29 13:13:00.000000',45840000000,'2018-03-29 08:28:43.813000',4,1672.00,'16:13:00.000000','079У',1751.00,1672.00,955.00,33,24,52),
	(1250,'2018-04-30 03:37:00.000000','2018-04-29 15:11:00.000000',44760000000,'2018-03-29 08:28:43.813000',4,2146.00,'18:11:00.000000','023Г',2146.00,NULL,NULL,543,NULL,NULL),
	(1251,'2018-04-30 04:10:00.000000','2018-04-29 17:00:00.000000',40200000000,'2018-03-29 08:28:43.813000',4,2486.00,'20:00:00.000000','001Г',5135.00,2486.00,NULL,201,97,NULL),
	(1252,'2018-04-30 07:08:00.000000','2018-04-29 18:41:00.000000',44820000000,'2018-03-29 08:28:43.813000',4,2486.00,'21:41:00.000000','025Г',4470.00,2486.00,NULL,132,60,NULL),
	(1253,'2018-04-30 06:23:00.000000','2018-04-29 18:57:00.000000',41160000000,'2018-03-29 08:28:43.813000',4,2486.00,'21:57:00.000000','059Е',4054.00,2486.00,NULL,120,19,NULL),
	(1254,'2018-05-04 22:56:00.000000','2018-05-04 10:10:00.000000',45960000000,'2018-03-29 08:25:45.261000',3,1672.00,'13:10:00.000000','082И',1736.00,1672.00,NULL,54,64,NULL),
	(1255,'2018-05-05 02:10:00.000000','2018-05-04 13:38:00.000000',45120000000,'2018-03-29 08:25:45.261000',3,2486.00,'16:38:00.000000','016Е',3992.00,2486.00,NULL,148,292,NULL),
	(1256,'2018-05-05 02:57:00.000000','2018-05-04 14:38:00.000000',44340000000,'2018-03-29 08:25:45.261000',3,2486.00,'17:38:00.000000','026Г',5706.00,2486.00,NULL,116,83,NULL),
	(1257,'2018-05-05 04:38:00.000000','2018-05-04 15:50:00.000000',46080000000,'2018-03-29 08:25:45.261000',3,1703.00,'18:50:00.000000','136М',2591.00,1703.00,NULL,71,34,NULL),
	(1258,'2018-05-05 04:48:00.000000','2018-05-04 16:20:00.000000',44880000000,'2018-03-29 08:25:45.261000',3,1672.00,'19:20:00.000000','080У',2391.00,1672.00,955.00,36,19,34),
	(1259,'2018-05-05 06:25:00.000000','2018-05-04 16:40:00.000000',49500000000,'2018-03-29 08:25:45.261000',3,1672.00,'19:40:00.000000','272Х',1874.00,1672.00,NULL,219,56,NULL),
	(1260,'2018-05-05 05:00:00.000000','2018-05-04 17:48:00.000000',40320000000,'2018-03-29 08:25:45.261000',3,2486.00,'20:48:00.000000','002Й',4325.00,2486.00,NULL,183,128,NULL),
	(1261,'2018-05-05 07:45:00.000000','2018-05-04 20:08:00.000000',41820000000,'2018-03-29 08:25:45.261000',3,2982.00,'23:08:00.000000','024М',2982.00,NULL,NULL,499,NULL,NULL),
	(1262,'2018-05-05 10:08:00.000000','2018-05-04 20:38:00.000000',48600000000,'2018-03-29 08:25:45.261000',3,1703.00,'23:38:00.000000','112М',1825.00,1703.00,955.00,126,24,202),
	(1263,'2018-05-06 18:37:00.000000','2018-05-06 06:35:00.000000',43320000000,'2018-03-29 08:25:45.261000',4,1574.00,'09:35:00.000000','275Г',1574.00,1703.00,NULL,286,309,NULL),
	(1264,'2018-05-07 01:42:00.000000','2018-05-06 12:55:00.000000',46020000000,'2018-03-29 08:25:45.261000',4,1672.00,'15:55:00.000000','075Э',1727.00,1672.00,NULL,20,48,NULL),
	(1265,'2018-05-07 01:57:00.000000','2018-05-06 13:13:00.000000',45840000000,'2018-03-29 08:25:45.261000',4,1703.00,'16:13:00.000000','089У',2541.00,1703.00,955.00,28,19,53),
	(1266,'2018-05-07 02:38:00.000000','2018-05-06 13:30:00.000000',47280000000,'2018-03-29 08:25:45.261000',4,1703.00,'16:30:00.000000','117Н',2693.00,1703.00,NULL,5,3,NULL),
	(1267,'2018-05-07 02:46:00.000000','2018-05-06 13:42:00.000000',47040000000,'2018-03-29 08:25:45.261000',4,1672.00,'16:42:00.000000','095Н',2798.00,1672.00,NULL,25,1,NULL),
	(1268,'2018-05-07 03:37:00.000000','2018-05-06 15:11:00.000000',44760000000,'2018-03-29 08:25:45.261000',4,3242.00,'18:11:00.000000','023Г',3242.00,NULL,NULL,481,NULL,NULL),
	(1269,'2018-05-07 04:10:00.000000','2018-05-06 17:00:00.000000',40200000000,'2018-03-29 08:25:45.261000',4,4688.00,'20:00:00.000000','001Г',4688.00,NULL,NULL,179,NULL,NULL),
	(1270,'2018-05-07 07:08:00.000000','2018-05-06 18:41:00.000000',44820000000,'2018-03-29 08:25:45.261000',4,2486.00,'21:41:00.000000','025Г',4091.00,2486.00,NULL,97,4,NULL),
	(1271,'2018-05-07 06:23:00.000000','2018-05-06 18:57:00.000000',41160000000,'2018-03-29 08:25:45.261000',4,2486.00,'21:57:00.000000','015Е',4231.00,2486.00,NULL,106,1,NULL),
	(1272,'2018-05-11 10:33:00.000000','2018-05-10 22:20:00.000000',43980000000,'2018-03-29 08:25:50.948000',3,1393.00,'01:20:00.000000','276Г',1418.00,1393.00,NULL,280,432,NULL),
	(1273,'2018-05-11 12:55:00.000000','2018-05-10 22:50:00.000000',50700000000,'2018-03-29 08:25:50.948000',3,1393.00,'01:50:00.000000','278Г',1418.00,1393.00,NULL,268,424,NULL),
	(1274,'2018-05-11 22:56:00.000000','2018-05-11 10:10:00.000000',45960000000,'2018-03-29 08:25:50.948000',3,1393.00,'13:10:00.000000','076Э',1622.00,1393.00,NULL,55,118,NULL),
	(1275,'2018-05-11 23:07:00.000000','2018-05-11 10:18:00.000000',46140000000,'2018-03-29 08:25:50.948000',3,1393.00,'13:18:00.000000','118Н',1622.00,1393.00,NULL,82,66,NULL),
	(1276,'2018-05-12 02:10:00.000000','2018-05-11 13:38:00.000000',45120000000,'2018-03-29 08:25:50.948000',3,2059.00,'16:38:00.000000','060У',3242.00,2059.00,NULL,152,282,NULL),
	(1277,'2018-05-12 02:57:00.000000','2018-05-11 14:38:00.000000',44340000000,'2018-03-29 08:25:50.948000',3,2059.00,'17:38:00.000000','026Г',4253.00,2059.00,NULL,180,183,NULL),
	(1278,'2018-05-12 04:38:00.000000','2018-05-11 15:50:00.000000',46080000000,'2018-03-29 08:25:50.948000',3,1393.00,'18:50:00.000000','096Н',1644.00,1393.00,NULL,43,45,NULL),
	(1279,'2018-05-12 04:48:00.000000','2018-05-11 16:20:00.000000',44880000000,'2018-03-29 08:25:50.948000',3,1393.00,'19:20:00.000000','090У',3263.00,1393.00,782.00,14,9,46),
	(1280,'2018-05-12 06:25:00.000000','2018-05-11 16:40:00.000000',49500000000,'2018-03-29 08:25:50.948000',3,1393.00,'19:40:00.000000','272Х',1923.00,1393.00,NULL,86,30,NULL),
	(1281,'2018-05-12 05:00:00.000000','2018-05-11 17:48:00.000000',40320000000,'2018-03-29 08:25:50.948000',3,2059.00,'20:48:00.000000','002Й',4153.00,2059.00,NULL,170,76,NULL),
	(1282,'2018-05-12 07:45:00.000000','2018-05-11 20:08:00.000000',41820000000,'2018-03-29 08:25:50.948000',3,3060.00,'23:08:00.000000','024М',3060.00,NULL,NULL,464,NULL,NULL),
	(1283,'2018-05-12 10:08:00.000000','2018-05-11 20:38:00.000000',48600000000,'2018-03-29 08:25:50.948000',3,1419.00,'23:38:00.000000','112М',1745.00,1419.00,782.00,144,123,218),
	(1284,'2018-05-14 01:42:00.000000','2018-05-13 12:55:00.000000',46020000000,'2018-03-29 08:25:50.948000',4,1419.00,'15:55:00.000000','081И',1735.00,1419.00,NULL,125,12,NULL),
	(1285,'2018-05-14 01:57:00.000000','2018-05-13 13:13:00.000000',45840000000,'2018-03-29 08:25:50.948000',4,1393.00,'16:13:00.000000','079У',1547.00,1393.00,782.00,31,33,57),
	(1286,'2018-05-14 03:37:00.000000','2018-05-13 15:11:00.000000',44760000000,'2018-03-29 08:25:50.948000',4,2705.00,'18:11:00.000000','023Г',2705.00,NULL,NULL,324,NULL,NULL),
	(1287,'2018-05-14 04:10:00.000000','2018-05-13 17:00:00.000000',40200000000,'2018-03-29 08:25:50.948000',4,2059.00,'20:00:00.000000','001Г',4153.00,2059.00,NULL,184,23,NULL),
	(1288,'2018-05-14 07:08:00.000000','2018-05-13 18:41:00.000000',44820000000,'2018-03-29 08:25:50.948000',4,2059.00,'21:41:00.000000','025Г',3930.00,2059.00,NULL,88,12,NULL),
	(1289,'2018-05-14 06:23:00.000000','2018-05-13 18:57:00.000000',41160000000,'2018-03-29 08:25:50.948000',4,2059.00,'21:57:00.000000','059Е',3422.00,2059.00,NULL,100,18,NULL),
	(1290,'2018-05-18 22:56:00.000000','2018-05-18 10:10:00.000000',45960000000,'2018-03-29 08:25:56.617000',3,1393.00,'13:10:00.000000','082И',1736.00,1393.00,NULL,91,80,NULL),
	(1291,'2018-05-19 02:10:00.000000','2018-05-18 13:38:00.000000',45120000000,'2018-03-29 08:25:56.617000',3,2059.00,'16:38:00.000000','016Е',3912.00,2059.00,NULL,87,198,NULL),
	(1292,'2018-05-19 02:57:00.000000','2018-05-18 14:38:00.000000',44340000000,'2018-03-29 08:25:56.617000',3,2059.00,'17:38:00.000000','026Г',5093.00,2059.00,NULL,76,275,NULL),
	(1293,'2018-05-19 04:38:00.000000','2018-05-18 15:50:00.000000',46080000000,'2018-03-29 08:25:56.617000',3,1419.00,'18:50:00.000000','136М',2352.00,1419.00,NULL,38,4,NULL),
	(1294,'2018-05-19 04:48:00.000000','2018-05-18 16:20:00.000000',44880000000,'2018-03-29 08:25:56.617000',3,2619.00,'19:20:00.000000','080У',2619.00,NULL,782.00,19,NULL,38),
	(1295,'2018-05-19 05:00:00.000000','2018-05-18 17:48:00.000000',40320000000,'2018-03-29 08:25:56.617000',3,2059.00,'20:48:00.000000','002Й',4498.00,2059.00,NULL,168,22,NULL),
	(1296,'2018-05-19 07:45:00.000000','2018-05-18 20:08:00.000000',41820000000,'2018-03-29 08:25:56.617000',3,3574.00,'23:08:00.000000','024М',3574.00,NULL,NULL,420,NULL,NULL),
	(1297,'2018-05-19 10:08:00.000000','2018-05-18 20:38:00.000000',48600000000,'2018-03-29 08:25:56.617000',3,1419.00,'23:38:00.000000','112М',2256.00,1419.00,782.00,110,85,216),
	(1298,'2018-05-21 01:42:00.000000','2018-05-20 12:55:00.000000',46020000000,'2018-03-29 08:25:56.617000',4,1393.00,'15:55:00.000000','075Э',1622.00,1393.00,NULL,44,135,NULL),
	(1299,'2018-05-21 01:57:00.000000','2018-05-20 13:13:00.000000',45840000000,'2018-03-29 08:25:56.617000',4,1419.00,'16:13:00.000000','089У',2156.00,1419.00,782.00,36,100,59),
	(1300,'2018-05-21 02:38:00.000000','2018-05-20 13:30:00.000000',47280000000,'2018-03-29 08:25:56.617000',4,1419.00,'16:30:00.000000','117Н',1622.00,1419.00,NULL,62,32,NULL),
	(1301,'2018-05-21 02:46:00.000000','2018-05-20 13:42:00.000000',47040000000,'2018-03-29 08:25:56.617000',4,1393.00,'16:42:00.000000','095Н',2093.00,1393.00,NULL,54,45,NULL),
	(1302,'2018-05-21 03:37:00.000000','2018-05-20 15:11:00.000000',44760000000,'2018-03-29 08:25:56.617000',4,2705.00,'18:11:00.000000','023Г',2705.00,NULL,NULL,224,NULL,NULL),
	(1303,'2018-05-21 04:10:00.000000','2018-05-20 17:00:00.000000',40200000000,'2018-03-29 08:25:56.617000',4,2059.00,'20:00:00.000000','001Г',4498.00,2059.00,NULL,154,1,NULL),
	(1304,'2018-05-21 07:08:00.000000','2018-05-20 18:41:00.000000',44820000000,'2018-03-29 08:25:56.617000',4,2059.00,'21:41:00.000000','025Г',3635.00,2059.00,NULL,89,28,NULL),
	(1305,'2018-05-21 06:23:00.000000','2018-05-20 18:57:00.000000',41160000000,'2018-03-29 08:25:56.617000',4,3912.00,'21:57:00.000000','015Е',3912.00,NULL,NULL,95,NULL,NULL),
	(1306,'2018-05-25 22:56:00.000000','2018-05-25 10:10:00.000000',45960000000,'2018-03-29 08:26:02.383000',3,1393.00,'13:10:00.000000','076Э',1696.00,1393.00,NULL,52,117,NULL),
	(1307,'2018-05-25 23:07:00.000000','2018-05-25 10:18:00.000000',46140000000,'2018-03-29 08:26:02.383000',3,1419.00,'13:18:00.000000','118Н',1696.00,1419.00,NULL,92,41,NULL),
	(1308,'2018-05-26 02:10:00.000000','2018-05-25 13:38:00.000000',45120000000,'2018-03-29 08:26:02.383000',3,2059.00,'16:38:00.000000','060У',3734.00,2059.00,NULL,78,186,NULL),
	(1309,'2018-05-26 02:57:00.000000','2018-05-25 14:38:00.000000',44340000000,'2018-03-29 08:26:02.383000',3,2059.00,'17:38:00.000000','026Г',4091.00,2059.00,NULL,91,275,NULL),
	(1310,'2018-05-26 04:38:00.000000','2018-05-25 15:50:00.000000',46080000000,'2018-03-29 08:26:02.383000',3,1393.00,'18:50:00.000000','096Н',2568.00,1393.00,NULL,15,42,NULL),
	(1311,'2018-05-26 04:48:00.000000','2018-05-25 16:20:00.000000',44880000000,'2018-03-29 08:26:02.383000',3,1419.00,'19:20:00.000000','090У',3392.00,1419.00,782.00,9,6,36),
	(1312,'2018-05-26 05:00:00.000000','2018-05-25 17:48:00.000000',40320000000,'2018-03-29 08:26:02.383000',3,2059.00,'20:48:00.000000','002Й',4325.00,2059.00,NULL,180,97,NULL),
	(1313,'2018-05-26 07:45:00.000000','2018-05-25 20:08:00.000000',41820000000,'2018-03-29 08:26:02.383000',3,3195.00,'23:08:00.000000','024М',3195.00,NULL,NULL,532,NULL,NULL),
	(1314,'2018-05-26 10:08:00.000000','2018-05-25 20:38:00.000000',48600000000,'2018-03-29 08:26:02.383000',3,1419.00,'23:38:00.000000','112М',1825.00,1419.00,782.00,119,124,208),
	(1315,'2018-05-28 01:42:00.000000','2018-05-27 12:55:00.000000',46020000000,'2018-03-29 08:26:02.383000',4,1703.00,'15:55:00.000000','081И',1735.00,1703.00,NULL,48,26,NULL),
	(1316,'2018-05-28 01:57:00.000000','2018-05-27 13:13:00.000000',45840000000,'2018-03-29 08:26:02.383000',4,1672.00,'16:13:00.000000','079У',2514.00,1672.00,955.00,51,40,57),
	(1317,'2018-05-28 03:37:00.000000','2018-05-27 15:11:00.000000',44760000000,'2018-03-29 08:26:02.383000',4,2822.00,'18:11:00.000000','023Г',2822.00,NULL,NULL,365,NULL,NULL),
	(1318,'2018-05-28 04:10:00.000000','2018-05-27 17:00:00.000000',40200000000,'2018-03-29 08:26:02.383000',4,2486.00,'20:00:00.000000','001Г',4688.00,2486.00,NULL,167,69,NULL),
	(1319,'2018-05-28 07:08:00.000000','2018-05-27 18:41:00.000000',44820000000,'2018-03-29 08:26:02.383000',4,2486.00,'21:41:00.000000','025Г',4091.00,2486.00,NULL,119,67,NULL),
	(1320,'2018-05-28 06:23:00.000000','2018-05-27 18:57:00.000000',41160000000,'2018-03-29 08:26:02.383000',4,2486.00,'21:57:00.000000','059Е',5400.00,2486.00,NULL,54,41,NULL),
	(1321,'2018-04-06 05:59:00.000000','2018-04-05 21:20:00.000000',31140000000,'2018-03-29 08:24:24.835000',1,2800.00,'00:20:00.000000','020У',2800.00,NULL,NULL,70,NULL,NULL),
	(1322,'2018-04-06 06:13:00.000000','2018-04-05 21:41:00.000000',30720000000,'2018-03-29 08:24:24.835000',1,1212.00,'00:41:00.000000','016А',3027.00,1212.00,NULL,35,120,NULL),
	(1323,'2018-04-06 06:05:00.000000','2018-04-05 21:44:00.000000',30060000000,'2018-03-29 08:24:24.835000',1,1212.00,'00:44:00.000000','059Г',2787.00,1212.00,NULL,37,24,NULL),
	(1324,'2018-04-06 07:18:00.000000','2018-04-05 22:15:00.000000',32580000000,'2018-03-29 08:24:24.835000',1,806.00,'01:15:00.000000','030А',2257.00,806.00,693.00,18,68,26),
	(1325,'2018-04-06 07:24:00.000000','2018-04-05 22:25:00.000000',32340000000,'2018-03-29 08:24:24.835000',1,806.00,'01:25:00.000000','128А',2685.00,806.00,693.00,18,397,39),
	(1326,'2018-04-06 08:10:00.000000','2018-04-05 22:56:00.000000',33240000000,'2018-03-29 08:24:24.835000',1,840.00,'01:56:00.000000','111В',1422.00,840.00,NULL,48,142,NULL),
	(1327,'2018-04-06 09:25:00.000000','2018-04-06 00:33:00.000000',31920000000,'2018-03-29 08:24:24.835000',1,840.00,'03:33:00.000000','079Ж',1656.00,840.00,NULL,65,49,NULL),
	(1328,'2018-04-06 09:30:00.000000','2018-04-06 01:35:00.000000',28500000000,'2018-03-29 08:24:24.835000',1,1739.00,'04:35:00.000000','082В',1739.00,NULL,NULL,114,NULL,NULL),
	(1329,'2018-04-06 06:15:00.000000','2018-04-06 02:45:00.000000',12600000000,'2018-03-29 08:24:24.835000',1,2335.00,'05:45:00.000000','752А',NULL,NULL,2335.00,NULL,NULL,372),
	(1330,'2018-04-06 07:52:00.000000','2018-04-06 03:50:00.000000',14520000000,'2018-03-29 08:24:24.835000',1,2335.00,'06:50:00.000000','754А',NULL,NULL,2335.00,NULL,NULL,347),
	(1331,'2018-04-06 08:00:00.000000','2018-04-06 04:00:00.000000',14400000000,'2018-03-29 08:24:24.835000',1,3183.00,'07:00:00.000000','756А',NULL,NULL,3183.00,NULL,NULL,628),
	(1332,'2018-04-06 15:09:00.000000','2018-04-06 05:08:00.000000',36060000000,'2018-03-29 08:24:24.835000',1,840.00,'08:08:00.000000','224В',1671.00,840.00,728.00,19,135,107),
	(1333,'2018-04-06 10:20:00.000000','2018-04-06 06:18:00.000000',14520000000,'2018-03-29 08:24:24.835000',1,4584.00,'09:18:00.000000','757Н',NULL,NULL,4584.00,NULL,NULL,344),
	(1334,'2018-04-06 10:32:00.000000','2018-04-06 06:40:00.000000',13920000000,'2018-03-29 08:24:24.835000',1,5273.00,'09:40:00.000000','760А',NULL,NULL,5273.00,NULL,NULL,204),
	(1335,'2018-04-06 14:45:00.000000','2018-04-06 10:40:00.000000',14700000000,'2018-03-29 08:24:24.835000',1,3127.00,'13:40:00.000000','748А',NULL,NULL,3127.00,NULL,NULL,107),
	(1336,'2018-04-06 16:16:00.000000','2018-04-06 12:30:00.000000',13560000000,'2018-03-29 08:24:24.835000',1,5187.00,'15:30:00.000000','768А',NULL,NULL,5187.00,NULL,NULL,299),
	(1337,'2018-04-06 16:27:00.000000','2018-04-06 12:40:00.000000',13620000000,'2018-03-29 08:24:24.835000',1,5187.00,'15:40:00.000000','770А',NULL,NULL,5187.00,NULL,NULL,313),
	(1338,'2018-04-06 18:16:00.000000','2018-04-06 14:30:00.000000',13560000000,'2018-03-29 08:24:24.835000',1,2290.00,'17:30:00.000000','772А',NULL,NULL,2290.00,NULL,NULL,332),
	(1339,'2018-04-06 18:35:00.000000','2018-04-06 14:40:00.000000',14100000000,'2018-03-29 08:24:24.835000',1,6636.00,'17:40:00.000000','774А',NULL,NULL,6636.00,NULL,NULL,497),
	(1340,'2018-04-07 04:45:00.000000','2018-04-06 15:45:00.000000',46800000000,'2018-03-29 08:24:24.835000',1,806.00,'18:45:00.000000','210А',2234.00,806.00,NULL,17,415,NULL),
	(1341,'2018-04-06 20:25:00.000000','2018-04-06 16:30:00.000000',14100000000,'2018-03-29 08:24:24.835000',1,6337.00,'19:30:00.000000','776А',NULL,NULL,6337.00,NULL,NULL,529),
	(1342,'2018-04-06 20:44:00.000000','2018-04-06 16:40:00.000000',14640000000,'2018-03-29 08:24:24.835000',1,6636.00,'19:40:00.000000','778А',NULL,NULL,6636.00,NULL,NULL,243),
	(1343,'2018-04-06 21:40:00.000000','2018-04-06 18:00:00.000000',13200000000,'2018-03-29 08:24:24.835000',1,5783.00,'21:00:00.000000','780А',NULL,NULL,5783.00,NULL,NULL,258),
	(1344,'2018-04-07 02:01:00.000000','2018-04-06 18:20:00.000000',27660000000,'2018-03-29 08:24:24.835000',1,2057.00,'21:20:00.000000','135С',2057.00,NULL,NULL,47,NULL,NULL),
	(1345,'2018-04-07 02:19:00.000000','2018-04-06 18:24:00.000000',28500000000,'2018-03-29 08:24:24.835000',1,3015.00,'21:24:00.000000','024А',3015.00,NULL,NULL,3,NULL,NULL),
	(1346,'2018-04-07 04:30:00.000000','2018-04-06 18:41:00.000000',35340000000,'2018-03-29 08:24:24.835000',1,2182.00,'21:41:00.000000','120В',2182.00,NULL,NULL,36,NULL,NULL),
	(1347,'2018-04-07 02:32:00.000000','2018-04-06 18:49:00.000000',27780000000,'2018-03-29 08:24:24.835000',1,2709.00,'21:49:00.000000','107Й',2709.00,NULL,1190.00,87,NULL,58),
	(1348,'2018-04-07 03:06:00.000000','2018-04-06 18:50:00.000000',29760000000,'2018-03-29 08:24:24.835000',1,2118.00,'21:50:00.000000','026А',2118.00,NULL,NULL,78,NULL,NULL),
	(1349,'2018-04-07 02:39:00.000000','2018-04-06 19:15:00.000000',26640000000,'2018-03-29 08:24:24.835000',1,3353.00,'22:15:00.000000','034А',3353.00,NULL,NULL,4,NULL,NULL),
	(1350,'2018-04-07 03:16:00.000000','2018-04-06 19:16:00.000000',28800000000,'2018-03-29 08:24:24.835000',1,2593.00,'22:16:00.000000','146У',2593.00,NULL,728.00,17,NULL,17),
	(1351,'2018-04-07 03:40:00.000000','2018-04-06 19:28:00.000000',29520000000,'2018-03-29 08:24:24.835000',1,2962.00,'22:28:00.000000','028А',2962.00,NULL,NULL,28,NULL,NULL),
	(1352,'2018-04-07 03:47:00.000000','2018-04-06 19:50:00.000000',28620000000,'2018-03-29 08:24:24.835000',1,3243.00,'22:50:00.000000','006А',3243.00,NULL,NULL,38,NULL,NULL),
	(1353,'2018-04-07 02:49:00.000000','2018-04-06 20:10:00.000000',23940000000,'2018-03-29 08:24:24.835000',1,3522.00,'23:10:00.000000','032А',3522.00,NULL,NULL,5,NULL,NULL),
	(1354,'2018-04-07 05:30:00.000000','2018-04-06 20:30:00.000000',32400000000,'2018-03-29 08:24:24.835000',1,2671.00,'23:30:00.000000','004А',2671.00,NULL,NULL,138,NULL,NULL),
	(1355,'2018-04-07 05:36:00.000000','2018-04-06 20:40:00.000000',32160000000,'2018-03-29 08:24:24.835000',1,4360.00,'23:40:00.000000','054Ч',4360.00,NULL,NULL,64,NULL,NULL),
	(1356,'2018-04-07 04:55:00.000000','2018-04-06 20:55:00.000000',28800000000,'2018-03-29 08:24:24.835000',1,3061.00,'23:55:00.000000','002А',3061.00,NULL,NULL,50,NULL,NULL),
	(1357,'2018-04-08 06:43:00.000000','2018-04-07 21:11:00.000000',34320000000,'2018-03-29 08:24:24.835000',2,1332.00,'00:11:00.000000','119А',2082.00,1332.00,NULL,63,13,NULL),
	(1358,'2018-04-08 06:00:00.000000','2018-04-08 02:30:00.000000',12600000000,'2018-03-29 08:24:24.835000',2,1490.00,'05:30:00.000000','751А',NULL,NULL,1490.00,NULL,NULL,424),
	(1359,'2018-04-08 07:43:00.000000','2018-04-08 03:40:00.000000',14580000000,'2018-03-29 08:24:24.835000',2,994.00,'06:40:00.000000','753А',NULL,NULL,994.00,NULL,NULL,412),
	(1360,'2018-04-08 07:50:00.000000','2018-04-08 03:50:00.000000',14400000000,'2018-03-29 08:24:24.835000',2,994.00,'06:50:00.000000','755А',NULL,NULL,994.00,NULL,NULL,784),
	(1361,'2018-04-08 09:58:00.000000','2018-04-08 06:00:00.000000',14280000000,'2018-03-29 08:24:24.835000',2,3504.00,'09:00:00.000000','757А',NULL,NULL,3504.00,NULL,NULL,273),
	(1362,'2018-04-08 11:46:00.000000','2018-04-08 08:00:00.000000',13560000000,'2018-03-29 08:24:24.835000',2,4173.00,'11:00:00.000000','761А',NULL,NULL,4173.00,NULL,NULL,357),
	(1363,'2018-04-08 11:56:00.000000','2018-04-08 08:10:00.000000',13560000000,'2018-03-29 08:24:24.835000',2,3584.00,'11:10:00.000000','763А',NULL,NULL,3584.00,NULL,NULL,356),
	(1364,'2018-04-08 13:58:00.000000','2018-04-08 10:00:00.000000',14280000000,'2018-03-29 08:24:24.835000',2,4584.00,'13:00:00.000000','765А',NULL,NULL,4584.00,NULL,NULL,621),
	(1365,'2018-04-08 14:15:00.000000','2018-04-08 10:10:00.000000',14700000000,'2018-03-29 08:24:24.835000',2,3490.00,'13:10:00.000000','747А',NULL,NULL,3490.00,NULL,NULL,116),
	(1366,'2018-04-08 18:35:00.000000','2018-04-08 10:32:00.000000',28980000000,'2018-03-29 08:24:24.835000',2,854.00,'13:32:00.000000','049А',1844.00,854.00,NULL,42,40,NULL),
	(1367,'2018-04-08 19:27:00.000000','2018-04-08 10:33:00.000000',32040000000,'2018-03-29 08:24:24.835000',2,840.00,'13:33:00.000000','131Г',2305.00,840.00,NULL,16,155,NULL),
	(1368,'2018-04-08 15:45:00.000000','2018-04-08 12:00:00.000000',13500000000,'2018-03-29 08:24:24.835000',2,5273.00,'15:00:00.000000','767А',NULL,NULL,5273.00,NULL,NULL,184),
	(1369,'2018-04-08 15:59:00.000000','2018-04-08 12:10:00.000000',13740000000,'2018-03-29 08:24:24.835000',2,5273.00,'15:10:00.000000','769А',NULL,NULL,5273.00,NULL,NULL,226),
	(1370,'2018-04-09 00:03:00.000000','2018-04-08 13:32:00.000000',37860000000,'2018-03-29 08:24:24.835000',2,1332.00,'16:32:00.000000','121А',1494.00,1332.00,NULL,48,12,NULL),
	(1371,'2018-04-08 17:54:00.000000','2018-04-08 14:00:00.000000',14040000000,'2018-03-29 08:24:24.835000',2,5584.00,'17:00:00.000000','771Н',NULL,NULL,5584.00,NULL,NULL,179),
	(1372,'2018-04-08 17:56:00.000000','2018-04-08 14:10:00.000000',13560000000,'2018-03-29 08:24:24.835000',2,5784.00,'17:10:00.000000','773А',NULL,NULL,5784.00,NULL,NULL,221),
	(1373,'2018-04-08 19:58:00.000000','2018-04-08 16:00:00.000000',14280000000,'2018-03-29 08:24:24.835000',2,5783.00,'19:00:00.000000','775А',NULL,NULL,5783.00,NULL,NULL,573),
	(1374,'2018-04-08 20:13:00.000000','2018-04-08 16:10:00.000000',14580000000,'2018-03-29 08:24:24.835000',2,5783.00,'19:10:00.000000','777А',NULL,NULL,5783.00,NULL,NULL,265),
	(1375,'2018-04-08 23:10:00.000000','2018-04-08 16:15:00.000000',24900000000,'2018-03-29 08:24:24.835000',2,1212.00,'19:15:00.000000','059А',2899.00,1212.00,NULL,37,78,NULL),
	(1376,'2018-04-09 01:30:00.000000','2018-04-08 16:27:00.000000',32580000000,'2018-03-29 08:24:24.835000',2,806.00,'19:27:00.000000','251А',1956.00,806.00,693.00,18,434,95),
	(1377,'2018-04-09 00:46:00.000000','2018-04-08 17:00:00.000000',27960000000,'2018-03-29 08:24:24.835000',2,840.00,'20:00:00.000000','111А',1422.00,840.00,NULL,45,147,NULL),
	(1378,'2018-04-09 01:00:00.000000','2018-04-08 17:06:00.000000',28440000000,'2018-03-29 08:24:24.835000',2,854.00,'20:06:00.000000','081А',1739.00,854.00,NULL,92,13,NULL),
	(1379,'2018-04-09 01:12:00.000000','2018-04-08 17:32:00.000000',27600000000,'2018-03-29 08:24:24.835000',2,854.00,'20:32:00.000000','079А',1793.00,854.00,NULL,41,146,NULL),
	(1380,'2018-04-08 21:40:00.000000','2018-04-08 18:00:00.000000',13200000000,'2018-03-29 08:24:24.835000',2,5783.00,'21:00:00.000000','779А',NULL,NULL,5783.00,NULL,NULL,299),
	(1381,'2018-04-09 02:22:00.000000','2018-04-08 18:05:00.000000',29820000000,'2018-03-29 08:24:24.835000',2,806.00,'21:05:00.000000','287Ч',2197.00,806.00,NULL,18,443,NULL),
	(1382,'2018-04-09 01:51:00.000000','2018-04-08 18:24:00.000000',26820000000,'2018-03-29 08:24:24.835000',2,806.00,'21:24:00.000000','127А',2654.00,806.00,NULL,16,460,NULL),
	(1383,'2018-04-09 03:06:00.000000','2018-04-08 18:55:00.000000',29460000000,'2018-03-29 08:24:24.835000',2,3466.00,'21:55:00.000000','025А',3466.00,NULL,NULL,97,NULL,NULL),
	(1384,'2018-04-09 02:49:00.000000','2018-04-08 19:11:00.000000',27480000000,'2018-03-29 08:24:24.835000',2,3003.00,'22:11:00.000000','029А',3003.00,NULL,NULL,31,NULL,NULL),
	(1385,'2018-04-09 02:57:00.000000','2018-04-08 19:29:00.000000',26880000000,'2018-03-29 08:24:24.835000',2,2800.00,'22:29:00.000000','019У',2800.00,NULL,NULL,85,NULL,NULL),
	(1386,'2018-04-09 03:50:00.000000','2018-04-08 19:41:00.000000',29340000000,'2018-03-29 08:24:24.835000',2,1212.00,'22:41:00.000000','015А',2387.00,1212.00,NULL,60,4,NULL),
	(1387,'2018-04-09 03:45:00.000000','2018-04-08 19:50:00.000000',28500000000,'2018-03-29 08:24:24.835000',2,3243.00,'22:50:00.000000','005А',3243.00,NULL,NULL,120,NULL,NULL),
	(1388,'2018-04-09 05:30:00.000000','2018-04-08 20:30:00.000000',32400000000,'2018-03-29 08:24:24.835000',2,2332.00,'23:30:00.000000','003А',2332.00,NULL,NULL,92,NULL,NULL),
	(1389,'2018-04-09 04:19:00.000000','2018-04-08 20:36:00.000000',27780000000,'2018-03-29 08:24:24.835000',2,2449.00,'23:36:00.000000','027А',2449.00,NULL,NULL,134,NULL,NULL),
	(1390,'2018-04-09 05:14:00.000000','2018-04-08 20:44:00.000000',30600000000,'2018-03-29 08:24:24.835000',2,3352.00,'23:44:00.000000','053Ч',3352.00,NULL,NULL,131,NULL,NULL),
	(1391,'2018-04-09 04:55:00.000000','2018-04-08 20:55:00.000000',28800000000,'2018-03-29 08:24:24.835000',2,3447.00,'23:55:00.000000','001А',3447.00,NULL,NULL,51,NULL,NULL),
	(1392,'2018-04-13 06:52:00.000000','2018-04-12 21:10:00.000000',34920000000,'2018-03-29 08:24:31.983000',1,1332.00,'00:10:00.000000','116С',1591.00,1332.00,NULL,78,1,NULL),
	(1393,'2018-04-13 05:59:00.000000','2018-04-12 21:20:00.000000',31140000000,'2018-03-29 08:24:31.983000',1,2800.00,'00:20:00.000000','020У',2800.00,NULL,NULL,49,NULL,NULL),
	(1394,'2018-04-13 06:13:00.000000','2018-04-12 21:41:00.000000',30720000000,'2018-03-29 08:24:31.983000',1,1212.00,'00:41:00.000000','016А',2857.00,1212.00,NULL,24,10,NULL),
	(1395,'2018-04-13 06:05:00.000000','2018-04-12 21:44:00.000000',30060000000,'2018-03-29 08:24:31.983000',1,1212.00,'00:44:00.000000','059Г',2751.00,1212.00,NULL,40,14,NULL),
	(1396,'2018-04-13 07:18:00.000000','2018-04-12 22:15:00.000000',32580000000,'2018-03-29 08:24:31.983000',1,2433.00,'01:15:00.000000','030А',2433.00,NULL,693.00,18,NULL,32),
	(1397,'2018-04-13 09:30:00.000000','2018-04-13 01:35:00.000000',28500000000,'2018-03-29 08:24:31.983000',1,1308.00,'04:35:00.000000','082В',1739.00,1308.00,NULL,158,1,NULL),
	(1398,'2018-04-13 06:15:00.000000','2018-04-13 02:45:00.000000',12600000000,'2018-03-29 08:24:31.983000',1,2141.00,'05:45:00.000000','752А',NULL,NULL,2141.00,NULL,NULL,374),
	(1399,'2018-04-13 07:52:00.000000','2018-04-13 03:50:00.000000',14520000000,'2018-03-29 08:24:31.983000',1,2643.00,'06:50:00.000000','754А',NULL,NULL,2643.00,NULL,NULL,396),
	(1400,'2018-04-13 08:00:00.000000','2018-04-13 04:00:00.000000',14400000000,'2018-03-29 08:24:31.983000',1,2643.00,'07:00:00.000000','756А',NULL,NULL,2643.00,NULL,NULL,759),
	(1401,'2018-04-13 15:09:00.000000','2018-04-13 05:08:00.000000',36060000000,'2018-03-29 08:24:31.983000',1,840.00,'08:08:00.000000','224В',1796.00,840.00,728.00,19,133,179),
	(1402,'2018-04-13 10:20:00.000000','2018-04-13 06:18:00.000000',14520000000,'2018-03-29 08:24:31.983000',1,3584.00,'09:18:00.000000','757Н',NULL,NULL,3584.00,NULL,NULL,386),
	(1403,'2018-04-13 10:32:00.000000','2018-04-13 06:40:00.000000',13920000000,'2018-03-29 08:24:31.983000',1,4584.00,'09:40:00.000000','760А',NULL,NULL,4584.00,NULL,NULL,271),
	(1404,'2018-04-13 14:45:00.000000','2018-04-13 10:40:00.000000',14700000000,'2018-03-29 08:24:31.983000',1,3037.00,'13:40:00.000000','748А',NULL,NULL,3037.00,NULL,NULL,151),
	(1405,'2018-04-13 16:16:00.000000','2018-04-13 12:30:00.000000',13560000000,'2018-03-29 08:24:31.983000',1,5187.00,'15:30:00.000000','768А',NULL,NULL,5187.00,NULL,NULL,342),
	(1406,'2018-04-13 16:27:00.000000','2018-04-13 12:40:00.000000',13620000000,'2018-03-29 08:24:31.983000',1,5187.00,'15:40:00.000000','770А',NULL,NULL,5187.00,NULL,NULL,340),
	(1407,'2018-04-13 18:35:00.000000','2018-04-13 14:40:00.000000',14100000000,'2018-03-29 08:24:31.983000',1,5187.00,'17:40:00.000000','774А',NULL,NULL,5187.00,NULL,NULL,652),
	(1408,'2018-04-14 04:02:00.000000','2018-04-13 15:45:00.000000',44220000000,'2018-03-29 08:24:31.983000',1,840.00,'18:45:00.000000','210А',2130.00,840.00,NULL,24,462,NULL),
	(1409,'2018-04-13 20:25:00.000000','2018-04-13 16:30:00.000000',14100000000,'2018-03-29 08:24:31.983000',1,5187.00,'19:30:00.000000','776А',NULL,NULL,5187.00,NULL,NULL,660),
	(1410,'2018-04-13 20:44:00.000000','2018-04-13 16:40:00.000000',14640000000,'2018-03-29 08:24:31.983000',1,5187.00,'19:40:00.000000','778А',NULL,NULL,5187.00,NULL,NULL,330),
	(1411,'2018-04-13 21:40:00.000000','2018-04-13 18:00:00.000000',13200000000,'2018-03-29 08:24:31.983000',1,4784.00,'21:00:00.000000','780А',NULL,NULL,4784.00,NULL,NULL,332),
	(1412,'2018-04-14 02:01:00.000000','2018-04-13 18:20:00.000000',27660000000,'2018-03-29 08:24:31.983000',1,1332.00,'21:20:00.000000','121С',1494.00,1332.00,NULL,61,13,NULL),
	(1413,'2018-04-14 02:19:00.000000','2018-04-13 18:24:00.000000',28500000000,'2018-03-29 08:24:31.983000',1,1675.00,'21:24:00.000000','024А',1675.00,NULL,NULL,217,NULL,NULL),
	(1414,'2018-04-14 04:30:00.000000','2018-04-13 18:41:00.000000',35340000000,'2018-03-29 08:24:31.983000',1,854.00,'21:41:00.000000','120В',2136.00,854.00,NULL,54,34,NULL),
	(1415,'2018-04-14 03:06:00.000000','2018-04-13 18:50:00.000000',29760000000,'2018-03-29 08:24:31.983000',1,1486.00,'21:50:00.000000','026А',1486.00,NULL,NULL,268,NULL,NULL),
	(1416,'2018-04-14 02:39:00.000000','2018-04-13 19:15:00.000000',26640000000,'2018-03-29 08:24:31.983000',1,1251.00,'22:15:00.000000','034А',2238.00,1251.00,693.00,15,99,12),
	(1417,'2018-04-14 03:16:00.000000','2018-04-13 19:16:00.000000',28800000000,'2018-03-29 08:24:31.983000',1,840.00,'22:16:00.000000','132Г',2007.00,840.00,NULL,27,129,NULL),
	(1418,'2018-04-14 03:40:00.000000','2018-04-13 19:28:00.000000',29520000000,'2018-03-29 08:24:31.983000',1,1251.00,'22:28:00.000000','028А',2397.00,1251.00,NULL,192,17,NULL),
	(1419,'2018-04-14 03:47:00.000000','2018-04-13 19:50:00.000000',28620000000,'2018-03-29 08:24:31.983000',1,1833.00,'22:50:00.000000','006А',1833.00,NULL,NULL,161,NULL,NULL),
	(1420,'2018-04-14 02:49:00.000000','2018-04-13 20:10:00.000000',23940000000,'2018-03-29 08:24:31.983000',1,3522.00,'23:10:00.000000','032А',3522.00,NULL,NULL,8,NULL,NULL),
	(1421,'2018-04-14 05:30:00.000000','2018-04-13 20:30:00.000000',32400000000,'2018-03-29 08:24:31.983000',1,2626.00,'23:30:00.000000','004А',2626.00,NULL,NULL,183,NULL,NULL),
	(1422,'2018-04-14 05:36:00.000000','2018-04-13 20:40:00.000000',32160000000,'2018-03-29 08:24:31.983000',1,3184.00,'23:40:00.000000','054Ч',3184.00,NULL,NULL,112,NULL,NULL),
	(1423,'2018-04-14 04:55:00.000000','2018-04-13 20:55:00.000000',28800000000,'2018-03-29 08:24:31.983000',1,3006.00,'23:55:00.000000','002А',3006.00,NULL,NULL,67,NULL,NULL),
	(1424,'2018-04-15 06:43:00.000000','2018-04-14 21:11:00.000000',34320000000,'2018-03-29 08:24:31.983000',2,1332.00,'00:11:00.000000','119А',2082.00,1332.00,NULL,54,13,NULL),
	(1425,'2018-04-15 06:00:00.000000','2018-04-15 02:30:00.000000',12600000000,'2018-03-29 08:24:31.983000',2,1229.00,'05:30:00.000000','751А',NULL,NULL,1229.00,NULL,NULL,438),
	(1426,'2018-04-15 07:43:00.000000','2018-04-15 03:40:00.000000',14580000000,'2018-03-29 08:24:31.983000',2,1229.00,'06:40:00.000000','753А',NULL,NULL,1229.00,NULL,NULL,400),
	(1427,'2018-04-15 07:50:00.000000','2018-04-15 03:50:00.000000',14400000000,'2018-03-29 08:24:31.983000',2,1229.00,'06:50:00.000000','755А',NULL,NULL,1229.00,NULL,NULL,754),
	(1428,'2018-04-15 09:58:00.000000','2018-04-15 06:00:00.000000',14280000000,'2018-03-29 08:24:31.983000',2,4004.00,'09:00:00.000000','757А',NULL,NULL,4004.00,NULL,NULL,241),
	(1429,'2018-04-15 11:46:00.000000','2018-04-15 08:00:00.000000',13560000000,'2018-03-29 08:24:31.983000',2,3373.00,'11:00:00.000000','761А',NULL,NULL,3373.00,NULL,NULL,325),
	(1430,'2018-04-15 11:56:00.000000','2018-04-15 08:10:00.000000',13560000000,'2018-03-29 08:24:31.983000',2,3183.00,'11:10:00.000000','763А',NULL,NULL,3183.00,NULL,NULL,287),
	(1431,'2018-04-15 13:58:00.000000','2018-04-15 10:00:00.000000',14280000000,'2018-03-29 08:24:31.983000',2,4173.00,'13:00:00.000000','765А',NULL,NULL,4173.00,NULL,NULL,613),
	(1432,'2018-04-15 14:15:00.000000','2018-04-15 10:10:00.000000',14700000000,'2018-03-29 08:24:31.983000',2,4841.00,'13:10:00.000000','747А',NULL,NULL,4841.00,NULL,NULL,97),
	(1433,'2018-04-15 18:35:00.000000','2018-04-15 10:32:00.000000',28980000000,'2018-03-29 08:24:31.983000',2,854.00,'13:32:00.000000','049А',2415.00,854.00,NULL,45,21,NULL),
	(1434,'2018-04-15 19:27:00.000000','2018-04-15 10:33:00.000000',32040000000,'2018-03-29 08:24:31.983000',2,840.00,'13:33:00.000000','145А',1782.00,840.00,728.00,20,89,17),
	(1435,'2018-04-15 20:48:00.000000','2018-04-15 11:31:00.000000',33420000000,'2018-03-29 08:24:31.983000',2,2709.00,'14:31:00.000000','107Ж',2709.00,NULL,1190.00,97,NULL,52),
	(1436,'2018-04-15 15:45:00.000000','2018-04-15 12:00:00.000000',13500000000,'2018-03-29 08:24:31.983000',2,5273.00,'15:00:00.000000','767А',NULL,NULL,5273.00,NULL,NULL,236),
	(1437,'2018-04-15 15:59:00.000000','2018-04-15 12:10:00.000000',13740000000,'2018-03-29 08:24:31.983000',2,4584.00,'15:10:00.000000','769А',NULL,NULL,4584.00,NULL,NULL,244),
	(1438,'2018-04-16 00:03:00.000000','2018-04-15 13:32:00.000000',37860000000,'2018-03-29 08:24:31.983000',2,854.00,'16:32:00.000000','135А',2057.00,854.00,NULL,61,5,NULL),
	(1439,'2018-04-15 17:54:00.000000','2018-04-15 14:00:00.000000',14040000000,'2018-03-29 08:24:31.983000',2,5273.00,'17:00:00.000000','771Н',NULL,NULL,5273.00,NULL,NULL,180),
	(1440,'2018-04-15 17:56:00.000000','2018-04-15 14:10:00.000000',13560000000,'2018-03-29 08:24:31.983000',2,5783.00,'17:10:00.000000','773А',NULL,NULL,5783.00,NULL,NULL,276),
	(1441,'2018-04-15 19:58:00.000000','2018-04-15 16:00:00.000000',14280000000,'2018-03-29 08:24:31.983000',2,4784.00,'19:00:00.000000','775А',NULL,NULL,4784.00,NULL,NULL,597),
	(1442,'2018-04-15 20:13:00.000000','2018-04-15 16:10:00.000000',14580000000,'2018-03-29 08:24:31.983000',2,4784.00,'19:10:00.000000','777А',NULL,NULL,4784.00,NULL,NULL,310),
	(1443,'2018-04-15 23:10:00.000000','2018-04-15 16:15:00.000000',24900000000,'2018-03-29 08:24:31.983000',2,1212.00,'19:15:00.000000','059А',2899.00,1212.00,NULL,71,110,NULL),
	(1444,'2018-04-16 01:00:00.000000','2018-04-15 17:06:00.000000',28440000000,'2018-03-29 08:24:31.983000',2,1739.00,'20:06:00.000000','081А',1739.00,NULL,NULL,141,NULL,NULL),
	(1445,'2018-04-16 01:37:00.000000','2018-04-15 17:25:00.000000',29520000000,'2018-03-29 08:24:31.983000',2,806.00,'20:25:00.000000','209А',2187.00,806.00,693.00,24,495,155),
	(1446,'2018-04-16 01:18:00.000000','2018-04-15 17:33:00.000000',27900000000,'2018-03-29 08:24:31.983000',2,1881.00,'20:33:00.000000','115А',1881.00,NULL,NULL,66,NULL,NULL),
	(1447,'2018-04-15 21:40:00.000000','2018-04-15 18:00:00.000000',13200000000,'2018-03-29 08:24:31.983000',2,4784.00,'21:00:00.000000','779А',NULL,NULL,4784.00,NULL,NULL,316),
	(1448,'2018-04-16 02:22:00.000000','2018-04-15 18:05:00.000000',29820000000,'2018-03-29 08:24:31.983000',2,2176.00,'21:05:00.000000','287Ч',2176.00,NULL,NULL,299,NULL,NULL),
	(1449,'2018-04-16 01:51:00.000000','2018-04-15 18:24:00.000000',26820000000,'2018-03-29 08:24:31.983000',2,806.00,'21:24:00.000000','127А',2596.00,806.00,NULL,16,380,NULL),
	(1450,'2018-04-16 03:06:00.000000','2018-04-15 18:55:00.000000',29460000000,'2018-03-29 08:24:31.983000',2,1844.00,'21:55:00.000000','025А',1844.00,NULL,NULL,61,NULL,NULL),
	(1451,'2018-04-16 02:49:00.000000','2018-04-15 19:11:00.000000',27480000000,'2018-03-29 08:24:31.983000',2,2937.00,'22:11:00.000000','029А',2937.00,NULL,NULL,35,NULL,NULL),
	(1452,'2018-04-16 02:57:00.000000','2018-04-15 19:29:00.000000',26880000000,'2018-03-29 08:24:31.983000',2,2800.00,'22:29:00.000000','019У',2800.00,NULL,NULL,111,NULL,NULL),
	(1453,'2018-04-16 03:50:00.000000','2018-04-15 19:41:00.000000',29340000000,'2018-03-29 08:24:31.983000',2,1212.00,'22:41:00.000000','015А',3370.00,1212.00,NULL,13,10,NULL),
	(1454,'2018-04-16 03:45:00.000000','2018-04-15 19:50:00.000000',28500000000,'2018-03-29 08:24:31.983000',2,2153.00,'22:50:00.000000','005А',2153.00,NULL,NULL,91,NULL,NULL),
	(1455,'2018-04-16 05:30:00.000000','2018-04-15 20:30:00.000000',32400000000,'2018-03-29 08:24:31.983000',2,2455.00,'23:30:00.000000','003А',2455.00,NULL,NULL,100,NULL,NULL),
	(1456,'2018-04-16 04:19:00.000000','2018-04-15 20:36:00.000000',27780000000,'2018-03-29 08:24:31.983000',2,806.00,'23:36:00.000000','027А',2397.00,806.00,NULL,163,1,NULL),
	(1457,'2018-04-16 05:14:00.000000','2018-04-15 20:44:00.000000',30600000000,'2018-03-29 08:24:31.983000',2,3026.00,'23:44:00.000000','053Ч',3026.00,NULL,NULL,140,NULL,NULL),
	(1458,'2018-04-16 04:55:00.000000','2018-04-15 20:55:00.000000',28800000000,'2018-03-29 08:24:31.983000',2,4580.00,'23:55:00.000000','001А',4580.00,NULL,NULL,8,NULL,NULL),
	(1459,'2018-04-20 05:59:00.000000','2018-04-19 21:20:00.000000',31140000000,'2018-03-29 08:24:39.257000',1,3144.00,'00:20:00.000000','020У',3144.00,NULL,NULL,43,NULL,NULL),
	(1460,'2018-04-20 06:13:00.000000','2018-04-19 21:41:00.000000',30720000000,'2018-03-29 08:24:39.257000',1,1212.00,'00:41:00.000000','016А',2391.00,1212.00,NULL,48,44,NULL),
	(1461,'2018-04-20 06:16:00.000000','2018-04-19 21:44:00.000000',30720000000,'2018-03-29 08:24:39.257000',1,1212.00,'00:44:00.000000','059Г',2899.00,1212.00,NULL,64,46,NULL),
	(1462,'2018-04-20 06:50:00.000000','2018-04-19 22:15:00.000000',30900000000,'2018-03-29 08:24:39.257000',1,806.00,'01:15:00.000000','030А',2313.00,806.00,693.00,21,68,39),
	(1463,'2018-04-20 07:39:00.000000','2018-04-19 22:25:00.000000',33240000000,'2018-03-29 08:24:39.257000',1,840.00,'01:25:00.000000','128А',2554.00,840.00,728.00,23,494,165),
	(1464,'2018-04-20 08:40:00.000000','2018-04-19 22:56:00.000000',35040000000,'2018-03-29 08:24:39.257000',1,840.00,'01:56:00.000000','111В',1422.00,840.00,NULL,58,126,NULL),
	(1465,'2018-04-20 09:40:00.000000','2018-04-20 00:33:00.000000',32820000000,'2018-03-29 08:24:39.257000',1,854.00,'03:33:00.000000','079Ж',2841.00,854.00,NULL,87,56,NULL),
	(1466,'2018-04-20 09:59:00.000000','2018-04-20 01:35:00.000000',30240000000,'2018-03-29 08:24:39.257000',1,840.00,'04:35:00.000000','082В',1739.00,840.00,NULL,191,24,NULL),
	(1467,'2018-04-20 06:28:00.000000','2018-04-20 02:45:00.000000',13380000000,'2018-03-29 08:24:39.257000',1,1737.00,'05:45:00.000000','752А',NULL,NULL,1737.00,NULL,NULL,386),
	(1468,'2018-04-20 07:52:00.000000','2018-04-20 03:45:00.000000',14820000000,'2018-03-29 08:24:39.257000',1,3584.00,'06:45:00.000000','754А',NULL,NULL,3584.00,NULL,NULL,389),
	(1469,'2018-04-20 08:03:00.000000','2018-04-20 03:58:00.000000',14700000000,'2018-03-29 08:24:39.257000',1,3584.00,'06:58:00.000000','756А',NULL,NULL,3584.00,NULL,NULL,802),
	(1470,'2018-04-20 10:22:00.000000','2018-04-20 06:18:00.000000',14640000000,'2018-03-29 08:24:39.257000',1,3584.00,'09:18:00.000000','757Н',NULL,NULL,3584.00,NULL,NULL,354),
	(1471,'2018-04-20 10:32:00.000000','2018-04-20 06:35:00.000000',14220000000,'2018-03-29 08:24:39.257000',1,4584.00,'09:35:00.000000','760А',NULL,NULL,4584.00,NULL,NULL,234),
	(1472,'2018-04-20 16:54:00.000000','2018-04-20 13:03:00.000000',13860000000,'2018-03-29 08:24:39.257000',1,6337.00,'16:03:00.000000','768А',NULL,NULL,6337.00,NULL,NULL,313),
	(1473,'2018-04-20 17:05:00.000000','2018-04-20 13:13:00.000000',13920000000,'2018-03-29 08:24:39.257000',1,5187.00,'16:13:00.000000','770А',NULL,NULL,5187.00,NULL,NULL,321),
	(1474,'2018-04-20 17:29:00.000000','2018-04-20 13:24:00.000000',14700000000,'2018-03-29 08:24:39.257000',1,4286.00,'16:24:00.000000','748А',NULL,NULL,4286.00,NULL,NULL,126),
	(1475,'2018-04-20 18:45:00.000000','2018-04-20 14:40:00.000000',14700000000,'2018-03-29 08:24:39.257000',1,6337.00,'17:40:00.000000','774А',NULL,NULL,6337.00,NULL,NULL,306),
	(1476,'2018-04-20 20:27:00.000000','2018-04-20 16:20:00.000000',14820000000,'2018-03-29 08:24:39.257000',1,5001.00,'19:20:00.000000','778А',NULL,NULL,5001.00,NULL,NULL,321),
	(1477,'2018-04-20 20:38:00.000000','2018-04-20 16:33:00.000000',14700000000,'2018-03-29 08:24:39.257000',1,5001.00,'19:33:00.000000','776А',NULL,NULL,5001.00,NULL,NULL,734),
	(1478,'2018-04-20 21:46:00.000000','2018-04-20 18:00:00.000000',13560000000,'2018-03-29 08:24:39.257000',1,3293.00,'21:00:00.000000','780А',NULL,NULL,3293.00,NULL,NULL,378),
	(1479,'2018-04-21 02:01:00.000000','2018-04-20 18:20:00.000000',27660000000,'2018-03-29 08:24:39.257000',1,854.00,'21:20:00.000000','135С',1984.00,854.00,NULL,72,37,NULL),
	(1480,'2018-04-21 02:19:00.000000','2018-04-20 18:24:00.000000',28500000000,'2018-03-29 08:24:39.257000',1,999.00,'21:24:00.000000','024А',999.00,NULL,NULL,314,NULL,NULL),
	(1481,'2018-04-21 04:30:00.000000','2018-04-20 18:41:00.000000',35340000000,'2018-03-29 08:24:39.257000',1,840.00,'21:41:00.000000','120В',2077.00,840.00,NULL,55,56,NULL),
	(1482,'2018-04-21 02:39:00.000000','2018-04-20 18:49:00.000000',28200000000,'2018-03-29 08:24:39.257000',1,2709.00,'21:49:00.000000','107Й',2709.00,NULL,1190.00,91,NULL,60),
	(1483,'2018-04-21 03:26:00.000000','2018-04-20 18:50:00.000000',30960000000,'2018-03-29 08:24:39.257000',1,1640.00,'21:50:00.000000','026А',1640.00,NULL,NULL,212,NULL,NULL),
	(1484,'2018-04-21 02:32:00.000000','2018-04-20 19:15:00.000000',26220000000,'2018-03-29 08:24:39.257000',1,2238.00,'22:15:00.000000','034А',2238.00,NULL,693.00,4,NULL,9),
	(1485,'2018-04-21 03:35:00.000000','2018-04-20 19:16:00.000000',29940000000,'2018-03-29 08:24:39.257000',1,854.00,'22:16:00.000000','146У',2035.00,854.00,728.00,21,44,32),
	(1486,'2018-04-21 03:48:00.000000','2018-04-20 19:28:00.000000',30000000000,'2018-03-29 08:24:39.257000',1,1251.00,'22:28:00.000000','028А',2330.00,1251.00,NULL,181,16,NULL),
	(1487,'2018-04-21 03:54:00.000000','2018-04-20 19:50:00.000000',29040000000,'2018-03-29 08:24:39.257000',1,1594.00,'22:50:00.000000','006А',1594.00,NULL,NULL,202,NULL,NULL),
	(1488,'2018-04-21 02:49:00.000000','2018-04-20 20:10:00.000000',23940000000,'2018-03-29 08:24:39.257000',1,3522.00,'23:10:00.000000','032А',3522.00,NULL,NULL,7,NULL,NULL),
	(1489,'2018-04-21 05:30:00.000000','2018-04-20 20:30:00.000000',32400000000,'2018-03-29 08:24:39.257000',1,2569.00,'23:30:00.000000','004А',2569.00,NULL,NULL,171,NULL,NULL),
	(1490,'2018-04-21 05:36:00.000000','2018-04-20 20:40:00.000000',32160000000,'2018-03-29 08:24:39.257000',1,3331.00,'23:40:00.000000','054Ч',3331.00,NULL,NULL,125,NULL,NULL),
	(1491,'2018-04-21 04:55:00.000000','2018-04-20 20:55:00.000000',28800000000,'2018-03-29 08:24:39.257000',1,2837.00,'23:55:00.000000','002А',2837.00,NULL,NULL,93,NULL,NULL),
	(1492,'2018-04-22 06:43:00.000000','2018-04-21 21:11:00.000000',34320000000,'2018-03-29 08:24:39.257000',2,1332.00,'00:11:00.000000','119А',2082.00,1332.00,NULL,59,16,NULL),
	(1493,'2018-04-22 06:03:00.000000','2018-04-22 02:30:00.000000',12780000000,'2018-03-29 08:24:39.257000',2,994.00,'05:30:00.000000','751А',NULL,NULL,994.00,NULL,NULL,470),
	(1494,'2018-04-22 07:27:00.000000','2018-04-22 03:20:00.000000',14820000000,'2018-03-29 08:24:39.257000',2,994.00,'06:20:00.000000','753А',NULL,NULL,994.00,NULL,NULL,462),
	(1495,'2018-04-22 07:43:00.000000','2018-04-22 03:33:00.000000',15000000000,'2018-03-29 08:24:39.257000',2,1229.00,'06:33:00.000000','755А',NULL,NULL,1229.00,NULL,NULL,868),
	(1496,'2018-04-22 09:38:00.000000','2018-04-22 05:30:00.000000',14880000000,'2018-03-29 08:24:39.257000',2,4085.00,'08:30:00.000000','757А',NULL,NULL,4085.00,NULL,NULL,271),
	(1497,'2018-04-22 11:51:00.000000','2018-04-22 08:00:00.000000',13860000000,'2018-03-29 08:24:39.257000',2,4584.00,'11:00:00.000000','761А',NULL,NULL,4584.00,NULL,NULL,325),
	(1498,'2018-04-22 12:01:00.000000','2018-04-22 08:10:00.000000',13860000000,'2018-03-29 08:24:39.257000',2,5584.00,'11:10:00.000000','763А',NULL,NULL,5584.00,NULL,NULL,323),
	(1499,'2018-04-22 18:35:00.000000','2018-04-22 10:32:00.000000',28980000000,'2018-03-29 08:24:39.257000',2,840.00,'13:32:00.000000','049А',2415.00,840.00,NULL,35,32,NULL),
	(1500,'2018-04-22 19:27:00.000000','2018-04-22 10:33:00.000000',32040000000,'2018-03-29 08:24:39.257000',2,840.00,'13:33:00.000000','131Г',2118.00,840.00,NULL,23,157,NULL),
	(1501,'2018-04-22 15:50:00.000000','2018-04-22 12:05:00.000000',13500000000,'2018-03-29 08:24:39.257000',2,4173.00,'15:05:00.000000','767А',NULL,NULL,4173.00,NULL,NULL,251),
	(1502,'2018-04-22 16:04:00.000000','2018-04-22 12:15:00.000000',13740000000,'2018-03-29 08:24:39.257000',2,4584.00,'15:15:00.000000','769А',NULL,NULL,4584.00,NULL,NULL,235),
	(1503,'2018-04-22 16:24:00.000000','2018-04-22 12:25:00.000000',14340000000,'2018-03-29 08:24:39.257000',2,5842.00,'15:25:00.000000','747А',NULL,NULL,5842.00,NULL,NULL,88),
	(1504,'2018-04-23 00:03:00.000000','2018-04-22 13:10:00.000000',39180000000,'2018-03-29 08:24:39.257000',2,854.00,'16:10:00.000000','121А',1629.00,854.00,NULL,45,32,NULL),
	(1505,'2018-04-22 17:54:00.000000','2018-04-22 14:00:00.000000',14040000000,'2018-03-29 08:24:39.257000',2,4584.00,'17:00:00.000000','771Н',NULL,NULL,4584.00,NULL,NULL,252),
	(1506,'2018-04-22 17:56:00.000000','2018-04-22 14:10:00.000000',13560000000,'2018-03-29 08:24:39.257000',2,4784.00,'17:10:00.000000','773А',NULL,NULL,4784.00,NULL,NULL,296),
	(1507,'2018-04-22 23:10:00.000000','2018-04-22 15:02:00.000000',29280000000,'2018-03-29 08:24:39.257000',2,1212.00,'18:02:00.000000','059А',2899.00,1212.00,NULL,46,143,NULL),
	(1508,'2018-04-22 20:03:00.000000','2018-04-22 16:05:00.000000',14280000000,'2018-03-29 08:24:39.257000',2,4784.00,'19:05:00.000000','775А',NULL,NULL,4784.00,NULL,NULL,597),
	(1509,'2018-04-22 20:18:00.000000','2018-04-22 16:15:00.000000',14580000000,'2018-03-29 08:24:39.257000',2,4784.00,'19:15:00.000000','777А',NULL,NULL,4784.00,NULL,NULL,301),
	(1510,'2018-04-23 00:46:00.000000','2018-04-22 17:00:00.000000',27960000000,'2018-03-29 08:24:39.257000',2,840.00,'20:00:00.000000','111А',1422.00,840.00,NULL,59,202,NULL),
	(1511,'2018-04-23 01:00:00.000000','2018-04-22 17:25:00.000000',27300000000,'2018-03-29 08:24:39.257000',2,840.00,'20:25:00.000000','081А',1739.00,840.00,NULL,152,28,NULL),
	(1512,'2018-04-23 01:12:00.000000','2018-04-22 17:32:00.000000',27600000000,'2018-03-29 08:24:39.257000',2,840.00,'20:32:00.000000','079А',2841.00,840.00,NULL,104,25,NULL),
	(1513,'2018-04-22 21:40:00.000000','2018-04-22 18:00:00.000000',13200000000,'2018-03-29 08:24:39.257000',2,4393.00,'21:00:00.000000','779А',NULL,NULL,4393.00,NULL,NULL,334),
	(1514,'2018-04-23 02:22:00.000000','2018-04-22 18:05:00.000000',29820000000,'2018-03-29 08:24:39.257000',2,806.00,'21:05:00.000000','287Ч',2116.00,806.00,NULL,129,257,NULL),
	(1515,'2018-04-23 01:51:00.000000','2018-04-22 18:24:00.000000',26820000000,'2018-03-29 08:24:39.257000',2,806.00,'21:24:00.000000','127А',2524.00,806.00,NULL,20,568,NULL),
	(1516,'2018-04-23 03:06:00.000000','2018-04-22 18:55:00.000000',29460000000,'2018-03-29 08:24:39.257000',2,1640.00,'21:55:00.000000','025А',1640.00,NULL,NULL,122,NULL,NULL),
	(1517,'2018-04-23 02:49:00.000000','2018-04-22 19:11:00.000000',27480000000,'2018-03-29 08:24:39.257000',2,806.00,'22:11:00.000000','029А',2855.00,806.00,NULL,33,54,NULL),
	(1518,'2018-04-23 02:57:00.000000','2018-04-22 19:29:00.000000',26880000000,'2018-03-29 08:24:39.257000',2,3144.00,'22:29:00.000000','019У',3144.00,NULL,NULL,160,NULL,NULL),
	(1519,'2018-04-23 03:50:00.000000','2018-04-22 19:41:00.000000',29340000000,'2018-03-29 08:24:39.257000',2,1212.00,'22:41:00.000000','015А',3043.00,1212.00,NULL,29,38,NULL),
	(1520,'2018-04-23 03:45:00.000000','2018-04-22 19:50:00.000000',28500000000,'2018-03-29 08:24:39.257000',2,2159.00,'22:50:00.000000','005А',2159.00,NULL,NULL,113,NULL,NULL),
	(1521,'2018-04-23 05:30:00.000000','2018-04-22 20:30:00.000000',32400000000,'2018-03-29 08:24:39.257000',2,2247.00,'23:30:00.000000','003А',2247.00,NULL,NULL,196,NULL,NULL),
	(1522,'2018-04-23 04:19:00.000000','2018-04-22 20:36:00.000000',27780000000,'2018-03-29 08:24:39.257000',2,1251.00,'23:36:00.000000','027А',2330.00,1251.00,NULL,168,15,NULL),
	(1523,'2018-04-23 05:14:00.000000','2018-04-22 20:44:00.000000',30600000000,'2018-03-29 08:24:39.257000',2,3026.00,'23:44:00.000000','053Ч',3026.00,NULL,NULL,147,NULL,NULL),
	(1524,'2018-04-23 04:55:00.000000','2018-04-22 20:55:00.000000',28800000000,'2018-03-29 08:24:39.257000',2,2837.00,'23:55:00.000000','001А',2837.00,NULL,NULL,91,NULL,NULL),
	(1525,'2018-04-20 05:59:00.000000','2018-04-19 21:20:00.000000',31140000000,'2018-04-09 08:13:52.689000',1,31445.00,'00:20:00.000000','020У',31445.00,NULL,NULL,40,NULL,NULL),
	(1526,'2018-04-20 06:13:00.000000','2018-04-19 21:41:00.000000',30720000000,'2018-04-09 08:13:52.689000',1,1212.00,'00:41:00.000000','016А',2568.00,1212.00,NULL,42,27,NULL),
	(1527,'2018-04-20 06:16:00.000000','2018-04-19 21:44:00.000000',30720000000,'2018-04-09 08:13:52.689000',1,1212.00,'00:44:00.000000','059Г',2899.00,1212.00,NULL,45,24,NULL),
	(1528,'2018-04-20 06:50:00.000000','2018-04-19 22:15:00.000000',30900000000,'2018-04-09 08:13:52.689000',1,1251.00,'01:15:00.000000','030А',2507.00,1251.00,693.00,11,25,12),
	(1529,'2018-04-20 07:39:00.000000','2018-04-19 22:25:00.000000',33240000000,'2018-04-09 08:13:52.689000',1,840.00,'01:25:00.000000','128А',2685.00,840.00,728.00,23,411,161),
	(1530,'2018-04-20 08:40:00.000000','2018-04-19 22:56:00.000000',35040000000,'2018-04-09 08:13:52.689000',1,840.00,'01:56:00.000000','111В',1422.00,840.00,NULL,40,128,NULL),
	(1531,'2018-04-20 09:40:00.000000','2018-04-20 00:33:00.000000',32820000000,'2018-04-09 08:13:52.689000',1,854.00,'03:33:00.000000','079Ж',1793.00,854.00,NULL,75,38,NULL),
	(1532,'2018-04-20 09:59:00.000000','2018-04-20 01:35:00.000000',30240000000,'2018-04-09 08:13:52.689000',1,840.00,'04:35:00.000000','082В',1739.00,840.00,NULL,149,9,NULL),
	(1533,'2018-04-20 06:28:00.000000','2018-04-20 02:45:00.000000',13380000000,'2018-04-09 08:13:52.689000',1,3146.00,'05:45:00.000000','752А',NULL,NULL,3146.00,NULL,NULL,216),
	(1534,'2018-04-20 07:52:00.000000','2018-04-20 03:45:00.000000',14820000000,'2018-04-09 08:13:52.689000',1,4584.00,'06:45:00.000000','754А',NULL,NULL,4584.00,NULL,NULL,348),
	(1535,'2018-04-20 08:03:00.000000','2018-04-20 03:58:00.000000',14700000000,'2018-04-09 08:13:52.689000',1,4584.00,'06:58:00.000000','756А',NULL,NULL,4584.00,NULL,NULL,640),
	(1536,'2018-04-20 10:22:00.000000','2018-04-20 06:18:00.000000',14640000000,'2018-04-09 08:13:52.689000',1,5273.00,'09:18:00.000000','757Н',NULL,NULL,5273.00,NULL,NULL,251),
	(1537,'2018-04-20 10:32:00.000000','2018-04-20 06:35:00.000000',14220000000,'2018-04-09 08:13:52.689000',1,6583.00,'09:35:00.000000','760А',NULL,NULL,6583.00,NULL,NULL,157),
	(1538,'2018-04-20 16:54:00.000000','2018-04-20 13:03:00.000000',13860000000,'2018-04-09 08:13:52.689000',1,6636.00,'16:03:00.000000','768А',NULL,NULL,6636.00,NULL,NULL,260),
	(1539,'2018-04-20 17:05:00.000000','2018-04-20 13:13:00.000000',13920000000,'2018-04-09 08:13:52.689000',1,6636.00,'16:13:00.000000','770А',NULL,NULL,6636.00,NULL,NULL,282),
	(1540,'2018-04-20 17:29:00.000000','2018-04-20 13:24:00.000000',14700000000,'2018-04-09 08:13:52.689000',1,5618.00,'16:24:00.000000','748А',NULL,NULL,5618.00,NULL,NULL,83),
	(1541,'2018-04-20 18:21:00.000000','2018-04-20 14:30:00.000000',13860000000,'2018-04-09 08:13:52.689000',1,5164.00,'17:30:00.000000','772А',NULL,NULL,5164.00,NULL,NULL,141),
	(1542,'2018-04-20 18:45:00.000000','2018-04-20 14:40:00.000000',14700000000,'2018-04-09 08:13:52.689000',1,6636.00,'17:40:00.000000','774А',NULL,NULL,6636.00,NULL,NULL,280),
	(1543,'2018-04-20 20:27:00.000000','2018-04-20 16:20:00.000000',14820000000,'2018-04-09 08:13:52.689000',1,6636.00,'19:20:00.000000','778А',NULL,NULL,6636.00,NULL,NULL,256),
	(1544,'2018-04-20 20:38:00.000000','2018-04-20 16:33:00.000000',14700000000,'2018-04-09 08:13:52.689000',1,6636.00,'19:33:00.000000','776А',NULL,NULL,6636.00,NULL,NULL,630),
	(1545,'2018-04-20 21:46:00.000000','2018-04-20 18:00:00.000000',13560000000,'2018-04-09 08:13:52.689000',1,5783.00,'21:00:00.000000','780А',NULL,NULL,5783.00,NULL,NULL,304),
	(1546,'2018-04-21 02:01:00.000000','2018-04-20 18:20:00.000000',27660000000,'2018-04-09 08:13:52.689000',1,2057.00,'21:20:00.000000','135С',2057.00,NULL,NULL,54,NULL,NULL),
	(1547,'2018-04-21 02:19:00.000000','2018-04-20 18:24:00.000000',28500000000,'2018-04-09 08:13:52.689000',1,2384.00,'21:24:00.000000','024А',2384.00,NULL,NULL,72,NULL,NULL),
	(1548,'2018-04-21 04:30:00.000000','2018-04-20 18:41:00.000000',35340000000,'2018-04-09 08:13:52.689000',1,2301.00,'21:41:00.000000','120В',2301.00,NULL,NULL,31,NULL,NULL),
	(1549,'2018-04-21 02:39:00.000000','2018-04-20 18:49:00.000000',28200000000,'2018-04-09 08:13:52.689000',1,2709.00,'21:49:00.000000','107Й',2709.00,NULL,1190.00,80,NULL,47),
	(1550,'2018-04-21 03:26:00.000000','2018-04-20 18:50:00.000000',30960000000,'2018-04-09 08:13:52.689000',1,3466.00,'21:50:00.000000','026А',3466.00,NULL,NULL,5,NULL,NULL),
	(1551,'2018-04-21 02:32:00.000000','2018-04-20 19:15:00.000000',26220000000,'2018-04-09 08:13:52.689000',1,1193.00,'22:15:00.000000','034А',1193.00,NULL,NULL,2,NULL,NULL),
	(1552,'2018-04-21 03:35:00.000000','2018-04-20 19:16:00.000000',29940000000,'2018-04-09 08:13:52.689000',1,2444.00,'22:16:00.000000','146У',2444.00,NULL,728.00,18,NULL,7),
	(1553,'2018-04-21 03:48:00.000000','2018-04-20 19:28:00.000000',30000000000,'2018-04-09 08:13:52.689000',1,3492.00,'22:28:00.000000','028А',3492.00,NULL,NULL,17,NULL,NULL),
	(1554,'2018-04-21 03:54:00.000000','2018-04-20 19:50:00.000000',29040000000,'2018-04-09 08:13:52.689000',1,3243.00,'22:50:00.000000','006А',3243.00,NULL,NULL,42,NULL,NULL),
	(1555,'2018-04-21 05:30:00.000000','2018-04-20 20:30:00.000000',32400000000,'2018-04-09 08:13:52.689000',1,2671.00,'23:30:00.000000','004А',2671.00,NULL,NULL,119,NULL,NULL),
	(1556,'2018-04-21 05:36:00.000000','2018-04-20 20:40:00.000000',32160000000,'2018-04-09 08:13:52.689000',1,3184.00,'23:40:00.000000','054Ч',3184.00,NULL,NULL,111,NULL,NULL),
	(1557,'2018-04-21 04:55:00.000000','2018-04-20 20:55:00.000000',28800000000,'2018-04-09 08:13:52.689000',1,3447.00,'23:55:00.000000','002А',3447.00,NULL,NULL,45,NULL,NULL),
	(1558,'2018-04-22 06:43:00.000000','2018-04-21 21:11:00.000000',34320000000,'2018-04-09 08:13:52.689000',2,2130.00,'00:11:00.000000','119А',2130.00,NULL,NULL,51,NULL,NULL),
	(1559,'2018-04-22 06:03:00.000000','2018-04-22 02:30:00.000000',12780000000,'2018-04-09 08:13:52.689000',2,1325.00,'05:30:00.000000','751А',NULL,NULL,1325.00,NULL,NULL,356),
	(1560,'2018-04-22 07:27:00.000000','2018-04-22 03:20:00.000000',14820000000,'2018-04-09 08:13:52.689000',2,1464.00,'06:20:00.000000','753А',NULL,NULL,1464.00,NULL,NULL,341),
	(1561,'2018-04-22 07:43:00.000000','2018-04-22 03:33:00.000000',15000000000,'2018-04-09 08:13:52.689000',2,1464.00,'06:33:00.000000','755А',NULL,NULL,1464.00,NULL,NULL,661),
	(1562,'2018-04-22 09:38:00.000000','2018-04-22 05:30:00.000000',14880000000,'2018-04-09 08:13:52.689000',2,3504.00,'08:30:00.000000','757А',NULL,NULL,3504.00,NULL,NULL,261),
	(1563,'2018-04-22 09:47:00.000000','2018-04-22 05:42:00.000000',14700000000,'2018-04-09 08:13:52.689000',2,3004.00,'08:42:00.000000','759А',NULL,NULL,3004.00,NULL,NULL,333),
	(1564,'2018-04-22 11:51:00.000000','2018-04-22 08:00:00.000000',13860000000,'2018-04-09 08:13:52.689000',2,4584.00,'11:00:00.000000','761А',NULL,NULL,4584.00,NULL,NULL,262),
	(1565,'2018-04-22 12:01:00.000000','2018-04-22 08:10:00.000000',13860000000,'2018-04-09 08:13:52.689000',2,5273.00,'11:10:00.000000','763А',NULL,NULL,5273.00,NULL,NULL,226),
	(1566,'2018-04-22 18:35:00.000000','2018-04-22 10:32:00.000000',28980000000,'2018-04-09 08:13:52.689000',2,854.00,'13:32:00.000000','049А',1844.00,854.00,NULL,28,2,NULL),
	(1567,'2018-04-22 19:27:00.000000','2018-04-22 10:33:00.000000',32040000000,'2018-04-09 08:13:52.689000',2,840.00,'13:33:00.000000','131Г',1994.00,840.00,NULL,51,146,NULL),
	(1568,'2018-04-22 15:50:00.000000','2018-04-22 12:05:00.000000',13500000000,'2018-04-09 08:13:52.689000',2,6583.00,'15:05:00.000000','767А',NULL,NULL,6583.00,NULL,NULL,177),
	(1569,'2018-04-22 16:04:00.000000','2018-04-22 12:15:00.000000',13740000000,'2018-04-09 08:13:52.689000',2,6583.00,'15:15:00.000000','769А',NULL,NULL,6583.00,NULL,NULL,131),
	(1570,'2018-04-22 16:24:00.000000','2018-04-22 12:25:00.000000',14340000000,'2018-04-09 08:13:52.689000',2,7723.00,'15:25:00.000000','747А',NULL,NULL,7723.00,NULL,NULL,72),
	(1571,'2018-04-23 00:03:00.000000','2018-04-22 13:10:00.000000',39180000000,'2018-04-09 08:13:52.689000',2,854.00,'16:10:00.000000','121А',1494.00,854.00,NULL,32,13,NULL),
	(1572,'2018-04-22 17:54:00.000000','2018-04-22 14:00:00.000000',14040000000,'2018-04-09 08:13:52.689000',2,6583.00,'17:00:00.000000','771Н',NULL,NULL,6583.00,NULL,NULL,197),
	(1573,'2018-04-22 17:56:00.000000','2018-04-22 14:10:00.000000',13560000000,'2018-04-09 08:13:52.689000',2,7783.00,'17:10:00.000000','773А',NULL,NULL,7783.00,NULL,NULL,205),
	(1574,'2018-04-22 23:10:00.000000','2018-04-22 15:02:00.000000',29280000000,'2018-04-09 08:13:52.689000',2,1212.00,'18:02:00.000000','059А',3158.00,1212.00,NULL,32,296,NULL),
	(1575,'2018-04-22 20:03:00.000000','2018-04-22 16:05:00.000000',14280000000,'2018-04-09 08:13:52.689000',2,6593.00,'19:05:00.000000','775А',NULL,NULL,6593.00,NULL,NULL,418),
	(1576,'2018-04-22 20:18:00.000000','2018-04-22 16:15:00.000000',14580000000,'2018-04-09 08:13:52.689000',2,6593.00,'19:15:00.000000','777А',NULL,NULL,6593.00,NULL,NULL,213),
	(1577,'2018-04-23 00:46:00.000000','2018-04-22 17:00:00.000000',27960000000,'2018-04-09 08:13:52.689000',2,840.00,'20:00:00.000000','111А',1422.00,840.00,NULL,45,141,NULL),
	(1578,'2018-04-23 01:00:00.000000','2018-04-22 17:25:00.000000',27300000000,'2018-04-09 08:13:52.689000',2,840.00,'20:25:00.000000','081А',2184.00,840.00,NULL,78,6,NULL),
	(1579,'2018-04-23 01:12:00.000000','2018-04-22 17:32:00.000000',27600000000,'2018-04-09 08:13:52.689000',2,840.00,'20:32:00.000000','079А',1793.00,840.00,NULL,91,16,NULL),
	(1580,'2018-04-23 01:20:00.000000','2018-04-22 17:33:00.000000',28020000000,'2018-04-09 08:13:52.689000',2,840.00,'20:33:00.000000','251А',1918.00,840.00,728.00,60,412,106),
	(1581,'2018-04-22 21:40:00.000000','2018-04-22 18:00:00.000000',13200000000,'2018-04-09 08:13:52.689000',2,2004.00,'21:00:00.000000','779А',NULL,NULL,2004.00,NULL,NULL,107),
	(1582,'2018-04-23 02:22:00.000000','2018-04-22 18:05:00.000000',29820000000,'2018-04-09 08:13:52.689000',2,806.00,'21:05:00.000000','287Ч',2150.00,806.00,NULL,119,102,NULL),
	(1583,'2018-04-23 01:51:00.000000','2018-04-22 18:24:00.000000',26820000000,'2018-04-09 08:13:52.689000',2,806.00,'21:24:00.000000','127А',2596.00,806.00,NULL,18,462,NULL),
	(1584,'2018-04-23 03:06:00.000000','2018-04-22 18:55:00.000000',29460000000,'2018-04-09 08:13:52.689000',2,3466.00,'21:55:00.000000','025А',3466.00,NULL,NULL,47,NULL,NULL),
	(1585,'2018-04-23 02:49:00.000000','2018-04-22 19:11:00.000000',27480000000,'2018-04-09 08:13:52.689000',2,2937.00,'22:11:00.000000','029А',2937.00,NULL,NULL,25,NULL,NULL),
	(1586,'2018-04-23 02:57:00.000000','2018-04-22 19:29:00.000000',26880000000,'2018-04-09 08:13:52.689000',2,3144.00,'22:29:00.000000','019У',3144.00,NULL,NULL,151,NULL,NULL),
	(1587,'2018-04-23 03:50:00.000000','2018-04-22 19:41:00.000000',29340000000,'2018-04-09 08:13:52.689000',2,1212.00,'22:41:00.000000','015А',2435.00,1212.00,NULL,18,10,NULL),
	(1588,'2018-04-23 03:45:00.000000','2018-04-22 19:50:00.000000',28500000000,'2018-04-09 08:13:52.689000',2,3243.00,'22:50:00.000000','005А',3243.00,NULL,NULL,64,NULL,NULL),
	(1589,'2018-04-23 04:07:00.000000','2018-04-22 20:04:00.000000',28980000000,'2018-04-09 08:13:52.689000',2,2176.00,'23:04:00.000000','255А',2176.00,NULL,NULL,173,NULL,NULL),
	(1590,'2018-04-23 05:30:00.000000','2018-04-22 20:30:00.000000',32400000000,'2018-04-09 08:13:52.689000',2,2295.00,'23:30:00.000000','003А',2295.00,NULL,NULL,117,NULL,NULL),
	(1591,'2018-04-23 04:19:00.000000','2018-04-22 20:36:00.000000',27780000000,'2018-04-09 08:13:52.689000',2,2352.00,'23:36:00.000000','027А',2352.00,NULL,NULL,131,NULL,NULL),
	(1592,'2018-04-23 05:14:00.000000','2018-04-22 20:44:00.000000',30600000000,'2018-04-09 08:13:52.689000',2,3352.00,'23:44:00.000000','053Ч',3352.00,NULL,NULL,135,NULL,NULL),
	(1593,'2018-04-23 04:55:00.000000','2018-04-22 20:55:00.000000',28800000000,'2018-04-09 08:13:52.689000',2,3006.00,'23:55:00.000000','001А',3006.00,NULL,NULL,54,NULL,NULL),
	(1594,'2018-04-27 08:35:00.000000','2018-04-26 21:10:00.000000',41100000000,'2018-03-29 08:24:46.538000',1,1013.00,'00:10:00.000000','116С',1642.00,1013.00,NULL,112,30,NULL),
	(1595,'2018-04-27 06:13:00.000000','2018-04-26 21:41:00.000000',30720000000,'2018-03-29 08:24:46.538000',1,1451.00,'00:41:00.000000','016А',3260.00,1451.00,NULL,32,32,NULL),
	(1596,'2018-04-27 06:16:00.000000','2018-04-26 21:44:00.000000',30720000000,'2018-03-29 08:24:46.538000',1,1451.00,'00:44:00.000000','059Г',3009.00,1451.00,NULL,57,29,NULL),
	(1597,'2018-04-27 06:50:00.000000','2018-04-26 22:15:00.000000',30900000000,'2018-03-29 08:24:46.538000',1,971.00,'01:15:00.000000','030А',2157.00,971.00,847.00,24,78,3),
	(1598,'2018-04-27 09:13:00.000000','2018-04-26 23:22:00.000000',35460000000,'2018-03-29 08:24:46.538000',1,996.00,'02:22:00.000000','049Ч',1844.00,996.00,NULL,77,56,NULL),
	(1599,'2018-04-27 09:40:00.000000','2018-04-27 00:33:00.000000',32820000000,'2018-03-29 08:24:46.538000',1,1013.00,'03:33:00.000000','079Ж',2596.00,1013.00,NULL,196,46,NULL),
	(1600,'2018-04-27 09:59:00.000000','2018-04-27 01:35:00.000000',30240000000,'2018-03-29 08:24:46.538000',1,1568.00,'04:35:00.000000','082В',1818.00,1568.00,NULL,140,1,NULL),
	(1601,'2018-04-27 06:28:00.000000','2018-04-27 02:45:00.000000',13380000000,'2018-03-29 08:24:46.538000',1,2643.00,'05:45:00.000000','752А',NULL,NULL,2643.00,NULL,NULL,389),
	(1602,'2018-04-27 07:52:00.000000','2018-04-27 03:45:00.000000',14820000000,'2018-03-29 08:24:46.538000',1,4173.00,'06:45:00.000000','754А',NULL,NULL,4173.00,NULL,NULL,375),
	(1603,'2018-04-27 08:03:00.000000','2018-04-27 03:58:00.000000',14700000000,'2018-03-29 08:24:46.538000',1,4173.00,'06:58:00.000000','756А',NULL,NULL,4173.00,NULL,NULL,749),
	(1604,'2018-04-27 10:22:00.000000','2018-04-27 06:18:00.000000',14640000000,'2018-03-29 08:24:46.538000',1,4584.00,'09:18:00.000000','757Н',NULL,NULL,4584.00,NULL,NULL,336),
	(1605,'2018-04-27 10:32:00.000000','2018-04-27 06:35:00.000000',14220000000,'2018-03-29 08:24:46.538000',1,4173.00,'09:35:00.000000','760А',NULL,NULL,4173.00,NULL,NULL,281),
	(1606,'2018-04-27 16:54:00.000000','2018-04-27 13:03:00.000000',13860000000,'2018-03-29 08:24:46.538000',1,5001.00,'16:03:00.000000','768А',NULL,NULL,5001.00,NULL,NULL,314),
	(1607,'2018-04-27 17:05:00.000000','2018-04-27 13:13:00.000000',13920000000,'2018-03-29 08:24:46.538000',1,5001.00,'16:13:00.000000','770А',NULL,NULL,5001.00,NULL,NULL,340),
	(1608,'2018-04-27 17:29:00.000000','2018-04-27 13:24:00.000000',14700000000,'2018-03-29 08:24:46.538000',1,5215.00,'16:24:00.000000','748А',NULL,NULL,5215.00,NULL,NULL,104),
	(1609,'2018-04-27 18:45:00.000000','2018-04-27 14:40:00.000000',14700000000,'2018-03-29 08:24:46.538000',1,5187.00,'17:40:00.000000','774А',NULL,NULL,5187.00,NULL,NULL,327),
	(1610,'2018-04-28 01:37:00.000000','2018-04-27 15:45:00.000000',35520000000,'2018-03-29 08:24:46.538000',1,954.00,'18:45:00.000000','210А',NULL,954.00,NULL,NULL,343,NULL),
	(1611,'2018-04-27 20:27:00.000000','2018-04-27 16:20:00.000000',14820000000,'2018-03-29 08:24:46.538000',1,5001.00,'19:20:00.000000','778А',NULL,NULL,5001.00,NULL,NULL,334),
	(1612,'2018-04-27 20:38:00.000000','2018-04-27 16:33:00.000000',14700000000,'2018-03-29 08:24:46.538000',1,4337.00,'19:33:00.000000','776А',NULL,NULL,4337.00,NULL,NULL,753),
	(1613,'2018-04-27 21:46:00.000000','2018-04-27 18:00:00.000000',13560000000,'2018-03-29 08:24:46.538000',1,4784.00,'21:00:00.000000','780А',NULL,NULL,4784.00,NULL,NULL,370),
	(1614,'2018-04-28 02:01:00.000000','2018-04-27 18:20:00.000000',27660000000,'2018-03-29 08:24:46.538000',1,4304.00,'21:20:00.000000','121С',4304.00,NULL,NULL,14,NULL,NULL),
	(1615,'2018-04-28 02:19:00.000000','2018-04-27 18:24:00.000000',28500000000,'2018-03-29 08:24:46.538000',1,2911.00,'21:24:00.000000','056А',2911.00,NULL,NULL,127,NULL,NULL),
	(1616,'2018-04-28 04:30:00.000000','2018-04-27 18:41:00.000000',35340000000,'2018-03-29 08:24:46.538000',1,2864.00,'21:41:00.000000','120В',2864.00,NULL,NULL,47,NULL,NULL),
	(1617,'2018-04-28 03:06:00.000000','2018-04-27 18:50:00.000000',29760000000,'2018-03-29 08:24:46.538000',1,2850.00,'21:50:00.000000','026А',2850.00,NULL,NULL,652,NULL,NULL),
	(1618,'2018-04-28 02:39:00.000000','2018-04-27 19:15:00.000000',26640000000,'2018-03-29 08:24:46.538000',1,3353.00,'22:15:00.000000','034А',3353.00,NULL,NULL,20,NULL,NULL),
	(1619,'2018-04-28 03:16:00.000000','2018-04-27 19:16:00.000000',28800000000,'2018-03-29 08:24:46.538000',1,2739.00,'22:16:00.000000','132Г',2739.00,NULL,NULL,2,NULL,NULL),
	(1620,'2018-04-28 03:40:00.000000','2018-04-27 19:28:00.000000',29520000000,'2018-03-29 08:24:46.538000',1,2573.00,'22:28:00.000000','028А',2573.00,NULL,NULL,165,NULL,NULL),
	(1621,'2018-04-28 03:47:00.000000','2018-04-27 19:50:00.000000',28620000000,'2018-03-29 08:24:46.538000',1,2995.00,'22:50:00.000000','006А',2995.00,NULL,NULL,424,NULL,NULL),
	(1622,'2018-04-28 02:49:00.000000','2018-04-27 20:10:00.000000',23940000000,'2018-03-29 08:24:46.538000',1,3522.00,'23:10:00.000000','032А',3522.00,NULL,NULL,7,NULL,NULL),
	(1623,'2018-04-28 05:30:00.000000','2018-04-27 20:30:00.000000',32400000000,'2018-03-29 08:24:46.538000',1,3491.00,'23:30:00.000000','004А',3491.00,NULL,NULL,189,NULL,NULL),
	(1624,'2018-04-28 05:36:00.000000','2018-04-27 20:40:00.000000',32160000000,'2018-03-29 08:24:46.538000',1,3921.00,'23:40:00.000000','054Ч',3921.00,NULL,NULL,75,NULL,NULL),
	(1625,'2018-04-28 04:55:00.000000','2018-04-27 20:55:00.000000',28800000000,'2018-03-29 08:24:46.538000',1,4590.00,'23:55:00.000000','002А',4590.00,NULL,NULL,82,NULL,NULL),
	(1626,'2018-04-29 06:43:00.000000','2018-04-28 21:11:00.000000',34320000000,'2018-03-29 08:24:46.538000',2,3595.00,'00:11:00.000000','119А',3595.00,NULL,NULL,59,NULL,NULL),
	(1627,'2018-04-29 06:19:00.000000','2018-04-28 22:53:00.000000',26760000000,'2018-03-29 08:24:46.538000',2,4257.00,'01:53:00.000000','031А',4257.00,NULL,NULL,30,NULL,NULL),
	(1628,'2018-04-29 08:47:00.000000','2018-04-28 23:09:00.000000',34680000000,'2018-03-29 08:24:46.538000',2,1568.00,'02:09:00.000000','255А',4421.00,1568.00,NULL,85,181,NULL),
	(1629,'2018-04-29 08:20:00.000000','2018-04-28 23:30:00.000000',31800000000,'2018-03-29 08:24:46.538000',2,1498.00,'02:30:00.000000','055А',2040.00,1498.00,NULL,45,249,NULL),
	(1630,'2018-04-29 06:00:00.000000','2018-04-29 02:30:00.000000',12600000000,'2018-03-29 08:24:46.538000',2,4004.00,'05:30:00.000000','751А',NULL,NULL,4004.00,NULL,NULL,290),
	(1631,'2018-04-29 07:43:00.000000','2018-04-29 03:40:00.000000',14580000000,'2018-03-29 08:24:46.538000',2,3073.00,'06:40:00.000000','753А',NULL,NULL,3073.00,NULL,NULL,380),
	(1632,'2018-04-29 07:50:00.000000','2018-04-29 03:50:00.000000',14400000000,'2018-03-29 08:24:46.538000',2,3073.00,'06:50:00.000000','755А',NULL,NULL,3073.00,NULL,NULL,673),
	(1633,'2018-04-29 13:05:00.000000','2018-04-29 04:00:00.000000',32700000000,'2018-03-29 08:24:46.538000',2,1376.00,'07:00:00.000000','011Ч',1376.00,1568.00,NULL,101,293,NULL),
	(1634,'2018-04-29 09:58:00.000000','2018-04-29 06:00:00.000000',14280000000,'2018-03-29 08:24:46.538000',2,4004.00,'09:00:00.000000','757А',NULL,NULL,4004.00,NULL,NULL,166),
	(1635,'2018-04-29 16:55:00.000000','2018-04-29 06:57:00.000000',35880000000,'2018-03-29 08:24:46.538000',2,1435.00,'09:57:00.000000','257А',1435.00,1498.00,NULL,20,289,NULL),
	(1636,'2018-04-29 11:46:00.000000','2018-04-29 08:00:00.000000',13560000000,'2018-03-29 08:24:46.538000',2,4004.00,'11:00:00.000000','761А',NULL,NULL,4004.00,NULL,NULL,263),
	(1637,'2018-04-29 11:56:00.000000','2018-04-29 08:10:00.000000',13560000000,'2018-03-29 08:24:46.538000',2,4004.00,'11:10:00.000000','763А',NULL,NULL,4004.00,NULL,NULL,264),
	(1638,'2018-04-29 13:58:00.000000','2018-04-29 10:00:00.000000',14280000000,'2018-03-29 08:24:46.538000',2,3584.00,'13:00:00.000000','765А',NULL,NULL,3584.00,NULL,NULL,782),
	(1639,'2018-04-29 18:35:00.000000','2018-04-29 10:32:00.000000',28980000000,'2018-03-29 08:24:46.538000',2,1568.00,'13:32:00.000000','049А',2033.00,1568.00,NULL,96,61,NULL),
	(1640,'2018-04-29 19:27:00.000000','2018-04-29 10:33:00.000000',32040000000,'2018-03-29 08:24:46.538000',2,1568.00,'13:33:00.000000','145А',1731.00,1568.00,890.00,91,199,4),
	(1641,'2018-04-29 20:48:00.000000','2018-04-29 11:31:00.000000',33420000000,'2018-03-29 08:24:46.538000',2,2327.00,'14:31:00.000000','107Ж',3299.00,2327.00,1433.00,43,37,50),
	(1642,'2018-04-29 15:45:00.000000','2018-04-29 12:00:00.000000',13500000000,'2018-03-29 08:24:46.538000',2,4004.00,'15:00:00.000000','767А',NULL,NULL,4004.00,NULL,NULL,279),
	(1643,'2018-04-29 15:59:00.000000','2018-04-29 12:10:00.000000',13740000000,'2018-03-29 08:24:46.538000',2,4004.00,'15:10:00.000000','769А',NULL,NULL,4004.00,NULL,NULL,300),
	(1644,'2018-04-30 00:03:00.000000','2018-04-29 13:32:00.000000',37860000000,'2018-03-29 08:24:46.538000',2,1597.00,'16:32:00.000000','135А',2343.00,1597.00,NULL,61,28,NULL),
	(1645,'2018-04-29 17:54:00.000000','2018-04-29 14:00:00.000000',14040000000,'2018-03-29 08:24:46.538000',2,3584.00,'17:00:00.000000','771Н',NULL,NULL,3584.00,NULL,NULL,417),
	(1646,'2018-04-29 17:56:00.000000','2018-04-29 14:10:00.000000',13560000000,'2018-03-29 08:24:46.538000',2,4173.00,'17:10:00.000000','773А',NULL,NULL,4173.00,NULL,NULL,372),
	(1647,'2018-04-29 19:58:00.000000','2018-04-29 16:00:00.000000',14280000000,'2018-03-29 08:24:46.538000',2,2504.00,'19:00:00.000000','775А',NULL,NULL,2504.00,NULL,NULL,715),
	(1648,'2018-04-29 20:13:00.000000','2018-04-29 16:10:00.000000',14580000000,'2018-03-29 08:24:46.538000',2,2435.00,'19:10:00.000000','777А',NULL,NULL,2435.00,NULL,NULL,347),
	(1649,'2018-04-29 23:10:00.000000','2018-04-29 16:15:00.000000',24900000000,'2018-03-29 08:24:46.538000',2,2327.00,'19:15:00.000000','059А',3229.00,2327.00,NULL,152,379,NULL),
	(1650,'2018-04-30 00:46:00.000000','2018-04-29 17:00:00.000000',27960000000,'2018-03-29 08:24:46.538000',2,1568.00,'20:00:00.000000','111А',2253.00,1568.00,NULL,172,362,NULL),
	(1651,'2018-04-30 01:00:00.000000','2018-04-29 17:06:00.000000',28440000000,'2018-03-29 08:24:46.538000',2,1568.00,'20:06:00.000000','081А',3458.00,1568.00,NULL,73,3,NULL),
	(1652,'2018-04-30 01:12:00.000000','2018-04-29 17:32:00.000000',27600000000,'2018-03-29 08:24:46.538000',2,1568.00,'20:32:00.000000','079А',2498.00,1568.00,NULL,193,91,NULL),
	(1653,'2018-04-30 01:18:00.000000','2018-04-29 17:33:00.000000',27900000000,'2018-03-29 08:24:46.538000',2,1597.00,'20:33:00.000000','115А',2049.00,1597.00,NULL,31,28,NULL),
	(1654,'2018-04-29 21:40:00.000000','2018-04-29 18:00:00.000000',13200000000,'2018-03-29 08:24:46.538000',2,2784.00,'21:00:00.000000','779А',NULL,NULL,2784.00,NULL,NULL,431),
	(1655,'2018-04-30 03:06:00.000000','2018-04-29 18:55:00.000000',29460000000,'2018-03-29 08:24:46.538000',2,2995.00,'21:55:00.000000','025А',2995.00,NULL,NULL,727,NULL,NULL),
	(1656,'2018-04-30 02:49:00.000000','2018-04-29 19:11:00.000000',27480000000,'2018-03-29 08:24:46.538000',2,1498.00,'22:11:00.000000','029А',3168.00,1498.00,NULL,38,41,NULL),
	(1657,'2018-04-30 02:57:00.000000','2018-04-29 19:29:00.000000',26880000000,'2018-03-29 08:24:46.538000',2,3144.00,'22:29:00.000000','019У',3144.00,NULL,NULL,67,NULL,NULL),
	(1658,'2018-04-30 03:50:00.000000','2018-04-29 19:41:00.000000',29340000000,'2018-03-29 08:24:46.538000',2,2327.00,'22:41:00.000000','015А',3264.00,2327.00,NULL,54,52,NULL),
	(1659,'2018-04-30 03:45:00.000000','2018-04-29 19:50:00.000000',28500000000,'2018-03-29 08:24:46.538000',2,2886.00,'22:50:00.000000','005А',2886.00,NULL,NULL,761,NULL,NULL),
	(1660,'2018-04-30 05:30:00.000000','2018-04-29 20:30:00.000000',32400000000,'2018-03-29 08:24:46.538000',2,1498.00,'23:30:00.000000','243А',2962.00,1498.00,NULL,10,387,NULL),
	(1661,'2018-04-30 04:19:00.000000','2018-04-29 20:36:00.000000',27780000000,'2018-03-29 08:24:46.538000',2,1498.00,'23:36:00.000000','027А',2853.00,1498.00,NULL,258,2,NULL),
	(1662,'2018-04-30 05:14:00.000000','2018-04-29 20:44:00.000000',30600000000,'2018-03-29 08:24:46.538000',2,2852.00,'23:44:00.000000','053Ч',2852.00,NULL,NULL,130,NULL,NULL),
	(1663,'2018-04-30 04:55:00.000000','2018-04-29 20:55:00.000000',28800000000,'2018-03-29 08:24:46.538000',2,3794.00,'23:55:00.000000','001А',3794.00,NULL,NULL,123,NULL,NULL),
	(1664,'2018-05-04 06:52:00.000000','2018-05-03 21:10:00.000000',34920000000,'2018-03-29 08:24:54.043000',1,1597.00,'00:10:00.000000','116С',1933.00,1597.00,NULL,123,17,NULL),
	(1665,'2018-05-04 06:13:00.000000','2018-05-03 21:41:00.000000',30720000000,'2018-03-29 08:24:54.043000',1,2327.00,'00:41:00.000000','016А',2495.00,2327.00,NULL,42,49,NULL),
	(1666,'2018-05-04 06:05:00.000000','2018-05-03 21:44:00.000000',30060000000,'2018-03-29 08:24:54.043000',1,2327.00,'00:44:00.000000','059Г',3015.00,2327.00,NULL,47,47,NULL),
	(1667,'2018-05-04 07:18:00.000000','2018-05-03 22:15:00.000000',32580000000,'2018-03-29 08:24:54.043000',1,1498.00,'01:15:00.000000','030А',1988.00,1498.00,847.00,25,318,27),
	(1668,'2018-05-04 08:10:00.000000','2018-05-03 22:56:00.000000',33240000000,'2018-03-29 08:24:54.043000',1,1568.00,'01:56:00.000000','111В',1979.00,1568.00,NULL,57,388,NULL),
	(1669,'2018-05-04 09:01:00.000000','2018-05-03 23:22:00.000000',34740000000,'2018-03-29 08:24:54.043000',1,1568.00,'02:22:00.000000','049Ч',2118.00,1568.00,NULL,134,33,NULL),
	(1670,'2018-05-04 09:25:00.000000','2018-05-04 00:33:00.000000',31920000000,'2018-03-29 08:24:54.043000',1,1568.00,'03:33:00.000000','079Ж',2498.00,1568.00,NULL,207,124,NULL),
	(1671,'2018-05-04 09:30:00.000000','2018-05-04 01:35:00.000000',28500000000,'2018-03-29 08:24:54.043000',1,1568.00,'04:35:00.000000','082В',2106.00,1568.00,NULL,48,38,NULL),
	(1672,'2018-05-04 06:15:00.000000','2018-05-04 02:45:00.000000',12600000000,'2018-03-29 08:24:54.043000',1,2004.00,'05:45:00.000000','752А',NULL,NULL,2004.00,NULL,NULL,460),
	(1673,'2018-05-04 07:52:00.000000','2018-05-04 03:50:00.000000',14520000000,'2018-03-29 08:24:54.043000',1,2435.00,'06:50:00.000000','754А',NULL,NULL,2435.00,NULL,NULL,407),
	(1674,'2018-05-04 08:00:00.000000','2018-05-04 04:00:00.000000',14400000000,'2018-03-29 08:24:54.043000',1,2435.00,'07:00:00.000000','756А',NULL,NULL,2435.00,NULL,NULL,807),
	(1675,'2018-05-04 15:41:00.000000','2018-05-04 05:08:00.000000',37980000000,'2018-03-29 08:24:54.043000',1,1481.00,'08:08:00.000000','224В',1481.00,1568.00,890.00,14,162,247),
	(1676,'2018-05-04 10:22:00.000000','2018-05-04 06:18:00.000000',14640000000,'2018-03-29 08:24:54.043000',1,2435.00,'09:18:00.000000','757Н',NULL,NULL,2435.00,NULL,NULL,416),
	(1677,'2018-05-04 10:34:00.000000','2018-05-04 06:40:00.000000',14040000000,'2018-03-29 08:24:54.043000',1,2985.00,'09:40:00.000000','760А',NULL,NULL,2985.00,NULL,NULL,349),
	(1678,'2018-05-04 14:45:00.000000','2018-05-04 10:40:00.000000',14700000000,'2018-03-29 08:24:54.043000',1,2082.00,'13:40:00.000000','748А',NULL,NULL,2082.00,NULL,NULL,289),
	(1679,'2018-05-04 16:16:00.000000','2018-05-04 12:30:00.000000',13560000000,'2018-03-29 08:24:54.043000',1,2504.00,'15:30:00.000000','768А',NULL,NULL,2504.00,NULL,NULL,384),
	(1680,'2018-05-04 16:27:00.000000','2018-05-04 12:40:00.000000',13620000000,'2018-03-29 08:24:54.043000',1,2985.00,'15:40:00.000000','770А',NULL,NULL,2985.00,NULL,NULL,279),
	(1681,'2018-05-04 18:35:00.000000','2018-05-04 14:40:00.000000',14100000000,'2018-03-29 08:24:54.043000',1,2435.00,'17:40:00.000000','774А',NULL,NULL,2435.00,NULL,NULL,797),
	(1682,'2018-05-04 20:25:00.000000','2018-05-04 16:30:00.000000',14100000000,'2018-03-29 08:24:54.043000',1,2435.00,'19:30:00.000000','776А',NULL,NULL,2435.00,NULL,NULL,807),
	(1683,'2018-05-04 20:44:00.000000','2018-05-04 16:40:00.000000',14640000000,'2018-03-29 08:24:54.043000',1,2435.00,'19:40:00.000000','778А',NULL,NULL,2435.00,NULL,NULL,406),
	(1684,'2018-05-04 21:40:00.000000','2018-05-04 18:00:00.000000',13200000000,'2018-03-29 08:24:54.043000',1,2504.00,'21:00:00.000000','780А',NULL,NULL,2504.00,NULL,NULL,414),
	(1685,'2018-05-05 02:01:00.000000','2018-05-04 18:20:00.000000',27660000000,'2018-03-29 08:24:54.043000',1,1597.00,'21:20:00.000000','135С',2343.00,1597.00,NULL,69,78,NULL),
	(1686,'2018-05-05 02:19:00.000000','2018-05-04 18:24:00.000000',28500000000,'2018-03-29 08:24:54.043000',1,1286.00,'21:24:00.000000','056А',1286.00,1498.00,NULL,2,642,NULL),
	(1687,'2018-05-05 04:30:00.000000','2018-05-04 18:41:00.000000',35340000000,'2018-03-29 08:24:54.043000',1,1597.00,'21:41:00.000000','120В',2102.00,1597.00,NULL,108,1,NULL),
	(1688,'2018-05-05 02:32:00.000000','2018-05-04 18:49:00.000000',27780000000,'2018-03-29 08:24:54.043000',1,2327.00,'21:49:00.000000','107Й',3180.00,2327.00,1433.00,57,47,59),
	(1689,'2018-05-05 03:06:00.000000','2018-05-04 18:50:00.000000',29760000000,'2018-03-29 08:24:54.043000',1,2558.00,'21:50:00.000000','026А',2558.00,NULL,NULL,653,NULL,NULL),
	(1690,'2018-05-05 02:39:00.000000','2018-05-04 19:15:00.000000',26640000000,'2018-03-29 08:24:54.043000',1,1526.00,'22:15:00.000000','034А',2470.00,1526.00,847.00,36,46,4),
	(1691,'2018-05-05 03:16:00.000000','2018-05-04 19:16:00.000000',28800000000,'2018-03-29 08:24:54.043000',1,1568.00,'22:16:00.000000','146У',2480.00,1568.00,890.00,24,50,37),
	(1692,'2018-05-05 03:40:00.000000','2018-05-04 19:28:00.000000',29520000000,'2018-03-29 08:24:54.043000',1,1498.00,'22:28:00.000000','028А',2415.00,1498.00,NULL,180,5,NULL),
	(1693,'2018-05-05 03:47:00.000000','2018-05-04 19:50:00.000000',28620000000,'2018-03-29 08:24:54.043000',1,2335.00,'22:50:00.000000','006А',2335.00,NULL,NULL,779,NULL,NULL),
	(1694,'2018-05-05 02:49:00.000000','2018-05-04 20:10:00.000000',23940000000,'2018-03-29 08:24:54.043000',1,3890.00,'23:10:00.000000','032А',3890.00,NULL,NULL,8,NULL,NULL),
	(1695,'2018-05-05 05:30:00.000000','2018-05-04 20:30:00.000000',32400000000,'2018-03-29 08:24:54.043000',1,3245.00,'23:30:00.000000','004А',3245.00,NULL,NULL,211,NULL,NULL),
	(1696,'2018-05-05 05:36:00.000000','2018-05-04 20:40:00.000000',32160000000,'2018-03-29 08:24:54.043000',1,3247.00,'23:40:00.000000','054Ч',3247.00,NULL,NULL,105,NULL,NULL),
	(1697,'2018-05-05 04:55:00.000000','2018-05-04 20:55:00.000000',28800000000,'2018-03-29 08:24:54.043000',1,3609.00,'23:55:00.000000','002А',3609.00,NULL,NULL,130,NULL,NULL),
	(1698,'2018-05-06 06:43:00.000000','2018-05-05 21:11:00.000000',34320000000,'2018-03-29 08:24:54.043000',2,1597.00,'00:11:00.000000','119А',2302.00,1597.00,NULL,94,36,NULL),
	(1699,'2018-05-06 08:20:00.000000','2018-05-05 22:15:00.000000',36300000000,'2018-03-29 08:24:54.043000',2,1498.00,'01:15:00.000000','055А',2990.00,1498.00,NULL,3,638,NULL),
	(1700,'2018-05-06 06:19:00.000000','2018-05-05 22:53:00.000000',26760000000,'2018-03-29 08:24:54.043000',2,3890.00,'01:53:00.000000','031А',3890.00,NULL,NULL,32,NULL,NULL),
	(1701,'2018-05-06 06:00:00.000000','2018-05-06 02:30:00.000000',12600000000,'2018-03-29 08:24:54.043000',2,2004.00,'05:30:00.000000','751А',NULL,NULL,2004.00,NULL,NULL,468),
	(1702,'2018-05-06 07:43:00.000000','2018-05-06 03:40:00.000000',14580000000,'2018-03-29 08:24:54.043000',2,2435.00,'06:40:00.000000','753А',NULL,NULL,2435.00,NULL,NULL,434),
	(1703,'2018-05-06 07:50:00.000000','2018-05-06 03:50:00.000000',14400000000,'2018-03-29 08:24:54.043000',2,2504.00,'06:50:00.000000','755А',NULL,NULL,2504.00,NULL,NULL,841),
	(1704,'2018-05-06 09:58:00.000000','2018-05-06 06:00:00.000000',14280000000,'2018-03-29 08:24:54.043000',2,3504.00,'09:00:00.000000','757А',NULL,NULL,3504.00,NULL,NULL,336),
	(1705,'2018-05-06 11:46:00.000000','2018-05-06 08:00:00.000000',13560000000,'2018-03-29 08:24:54.043000',2,3584.00,'11:00:00.000000','761А',NULL,NULL,3584.00,NULL,NULL,411),
	(1706,'2018-05-06 11:56:00.000000','2018-05-06 08:10:00.000000',13560000000,'2018-03-29 08:24:54.043000',2,3584.00,'11:10:00.000000','763А',NULL,NULL,3584.00,NULL,NULL,407),
	(1707,'2018-05-06 13:58:00.000000','2018-05-06 10:00:00.000000',14280000000,'2018-03-29 08:24:54.043000',2,4173.00,'13:00:00.000000','765А',NULL,NULL,4173.00,NULL,NULL,751),
	(1708,'2018-05-06 14:15:00.000000','2018-05-06 10:10:00.000000',14700000000,'2018-03-29 08:24:54.043000',2,4175.00,'13:10:00.000000','747А',NULL,NULL,4175.00,NULL,NULL,134),
	(1709,'2018-05-06 18:35:00.000000','2018-05-06 10:32:00.000000',28980000000,'2018-03-29 08:24:54.043000',2,1568.00,'13:32:00.000000','049А',2033.00,1568.00,NULL,120,11,NULL),
	(1710,'2018-05-06 19:27:00.000000','2018-05-06 10:33:00.000000',32040000000,'2018-03-29 08:24:54.043000',2,1568.00,'13:33:00.000000','131Г',2144.00,1568.00,NULL,24,255,NULL),
	(1711,'2018-05-06 20:54:00.000000','2018-05-06 10:35:00.000000',37140000000,'2018-03-29 08:24:54.043000',2,1461.00,'13:35:00.000000','275А',1461.00,1568.00,NULL,60,34,NULL),
	(1712,'2018-05-06 15:45:00.000000','2018-05-06 12:00:00.000000',13500000000,'2018-03-29 08:24:54.043000',2,4173.00,'15:00:00.000000','767А',NULL,NULL,4173.00,NULL,NULL,353),
	(1713,'2018-05-06 15:59:00.000000','2018-05-06 12:10:00.000000',13740000000,'2018-03-29 08:24:54.043000',2,4173.00,'15:10:00.000000','769А',NULL,NULL,4173.00,NULL,NULL,364),
	(1714,'2018-05-07 00:03:00.000000','2018-05-06 13:32:00.000000',37860000000,'2018-03-29 08:24:54.043000',2,1597.00,'16:32:00.000000','121А',1629.00,1597.00,NULL,59,37,NULL),
	(1715,'2018-05-06 17:54:00.000000','2018-05-06 14:00:00.000000',14040000000,'2018-03-29 08:24:54.043000',2,4173.00,'17:00:00.000000','771Н',NULL,NULL,4173.00,NULL,NULL,356),
	(1716,'2018-05-06 17:56:00.000000','2018-05-06 14:10:00.000000',13560000000,'2018-03-29 08:24:54.043000',2,4784.00,'17:10:00.000000','773А',NULL,NULL,4784.00,NULL,NULL,377),
	(1717,'2018-05-07 01:37:00.000000','2018-05-06 15:32:00.000000',36300000000,'2018-03-29 08:24:54.043000',2,1233.00,'18:32:00.000000','201А',1233.00,1568.00,NULL,30,104,NULL),
	(1718,'2018-05-06 19:58:00.000000','2018-05-06 16:00:00.000000',14280000000,'2018-03-29 08:24:54.043000',2,4784.00,'19:00:00.000000','775А',NULL,NULL,4784.00,NULL,NULL,760),
	(1719,'2018-05-06 20:13:00.000000','2018-05-06 16:10:00.000000',14580000000,'2018-03-29 08:24:54.043000',2,4784.00,'19:10:00.000000','777А',NULL,NULL,4784.00,NULL,NULL,382),
	(1720,'2018-05-06 23:10:00.000000','2018-05-06 16:15:00.000000',24900000000,'2018-03-29 08:24:54.043000',2,2327.00,'19:15:00.000000','059А',3150.00,2327.00,NULL,61,343,NULL),
	(1721,'2018-05-07 00:46:00.000000','2018-05-06 17:00:00.000000',27960000000,'2018-03-29 08:24:54.043000',2,1568.00,'20:00:00.000000','111А',2238.00,1568.00,NULL,59,353,NULL),
	(1722,'2018-05-07 01:00:00.000000','2018-05-06 17:06:00.000000',28440000000,'2018-03-29 08:24:54.043000',2,1568.00,'20:06:00.000000','081А',2302.00,1568.00,NULL,58,36,NULL),
	(1723,'2018-05-07 01:12:00.000000','2018-05-06 17:32:00.000000',27600000000,'2018-03-29 08:24:54.043000',2,1597.00,'20:32:00.000000','079А',2498.00,1597.00,NULL,275,158,NULL),
	(1724,'2018-05-07 01:18:00.000000','2018-05-06 17:33:00.000000',27900000000,'2018-03-29 08:24:54.043000',2,1597.00,'20:33:00.000000','115А',2049.00,1597.00,NULL,86,60,NULL),
	(1725,'2018-05-06 21:40:00.000000','2018-05-06 18:00:00.000000',13200000000,'2018-03-29 08:24:54.043000',2,3293.00,'21:00:00.000000','779А',NULL,NULL,3293.00,NULL,NULL,374),
	(1726,'2018-05-07 01:51:00.000000','2018-05-06 18:24:00.000000',26820000000,'2018-03-29 08:24:54.043000',2,1498.00,'21:24:00.000000','127А',2592.00,1498.00,NULL,10,604,NULL),
	(1727,'2018-05-07 03:06:00.000000','2018-05-06 18:55:00.000000',29460000000,'2018-03-29 08:24:54.043000',2,2754.00,'21:55:00.000000','025А',2754.00,NULL,NULL,632,NULL,NULL),
	(1728,'2018-05-07 02:49:00.000000','2018-05-06 19:11:00.000000',27480000000,'2018-03-29 08:24:54.043000',2,1498.00,'22:11:00.000000','029А',2993.00,1498.00,847.00,23,60,15),
	(1729,'2018-05-07 03:50:00.000000','2018-05-06 19:41:00.000000',29340000000,'2018-03-29 08:24:54.043000',2,2327.00,'22:41:00.000000','015А',2714.00,2327.00,NULL,66,46,NULL),
	(1730,'2018-05-07 03:45:00.000000','2018-05-06 19:50:00.000000',28500000000,'2018-03-29 08:24:54.043000',2,2531.00,'22:50:00.000000','005А',2531.00,NULL,NULL,776,NULL,NULL),
	(1731,'2018-05-07 05:30:00.000000','2018-05-06 20:30:00.000000',32400000000,'2018-03-29 08:24:54.043000',2,3018.00,'23:30:00.000000','003А',3018.00,NULL,NULL,216,NULL,NULL),
	(1732,'2018-05-07 04:19:00.000000','2018-05-06 20:36:00.000000',27780000000,'2018-03-29 08:24:54.043000',2,1498.00,'23:36:00.000000','027А',2642.00,1498.00,NULL,169,30,NULL),
	(1733,'2018-05-07 05:14:00.000000','2018-05-06 20:44:00.000000',30600000000,'2018-03-29 08:24:54.043000',2,3921.00,'23:44:00.000000','053Ч',3921.00,NULL,NULL,94,NULL,NULL),
	(1734,'2018-05-07 04:55:00.000000','2018-05-06 20:55:00.000000',28800000000,'2018-03-29 08:24:54.043000',2,3900.00,'23:55:00.000000','001А',3900.00,NULL,NULL,116,NULL,NULL),
	(1735,'2018-05-11 06:52:00.000000','2018-05-10 21:10:00.000000',34920000000,'2018-03-29 08:25:01.384000',1,1332.00,'00:10:00.000000','116С',1753.00,1332.00,NULL,116,92,NULL),
	(1736,'2018-05-11 06:13:00.000000','2018-05-10 21:41:00.000000',30720000000,'2018-03-29 08:25:01.384000',1,1929.00,'00:41:00.000000','016А',5000.00,1929.00,NULL,29,31,NULL),
	(1737,'2018-05-11 06:05:00.000000','2018-05-10 21:44:00.000000',30060000000,'2018-03-29 08:25:01.384000',1,1929.00,'00:44:00.000000','059Г',2899.00,1929.00,NULL,62,60,NULL),
	(1738,'2018-05-11 07:18:00.000000','2018-05-10 22:15:00.000000',32580000000,'2018-03-29 08:25:01.384000',1,1251.00,'01:15:00.000000','030А',1988.00,1251.00,693.00,32,187,43),
	(1739,'2018-05-11 09:01:00.000000','2018-05-10 23:22:00.000000',34740000000,'2018-03-29 08:25:01.384000',1,1308.00,'02:22:00.000000','049Ч',1861.00,1308.00,NULL,114,30,NULL),
	(1740,'2018-05-11 09:25:00.000000','2018-05-11 00:33:00.000000',31920000000,'2018-03-29 08:25:01.384000',1,1308.00,'03:33:00.000000','079Ж',1790.00,1308.00,NULL,182,125,NULL),
	(1741,'2018-05-11 09:30:00.000000','2018-05-11 01:35:00.000000',28500000000,'2018-03-29 08:25:01.384000',1,1308.00,'04:35:00.000000','082В',2106.00,1308.00,NULL,174,42,NULL),
	(1742,'2018-05-11 06:15:00.000000','2018-05-11 02:45:00.000000',12600000000,'2018-03-29 08:25:01.384000',1,2435.00,'05:45:00.000000','752А',NULL,NULL,2435.00,NULL,NULL,418),
	(1743,'2018-05-11 07:52:00.000000','2018-05-11 03:50:00.000000',14520000000,'2018-03-29 08:25:01.384000',1,3504.00,'06:50:00.000000','754А',NULL,NULL,3504.00,NULL,NULL,389),
	(1744,'2018-05-11 08:00:00.000000','2018-05-11 04:00:00.000000',14400000000,'2018-03-29 08:25:01.384000',1,2435.00,'07:00:00.000000','756А',NULL,NULL,2435.00,NULL,NULL,800),
	(1745,'2018-05-11 15:41:00.000000','2018-05-11 05:08:00.000000',37980000000,'2018-03-29 08:25:01.384000',1,1308.00,'08:08:00.000000','224В',1481.00,1308.00,728.00,14,158,248),
	(1746,'2018-05-11 10:22:00.000000','2018-05-11 06:18:00.000000',14640000000,'2018-03-29 08:25:01.384000',1,3504.00,'09:18:00.000000','757Н',NULL,NULL,3504.00,NULL,NULL,417),
	(1747,'2018-05-11 10:34:00.000000','2018-05-11 06:40:00.000000',14040000000,'2018-03-29 08:25:01.384000',1,3504.00,'09:40:00.000000','760А',NULL,NULL,3504.00,NULL,NULL,365),
	(1748,'2018-05-11 14:45:00.000000','2018-05-11 10:40:00.000000',14700000000,'2018-03-29 08:25:01.384000',1,2260.00,'13:40:00.000000','748А',NULL,NULL,2260.00,NULL,NULL,332),
	(1749,'2018-05-11 16:16:00.000000','2018-05-11 12:30:00.000000',13560000000,'2018-03-29 08:25:01.384000',1,3504.00,'15:30:00.000000','768А',NULL,NULL,3504.00,NULL,NULL,399),
	(1750,'2018-05-11 16:27:00.000000','2018-05-11 12:40:00.000000',13620000000,'2018-03-29 08:25:01.384000',1,3504.00,'15:40:00.000000','770А',NULL,NULL,3504.00,NULL,NULL,360),
	(1751,'2018-05-11 18:35:00.000000','2018-05-11 14:40:00.000000',14100000000,'2018-03-29 08:25:01.384000',1,3504.00,'17:40:00.000000','774А',NULL,NULL,3504.00,NULL,NULL,751),
	(1752,'2018-05-11 20:25:00.000000','2018-05-11 16:30:00.000000',14100000000,'2018-03-29 08:25:01.384000',1,3504.00,'19:30:00.000000','776А',NULL,NULL,3504.00,NULL,NULL,810),
	(1753,'2018-05-11 20:44:00.000000','2018-05-11 16:40:00.000000',14640000000,'2018-03-29 08:25:01.384000',1,3504.00,'19:40:00.000000','778А',NULL,NULL,3504.00,NULL,NULL,411),
	(1754,'2018-05-11 21:40:00.000000','2018-05-11 18:00:00.000000',13200000000,'2018-03-29 08:25:01.384000',1,2004.00,'21:00:00.000000','780А',NULL,NULL,2004.00,NULL,NULL,442),
	(1755,'2018-05-12 02:01:00.000000','2018-05-11 18:20:00.000000',27660000000,'2018-03-29 08:25:01.384000',1,1332.00,'21:20:00.000000','121С',1494.00,1332.00,NULL,63,19,NULL),
	(1756,'2018-05-12 02:19:00.000000','2018-05-11 18:24:00.000000',28500000000,'2018-03-29 08:25:01.384000',1,1251.00,'21:24:00.000000','056А',1286.00,1251.00,NULL,2,552,NULL),
	(1757,'2018-05-12 04:30:00.000000','2018-05-11 18:41:00.000000',35340000000,'2018-03-29 08:25:01.384000',1,1332.00,'21:41:00.000000','120В',2010.00,1332.00,NULL,132,49,NULL),
	(1758,'2018-05-12 03:06:00.000000','2018-05-11 18:50:00.000000',29760000000,'2018-03-29 08:25:01.384000',1,945.00,'21:50:00.000000','026А',945.00,NULL,NULL,287,NULL,NULL),
	(1759,'2018-05-12 02:39:00.000000','2018-05-11 19:15:00.000000',26640000000,'2018-03-29 08:25:01.384000',1,2470.00,'22:15:00.000000','034А',2470.00,NULL,693.00,6,NULL,5),
	(1760,'2018-05-12 03:16:00.000000','2018-05-11 19:16:00.000000',28800000000,'2018-03-29 08:25:01.384000',1,1308.00,'22:16:00.000000','132Г',1979.00,1308.00,NULL,27,53,NULL),
	(1761,'2018-05-12 03:40:00.000000','2018-05-11 19:28:00.000000',29520000000,'2018-03-29 08:25:01.384000',1,1251.00,'22:28:00.000000','028А',2387.00,1251.00,NULL,127,72,NULL),
	(1762,'2018-05-12 03:47:00.000000','2018-05-11 19:50:00.000000',28620000000,'2018-03-29 08:25:01.384000',1,945.00,'22:50:00.000000','006А',945.00,NULL,NULL,442,NULL,NULL),
	(1763,'2018-05-12 02:49:00.000000','2018-05-11 20:10:00.000000',23940000000,'2018-03-29 08:25:01.384000',1,3890.00,'23:10:00.000000','032А',3890.00,NULL,NULL,8,NULL,NULL),
	(1764,'2018-05-12 05:30:00.000000','2018-05-11 20:30:00.000000',32400000000,'2018-03-29 08:25:01.384000',1,1945.00,'23:30:00.000000','004А',1945.00,NULL,NULL,198,NULL,NULL),
	(1765,'2018-05-12 05:36:00.000000','2018-05-11 20:40:00.000000',32160000000,'2018-03-29 08:25:01.384000',1,3247.00,'23:40:00.000000','054Ч',3247.00,NULL,NULL,106,NULL,NULL),
	(1766,'2018-05-12 04:55:00.000000','2018-05-11 20:55:00.000000',28800000000,'2018-03-29 08:25:01.384000',1,1945.00,'23:55:00.000000','002А',1945.00,NULL,NULL,94,NULL,NULL),
	(1767,'2018-05-13 06:43:00.000000','2018-05-12 21:11:00.000000',34320000000,'2018-03-29 08:25:01.384000',2,1332.00,'00:11:00.000000','119А',2106.00,1332.00,NULL,96,63,NULL),
	(1768,'2018-05-13 08:20:00.000000','2018-05-12 22:15:00.000000',36300000000,'2018-03-29 08:25:01.384000',2,1251.00,'01:15:00.000000','055А',2990.00,1251.00,NULL,3,713,NULL),
	(1769,'2018-05-13 06:19:00.000000','2018-05-12 22:53:00.000000',26760000000,'2018-03-29 08:25:01.384000',2,3890.00,'01:53:00.000000','031А',3890.00,NULL,NULL,29,NULL,NULL),
	(1770,'2018-05-13 06:00:00.000000','2018-05-13 02:30:00.000000',12600000000,'2018-03-29 08:25:01.384000',2,2004.00,'05:30:00.000000','751А',NULL,NULL,2004.00,NULL,NULL,453),
	(1771,'2018-05-13 07:43:00.000000','2018-05-13 03:40:00.000000',14580000000,'2018-03-29 08:25:01.384000',2,2004.00,'06:40:00.000000','753А',NULL,NULL,2004.00,NULL,NULL,472),
	(1772,'2018-05-13 07:50:00.000000','2018-05-13 03:50:00.000000',14400000000,'2018-03-29 08:25:01.384000',2,2004.00,'06:50:00.000000','755А',NULL,NULL,2004.00,NULL,NULL,914),
	(1773,'2018-05-13 09:58:00.000000','2018-05-13 06:00:00.000000',14280000000,'2018-03-29 08:25:01.384000',2,3504.00,'09:00:00.000000','757А',NULL,NULL,3504.00,NULL,NULL,396),
	(1774,'2018-05-13 11:46:00.000000','2018-05-13 08:00:00.000000',13560000000,'2018-03-29 08:25:01.384000',2,3073.00,'11:00:00.000000','761А',NULL,NULL,3073.00,NULL,NULL,425),
	(1775,'2018-05-13 11:56:00.000000','2018-05-13 08:10:00.000000',13560000000,'2018-03-29 08:25:01.384000',2,4584.00,'11:10:00.000000','763А',NULL,NULL,4584.00,NULL,NULL,417),
	(1776,'2018-05-13 13:58:00.000000','2018-05-13 10:00:00.000000',14280000000,'2018-03-29 08:25:01.384000',2,4584.00,'13:00:00.000000','765А',NULL,NULL,4584.00,NULL,NULL,824),
	(1777,'2018-05-13 14:15:00.000000','2018-05-13 10:10:00.000000',14700000000,'2018-03-29 08:25:01.384000',2,3843.00,'13:10:00.000000','747А',NULL,NULL,3843.00,NULL,NULL,163),
	(1778,'2018-05-13 18:35:00.000000','2018-05-13 10:32:00.000000',28980000000,'2018-03-29 08:25:01.384000',2,1308.00,'13:32:00.000000','049А',2033.00,1308.00,NULL,116,55,NULL),
	(1779,'2018-05-13 19:27:00.000000','2018-05-13 10:33:00.000000',32040000000,'2018-03-29 08:25:01.384000',2,1308.00,'13:33:00.000000','145А',1770.00,1308.00,728.00,28,73,39),
	(1780,'2018-05-13 20:48:00.000000','2018-05-13 11:31:00.000000',33420000000,'2018-03-29 08:25:01.384000',2,1929.00,'14:31:00.000000','107Ж',3299.00,1929.00,1190.00,47,40,56),
	(1781,'2018-05-13 15:45:00.000000','2018-05-13 12:00:00.000000',13500000000,'2018-03-29 08:25:01.384000',2,4584.00,'15:00:00.000000','767А',NULL,NULL,4584.00,NULL,NULL,384),
	(1782,'2018-05-13 15:59:00.000000','2018-05-13 12:10:00.000000',13740000000,'2018-03-29 08:25:01.384000',2,4584.00,'15:10:00.000000','769А',NULL,NULL,4584.00,NULL,NULL,392),
	(1783,'2018-05-14 00:03:00.000000','2018-05-13 13:32:00.000000',37860000000,'2018-03-29 08:25:01.384000',2,1332.00,'16:32:00.000000','135А',2057.00,1332.00,NULL,71,26,NULL),
	(1784,'2018-05-13 17:54:00.000000','2018-05-13 14:00:00.000000',14040000000,'2018-03-29 08:25:01.384000',2,4584.00,'17:00:00.000000','771Н',NULL,NULL,4584.00,NULL,NULL,313),
	(1785,'2018-05-13 17:56:00.000000','2018-05-13 14:10:00.000000',13560000000,'2018-03-29 08:25:01.384000',2,6813.00,'17:10:00.000000','773А',NULL,NULL,6813.00,NULL,NULL,396),
	(1786,'2018-05-14 01:37:00.000000','2018-05-13 15:32:00.000000',36300000000,'2018-03-29 08:25:01.384000',2,1308.00,'18:32:00.000000','201А',1506.00,1308.00,NULL,34,12,NULL),
	(1787,'2018-05-13 19:58:00.000000','2018-05-13 16:00:00.000000',14280000000,'2018-03-29 08:25:01.384000',2,4784.00,'19:00:00.000000','775А',NULL,NULL,4784.00,NULL,NULL,629),
	(1788,'2018-05-13 20:13:00.000000','2018-05-13 16:10:00.000000',14580000000,'2018-03-29 08:25:01.384000',2,4784.00,'19:10:00.000000','777А',NULL,NULL,4784.00,NULL,NULL,318),
	(1789,'2018-05-13 23:10:00.000000','2018-05-13 16:15:00.000000',24900000000,'2018-03-29 08:25:01.384000',2,1929.00,'19:15:00.000000','059А',3150.00,1929.00,NULL,45,200,NULL),
	(1790,'2018-05-14 01:00:00.000000','2018-05-13 17:06:00.000000',28440000000,'2018-03-29 08:25:01.384000',2,1308.00,'20:06:00.000000','081А',2106.00,1308.00,NULL,170,15,NULL),
	(1791,'2018-05-14 01:18:00.000000','2018-05-13 17:33:00.000000',27900000000,'2018-03-29 08:25:01.384000',2,1332.00,'20:33:00.000000','115А',1992.00,1332.00,NULL,90,19,NULL),
	(1792,'2018-05-13 21:40:00.000000','2018-05-13 18:00:00.000000',13200000000,'2018-03-29 08:25:01.384000',2,4784.00,'21:00:00.000000','779А',NULL,NULL,4784.00,NULL,NULL,365),
	(1793,'2018-05-14 01:51:00.000000','2018-05-13 18:24:00.000000',26820000000,'2018-03-29 08:25:01.384000',2,1251.00,'21:24:00.000000','127А',2342.00,1251.00,NULL,11,151,NULL),
	(1794,'2018-05-14 03:21:00.000000','2018-05-13 18:55:00.000000',30360000000,'2018-03-29 08:25:01.384000',2,2465.00,'21:55:00.000000','025А',2465.00,NULL,NULL,611,NULL,NULL),
	(1795,'2018-05-14 03:30:00.000000','2018-05-13 19:11:00.000000',29940000000,'2018-03-29 08:25:01.384000',2,1251.00,'22:11:00.000000','029А',3768.00,1251.00,NULL,21,35,NULL),
	(1796,'2018-05-14 04:28:00.000000','2018-05-13 19:41:00.000000',31620000000,'2018-03-29 08:25:01.384000',2,1929.00,'22:41:00.000000','015А',2480.00,1929.00,NULL,8,34,NULL),
	(1797,'2018-05-14 04:08:00.000000','2018-05-13 19:50:00.000000',29880000000,'2018-03-29 08:25:01.384000',2,2242.00,'22:50:00.000000','005А',2242.00,NULL,NULL,695,NULL,NULL),
	(1798,'2018-05-14 05:30:00.000000','2018-05-13 20:30:00.000000',32400000000,'2018-03-29 08:25:01.384000',2,2807.00,'23:30:00.000000','003А',2807.00,NULL,NULL,200,NULL,NULL),
	(1799,'2018-05-14 04:40:00.000000','2018-05-13 20:36:00.000000',29040000000,'2018-03-29 08:25:01.384000',2,1251.00,'23:36:00.000000','027А',2387.00,1251.00,NULL,168,1,NULL),
	(1800,'2018-05-14 05:14:00.000000','2018-05-13 20:44:00.000000',30600000000,'2018-03-29 08:25:01.384000',2,3189.00,'23:44:00.000000','053Ч',3189.00,NULL,NULL,147,NULL,NULL),
	(1801,'2018-05-14 04:55:00.000000','2018-05-13 20:55:00.000000',28800000000,'2018-03-29 08:25:01.384000',2,3470.00,'23:55:00.000000','001А',3470.00,NULL,NULL,120,NULL,NULL),
	(1802,'2018-05-18 07:35:00.000000','2018-05-17 21:10:00.000000',37500000000,'2018-03-29 08:25:08.328000',1,1332.00,'00:10:00.000000','116С',1680.00,1332.00,NULL,55,3,NULL),
	(1803,'2018-05-18 06:11:00.000000','2018-05-17 21:44:00.000000',30420000000,'2018-03-29 08:25:08.328000',1,1929.00,'00:44:00.000000','059Г',3101.00,1929.00,NULL,37,44,NULL),
	(1804,'2018-05-18 07:18:00.000000','2018-05-17 22:15:00.000000',32580000000,'2018-03-29 08:25:08.328000',1,1251.00,'01:15:00.000000','030А',2157.00,1251.00,693.00,19,43,31),
	(1805,'2018-05-18 09:30:00.000000','2018-05-17 23:22:00.000000',36480000000,'2018-03-29 08:25:08.328000',1,1308.00,'02:22:00.000000','049Ч',1947.00,1308.00,NULL,62,35,NULL),
	(1806,'2018-05-18 10:00:00.000000','2018-05-18 00:33:00.000000',34020000000,'2018-03-29 08:25:08.328000',1,1332.00,'03:33:00.000000','079Ж',1910.00,1332.00,NULL,96,84,NULL),
	(1807,'2018-05-18 10:15:00.000000','2018-05-18 01:35:00.000000',31200000000,'2018-03-29 08:25:08.328000',1,1308.00,'04:35:00.000000','082В',2106.00,1308.00,NULL,110,35,NULL),
	(1808,'2018-05-18 06:19:00.000000','2018-05-18 02:45:00.000000',12840000000,'2018-03-29 08:25:08.328000',1,3073.00,'05:45:00.000000','752А',NULL,NULL,3073.00,NULL,NULL,419),
	(1809,'2018-05-18 07:52:00.000000','2018-05-18 03:50:00.000000',14520000000,'2018-03-29 08:25:08.328000',1,3073.00,'06:50:00.000000','754А',NULL,NULL,3073.00,NULL,NULL,420),
	(1810,'2018-05-18 08:00:00.000000','2018-05-18 04:00:00.000000',14400000000,'2018-03-29 08:25:08.328000',1,4584.00,'07:00:00.000000','756А',NULL,NULL,4584.00,NULL,NULL,817),
	(1811,'2018-05-18 10:30:00.000000','2018-05-18 06:18:00.000000',15120000000,'2018-03-29 08:25:08.328000',1,4584.00,'09:18:00.000000','757Н',NULL,NULL,4584.00,NULL,NULL,375),
	(1812,'2018-05-18 10:42:00.000000','2018-05-18 06:40:00.000000',14520000000,'2018-03-29 08:25:08.328000',1,4584.00,'09:40:00.000000','760А',NULL,NULL,4584.00,NULL,NULL,375),
	(1813,'2018-05-18 15:37:00.000000','2018-05-18 11:51:00.000000',13560000000,'2018-03-29 08:25:08.328000',1,3293.00,'14:51:00.000000','768А',NULL,NULL,3293.00,NULL,NULL,375),
	(1814,'2018-05-18 15:48:00.000000','2018-05-18 12:01:00.000000',13620000000,'2018-03-29 08:25:08.328000',1,4784.00,'15:01:00.000000','770А',NULL,NULL,4784.00,NULL,NULL,368),
	(1815,'2018-05-18 16:17:00.000000','2018-05-18 12:11:00.000000',14760000000,'2018-03-29 08:25:08.328000',1,3843.00,'15:11:00.000000','748А',NULL,NULL,3843.00,NULL,NULL,144),
	(1816,'2018-05-18 19:03:00.000000','2018-05-18 15:08:00.000000',14100000000,'2018-03-29 08:25:08.328000',1,5493.00,'18:08:00.000000','774А',NULL,NULL,5493.00,NULL,NULL,327),
	(1817,'2018-05-18 20:09:00.000000','2018-05-18 16:14:00.000000',14100000000,'2018-03-29 08:25:08.328000',1,3293.00,'19:14:00.000000','776А',NULL,NULL,3293.00,NULL,NULL,791),
	(1818,'2018-05-18 20:28:00.000000','2018-05-18 16:27:00.000000',14460000000,'2018-03-29 08:25:08.328000',1,3293.00,'19:27:00.000000','778А',NULL,NULL,3293.00,NULL,NULL,381),
	(1819,'2018-05-18 21:40:00.000000','2018-05-18 18:00:00.000000',13200000000,'2018-03-29 08:25:08.328000',1,2784.00,'21:00:00.000000','780А',NULL,NULL,2784.00,NULL,NULL,461),
	(1820,'2018-05-19 02:01:00.000000','2018-05-18 18:20:00.000000',27660000000,'2018-03-29 08:25:08.328000',1,1332.00,'21:20:00.000000','135С',2152.00,1332.00,NULL,69,63,NULL),
	(1821,'2018-05-19 01:48:00.000000','2018-05-18 18:24:00.000000',26640000000,'2018-03-29 08:25:08.328000',1,1251.00,'21:24:00.000000','056А',1286.00,1251.00,NULL,2,575,NULL),
	(1822,'2018-05-19 09:06:00.000000','2018-05-18 18:41:00.000000',51900000000,'2018-03-29 08:25:08.328000',1,1308.00,'21:41:00.000000','120В',1972.00,1308.00,NULL,130,76,NULL),
	(1823,'2018-05-19 03:07:00.000000','2018-05-18 18:49:00.000000',29880000000,'2018-03-29 08:25:08.328000',1,1929.00,'21:49:00.000000','107Й',3062.00,1929.00,1190.00,58,19,59),
	(1824,'2018-05-19 03:00:00.000000','2018-05-18 18:50:00.000000',29400000000,'2018-03-29 08:25:08.328000',1,2465.00,'21:50:00.000000','026А',2465.00,NULL,NULL,692,NULL,NULL),
	(1825,'2018-05-19 02:39:00.000000','2018-05-18 19:15:00.000000',26640000000,'2018-03-29 08:25:08.328000',1,1251.00,'22:15:00.000000','034А',2470.00,1251.00,693.00,11,81,1),
	(1826,'2018-05-19 04:30:00.000000','2018-05-18 19:16:00.000000',33240000000,'2018-03-29 08:25:08.328000',1,1308.00,'22:16:00.000000','146У',2582.00,1308.00,728.00,25,12,56),
	(1827,'2018-05-19 03:45:00.000000','2018-05-18 19:28:00.000000',29820000000,'2018-03-29 08:25:08.328000',1,1251.00,'22:28:00.000000','028А',2331.00,1251.00,NULL,29,13,NULL),
	(1828,'2018-05-19 03:57:00.000000','2018-05-18 19:50:00.000000',29220000000,'2018-03-29 08:25:08.328000',1,2242.00,'22:50:00.000000','006А',2242.00,NULL,NULL,645,NULL,NULL),
	(1829,'2018-05-19 02:49:00.000000','2018-05-18 20:10:00.000000',23940000000,'2018-03-29 08:25:08.328000',1,3890.00,'23:10:00.000000','032А',3890.00,NULL,NULL,8,NULL,NULL),
	(1830,'2018-05-19 05:30:00.000000','2018-05-18 20:30:00.000000',32400000000,'2018-03-29 08:25:08.328000',1,3124.00,'23:30:00.000000','004А',3124.00,NULL,NULL,209,NULL,NULL),
	(1831,'2018-05-19 05:36:00.000000','2018-05-18 20:40:00.000000',32160000000,'2018-03-29 08:25:08.328000',1,4005.00,'23:40:00.000000','054Ч',4005.00,NULL,NULL,107,NULL,NULL),
	(1832,'2018-05-19 04:55:00.000000','2018-05-18 20:55:00.000000',28800000000,'2018-03-29 08:25:08.328000',1,3470.00,'23:55:00.000000','002А',3470.00,NULL,NULL,105,NULL,NULL),
	(1833,'2018-05-20 06:43:00.000000','2018-05-19 21:11:00.000000',34320000000,'2018-03-29 08:25:08.328000',2,1308.00,'00:11:00.000000','119А',2067.00,1308.00,NULL,97,93,NULL),
	(1834,'2018-05-20 08:43:00.000000','2018-05-19 22:15:00.000000',37680000000,'2018-03-29 08:25:08.328000',2,1251.00,'01:15:00.000000','055А',1286.00,1251.00,NULL,2,725,NULL),
	(1835,'2018-05-20 06:13:00.000000','2018-05-20 02:30:00.000000',13380000000,'2018-03-29 08:25:08.328000',2,2004.00,'05:30:00.000000','751А',NULL,NULL,2004.00,NULL,NULL,484),
	(1836,'2018-05-20 07:48:00.000000','2018-05-20 03:40:00.000000',14880000000,'2018-03-29 08:25:08.328000',2,2004.00,'06:40:00.000000','755А',NULL,NULL,2004.00,NULL,NULL,1025),
	(1837,'2018-05-20 08:00:00.000000','2018-05-20 03:50:00.000000',15000000000,'2018-03-29 08:25:08.328000',2,2004.00,'06:50:00.000000','753А',NULL,NULL,2004.00,NULL,NULL,477),
	(1838,'2018-05-20 09:16:00.000000','2018-05-20 05:08:00.000000',14880000000,'2018-03-29 08:25:08.328000',2,3504.00,'08:08:00.000000','757А',NULL,NULL,3504.00,NULL,NULL,412),
	(1839,'2018-05-20 11:16:00.000000','2018-05-20 07:15:00.000000',14460000000,'2018-03-29 08:25:08.328000',2,4584.00,'10:15:00.000000','761А',NULL,NULL,4584.00,NULL,NULL,415),
	(1840,'2018-05-20 11:25:00.000000','2018-05-20 07:25:00.000000',14400000000,'2018-03-29 08:25:08.328000',2,4584.00,'10:25:00.000000','763А',NULL,NULL,4584.00,NULL,NULL,418),
	(1841,'2018-05-20 18:35:00.000000','2018-05-20 09:42:00.000000',31980000000,'2018-03-29 08:25:08.328000',2,1308.00,'12:42:00.000000','049А',1861.00,1308.00,NULL,111,75,NULL),
	(1842,'2018-05-20 19:27:00.000000','2018-05-20 09:45:00.000000',34920000000,'2018-03-29 08:25:08.328000',2,1308.00,'12:45:00.000000','131Г',1870.00,1308.00,NULL,65,169,NULL),
	(1843,'2018-05-20 15:51:00.000000','2018-05-20 12:00:00.000000',13860000000,'2018-03-29 08:25:08.328000',2,4584.00,'15:00:00.000000','767А',NULL,NULL,4584.00,NULL,NULL,350),
	(1844,'2018-05-20 16:08:00.000000','2018-05-20 12:13:00.000000',14100000000,'2018-03-29 08:25:08.328000',2,4584.00,'15:13:00.000000','769А',NULL,NULL,4584.00,NULL,NULL,380),
	(1845,'2018-05-20 16:35:00.000000','2018-05-20 12:23:00.000000',15120000000,'2018-03-29 08:25:08.328000',2,5215.00,'15:23:00.000000','747А',NULL,NULL,5215.00,NULL,NULL,90),
	(1846,'2018-05-21 00:03:00.000000','2018-05-20 13:11:00.000000',39120000000,'2018-03-29 08:25:08.328000',2,1332.00,'16:11:00.000000','121А',1494.00,1332.00,NULL,53,31,NULL),
	(1847,'2018-05-20 17:54:00.000000','2018-05-20 13:53:00.000000',14460000000,'2018-03-29 08:25:08.328000',2,4584.00,'16:53:00.000000','771Н',NULL,NULL,4584.00,NULL,NULL,330),
	(1848,'2018-05-20 17:55:00.000000','2018-05-20 14:03:00.000000',13920000000,'2018-03-29 08:25:08.328000',2,4784.00,'17:03:00.000000','773А',NULL,NULL,4784.00,NULL,NULL,319),
	(1849,'2018-05-20 23:10:00.000000','2018-05-20 15:03:00.000000',29220000000,'2018-03-29 08:25:08.328000',2,1929.00,'18:03:00.000000','059А',2899.00,1929.00,NULL,63,137,NULL),
	(1850,'2018-05-20 20:08:00.000000','2018-05-20 16:00:00.000000',14880000000,'2018-03-29 08:25:08.328000',2,5493.00,'19:00:00.000000','775А',NULL,NULL,5493.00,NULL,NULL,666),
	(1851,'2018-05-20 20:20:00.000000','2018-05-20 16:10:00.000000',15000000000,'2018-03-29 08:25:08.328000',2,5004.00,'19:10:00.000000','777А',NULL,NULL,5004.00,NULL,NULL,309),
	(1852,'2018-05-21 01:12:00.000000','2018-05-20 17:00:00.000000',29520000000,'2018-03-29 08:25:08.328000',2,1308.00,'20:00:00.000000','079А',1714.00,1308.00,NULL,80,19,NULL),
	(1853,'2018-05-21 01:00:00.000000','2018-05-20 17:06:00.000000',28440000000,'2018-03-29 08:25:08.328000',2,1308.00,'20:06:00.000000','081А',2067.00,1308.00,NULL,28,9,NULL),
	(1854,'2018-05-21 01:18:00.000000','2018-05-20 17:33:00.000000',27900000000,'2018-03-29 08:25:08.328000',2,1332.00,'20:33:00.000000','115А',2049.00,1332.00,NULL,87,16,NULL),
	(1855,'2018-05-20 21:47:00.000000','2018-05-20 18:00:00.000000',13620000000,'2018-03-29 08:25:08.328000',2,3293.00,'21:00:00.000000','779А',NULL,NULL,3293.00,NULL,NULL,346),
	(1856,'2018-05-21 02:49:00.000000','2018-05-20 18:05:00.000000',31440000000,'2018-03-29 08:25:08.328000',2,1251.00,'21:05:00.000000','127А',4332.00,1251.00,NULL,3,41,NULL),
	(1857,'2018-05-21 03:21:00.000000','2018-05-20 18:55:00.000000',30360000000,'2018-03-29 08:25:08.328000',2,2465.00,'21:55:00.000000','025А',2465.00,NULL,NULL,621,NULL,NULL),
	(1858,'2018-05-21 03:30:00.000000','2018-05-20 19:11:00.000000',29940000000,'2018-03-29 08:25:08.328000',2,1251.00,'22:11:00.000000','029А',3768.00,1251.00,693.00,18,6,11),
	(1859,'2018-05-21 04:28:00.000000','2018-05-20 19:41:00.000000',31620000000,'2018-03-29 08:25:08.328000',2,1929.00,'22:41:00.000000','015А',3315.00,1929.00,NULL,28,1,NULL),
	(1860,'2018-05-21 04:08:00.000000','2018-05-20 19:50:00.000000',29880000000,'2018-03-29 08:25:08.328000',2,2242.00,'22:50:00.000000','005А',2242.00,NULL,NULL,602,NULL,NULL),
	(1861,'2018-05-21 05:30:00.000000','2018-05-20 20:30:00.000000',32400000000,'2018-03-29 08:25:08.328000',2,2807.00,'23:30:00.000000','003А',2807.00,NULL,NULL,194,NULL,NULL),
	(1862,'2018-05-21 05:14:00.000000','2018-05-20 20:44:00.000000',30600000000,'2018-03-29 08:25:08.328000',2,3489.00,'23:44:00.000000','053Ч',3489.00,NULL,NULL,148,NULL,NULL),
	(1863,'2018-05-21 04:55:00.000000','2018-05-20 20:55:00.000000',28800000000,'2018-03-29 08:25:08.328000',2,3470.00,'23:55:00.000000','001А',3470.00,NULL,NULL,117,NULL,NULL),
	(1864,'2018-05-25 06:11:00.000000','2018-05-24 21:44:00.000000',30420000000,'2018-03-29 08:25:15.760000',1,1929.00,'00:44:00.000000','059Г',2899.00,1929.00,NULL,59,33,NULL),
	(1865,'2018-05-25 07:18:00.000000','2018-05-24 22:15:00.000000',32580000000,'2018-03-29 08:25:15.760000',1,1251.00,'01:15:00.000000','030А',2682.00,1251.00,693.00,17,115,53),
	(1866,'2018-05-25 07:24:00.000000','2018-05-24 22:25:00.000000',32340000000,'2018-03-29 08:25:15.760000',1,1251.00,'01:25:00.000000','128А',2479.00,1251.00,NULL,92,349,NULL),
	(1867,'2018-05-25 10:00:00.000000','2018-05-24 22:56:00.000000',39840000000,'2018-03-29 08:25:15.760000',1,1308.00,'01:56:00.000000','111В',2017.00,1308.00,NULL,56,239,NULL),
	(1868,'2018-05-25 09:30:00.000000','2018-05-24 23:22:00.000000',36480000000,'2018-03-29 08:25:15.760000',1,1308.00,'02:22:00.000000','049Ч',1861.00,1308.00,NULL,60,20,NULL),
	(1869,'2018-05-25 10:15:00.000000','2018-05-25 01:35:00.000000',31200000000,'2018-03-29 08:25:15.760000',1,1308.00,'04:35:00.000000','082В',2067.00,1308.00,NULL,35,50,NULL),
	(1870,'2018-05-25 06:19:00.000000','2018-05-25 02:45:00.000000',12840000000,'2018-03-29 08:25:15.760000',1,3073.00,'05:45:00.000000','752А',NULL,NULL,3073.00,NULL,NULL,425),
	(1871,'2018-05-25 07:52:00.000000','2018-05-25 03:50:00.000000',14520000000,'2018-03-29 08:25:15.760000',1,3293.00,'06:50:00.000000','754А',NULL,NULL,3293.00,NULL,NULL,429),
	(1872,'2018-05-25 08:00:00.000000','2018-05-25 04:00:00.000000',14400000000,'2018-03-29 08:25:15.760000',1,3293.00,'07:00:00.000000','756А',NULL,NULL,3293.00,NULL,NULL,837),
	(1873,'2018-05-25 10:30:00.000000','2018-05-25 06:18:00.000000',15120000000,'2018-03-29 08:25:15.760000',1,4584.00,'09:18:00.000000','757Н',NULL,NULL,4584.00,NULL,NULL,404),
	(1874,'2018-05-25 10:42:00.000000','2018-05-25 06:40:00.000000',14520000000,'2018-03-29 08:25:15.760000',1,4584.00,'09:40:00.000000','760А',NULL,NULL,4584.00,NULL,NULL,369),
	(1875,'2018-05-25 15:37:00.000000','2018-05-25 11:51:00.000000',13560000000,'2018-03-29 08:25:15.760000',1,3984.00,'14:51:00.000000','768А',NULL,NULL,3984.00,NULL,NULL,429),
	(1876,'2018-05-25 15:48:00.000000','2018-05-25 12:01:00.000000',13620000000,'2018-03-29 08:25:15.760000',1,3984.00,'15:01:00.000000','770А',NULL,NULL,3984.00,NULL,NULL,419),
	(1877,'2018-05-25 16:17:00.000000','2018-05-25 12:11:00.000000',14760000000,'2018-03-29 08:25:15.760000',1,3843.00,'15:11:00.000000','748А',NULL,NULL,3843.00,NULL,NULL,149),
	(1878,'2018-05-25 22:17:00.000000','2018-05-25 13:20:00.000000',32220000000,'2018-03-29 08:25:15.760000',1,1308.00,'16:20:00.000000','242А',2161.00,1308.00,NULL,193,26,NULL),
	(1879,'2018-05-25 22:51:00.000000','2018-05-25 13:58:00.000000',31980000000,'2018-03-29 08:25:15.760000',1,1308.00,'16:58:00.000000','092А',2305.00,1308.00,NULL,63,67,NULL),
	(1880,'2018-05-25 19:03:00.000000','2018-05-25 15:08:00.000000',14100000000,'2018-03-29 08:25:15.760000',1,4613.00,'18:08:00.000000','774А',NULL,NULL,4613.00,NULL,NULL,344),
	(1881,'2018-05-26 01:35:00.000000','2018-05-25 15:45:00.000000',35400000000,'2018-03-29 08:25:15.760000',1,1251.00,'18:45:00.000000','210А',1474.00,1251.00,NULL,116,336,NULL),
	(1882,'2018-05-25 20:09:00.000000','2018-05-25 16:14:00.000000',14100000000,'2018-03-29 08:25:15.760000',1,3984.00,'19:14:00.000000','776А',NULL,NULL,3984.00,NULL,NULL,925),
	(1883,'2018-05-25 20:28:00.000000','2018-05-25 16:27:00.000000',14460000000,'2018-03-29 08:25:15.760000',1,3984.00,'19:27:00.000000','778А',NULL,NULL,3984.00,NULL,NULL,441),
	(1884,'2018-05-25 21:40:00.000000','2018-05-25 18:00:00.000000',13200000000,'2018-03-29 08:25:15.760000',1,3984.00,'21:00:00.000000','780А',NULL,NULL,3984.00,NULL,NULL,496),
	(1885,'2018-05-26 02:01:00.000000','2018-05-25 18:20:00.000000',27660000000,'2018-03-29 08:25:15.760000',1,1332.00,'21:20:00.000000','121С',1494.00,1332.00,NULL,46,31,NULL),
	(1886,'2018-05-26 01:48:00.000000','2018-05-25 18:24:00.000000',26640000000,'2018-03-29 08:25:15.760000',1,1251.00,'21:24:00.000000','056А',2616.00,1251.00,NULL,121,105,NULL),
	(1887,'2018-05-26 09:06:00.000000','2018-05-25 18:41:00.000000',51900000000,'2018-03-29 08:25:15.760000',1,1308.00,'21:41:00.000000','120В',2063.00,1308.00,NULL,130,100,NULL),
	(1888,'2018-05-26 03:00:00.000000','2018-05-25 18:50:00.000000',29400000000,'2018-03-29 08:25:15.760000',1,2558.00,'21:50:00.000000','026А',2558.00,NULL,NULL,706,NULL,NULL),
	(1889,'2018-05-26 02:39:00.000000','2018-05-25 19:15:00.000000',26640000000,'2018-03-29 08:25:15.760000',1,2470.00,'22:15:00.000000','034А',2470.00,NULL,693.00,5,NULL,1),
	(1890,'2018-05-26 04:30:00.000000','2018-05-25 19:16:00.000000',33240000000,'2018-03-29 08:25:15.760000',1,1308.00,'22:16:00.000000','132Г',2481.00,1308.00,NULL,11,13,NULL),
	(1891,'2018-05-26 03:45:00.000000','2018-05-25 19:28:00.000000',29820000000,'2018-03-29 08:25:15.760000',1,1251.00,'22:28:00.000000','028А',3992.00,1251.00,NULL,15,76,NULL),
	(1892,'2018-05-26 03:57:00.000000','2018-05-25 19:50:00.000000',29220000000,'2018-03-29 08:25:15.760000',1,2962.00,'22:50:00.000000','006А',2962.00,NULL,NULL,476,NULL,NULL),
	(1893,'2018-05-26 02:49:00.000000','2018-05-25 20:10:00.000000',23940000000,'2018-03-29 08:25:15.760000',1,3890.00,'23:10:00.000000','032А',3890.00,NULL,NULL,8,NULL,NULL),
	(1894,'2018-05-26 05:30:00.000000','2018-05-25 20:30:00.000000',32400000000,'2018-03-29 08:25:15.760000',1,3245.00,'23:30:00.000000','004А',3245.00,NULL,NULL,217,NULL,NULL),
	(1895,'2018-05-26 05:36:00.000000','2018-05-25 20:40:00.000000',32160000000,'2018-03-29 08:25:15.760000',1,4005.00,'23:40:00.000000','054Ч',4005.00,NULL,NULL,105,NULL,NULL),
	(1896,'2018-05-26 04:55:00.000000','2018-05-25 20:55:00.000000',28800000000,'2018-03-29 08:25:15.760000',1,3609.00,'23:55:00.000000','002А',3609.00,NULL,NULL,115,NULL,NULL),
	(1897,'2018-05-27 06:43:00.000000','2018-05-26 21:11:00.000000',34320000000,'2018-03-29 08:25:15.760000',2,1568.00,'00:11:00.000000','119А',2225.00,1568.00,NULL,93,87,NULL),
	(1898,'2018-05-27 07:15:00.000000','2018-05-26 21:40:00.000000',34500000000,'2018-03-29 08:25:15.760000',2,1448.00,'00:40:00.000000','479А',2182.00,1448.00,NULL,179,53,NULL),
	(1899,'2018-05-27 08:43:00.000000','2018-05-26 22:15:00.000000',37680000000,'2018-03-29 08:25:15.760000',2,1498.00,'01:15:00.000000','055А',1920.00,1498.00,NULL,115,273,NULL),
	(1900,'2018-05-27 06:30:00.000000','2018-05-26 22:53:00.000000',27420000000,'2018-03-29 08:25:15.760000',2,3890.00,'01:53:00.000000','031А',3890.00,NULL,NULL,36,NULL,NULL),
	(1901,'2018-05-27 06:13:00.000000','2018-05-27 02:30:00.000000',13380000000,'2018-03-29 08:25:15.760000',2,2004.00,'05:30:00.000000','751А',NULL,NULL,2004.00,NULL,NULL,476),
	(1902,'2018-05-27 07:48:00.000000','2018-05-27 03:40:00.000000',14880000000,'2018-03-29 08:25:15.760000',2,2004.00,'06:40:00.000000','755А',NULL,NULL,2004.00,NULL,NULL,1022),
	(1903,'2018-05-27 08:00:00.000000','2018-05-27 03:50:00.000000',15000000000,'2018-03-29 08:25:15.760000',2,2004.00,'06:50:00.000000','753А',NULL,NULL,2004.00,NULL,NULL,446),
	(1904,'2018-05-27 09:16:00.000000','2018-05-27 05:08:00.000000',14880000000,'2018-03-29 08:25:15.760000',2,3504.00,'08:08:00.000000','757А',NULL,NULL,3504.00,NULL,NULL,394),
	(1905,'2018-05-27 11:16:00.000000','2018-05-27 07:15:00.000000',14460000000,'2018-03-29 08:25:15.760000',2,3073.00,'10:15:00.000000','761А',NULL,NULL,3073.00,NULL,NULL,308),
	(1906,'2018-05-27 11:25:00.000000','2018-05-27 07:25:00.000000',14400000000,'2018-03-29 08:25:15.760000',2,4584.00,'10:25:00.000000','763А',NULL,NULL,4584.00,NULL,NULL,385),
	(1907,'2018-05-27 18:52:00.000000','2018-05-27 09:10:00.000000',34920000000,'2018-03-29 08:25:15.760000',2,1568.00,'12:10:00.000000','227А',2552.00,1568.00,NULL,289,50,NULL),
	(1908,'2018-05-27 18:35:00.000000','2018-05-27 09:42:00.000000',31980000000,'2018-03-29 08:25:15.760000',2,1568.00,'12:42:00.000000','049А',1947.00,1568.00,NULL,292,83,NULL),
	(1909,'2018-05-27 19:27:00.000000','2018-05-27 09:45:00.000000',34920000000,'2018-03-29 08:25:15.760000',2,1568.00,'12:45:00.000000','145А',1879.00,1568.00,890.00,17,142,43),
	(1910,'2018-05-27 20:48:00.000000','2018-05-27 11:09:00.000000',34740000000,'2018-03-29 08:25:15.760000',2,2327.00,'14:09:00.000000','107Ж',4074.00,2327.00,1433.00,41,40,58),
	(1911,'2018-05-27 15:51:00.000000','2018-05-27 12:00:00.000000',13860000000,'2018-03-29 08:25:15.760000',2,4784.00,'15:00:00.000000','767А',NULL,NULL,4784.00,NULL,NULL,277),
	(1912,'2018-05-27 16:08:00.000000','2018-05-27 12:13:00.000000',14100000000,'2018-03-29 08:25:15.760000',2,4784.00,'15:13:00.000000','769А',NULL,NULL,4784.00,NULL,NULL,347),
	(1913,'2018-05-27 16:35:00.000000','2018-05-27 12:23:00.000000',15120000000,'2018-03-29 08:25:15.760000',2,5215.00,'15:23:00.000000','747А',NULL,NULL,5215.00,NULL,NULL,102),
	(1914,'2018-05-28 00:03:00.000000','2018-05-27 13:11:00.000000',39120000000,'2018-03-29 08:25:15.760000',2,1597.00,'16:11:00.000000','135А',3193.00,1597.00,NULL,16,29,NULL),
	(1915,'2018-05-27 17:54:00.000000','2018-05-27 13:53:00.000000',14460000000,'2018-03-29 08:25:15.760000',2,4613.00,'16:53:00.000000','771Н',NULL,NULL,4613.00,NULL,NULL,390),
	(1916,'2018-05-27 17:55:00.000000','2018-05-27 14:03:00.000000',13920000000,'2018-03-29 08:25:15.760000',2,5983.00,'17:03:00.000000','773А',NULL,NULL,5983.00,NULL,NULL,363),
	(1917,'2018-05-27 23:10:00.000000','2018-05-27 15:03:00.000000',29220000000,'2018-03-29 08:25:15.760000',2,2327.00,'18:03:00.000000','059А',3009.00,2327.00,NULL,60,191,NULL),
	(1918,'2018-05-28 02:22:00.000000','2018-05-27 15:30:00.000000',39120000000,'2018-03-29 08:25:15.760000',2,1498.00,'18:30:00.000000','209А',2042.00,1498.00,NULL,86,272,NULL),
	(1919,'2018-05-27 20:08:00.000000','2018-05-27 16:00:00.000000',14880000000,'2018-03-29 08:25:15.760000',2,4613.00,'19:00:00.000000','775А',NULL,NULL,4613.00,NULL,NULL,734),
	(1920,'2018-05-27 20:20:00.000000','2018-05-27 16:10:00.000000',15000000000,'2018-03-29 08:25:15.760000',2,4613.00,'19:10:00.000000','777А',NULL,NULL,4613.00,NULL,NULL,371),
	(1921,'2018-05-28 01:50:00.000000','2018-05-27 16:27:00.000000',33780000000,'2018-03-29 08:25:15.760000',2,1597.00,'19:27:00.000000','259А',2381.00,1597.00,NULL,108,34,NULL),
	(1922,'2018-05-28 01:12:00.000000','2018-05-27 17:00:00.000000',29520000000,'2018-03-29 08:25:15.760000',2,1597.00,'20:00:00.000000','079А',2302.00,1597.00,NULL,76,127,NULL),
	(1923,'2018-05-28 01:00:00.000000','2018-05-27 17:06:00.000000',28440000000,'2018-03-29 08:25:15.760000',2,1568.00,'20:06:00.000000','081А',2364.00,1568.00,NULL,23,40,NULL),
	(1924,'2018-05-27 21:47:00.000000','2018-05-27 18:00:00.000000',13620000000,'2018-03-29 08:25:15.760000',2,4584.00,'21:00:00.000000','779А',NULL,NULL,4584.00,NULL,NULL,285),
	(1925,'2018-05-28 03:06:00.000000','2018-05-27 18:55:00.000000',29460000000,'2018-03-29 08:25:15.760000',2,2558.00,'21:55:00.000000','025А',2558.00,NULL,NULL,651,NULL,NULL),
	(1926,'2018-05-28 02:49:00.000000','2018-05-27 19:11:00.000000',27480000000,'2018-03-29 08:25:15.760000',2,1498.00,'22:11:00.000000','029А',2616.00,1498.00,847.00,157,26,30),
	(1927,'2018-05-28 03:50:00.000000','2018-05-27 19:41:00.000000',29340000000,'2018-03-29 08:25:15.760000',2,2327.00,'22:41:00.000000','015А',3146.00,2327.00,NULL,103,16,NULL),
	(1928,'2018-05-28 03:45:00.000000','2018-05-27 19:50:00.000000',28500000000,'2018-03-29 08:25:15.760000',2,2335.00,'22:50:00.000000','005А',2335.00,NULL,NULL,694,NULL,NULL),
	(1929,'2018-05-28 03:41:00.000000','2018-05-27 20:04:00.000000',27420000000,'2018-03-29 08:25:15.760000',2,1568.00,'23:04:00.000000','247А',2409.00,1568.00,NULL,69,14,NULL),
	(1930,'2018-05-28 05:30:00.000000','2018-05-27 20:30:00.000000',32400000000,'2018-03-29 08:25:15.760000',2,2912.00,'23:30:00.000000','003А',2912.00,NULL,NULL,208,NULL,NULL),
	(1931,'2018-05-28 04:19:00.000000','2018-05-27 20:36:00.000000',27780000000,'2018-03-29 08:25:15.760000',2,1498.00,'23:36:00.000000','027А',4010.00,1498.00,NULL,10,53,NULL),
	(1932,'2018-05-28 05:14:00.000000','2018-05-27 20:44:00.000000',30600000000,'2018-03-29 08:25:15.760000',2,3489.00,'23:44:00.000000','053Ч',3489.00,NULL,NULL,146,NULL,NULL),
	(1933,'2018-05-28 04:55:00.000000','2018-05-27 20:55:00.000000',28800000000,'2018-03-29 08:25:15.760000',2,3609.00,'23:55:00.000000','001А',3609.00,NULL,NULL,109,NULL,NULL);

/*!40000 ALTER TABLE `robot_route` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table robot_routearchive
# ------------------------------------------------------------

DROP TABLE IF EXISTS `robot_routearchive`;

CREATE TABLE `robot_routearchive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_date` datetime(6) DEFAULT NULL,
  `departure` datetime(6) DEFAULT NULL,
  `departure_time` time(6) DEFAULT NULL,
  `arrive` datetime(6) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `price_seated` decimal(8,2) DEFAULT NULL,
  `price_platzkart` decimal(8,2) DEFAULT NULL,
  `price_coupe` decimal(8,2) DEFAULT NULL,
  `seats_seated` smallint(5) unsigned DEFAULT NULL,
  `seats_platzkart` smallint(5) unsigned DEFAULT NULL,
  `seats_coupe` smallint(5) unsigned DEFAULT NULL,
  `min_price` decimal(8,2) DEFAULT NULL,
  `train_id` varchar(6) DEFAULT NULL,
  `way_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_routearchive_train_id_5a851a1a_fk_robot_train_number` (`train_id`),
  KEY `robot_routearchive_way_id_452d05dd_fk_robot_way_id` (`way_id`),
  CONSTRAINT `robot_routearchive_train_id_5a851a1a_fk_robot_train_number` FOREIGN KEY (`train_id`) REFERENCES `robot_train` (`number`),
  CONSTRAINT `robot_routearchive_way_id_452d05dd_fk_robot_way_id` FOREIGN KEY (`way_id`) REFERENCES `robot_way` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table robot_train
# ------------------------------------------------------------

DROP TABLE IF EXISTS `robot_train`;

CREATE TABLE `robot_train` (
  `number` varchar(6) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `is_firm` tinyint(1) NOT NULL,
  `tuturu_id` varchar(10) NOT NULL,
  `way_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `robot_train_way_id_239386aa_fk_robot_way_id` (`way_id`),
  CONSTRAINT `robot_train_way_id_239386aa_fk_robot_way_id` FOREIGN KEY (`way_id`) REFERENCES `robot_way` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `robot_train` WRITE;
/*!40000 ALTER TABLE `robot_train` DISABLE KEYS */;

INSERT INTO `robot_train` (`number`, `name`, `is_firm`, `tuturu_id`, `way_id`)
VALUES
	('001А','Красная стрела',1,'MDAx0JA=',2),
	('001Г','Татарстан Премиум',1,'MDAx0JM=',4),
	('002А','Красная стрела',1,'MDAy0JA=',1),
	('002Й','Татарстан Премиум',1,'MDAy0Jk=',3),
	('003А','Экспресс',1,'MDAz0JA=',2),
	('004А','Экспресс',1,'MDA00JA=',1),
	('005А','Двухэтажный',1,'MDA10JA=',2),
	('006А','Двухэтажный',1,'MDA20JA=',1),
	('011Ч',NULL,0,'MDEx0Kc=',2),
	('015А','Арктика',1,'MDE10JA=',2),
	('015Е','Урал Премиум',1,'MDE10JU=',4),
	('016А','Арктика',1,'MDE20JA=',1),
	('016Е','Урал Премиум',1,'MDE20JU=',3),
	('019У','Мегаполис',1,'MDE50KM=',2),
	('020У','Мегаполис',1,'MDIw0KM=',1),
	('023А',NULL,0,'MDIz0JA=',2),
	('023Г','Двухэтажный',1,'MDIz0JM=',4),
	('024А',NULL,0,'MDI00JA=',1),
	('024М','Двухэтажный',1,'MDI00Jw=',3),
	('025А','Смена – А. Бетанкур',1,'MDI10JA=',2),
	('025Г','Италмас',1,'MDI10JM=',4),
	('026А','Смена – А. Бетанкур',1,'MDI20JA=',1),
	('026Г','Италмас',1,'MDI20JM=',3),
	('027А','Северная Пальмира',1,'MDI30JA=',2),
	('027У',NULL,0,'MDI30KM=',2),
	('028А','Северная Пальмира',1,'MDI40JA=',1),
	('028У',NULL,0,'MDI40KM=',1),
	('028Ч',NULL,0,'MDI40Kc=',1),
	('029А',NULL,0,'MDI50JA=',2),
	('030А',NULL,0,'MDMw0JA=',1),
	('031А','Лев Толстой',1,'MDMx0JA=',2),
	('032А','Лев Толстой',1,'MDMy0JA=',1),
	('033В',NULL,0,'MDM00JI=',2),
	('034А','Балтийский экспресс',0,'MDM00JA=',1),
	('049А',NULL,0,'MDQ50JA=',2),
	('049Ч',NULL,0,'MDQ50Kc=',1),
	('053Ч','Гранд Экспресс',1,'MDUz0Kc=',2),
	('054Ч','Гранд Экспресс',1,'MDU00Kc=',1),
	('055А',NULL,0,'MDU10JA=',2),
	('056А',NULL,0,'MDU20JA=',1),
	('059А','Волга',1,'MDU50JA=',2),
	('059Г','Волга',1,'MDU50JM=',1),
	('059Е','Тюмень',1,'MDU50JU=',4),
	('060У','Тюмень',1,'MDYw0KM=',3),
	('061А',NULL,0,'MDYx0JA=',2),
	('062А',NULL,0,'MDYy0JA=',1),
	('069А',NULL,0,'MDY50JA=',2),
	('070А',NULL,0,'MDcw0JA=',1),
	('075А',NULL,0,'MDc10JA=',2),
	('075Э',NULL,0,'MDc10K0=',4),
	('076А',NULL,0,'MDc20JA=',1),
	('076Э',NULL,0,'MDc20K0=',3),
	('079А','Слава',1,'MDc50JA=',2),
	('079Ж','Слава',1,'MDc50JY=',1),
	('079У',NULL,0,'MDc50KM=',4),
	('080У',NULL,0,'MDgw0KM=',3),
	('081А',NULL,0,'MDgx0JA=',2),
	('081И',NULL,0,'MDgx0Jg=',4),
	('082В',NULL,0,'MDgy0JI=',1),
	('082И',NULL,0,'MDgy0Jg=',3),
	('085А',NULL,0,'MDg10JA=',2),
	('086А',NULL,0,'MDg20JA=',1),
	('089У',NULL,0,'MDg50KM=',4),
	('090У',NULL,0,'MDkw0KM=',3),
	('092А',NULL,0,'MDky0JA=',1),
	('095Н',NULL,0,'MDk10J0=',4),
	('096Н',NULL,0,'MDk20J0=',3),
	('107Ж','Самара',1,'MTA30JY=',2),
	('107Й','Самара',1,'MTA30Jk=',1),
	('111А',NULL,0,'MTEx0JA=',2),
	('111В',NULL,0,'MTEx0JI=',1),
	('111Й',NULL,0,'MTEy0Jk=',4),
	('112М',NULL,0,'MTEy0Jw=',3),
	('115А',NULL,0,'MTE10JA=',2),
	('116С',NULL,0,'MTE20KE=',1),
	('117Н',NULL,0,'MTE30J0=',4),
	('118Н',NULL,0,'MTE40J0=',3),
	('119А',NULL,0,'MTE50JA=',2),
	('120В',NULL,0,'MTIw0JI=',1),
	('121А',NULL,0,'MTIx0JA=',2),
	('121С',NULL,0,'MTIx0KE=',1),
	('127А',NULL,0,'MTI30JA=',2),
	('128А',NULL,0,'MTI40JA=',1),
	('131Г',NULL,0,'MTMx0JM=',2),
	('132Г',NULL,0,'MTMy0JM=',1),
	('135А',NULL,0,'MTM10JA=',2),
	('135Н',NULL,0,'MTM20J0=',4),
	('135С',NULL,0,'MTM10KE=',1),
	('136М',NULL,0,'MTM20Jw=',3),
	('145А',NULL,0,'MTQ10JA=',2),
	('146У',NULL,0,'MTQ20KM=',1),
	('188М',NULL,0,'MTg40Jw=',1),
	('201А',NULL,0,'MjAx0JA=',2),
	('204А',NULL,0,'MjA00JA=',1),
	('209А',NULL,0,'MjA50JA=',2),
	('210А',NULL,0,'MjEw0JA=',1),
	('214А',NULL,0,'MjE00JA=',1),
	('214В',NULL,0,'MjE00JI=',2),
	('217А',NULL,0,'MjE30JA=',2),
	('217В',NULL,0,'MjE30JI=',1),
	('219А',NULL,0,'MjE50JA=',2),
	('220А',NULL,0,'MjIw0JA=',1),
	('221А',NULL,0,'MjIx0JA=',2),
	('222В',NULL,0,'MjIy0JI=',1),
	('223Ь',NULL,0,'MjI00Kw=',2),
	('224В',NULL,0,'MjI00JI=',1),
	('227А',NULL,0,'MjI30JA=',2),
	('228А',NULL,0,'MjI40JA=',1),
	('231А',NULL,0,'MjMx0JA=',2),
	('232А',NULL,0,'MjMy0JA=',1),
	('242А',NULL,0,'MjQy0JA=',1),
	('243А',NULL,0,'MjQz0JA=',2),
	('244А',NULL,0,'MjQ00JA=',1),
	('247А',NULL,0,'MjQ30JA=',2),
	('247С',NULL,0,'MjQ30KE=',1),
	('249А',NULL,0,'MjQ50JA=',2),
	('251А',NULL,0,'MjUx0JA=',2),
	('252А',NULL,0,'MjUy0JA=',1),
	('253А',NULL,0,'MjUz0JA=',2),
	('253Э',NULL,0,'MjUz0K0=',4),
	('254А',NULL,0,'MjUz0JA=',3),
	('254Э',NULL,0,'MjUz0K0=',1),
	('255А',NULL,0,'MjU10JA=',2),
	('257А',NULL,0,'MjU30JA=',2),
	('258А',NULL,0,'MjU40JA=',1),
	('259А',NULL,0,'MjU50JA=',2),
	('259С',NULL,0,'MjU50KE=',1),
	('261А',NULL,0,'MjYx0JA=',2),
	('263А',NULL,0,'MjYz0JA=',2),
	('263Ч',NULL,0,'MjYz0Kc=',2),
	('264А',NULL,0,'MjY00JA=',1),
	('264Щ',NULL,0,'MjY00Kk=',1),
	('267А',NULL,0,'MjY30JA=',2),
	('267Г',NULL,0,'MjY30JM=',4),
	('268В',NULL,0,'MjY40JI=',3),
	('269Г',NULL,0,'MjY50JM=',4),
	('270В',NULL,0,'Mjcw0JI=',3),
	('271А',NULL,0,'Mjcx0JA=',2),
	('271Г',NULL,0,'Mjcx0JM=',4),
	('272Х',NULL,0,'Mjcy0KU=',3),
	('273Г',NULL,0,'Mjcz0JM=',4),
	('274Х',NULL,0,'Mjc00KU=',3),
	('275А',NULL,0,'Mjc10JA=',2),
	('275Г',NULL,0,'Mjc10JM=',4),
	('276Г',NULL,0,'Mjc20JM=',3),
	('277А',NULL,0,'Mjc30JA=',2),
	('277Г',NULL,0,'Mjc30JM=',4),
	('278Г',NULL,0,'Mjc40JM=',3),
	('279В',NULL,0,'Mjc50JI=',2),
	('279Й',NULL,0,'Mjc50Jk=',1),
	('282Ч',NULL,0,'Mjgy0Kc=',1),
	('284А',NULL,0,'Mjg00JA=',1),
	('287Ч',NULL,0,'Mjg30Kc=',2),
	('288Ч',NULL,0,'Mjg40Kc=',1),
	('289Г',NULL,0,'Mjg50JM=',4),
	('290А',NULL,0,'Mjkw0JA=',1),
	('290Г',NULL,0,'Mjkw0JM=',3),
	('293Г',NULL,0,'Mjkz0JM=',4),
	('294Г',NULL,0,'Mjk00JM=',3),
	('295В',NULL,0,'Mjk10JI=',2),
	('297А',NULL,0,'Mjk30JA=',2),
	('297Г',NULL,0,'Mjk30JM=',4),
	('298Х',NULL,0,'Mjk40KU=',3),
	('298Ч',NULL,0,'Mjk40Kc=',1),
	('479А',NULL,0,'NDc50JA=',2),
	('480С',NULL,0,'NDgw0KE=',1),
	('747А','Невский экспресс',1,'NzQ30JA=',2),
	('748А','Невский экспресс',1,'NzQ40JA=',1),
	('751А','Сапсан',1,'NzUx0JA=',2),
	('752А','Сапсан',1,'NzUy0JA=',1),
	('753А','Сапсан',1,'NzUz0JA=',2),
	('754А','Сапсан',1,'NzU00JA=',1),
	('755А','Сапсан',1,'NzU10JA=',2),
	('756А','Сапсан',1,'NzU20JA=',1),
	('757А','Сапсан',1,'NzU30JA=',2),
	('757Н','Сапсан',1,'NzU30J0=',1),
	('759А','Сапсан',0,'NzU50JA=',2),
	('760А','Сапсан',1,'NzYw0JA=',1),
	('761А','Сапсан',1,'NzYx0JA=',2),
	('762А','Сапсан',1,'NzYy0JA=',1),
	('763А','Сапсан',1,'NzYz0JA=',2),
	('764А','Сапсан',1,'NzY00JA=',1),
	('765А','Сапсан',1,'NzY10JA=',2),
	('767А','Сапсан',1,'NzY30JA=',2),
	('768А','Сапсан',1,'NzY40JA=',1),
	('769А','Сапсан',1,'NzY50JA=',2),
	('770А','Сапсан',1,'Nzcw0JA=',1),
	('771Н','Сапсан',1,'Nzcx0J0=',2),
	('772А','Сапсан',1,'Nzcy0JA=',1),
	('773А','Сапсан',1,'Nzcz0JA=',2),
	('774А','Сапсан',1,'Nzc00JA=',1),
	('775А','Сапсан',1,'Nzc10JA=',2),
	('776А','Сапсан',1,'Nzc20JA=',1),
	('777А','Сапсан',1,'Nzc30JA=',2),
	('778А','Сапсан',1,'Nzc40JA=',1),
	('779А','Сапсан',1,'Nzc50JA=',2),
	('780А','Сапсан',1,'Nzgw0JA=',1);

/*!40000 ALTER TABLE `robot_train` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table robot_way
# ------------------------------------------------------------

DROP TABLE IF EXISTS `robot_way`;

CREATE TABLE `robot_way` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(5) NOT NULL,
  `from_city_id` int(11) DEFAULT NULL,
  `to_city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `robot_way_from_city_id_ae8aa530_fk_robot_city_id` (`from_city_id`),
  KEY `robot_way_to_city_id_9d8af493_fk_robot_city_id` (`to_city_id`),
  CONSTRAINT `robot_way_from_city_id_ae8aa530_fk_robot_city_id` FOREIGN KEY (`from_city_id`) REFERENCES `robot_city` (`id`),
  CONSTRAINT `robot_way_to_city_id_9d8af493_fk_robot_city_id` FOREIGN KEY (`to_city_id`) REFERENCES `robot_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

LOCK TABLES `robot_way` WRITE;
/*!40000 ALTER TABLE `robot_way` DISABLE KEYS */;

INSERT INTO `robot_way` (`id`, `type`, `from_city_id`, `to_city_id`)
VALUES
	(1,'TRAIN',1,3),
	(2,'TRAIN',3,1),
	(3,'TRAIN',1,2),
	(4,'TRAIN',2,1);

/*!40000 ALTER TABLE `robot_way` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
