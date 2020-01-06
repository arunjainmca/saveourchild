/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.5.24-log : Database - crossover
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crossover` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `crossover`;

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `posts` */

insert  into `posts`(`id`,`title`,`body`,`published`,`created`,`modified`,`status`) values (1,'Test Post 1','This is the body of a test post.',1,'2015-05-24 16:46:38',NULL,1);

/*Table structure for table `tests_master` */

DROP TABLE IF EXISTS `tests_master`;

CREATE TABLE `tests_master` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_name` varchar(50) NOT NULL,
  `test_cost` smallint(5) unsigned NOT NULL,
  `test_min_value` float NOT NULL,
  `test_max_value` float NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `tests_master` */

insert  into `tests_master`(`id`,`test_name`,`test_cost`,`test_min_value`,`test_max_value`,`updated`,`created`) values (1,'TLC',200,100,220,'2015-04-20 01:49:49','2015-04-20 01:49:44'),(2,'DLC',200,110,220,'2015-04-21 08:57:52','2015-04-20 01:52:17'),(3,'Urine',150,2.5,8.5,'2015-04-20 01:53:04','2015-04-20 01:52:21'),(4,'CBP',250,188,233,'2015-04-21 08:58:02','2015-04-20 01:52:24'),(5,'Thyroid',300,200,350,'2015-04-20 01:53:46','2015-04-20 01:52:26'),(6,'Blood Suger',80,95,130,'2015-04-20 01:53:54','2015-04-20 01:52:30'),(7,'Lipid Profile',600,168,550,'2015-04-20 01:54:02','2015-04-20 01:52:32'),(8,'Hemo Globin',100,10,20,'2015-04-20 01:54:11','2015-04-20 01:52:34'),(9,'RBC',100,10000,100000,'2015-04-20 01:54:29','2015-04-20 01:52:36'),(10,'WBC',100,10000,120000,'2015-04-20 01:54:39','2015-04-20 01:52:38'),(11,'HIV',500,2222,3333,'2015-04-21 08:58:07','2015-04-20 01:52:40'),(12,'Cretinine',200,244,566,'2015-04-21 08:58:14','2015-04-20 01:52:42');

/*Table structure for table `tests_order` */

DROP TABLE IF EXISTS `tests_order`;

CREATE TABLE `tests_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `status` enum('PENDING') NOT NULL DEFAULT 'PENDING',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tests_order` */

insert  into `tests_order`(`id`,`customer_id`,`status`,`update`,`created`) values (1,4,'PENDING','2015-04-21 09:05:31','2015-04-21 03:35:31'),(2,3,'PENDING','2015-04-21 09:07:17','2015-04-21 03:37:17'),(3,14,'PENDING','2015-04-21 09:09:41','2015-04-21 03:39:41'),(4,15,'PENDING','2015-04-21 09:10:52','2015-04-21 03:40:52'),(5,14,'PENDING','2015-04-21 10:37:02','2015-04-21 05:07:02'),(6,14,'PENDING','2015-04-21 10:38:00','2015-04-21 05:08:00'),(7,3,'PENDING','2015-04-21 11:09:02','2015-04-21 05:39:02'),(8,3,'PENDING','2015-04-21 11:23:17','2015-04-21 05:53:17');

/*Table structure for table `tests_order_particulars` */

DROP TABLE IF EXISTS `tests_order_particulars`;

