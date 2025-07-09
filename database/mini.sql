/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.24-MariaDB : Database - mini_project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mini_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `mini_project`;

/*Table structure for table `appointments` */

DROP TABLE IF EXISTS `appointments`;

CREATE TABLE `appointments` (
  `ap_id` int(20) NOT NULL AUTO_INCREMENT,
  `d_id` int(20) NOT NULL,
  `pa_id` int(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `appointments` */

insert  into `appointments`(`ap_id`,`d_id`,`pa_id`,`status`) values 
(1,3,1,'accepted'),
(2,2,2,'requested'),
(3,1,3,'accepted');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `lid` int(30) NOT NULL AUTO_INCREMENT,
  `uid` int(30) NOT NULL,
  `u_nam` varchar(100) NOT NULL,
  `u_pass` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`lid`,`uid`,`u_nam`,`u_pass`,`type`,`status`) values 
(1,1,'avlin@gmail.com','123','parent','1'),
(2,1,'anna@gmail.com','321','vet','1'),
(3,2,'ji@gmail.com','321','vet','1'),
(4,3,'fi@gmail.com','321','vet','1'),
(5,2,'ag@gmail.com','123','parent','1'),
(6,3,'sh@gmail.com','123','parent','1');

/*Table structure for table `pet_parent` */

DROP TABLE IF EXISTS `pet_parent`;

CREATE TABLE `pet_parent` (
  `pid` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phn` varchar(100) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pet_parent` */

insert  into `pet_parent`(`pid`,`name`,`email`,`phn`,`pass`,`address`) values 
(1,'Avlin Antony','avlin@gmail.com','4567633786','123','thevara, kochi'),
(2,'agnes','ag@gmail.com','63782615','123','thevara, kochi'),
(3,'shahana','sh@gmail.com','4564545635','123','ernakulam');

/*Table structure for table `pets` */

DROP TABLE IF EXISTS `pets`;

CREATE TABLE `pets` (
  `pid` int(20) NOT NULL AUTO_INCREMENT,
  `pa_id` int(20) NOT NULL,
  `pet_name` varchar(100) NOT NULL,
  `typ` varchar(100) NOT NULL,
  `breed` varchar(100) NOT NULL,
  `age` int(20) NOT NULL,
  `weig` int(20) NOT NULL,
  `desp` varchar(100) NOT NULL,
  `image` longblob NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pets` */

insert  into `pets`(`pid`,`pa_id`,`pet_name`,`typ`,`breed`,`age`,`weig`,`desp`,`image`) values 
(1,1,'canny','dog','beagle',3,5,'good','beagle.jpg'),
(2,1,'loki','cat','indian',3,2,'good','cat.jpg'),
(3,1,'snoopy','dog','pug',5,7,'healthy','pug.jpeg'),
(4,1,'koko','cat','persian',8,3,'good','cat-Photoroom.png'),
(5,2,'emmo','cat','indian',3,2,'good ','cat-Photoroom.png'),
(6,2,'cooper','dog','shihzuh',1,2,'good','1747675774863_shitzu.jpeg'),
(7,2,'issa','cat','ragdoll',5,3,'good','1747676729396_rag.jpeg'),
(8,3,'snow white','cat','persian',3,4,'good and heathly','1747715190659_persian.jpeg');

/*Table structure for table `vet` */

DROP TABLE IF EXISTS `vet`;

CREATE TABLE `vet` (
  `vid` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phn` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `qual` varchar(100) NOT NULL,
  `lic` varchar(100) NOT NULL,
  `exp` varchar(100) NOT NULL,
  `spl` varchar(100) NOT NULL,
  `addrs` varchar(200) NOT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `vet` */

insert  into `vet`(`vid`,`name`,`email`,`phn`,`pass`,`qual`,`lic`,`exp`,`spl`,`addrs`) values 
(1,'anna','anna@gmail.com','4536245465','321','mbbs','ghjgh676','5','general','annas pets, thopumpady'),
(2,'jini','ji@gmail.com','7638767687','321','mbbs','t76wtt7tiQY','2','surgery','just dogs,panambilly'),
(3,'fina','fi@gmail.com','6786875685','321','mbbs','567fthtft','2','general','felix care ,panambilly');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
