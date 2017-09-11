/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.5.53 : Database - kodaiche
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kodaiche` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kodaiche`;

/*Table structure for table `dh_user` */

DROP TABLE IF EXISTS `dh_user`;

CREATE TABLE `dh_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(20) DEFAULT '' COMMENT '昵称',
  `password` varchar(25) DEFAULT '' COMMENT '密码',
  `salt` char(5) DEFAULT '' COMMENT '随机码',
  `token` char(128) DEFAULT '',
  `time_out` int(10) unsigned DEFAULT '0' COMMENT 'token到期时间',
  `created` int(11) DEFAULT '0' COMMENT '注册时间',
  `ip` varchar(18) DEFAULT '' COMMENT '注册ip',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user` */

insert  into `dh_user`(`id`,`type`,`mobile`,`username`,`nickname`,`password`,`salt`,`token`,`time_out`,`created`,`ip`) values (1,2,'15923882847','cheng6251',NULL,'75429bf707c8b0b5952ba1bcd','65412','',0,1505121167,'127.0.0.1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