CREATE TABLE `tests_order_particulars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tests_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `test_result` float DEFAULT '0',
  `status` enum('PENDING') NOT NULL DEFAULT 'PENDING',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `tests_order_particulars` */

insert  into `tests_order_particulars`(`id`,`order_id`,`tests_id`,`test_result`,`status`,`updated`,`created`) values (1,1,1,0,'PENDING','2015-04-21 09:05:31','2015-04-21 03:35:31'),(2,1,2,0,'PENDING','2015-04-21 09:05:31','2015-04-21 03:35:31'),(3,1,3,0,'PENDING','2015-04-21 09:05:31','2015-04-21 03:35:31'),(4,1,4,0,'PENDING','2015-04-21 09:05:31','2015-04-21 03:35:31'),(5,1,5,0,'PENDING','2015-04-21 09:05:31','2015-04-21 03:35:31'),(6,2,1,0,'PENDING','2015-04-21 09:07:17','2015-04-21 03:37:17'),(7,2,2,0,'PENDING','2015-04-21 09:07:17','2015-04-21 03:37:17'),(8,2,3,0,'PENDING','2015-04-21 09:07:18','2015-04-21 03:37:18'),(9,2,5,0,'PENDING','2015-04-21 09:07:18','2015-04-21 03:37:18'),(10,2,7,0,'PENDING','2015-04-21 09:07:18','2015-04-21 03:37:18'),(11,3,1,0,'PENDING','2015-04-21 09:09:41','2015-04-21 03:39:41'),(12,3,4,0,'PENDING','2015-04-21 09:09:41','2015-04-21 03:39:41'),(13,3,6,0,'PENDING','2015-04-21 09:09:41','2015-04-21 03:39:41'),(14,3,8,0,'PENDING','2015-04-21 09:09:41','2015-04-21 03:39:41'),(15,4,3,0,'PENDING','2015-04-21 09:10:52','2015-04-21 03:40:52'),(16,4,5,0,'PENDING','2015-04-21 09:10:52','2015-04-21 03:40:52'),(17,4,6,0,'PENDING','2015-04-21 09:10:52','2015-04-21 03:40:52'),(18,4,7,0,'PENDING','2015-04-21 09:10:52','2015-04-21 03:40:52'),(19,4,10,0,'PENDING','2015-04-21 09:10:52','2015-04-21 03:40:52'),(20,5,1,0,'PENDING','2015-04-21 10:37:02','2015-04-21 05:07:02'),(21,5,2,0,'PENDING','2015-04-21 10:37:02','2015-04-21 05:07:02'),(22,5,3,0,'PENDING','2015-04-21 10:37:02','2015-04-21 05:07:02'),(23,5,4,0,'PENDING','2015-04-21 10:37:02','2015-04-21 05:07:02'),(24,5,5,0,'PENDING','2015-04-21 10:37:02','2015-04-21 05:07:02'),(25,5,6,0,'PENDING','2015-04-21 10:37:02','2015-04-21 05:07:02'),(26,5,7,0,'PENDING','2015-04-21 10:37:03','2015-04-21 05:07:03'),(27,5,8,0,'PENDING','2015-04-21 10:37:03','2015-04-21 05:07:03'),(28,6,1,0,'PENDING','2015-04-21 10:38:00','2015-04-21 05:08:00'),(29,6,3,0,'PENDING','2015-04-21 10:38:00','2015-04-21 05:08:00'),(30,7,1,0,'PENDING','2015-04-21 11:09:02','2015-04-21 05:39:02'),(31,7,2,0,'PENDING','2015-04-21 11:09:02','2015-04-21 05:39:02'),(32,7,3,0,'PENDING','2015-04-21 11:09:02','2015-04-21 05:39:02'),(33,7,4,0,'PENDING','2015-04-21 11:09:02','2015-04-21 05:39:02'),(34,8,1,0,'PENDING','2015-04-21 11:23:17','2015-04-21 05:53:17'),(35,8,2,0,'PENDING','2015-04-21 11:23:17','2015-04-21 05:53:17'),(36,8,3,0,'PENDING','2015-04-21 11:23:17','2015-04-21 05:53:17'),(37,8,5,0,'PENDING','2015-04-21 11:23:17','2015-04-21 05:53:17'),(38,8,7,0,'PENDING','2015-04-21 11:23:17','2015-04-21 05:53:17');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(12) unsigned DEFAULT '0',
  `gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `age` int(3) DEFAULT '0',
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `user_type` enum('lab_technician','patient') NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`email`,`mobile`,`gender`,`age`,`username`,`password`,`user_type`,`updated`,`created`) values (1,'Amit','Gupta','amitgupta0007@gmail.com',12345678910,'Male',33,'amitgupta0007','827ccb0eea8a706c4c34a16891f84e7b','lab_technician','2015-04-21 09:07:01','2015-04-21 09:00:21'),(2,'glenn','pabuaya','glenn.pabuaya@yahoo.com',2222222222,'Male',24,'geepee','827ccb0eea8a706c4c34a16891f84e7b','patient','2015-04-21 09:06:52','2015-04-21 09:00:24'),(3,'Aster','Pabuaya','aster@yahoo.com',1111111111,'Male',34,'trixie','129842a82ec01dc55ef56dd83e711b96','patient','2015-04-21 11:23:17','2015-04-21 05:53:17'),(4,'Angel','Locsin','angel@locsin.com',4444444444,'Male',45,'Angie','99ff39d0a75318f9e70c3643605ced0e','patient','2015-04-21 09:05:31','2015-04-21 03:35:31'),(14,'jhon','Ambaugh','jaun@yahoo.com',25478554554,'Male',33333,'25478554554','','patient','2015-04-21 10:38:00','2015-04-21 05:08:00'),(15,'traci','jen','traci@hotmail.com',5888888888,'Female',25,'5888888888','','patient','2015-04-21 09:10:51','2015-04-21 03:40:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
