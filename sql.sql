/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.5.53-log : Database - fastgo
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fastgo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

/*Table structure for table `dh_api_log` */

DROP TABLE IF EXISTS `dh_api_log`;

CREATE TABLE `dh_api_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(100) DEFAULT '' COMMENT '请求控制器',
  `action` varchar(100) DEFAULT '' COMMENT '请求方法名',
  `url` varchar(1000) DEFAULT '' COMMENT '请求地址',
  `data` mediumtext COMMENT '请求参数',
  `status` char(5) DEFAULT NULL COMMENT '请求返回状态',
  `msg` varchar(200) DEFAULT '' COMMENT '返回信息',
  `ip` char(20) DEFAULT '' COMMENT '请求IP',
  `created` int(11) DEFAULT '0' COMMENT '请求时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1316 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_api_log` */

insert  into `dh_api_log`(`id`,`controller`,`action`,`url`,`data`,`status`,`msg`,`ip`,`created`) values (1288,'site','add','http://fastgo.com','null','0','签名信息不完整','127.0.0.1',1515653804),(1289,'site','add','http://fastgo.com','null','0','签名信息不完整','127.0.0.1',1515653867),(1290,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}','1','获取数据成功','127.0.0.1',1516096586),(1291,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}','1','获取数据成功','127.0.0.1',1516097782),(1292,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}','1','获取数据成功','127.0.0.1',1516156002),(1293,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}','1','获取数据成功','127.0.0.1',1516156015),(1294,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}','1','获取数据成功','127.0.0.1',1516156809),(1295,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}','1','获取数据成功','127.0.0.1',1516156832),(1296,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}',NULL,'','127.0.0.1',1516158307),(1297,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}',NULL,'','127.0.0.1',1516158412),(1298,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}',NULL,'','127.0.0.1',1516158417),(1299,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}',NULL,'','127.0.0.1',1516158481),(1287,'shop','add','http://fastgo.com','{\"uid\":\"123456\",\"password\":\"12345\",\"username\":\"12345\",\"created\":\"1514875374\",\"signature\":\"9c57478a9ffd7d3fbabaadaf6aad0f01\",\"type\":\"2\",\"nickname\":\"nc\"}','0','密码太过简单了','127.0.0.1',1514881648),(1300,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}',NULL,'','127.0.0.1',1516158496),(1301,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}',NULL,'','127.0.0.1',1516158504),(1302,'Account','createSignature','http://fastgo.com','{\"money\":\"0.01\"}',NULL,'','127.0.0.1',1516158515),(1303,'Site','update','http://fastgo.com','null','0','签名信息不完整','127.0.0.1',1516255988),(1304,'orders','update','http://fastgo.com','null','0','署名の情報が不完全である','127.0.0.1',1516775637),(1305,'orders','update','http://fastgo.com','null','0','签名信息不完整','127.0.0.1',1516775643),(1306,'Signature','create','http://fastgo.com','null','0','签名信息不完整','127.0.0.1',1516775731),(1307,'Signature','createSignature','http://fastgo.com','null','1','获取数据成功','127.0.0.1',1516775749),(1308,'orders','update','http://fastgo.com','{\"signature\":\"9fd7d2ec99d925ded7ece87e010f42c2\",\"rand\":\"31994\",\"time\":\"1516775749\"}','0','签名信息不完整','127.0.0.1',1516775781),(1309,'orders','update','http://fastgo.com','{\"signature\":\"9fd7d2ec99d925ded7ece87e010f42c2\",\"rand\":\"31994\",\"time\":\"1516775749\"}','0','签名信息不完整','127.0.0.1',1516775895),(1310,'Signature','createSignature','http://fastgo.com','null','1','获取数据成功','127.0.0.1',1516775898),(1311,'orders','update','http://fastgo.com','{\"signature\":\"9fd7d2ec99d925ded7ece87e010f42c2\",\"random_str\":\"31994\",\"sign_time\":\"1516775749\"}','0','获取数据成功','127.0.0.1',1516775913),(1312,'orders','update','http://fastgo.com','{\"signature\":\"9fd7d2ec99d925ded7ece87e010f42c2\",\"random_str\":\"31994\",\"sign_time\":\"1516775749\"}','0','未获取当订单编号','127.0.0.1',1516775938),(1313,'orders','update','http://fastgo.com','{\"signature\":\"9fd7d2ec99d925ded7ece87e010f42c2\",\"random_str\":\"31994\",\"sign_time\":\"1516775749\",\"order_sn\":\"TEST00005KO\"}','0','订单物流更新失败','127.0.0.1',1516775949),(1314,'orders','update','http://fastgo.com','{\"signature\":\"9fd7d2ec99d925ded7ece87e010f42c2\",\"random_str\":\"31994\",\"sign_time\":\"1516775749\",\"order_sn\":\"TEST00005KO\",\"position_sn\":\"test\"}','1','成功更新字段：Array','127.0.0.1',1516775976),(1315,'orders','update','http://fastgo.com','{\"signature\":\"9fd7d2ec99d925ded7ece87e010f42c2\",\"random_str\":\"31994\",\"sign_time\":\"1516775749\",\"order_sn\":\"TEST00005KO\",\"position_sn\":\"test\"}','1','成功更新字段：包裹位置编号 ','127.0.0.1',1516776010);

/*Table structure for table `dh_app_version` */

DROP TABLE IF EXISTS `dh_app_version`;

CREATE TABLE `dh_app_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ios_version` varchar(100) DEFAULT '1' COMMENT 'ios版本号',
  `version` varchar(100) DEFAULT '0' COMMENT '版本号',
  `apk_url` varchar(200) DEFAULT '' COMMENT '下载地址',
  `content` mediumtext COMMENT '更新内容',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='app版本';

/*Data for the table `dh_app_version` */

insert  into `dh_app_version`(`id`,`ios_version`,`version`,`apk_url`,`content`,`created`) values (1,'1','1.0','/uploadfile/app/app1_0.apk','',0);

/*Table structure for table `dh_article` */

DROP TABLE IF EXISTS `dh_article`;

CREATE TABLE `dh_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '发布信息用户id',
  `column_id` int(11) unsigned DEFAULT '0' COMMENT '栏目id',
  `model_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模型id',
  `tag` varchar(20) DEFAULT '0' COMMENT 'tag标签',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `title_en` varchar(200) DEFAULT '' COMMENT '英文标题',
  `title_jp` varchar(200) DEFAULT '' COMMENT '日文标题',
  `btitle` varchar(200) NOT NULL DEFAULT '' COMMENT '附标题',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) DEFAULT '' COMMENT '简介',
  `description_en` varchar(500) DEFAULT '' COMMENT '英文简介',
  `description_jp` varchar(500) DEFAULT '' COMMENT '日文简介',
  `origin` varchar(300) DEFAULT '' COMMENT '来源地址',
  `is_top` tinyint(1) unsigned DEFAULT '0' COMMENT '是否置顶 1置顶 0不置顶',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态 1显示 0关闭',
  `is_recommend` tinyint(1) unsigned DEFAULT '0' COMMENT '推荐排行榜 1推荐 0不推荐',
  `is_review` tinyint(1) unsigned DEFAULT '1' COMMENT '审核状态 1已审核 0未审核',
  `hot` int(11) DEFAULT '0' COMMENT '热度',
  `publish_time` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  `comment_num` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `comment_uid` int(10) unsigned DEFAULT '0' COMMENT '最后评论uid',
  `comment_time` int(10) unsigned DEFAULT '0' COMMENT '最后评论时间',
  `del_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `flag` varchar(50) DEFAULT '' COMMENT '文章属性',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

/*Data for the table `dh_article` */

insert  into `dh_article`(`id`,`uid`,`column_id`,`model_id`,`tag`,`title`,`title_en`,`title_jp`,`btitle`,`thumb`,`description`,`description_en`,`description_jp`,`origin`,`is_top`,`is_show`,`is_recommend`,`is_review`,`hot`,`publish_time`,`comment_num`,`comment_uid`,`comment_time`,`del_status`,`created`,`flag`) values (1,0,0,1,'6','Nginx 实现跨域使用字体文件','','','','','Nginx 实现跨域使用字体文件',NULL,NULL,'',0,1,1,1,19,0,0,0,0,0,1504970134,''),(2,0,0,1,'6','Nginx 跨域访问php  ','','','','','Access-Control-Allow-Origin 错误',NULL,NULL,'',0,1,0,1,40,0,0,0,0,0,1504970371,''),(3,0,0,1,'10','Html 文字内容只显示一行','','','','','css控制文字内容只显示一行',NULL,NULL,'',0,1,0,1,163,0,0,0,0,0,1505020972,''),(4,0,0,1,'8','docker 手把手教你基于官网镜像搭建mysql+php+nginx（一）','','','','','使用的是官网镜像mysql:5.7php:5.6nignx:last准备工作你需要先安装dockerdocker-compose并且需要有一个github账户创建本地文件apahcemysqlsrv这里用不到主要需要创建的docker文件夹文件夹下创建对应mysqlnginxphp文件里面文件内容我们需要从容器里面拷贝出来后自己调整修改OK准备工作完成了先从php开始吧抓取php需要的配置文件保存在本地方便自己以后修改创建phpDockerfile在php下创建Docker',NULL,NULL,'',0,1,1,1,39,0,0,0,0,0,1507688317,''),(5,0,0,1,'9','linux命令之crontab定时执行任务','','','','','一般情况下，我们在操作和运维VPS、服务器的时候可能会用到crontab定时任务的配置，比如定时的重启服务器、定时备份数据等操作使用的还是比较多的。这里就离不开使用crontab命令的任务配置，在这篇文章中，老左将会整理较为齐全的crontab命令使用的方法以及常用的实例操作。从上图中，我们其实就可以看到crontab具体用法。一共有6个段落，前面5个标示定时的时间设定，后面一个标示文件的路径定时执行。第一、crontab安装一般我们使用的centos或者debian发行版本都自带crontab定时软件支',NULL,NULL,'http://www.laozuo.org/7110.html',0,1,0,1,109,0,0,0,0,0,1507694379,''),(6,0,0,1,'3','mysql数据库主从服务器常见问题处理','','','','','Slave_IO_Running Checking master version',NULL,NULL,'http://blog.csdn.net/lvyongyi_2010/article/details/23336249',0,1,0,1,14,0,0,0,0,0,1507701439,''),(7,0,6,1,'1','学院介绍','','','','ded101245a4174a5173a8e98a32d680d.jpeg','该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖','这里是英文摘要',NULL,'',0,1,0,1,0,0,0,0,0,0,1508232750,''),(16,0,7,2,'1','大卫','','','Da Wei','6109903a4f0399518bc5829b01559ccc.jpeg','ETS官方培训师、British Council（英国教育文化协会）雅思考试年度工作坊特邀嘉宾','ETS Official Trainer, British Council (UK Education and Culture Association) IELTS Annual Workshop Specialist',NULL,'',0,1,0,1,0,0,0,0,0,0,1508492185,''),(24,0,8,3,'1','课程名称中文','','','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1509438430,''),(30,0,10,1,'1','恒鼎学院简介','','','ABOUT  US','d6fb1ac5f3a5111a7bf3aa08384cf4a8.jpeg','创立至今始终坚持帮助更多中国人快乐、自信、便捷地掌握流利英语，并实现成功梦想为使命，全方位地解决不同学员英语学习中遇到的各种问题和困难。每年为国家公务员、跨国机构、各行业职员、在校大学生等等在内的数万学员提高英语水平。我们和你都有共同的目标，那就是让你有更加优质的生活，并在学习英语的过程中给予最大的帮助','Since the creation has always been to help more Chinese people happy, confident, easy to master fluent in English, and to achieve a successful dream for the mission, all-round solution to different students in English learning problems and difficulties encountered. Each year for the national civil servants, multinational institutions, industry staff, college students, etc., including tens of thousands of students to improve the level of English. We and you have a common goal, that is to let you ',NULL,'',0,1,0,1,0,0,0,0,0,0,1509592877,''),(31,0,11,1,'1','澳洲恒鼎学院','','','Australia Heng Ding College','','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1509691386,''),(32,0,4,1,'1','入学必读','','','Admission must be read','','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1509930812,''),(33,0,22,1,'1','证书查询方法','','','Certificate inquiry method','','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1509941443,''),(34,0,20,1,'1','雅思考试时间','','','IELTS test time','','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1510133421,''),(35,0,13,1,'1','部门介绍','','','Department introduction','','该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖','The team sticks to the principle of \"six principles of teaching and promoting scientific research, scientific achievements, achievements award, achievements reporting project, project awards and teaching force and teaching and learning\" and puts forward six \"one\" That is, presided over a number of topics, the construction of a number of quality courses, published a number of planning materials, research and development of a group Kaoyan brand courses to guide a group of students to participate i',NULL,'',0,1,0,1,0,0,0,0,0,0,1510193921,''),(36,0,14,2,'1','张三老师','','','Zhangs San','eb83c791e527e2c6c1ce95b2f74f8599.jpeg','本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促 教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程。本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程。','In line with the principle of \"six disciplines of promoting scientific research through teaching, achievements of scientific research, awarding of achievements, reporting of projects with achievements, project awards with teams, and teaching teams promoted by teachers\", the goal of six \"one\" education reform achievements is proposed A number of topics, building a number of quality courses. In line with the principle of \"six disciplines of promoting scientific research through teaching, achieveme',NULL,'',0,1,0,1,0,0,0,0,0,0,1510195002,''),(37,0,27,2,'1','高级荣誉','','','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1510198807,''),(38,0,27,2,'1','高级荣誉','','','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1510198807,''),(39,0,27,2,'1','高级荣誉','','','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1510198807,''),(40,0,27,2,'1','高级荣誉','','','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1510198807,''),(41,0,27,2,'1','高级荣誉','','','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1510198807,''),(42,0,8,3,'1','课程名称中文','','','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1509438430,''),(43,0,8,3,'1','课程名称中文','','','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1509438430,''),(44,0,8,3,'1','课程名称中文','','','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','',NULL,'',0,1,0,1,0,0,0,0,0,0,1509438430,''),(45,0,8,3,'1','课程名称中文','','','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','',NULL,'',0,1,0,1,1,0,0,0,0,0,1509438430,''),(46,0,8,3,'1','学霸英文教程','','','学霸英文教程英文版','6109903a4f0399518bc5829b01559ccc.jpeg','','',NULL,'',0,1,0,1,36,0,0,0,0,0,1509438430,''),(47,0,8,3,'1','雅思7.5分精品课程','','','雅思7.5分精品课程','6109903a4f0399518bc5829b01559ccc.jpeg','','',NULL,'',0,1,1,1,56,1509438430,0,0,0,0,1509438430,''),(49,1,23,1,'1','可以哦','','','','','','',NULL,'',0,1,0,1,48,1509438430,3,10,1510898365,0,1510817001,''),(50,10,23,1,'1','hhhh','','','','','','',NULL,'',0,1,1,1,5,1510889253,0,0,0,0,1510889253,''),(51,10,23,1,'1','hhhh2','','','','','','',NULL,'',0,1,1,1,39,1510889476,3,10,1511510984,0,1510889476,''),(52,10,23,1,NULL,'范德萨发生大','','','','','',NULL,NULL,'',0,1,0,0,4,1510889486,0,0,0,0,1510889486,''),(53,10,23,1,NULL,'的说法的','','','','','',NULL,NULL,'',0,1,0,0,2,1510889529,0,0,0,1,1510889529,''),(54,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','','','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','',NULL,'',0,1,0,1,4,1511244700,0,0,0,0,1511244700,''),(55,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','','','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','',NULL,'',0,1,0,1,0,1511244700,0,0,0,0,1511244700,''),(56,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','','','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','',NULL,'',0,1,0,1,0,1511244700,0,0,0,0,1511244700,''),(57,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','','','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','',NULL,'',0,1,0,1,0,1511244700,0,0,0,0,1511244700,''),(58,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','','','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','',NULL,'',0,1,0,1,10,1511244700,0,0,0,0,1511244700,''),(59,0,8,3,'1','测试','','','','','','',NULL,'',0,1,0,1,18,1511330439,0,0,0,0,1511330439,''),(60,0,28,4,'1','测试下载资料显示','','','测试下载资料显示2','','测试下载资料显示33','测试下载资料显示5555',NULL,'',0,1,1,1,0,1511781359,0,0,0,0,1511781359,''),(61,0,28,4,'1','测试下载资料显示','','','测试下载资料显示2','','测试下载资料显示33','测试下载资料显示5555',NULL,'',0,1,1,1,0,1511781359,0,0,0,0,1511781359,''),(62,0,17,3,'1','测试计划','','','111','af7bb23cae72f3390eb5155a166d16be.jpeg','','',NULL,'',0,1,0,1,56,1512008757,0,0,0,0,1512008757,''),(63,0,17,3,'1','测试重复提交','','','测试重复提交','','','',NULL,'',0,1,0,1,1,1512009708,0,0,0,0,1512009708,''),(64,0,29,1,'1','关于我们','','','','','','',NULL,'',0,1,0,1,0,1512354984,0,0,0,0,1512354984,''),(65,0,36,1,'1','企业概况','','','企业概况','','','',NULL,'',0,1,0,1,0,1512358632,0,0,0,0,1512358632,''),(66,0,37,1,'1','联系我们','','','联系我们','','','',NULL,'',0,1,0,1,0,1512359138,0,0,0,0,1512359138,''),(67,0,32,5,'1','渝北两路店','','','','','','',NULL,'',0,1,1,1,0,1512367729,0,0,0,0,1512367729,''),(68,0,32,5,'1','测试店铺地址','','','','','','',NULL,'',0,1,1,1,0,1512367806,0,0,0,0,1512367806,''),(69,0,45,1,'1','加盟政策','','','加盟政策','','','',NULL,'',0,1,0,1,0,1512370573,0,0,0,0,1512370573,''),(70,0,46,1,'1','加盟流程','','','加盟流程','','','',NULL,'',0,1,0,1,0,1512370726,0,0,0,0,1512370726,''),(71,0,44,1,'1','2017欧拉曲曼新品即将发布','','','','80045b1cca260f6f2d159966c4d27116.jpeg','欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,'',0,1,0,1,0,1512370788,0,0,0,0,1512370788,''),(72,0,44,1,'1','2017欧拉曲曼新品即将发布','','','','80045b1cca260f6f2d159966c4d27116.jpeg','欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,'',0,1,0,1,0,1512370788,0,0,0,0,1512370788,''),(73,0,44,1,'1','2017欧拉曲曼新品即将发布','','','','80045b1cca260f6f2d159966c4d27116.jpeg','欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,'',0,1,0,1,0,1512370788,0,0,0,0,1512370788,''),(74,0,44,1,'1','2017欧拉曲曼新品即将发布','','','','80045b1cca260f6f2d159966c4d27116.jpeg','欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,'',0,1,0,1,0,1512370788,0,0,0,0,1512370788,''),(75,0,44,1,'1','2017欧拉曲曼新品即将发布','','','','80045b1cca260f6f2d159966c4d27116.jpeg','欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,'',0,1,0,1,0,1512370788,0,0,0,0,1512370788,''),(76,0,42,1,'1','欧拉曲曼测试新闻','','','','d41e2372dc4c349f1bad8760d50e8532.jpeg','欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻','',NULL,'',0,1,0,1,0,1512370887,0,0,0,0,1512370887,''),(77,0,42,1,'1','欧拉曲曼测试新闻','','','','','欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻','',NULL,'',0,1,0,1,0,1512370887,0,0,0,0,1512370887,''),(78,0,43,1,'1','聚会返场会员礼遇','','','','bb2a4b506a9d0bb5eda7ec5632e9c1cf.png','内衣对于女人来说，比合脚的鞋子更重要！一件合适的内衣不但能够展现自己的品味，更能塑造更加完美的体态！除了买自己喜欢的内衣款式','',NULL,'',0,1,1,1,0,1512371177,0,0,0,0,1512371177,''),(79,0,43,1,'1','欧拉曲曼测试新闻','','','','bb2a4b506a9d0bb5eda7ec5632e9c1cf.png','欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻','',NULL,'',0,1,1,1,0,1512370887,0,0,0,0,1512370887,''),(80,0,43,1,'1','欧拉曲曼测试新闻2','','','','bb2a4b506a9d0bb5eda7ec5632e9c1cf.png','欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻','',NULL,'',0,1,1,1,0,1512370887,0,0,0,0,1512370887,''),(81,0,43,1,'1','欧拉曲曼测试新闻','','','','bb2a4b506a9d0bb5eda7ec5632e9c1cf.png','欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻','',NULL,'',0,1,0,1,0,1512370887,0,0,0,0,1512370887,''),(82,0,38,1,'1','测试标题名称','','','this is english title test','161e484a57719dafaae061f684cfa02c.png','','',NULL,'',0,1,0,1,0,1512466263,0,0,0,0,1512466263,''),(83,0,38,1,'1','测试标题名称','','','this is english title test','161e484a57719dafaae061f684cfa02c.png','','',NULL,'',0,1,0,1,0,1512466263,0,0,0,0,1512466263,''),(84,0,38,1,'1','测试标题名称','','','this is english title test','161e484a57719dafaae061f684cfa02c.png','','',NULL,'',0,1,0,1,0,1512466263,0,0,0,0,1512466263,''),(85,0,38,1,'1','测试标题名称','','','this is english title test','161e484a57719dafaae061f684cfa02c.png','','',NULL,'',0,1,0,1,0,1512466263,0,0,0,0,1512466263,''),(86,0,38,1,'1','测试标题名称','','','this is english title test','161e484a57719dafaae061f684cfa02c.png','','',NULL,'',0,1,0,1,0,1512466263,0,0,0,0,1512466263,''),(87,0,38,1,'1','测试标题名称','','','this is english title test','161e484a57719dafaae061f684cfa02c.png','','',NULL,'',0,1,0,1,0,1512466263,0,0,0,0,1512466263,''),(88,0,35,1,'1','品牌宣传','','','','','','',NULL,'',0,1,0,1,0,1512548308,0,0,0,0,1512548308,''),(89,0,50,1,'1','这里是中文测试问题','这里是中文测试问题1','这里是中文测试问题2','','','','','','',0,1,0,1,0,1513663394,0,0,0,0,1513663394,''),(90,0,50,1,'1','这里是中文测试问题啊啊啊','这里是中文测试问题啊啊啊2','这里是中文测试问题啊啊啊3','','','','','','',0,1,0,1,0,1513663427,0,0,0,0,1513663427,''),(91,0,54,1,'1','测试标题哦哦哦','','','','','','','','',0,1,0,1,0,1516345235,0,0,0,0,1516345235,''),(92,0,54,1,'1','整个图片测试一下哟','','','','1516345250242_163.jpeg','','','','',0,1,0,1,0,1516345257,0,0,0,0,1516345257,''),(93,0,54,1,'1','发送大法师打发第三方','','','','','','','','',0,1,0,1,0,1516345290,0,0,0,0,1516345290,'');

/*Table structure for table `dh_article_blog` */

DROP TABLE IF EXISTS `dh_article_blog`;

CREATE TABLE `dh_article_blog` (
  `id` int(10) unsigned NOT NULL,
  `content` mediumtext COMMENT '博客内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_blog` */

insert  into `dh_article_blog`(`id`,`content`) values (1,'<p>							 	</p><pre class=\"brush:php;toolbar:false\">location&nbsp;~*&nbsp;.(eot|ttf|woff|woff2|svg|otf)$&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Origin&nbsp;http://dist.denha.loc;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#add_header&nbsp;Access-Control-Allow-Headers&nbsp;X-Requested-With;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#add_header&nbsp;Access-Control-Allow-Credentials&nbsp;true;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Methods&nbsp;GET;\r\n}</pre><p><br/></p><p>							 	</p>'),(2,'<pre class=\"brush:php;toolbar:false\">\r\nlocation&nbsp;~&nbsp;.php(.*)$&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Origin&nbsp;http://dist.denha.loc;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Headers&nbsp;X-Requested-With;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Credentials&nbsp;true;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Methods&nbsp;GET,POST;\r\n}</pre><p><br/></p>'),(3,'<p>							 	</p><p>							 	</p><pre class=\"brush:html;toolbar:false\">&lt;ul&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;a&nbsp;href=&quot;javascript:;&quot;&gt;餐馆&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;</pre><pre class=\"brush:css;toolbar:false\">css:\r\n\r\nli{\r\n&nbsp;white-space:nowrap;&nbsp;\r\n&nbsp;overflow:hidden;\r\n&nbsp;text-overflow:ellipsis;\r\n}</pre><p><br/></p><p><br/></p><p><br/></p><p>							 	</p><p>							 	</p>'),(4,'<p>							 	</p><p>							 	</p><p>							 	</p><p><strong>使用的是官网镜像 </strong><span style=\"color: rgb(192, 0, 0);\"><strong>mysql:5.7</strong></span><strong> <span style=\"color: rgb(192, 0, 0);\">php:5.6</span> <span style=\"color: rgb(192, 0, 0);\">nignx:last</span></strong></p><p><br/></p><p><strong>准备工作</strong></p><p><strong><br/></strong></p><p><span style=\"color: rgb(192, 0, 0);\">你需要先安装docker docker-compose并且需要有一个github账户</span></p><p><br/></p><p><strong>创建本地文件</strong></p><p><strong><br/></strong></p><p><strong><img src=\"/uploadfile/ueditor/20171011/1507686028368988.png\" title=\"1507686028368988.png\" alt=\"image.png\"/></strong></p><p>apahce mysqlsrv 这里用不到 主要需要创建的docker文件夹 文件夹下创建对应mysql nginx php文件 里面文件内容我们需要从容器里面拷贝出来后自己调整修改</p><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">OK准备工作完成了 先从php开始吧</span></p><p><br/></p><p><strong>抓取php需要的配置文件保存在本地方便自己以后修改</strong></p><p><br/></p><p><br/></p><p><strong>创建phpDockerfile</strong></p><p><strong><br/></strong></p><p>在php 下创建Dockerfile文件<span style=\"color: rgb(192, 0, 0);\">（我已屏蔽了非主要模块 后续需要可以自行添加）</span></p><p>文件内容如下：</p><pre class=\"brush:bash;toolbar:false\">#&nbsp;name:docker_php\r\n#&nbsp;use:store&nbsp;&nbsp;\r\n#&nbsp;date:2017-09-04&nbsp;&nbsp;\r\n&nbsp;&nbsp;\r\nFROM&nbsp;php:5.6-fpm\r\n\r\nMAINTAINER&nbsp;siyue&nbsp;350375092@qq.com&nbsp;&nbsp;\r\n\r\n#&nbsp;You&nbsp;may&nbsp;need&nbsp;proxy\r\n#&nbsp;RUN&nbsp;export&nbsp;http_proxy=192.168.1.10:1080\r\n#&nbsp;RUN&nbsp;export&nbsp;https_proxy=192.168.1.10:1080\r\n\r\n#&nbsp;Update&nbsp;ubuntu\r\n#RUN&nbsp;apt-get&nbsp;update\r\n\r\n#&nbsp;mcrypt\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libmcrypt-dev\r\nRUN&nbsp;docker-php-ext-install&nbsp;mcrypt\r\n\r\n#&nbsp;GD\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libfreetype6-dev&nbsp;libjpeg62-turbo-dev&nbsp;libpng12-dev\r\nRUN&nbsp;docker-php-ext-configure&nbsp;gd&nbsp;--with-freetype-dir=/usr/include/&nbsp;--with-jpeg-dir=/usr/include/\r\nRUN&nbsp;docker-php-ext-install&nbsp;-j$(nproc)&nbsp;gd\r\n\r\n#&nbsp;Intl\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libicu-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;-j$(nproc)&nbsp;intl\r\n\r\n#&nbsp;General\r\nRUN&nbsp;docker-php-ext-install&nbsp;zip&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;pcntl&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;opcache&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;pdo_mysql&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;mysqli&nbsp;\r\n\r\n#&nbsp;SOAP&nbsp;Client\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libxml2-dev\r\nRUN&nbsp;docker-php-ext-install&nbsp;soap\r\n\r\n#&nbsp;General&nbsp;extensions&nbsp;that&nbsp;may&nbsp;had&nbsp;be&nbsp;installed&nbsp;default\r\n#&nbsp;If&nbsp;not,&nbsp;install&nbsp;them&nbsp;with&nbsp;following&nbsp;command\r\n#RUN&nbsp;docker-php-ext-install&nbsp;ctype\r\n#RUN&nbsp;docker-php-ext-install&nbsp;dom\r\n#RUN&nbsp;docker-php-ext-install&nbsp;fileinfo\r\n#RUN&nbsp;docker-php-ext-install&nbsp;ftp\r\n#RUN&nbsp;docker-php-ext-install&nbsp;hash\r\nRUN&nbsp;docker-php-ext-install&nbsp;iconv\r\nRUN&nbsp;docker-php-ext-install&nbsp;json\r\nRUN&nbsp;docker-php-ext-install&nbsp;mbstring\r\nRUN&nbsp;docker-php-ext-install&nbsp;session\r\nRUN&nbsp;docker-php-ext-install&nbsp;pdo\r\nRUN&nbsp;docker-php-ext-install&nbsp;pdo_sqlite\r\n#RUN&nbsp;docker-php-ext-install&nbsp;posix\r\n#RUN&nbsp;docker-php-ext-install&nbsp;tokenizer\r\n#RUN&nbsp;docker-php-ext-install&nbsp;simplexml\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xml\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xmlreader\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xmlwriter\r\n\r\n#&nbsp;CURL,&nbsp;may&nbsp;had&nbsp;be&nbsp;installed&nbsp;default\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;curl\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libcurl3\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libcurl4-openssl-dev\r\nRUN&nbsp;docker-php-ext-install&nbsp;curl\r\n\r\n#&nbsp;More&nbsp;extensions\r\n#RUN&nbsp;docker-php-ext-install&nbsp;exif\r\n#RUN&nbsp;docker-php-ext-install&nbsp;bcmath\r\n#RUN&nbsp;docker-php-ext-install&nbsp;calendar\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sockets\r\n#RUN&nbsp;docker-php-ext-install&nbsp;gettext\r\n#RUN&nbsp;docker-php-ext-install&nbsp;phar\r\n#RUN&nbsp;docker-php-ext-install&nbsp;shmop\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sysvmsg\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sysvsem\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sysvshm\r\n\r\n#&nbsp;More&nbsp;extensions&nbsp;handle&nbsp;database\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_firebird\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_dblib\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_oci\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_odbc\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_pgsql\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pgsql\r\n#RUN&nbsp;docker-php-ext-install&nbsp;oci8\r\n#RUN&nbsp;docker-php-ext-install&nbsp;odbc\r\n#RUN&nbsp;docker-php-ext-install&nbsp;dba\r\n#RUN&nbsp;docker-php-ext-install&nbsp;interbase\r\n\r\n#&nbsp;execute&nbsp;`RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libxml2-dev`&nbsp;before&nbsp;using&nbsp;following&nbsp;command\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libxslt-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xsl\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xmlrpc\r\n#RUN&nbsp;docker-php-ext-install&nbsp;wddx\r\n\r\n#&nbsp;Readline\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libreadline-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;readline\r\n\r\n#&nbsp;SNMP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libsnmp-dev\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;snmp\r\n#RUN&nbsp;docker-php-ext-install&nbsp;snmp\r\n\r\n#&nbsp;pspell\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libpspell-dev\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;aspell-en\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pspell\r\n\r\n#&nbsp;recode\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;librecode0\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;librecode-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;recode\r\n\r\n#&nbsp;Tidy\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libtidy-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;tidy\r\n\r\n#&nbsp;GMP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libgmp-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;gmp\r\n\r\n#&nbsp;Client\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;postgresql-client\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;mysql-client\r\n\r\n#&nbsp;IMAP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libc-client-dev\r\n#RUN&nbsp;docker-php-ext-configure&nbsp;imap&nbsp;--with-kerberos&nbsp;--with-imap-ssl\r\n#RUN&nbsp;docker-php-ext-install&nbsp;imap\r\n\r\n#&nbsp;LDAP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libldb-dev\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libldap2-dev\r\n#RUN&nbsp;docker-php-ext-configure&nbsp;ldap&nbsp;--with-libdir=lib/x86_64-linux-gnu\r\n#RUN&nbsp;docker-php-ext-install&nbsp;ldap\r\n\r\n#&nbsp;Composer\r\n#RUN&nbsp;curl&nbsp;-sS&nbsp;https://getcomposer.org/installer&nbsp;|&nbsp;php&nbsp;--&nbsp;--install-dir=/usr/bin/&nbsp;--filename=composer\r\n\r\n#&nbsp;XDEBUG\r\n#RUN&nbsp;yes&nbsp;|&nbsp;pecl&nbsp;channel-update&nbsp;pecl.php.net&nbsp;&amp;&amp;&nbsp;pecl&nbsp;install&nbsp;xdebug&nbsp;\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;zend_extension=$(find&nbsp;/usr/local/lib/php/extensions/&nbsp;-name&nbsp;xdebug.so)&quot;&nbsp;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini&nbsp;\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.remote_enable=on&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini&nbsp;\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.remote_handler=dbgp&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.xdebug.remote_host=127.0.0.1&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.xdebug.remote_port=9000&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini</pre><p><br/></p><p><strong>创建docker-compose.yml</strong></p><p><strong><br/></strong></p><p>在docker文件下创建文件docker-compose.yml</p><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;php:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#depends_on:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;build:&nbsp;./php/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;container_name:&nbsp;php\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart:&nbsp;always\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;privileged:&nbsp;true\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;links:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql:mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;volumes:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/:/var/www/html/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/data:/var/www/html/data:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/php-fpm.d/www.conf:/usr/local/etc/php-fpm.d/www.conf:ro\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/log/:/var/log/php-fpm/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expose:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&quot;9000&quot;</pre><p><span style=\"color: rgb(192, 0, 0);\">docker-compose.yml注意事项</span></p><p><span style=\"color: rgb(192, 0, 0);\">1.格式需要对其 我因为这个问题报错找了N久</span></p><p><span style=\"color: rgb(192, 0, 0);\">2.#是注释</span></p><p><span style=\"color: rgb(192, 0, 0);\">&nbsp;</span></p><p><span style=\"color: rgb(127, 127, 127);\">参数解释：</span><br/></p><p><span style=\"color: rgb(127, 127, 127);\">depends_on：前置需要</span></p><p><span style=\"color: rgb(127, 127, 127);\">build: ./php/ 根据Dockerfile文件创建容器</span></p><p><span style=\"color: rgb(127, 127, 127);\">container_name：创建的容器名称</span></p><p><span style=\"color: rgb(127, 127, 127);\">restart: always&nbsp;&nbsp;意外停止自动重启</span></p><p><span style=\"color: rgb(127, 127, 127);\">volumes&nbsp;挂载数据卷 本地path：容器path ： 权限 | ro不可创建文件 rw可读写</span></p><p><span style=\"color: rgb(127, 127, 127);\">links&nbsp;链接容器</span></p><p><span style=\"color: rgb(127, 127, 127);\">ports&nbsp;端口映射 本地prot ： 容器prot</span></p><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">保存然后上传github</span></p><p><br/></p><p><strong>执行脚本</strong></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;clone&nbsp;https://github.com/xxxx/docker.git&nbsp;&nbsp;xxx替换为你自己的\r\ncd&nbsp;docker\r\ndocker-compose&nbsp;up&nbsp;-d</pre><p>docker ps 查看运行成功了没有如果现实如下表示成功运行<br/></p><p><br/></p><p><img src=\"/uploadfile/ueditor/20171011/1507687796857430.png\" title=\"1507687796857430.png\" alt=\"image.png\"/><br/></p><p><br/></p><p>步抓取容器配置文件到本地<br/></p><pre class=\"brush:bash;toolbar:false\">docker&nbsp;cp&nbsp;php:/usr/local/php&nbsp;~/docker/php</pre><p>这句代码表示抓取php容器的php文件 存放到 自己的docker文件下的php中</p><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">找到www.conf文件&nbsp;然后在php文件夹中创建php-fpm.d文件夹将其文件保存在这里</span></p><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><strong>最后一步修改docker-compose.yml</strong></p><pre class=\"brush:bash;toolbar:false\">php:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#depends_on:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;build:&nbsp;./php/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;container_name:&nbsp;php\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart:&nbsp;always\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;privileged:&nbsp;true\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;links:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql:mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;volumes:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/:/var/www/html/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/data:/var/www/html/data:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/php-fpm.d/www.conf:/usr/local/etc/php-fpm.d/www.conf:ro\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/log/:/var/log/php-fpm/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expose:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&quot;9000&quot;</pre><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(192, 0, 0);\">完成后上传github</span></p><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><strong>最后执行脚本</strong><br/></p><pre class=\"brush:bash;toolbar:false\">cd\r\nrm&nbsp;-rf&nbsp;docker&nbsp;\r\ngit&nbsp;clone&nbsp;https://github.com/xxxx/docker.git\r\ncd&nbsp;docker\r\ndocker-compose&nbsp;up</pre><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">现在我们完成了php的docker部署 不管你在哪点都可以一个脚本完成php安装</span></p><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(192, 0, 0);\">下一章讲如何创建mysql nginx主体思路和php差不多</span></p><p>							 	</p><p>							 	</p><p>							 	</p>'),(5,'<p>							 	</p><p>							 	</p><p>一般情况下，我们在操作和运维VPS、服务器的时候可能会用到crontab定时任务的配置，比如定时的重启服务器、定时备份数据等操作使用的还是比较多的。这里就离不开使用crontab命令的任务配置，在这篇文章中将会整理较为齐全的crontab命令使用的方法以及常用的实例操作。<br/></p><p><img src=\"/uploadfile/ueditor/20171011/1507694617148181.jpg\" title=\"1507694617148181.jpg\" alt=\"1507694355630383.jpg\"/></p><p>从上图中，我们其实就可以看到crontab具体用法。一共有6个段落，前面5个标示定时的时间设定，后面一个标示文件的路径定时执行。</p><p><strong>第一 crontab安装</strong></p><p>一般我们使用的centos或者debian发行版本都自带crontab定时软件支持的，如果系统不支持，我们只需要通过下面对应的安装就可以。</p><p><strong>1、centos安装crontab</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">#安装Crontab\r\nyum&nbsp;install&nbsp;vixie-cron&nbsp;crontabs\r\n#设置开机启动Crontab\r\nchkconfig&nbsp;crond&nbsp;on\r\n#启动Crontab\r\nservice&nbsp;crond&nbsp;start</pre><p><br/></p></blockquote><p><strong>2、debian安装crontab</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">#安装Crontab\r\napt-get&nbsp;install&nbsp;cron\r\n#重启Crontab\r\n/etc/init.d/cron&nbsp;restart</pre><p><br/></p></blockquote><p>确保系统安装且运行生效之后才可以相关的设置。</p><p><br/></p><p><strong>第二 定时任务案例</strong></p><pre class=\"brush:bash;toolbar:false\">35&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;updatedb</pre><p>每隔一小时35分钟的时候更新一次数据库。</p><pre class=\"brush:bash;toolbar:false\">*/5&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;/usr/local/bin/diskusage.sh</pre><p>每隔5分钟运行diskusage.sh文件。</p><pre class=\"brush:bash;toolbar:false\">25,50&nbsp;1&nbsp;15&nbsp;*&nbsp;2&nbsp;/usr/local/bin/diskusage.sh</pre><p>每周二1:50AM执行文件</p><pre class=\"brush:bash;toolbar:false\">00&nbsp;14&nbsp;10&nbsp;3,6,9,12&nbsp;*&nbsp;/usr/local/bin/diskusage.sh</pre><p>每年3、6、9、12月份第十天下午2点执行。</p><pre class=\"brush:bash;toolbar:false\">00&nbsp;21&nbsp;*&nbsp;*&nbsp;Mon,Wed,Fri&nbsp;/usr/local/bin/diskusage.sh&nbsp;admin@laozuo.org</pre><p>每周一、三、五下午9点执行脚本</p><pre class=\"brush:bash;toolbar:false\">*/5&nbsp;*&nbsp;*&nbsp;*&nbsp;1-5&nbsp;/usr/local/bin/diskusage.sh</pre><p>周一到周五，每五分钟执行。</p><p><br/></p><p><strong>第三 系统调度</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">/etc/cron.d&nbsp;/etc/cron.daily&nbsp;/etc/cron.hourly&nbsp;/etc/cron.monthly&nbsp;/etc/cron.weekly</pre><p><br/></p></blockquote><p>如果我们根目录在执行backup.sh备份命令，使用上面脚本可以直接替换到/etc/cron.weekly目录。</p><p><br/></p><p><strong>第四 定时计划的级别设定</strong></p><p><strong><br/></strong></p><p>我们在操作的时候，每个用户都可以编辑、查看、删除crontab定时配置文件。如果根用户需要改crontab文件，必须加上&#39;-u&#39;选项来指定用户名。</p><p>1、编辑crontab文件的用户laozuo时候，我们可以使用命令：</p><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-u&nbsp;laozuo&nbsp;-e</pre><p>2、移除laozuo用户的定时设定</p><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-u&nbsp;laozuo&nbsp;-r</pre><p>3、查看laozuo定时任务设置文件</p><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-u&nbsp;laozuo&nbsp;-l</pre><p><strong>第五 从文件中加载crontab</strong></p><p>我们除了可以手工编辑定时文件之外，还可以文件加载到定时文件中。</p><blockquote><pre class=\"brush:bash;toolbar:false\">cat&nbsp;/root/mycronjobs.txt\r\n53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh\r\n01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh</pre><p><br/></p></blockquote><p>我们需要先上传编辑好的mycronjobs.txt定时任务文件到目录中，然后才可以执行。</p><blockquote><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;/root/mycronjobs.txt</pre><p><br/></p></blockquote><p>通过这个命令检查验证。</p><blockquote><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-l\r\n53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh\r\n01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh</pre><p><br/></p></blockquote><p>这里我们可以检查定时文件是否存在。</p><p><strong>第<strong style=\"white-space: normal;\">六</strong> 加入SELinux安全选项</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-s&nbsp;/root/mycronjobs/my.txt\r\nSELINUX_ROLE_TYPE=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023\r\n53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh\r\n01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh</pre><p><br/></p></blockquote><p><strong>第七 删除定时任务工作</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">[root@linux&nbsp;~]#&nbsp;crontab&nbsp;-l53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh\r\n[root@linux&nbsp;~]#&nbsp;crontab&nbsp;-r\r\n[root@linux&nbsp;~]#&nbsp;crontab&nbsp;-lno&nbsp;crontab&nbsp;for&nbsp;root</pre><p><br/></p></blockquote><p>我们先用-l查看当前的定时任务，然后用-r删除，然后再检查已经没有任务选项。</p><p>总结，以上6个步骤和方法，就是我们常用的crontab定时文件配置常用的，一般我们会用的多的是备份和定时启动等，根据我们实际的需要再进行时间上的调整。</p><p><br/></p><p>							 	</p><p>							 	</p>'),(6,'<p style=\"white-space: normal;\">\r\n    一些错误信息的处理，主从服务器上的命令，及状态信息。<br/>在从服务器上使用show&nbsp;slave&nbsp;status\\G<br/><br/>Slave_IO_Running,为No,<br/>则说明IO_THREAD没有启动，请执行start&nbsp;slave&nbsp;io_thread<br/><br/>Slave_SQL_Running为No<br/>则复制出错,查看Last_error字段排除错误后执行start&nbsp;slave&nbsp;sql_thread&nbsp;<br/><br/>查看Slave_IO_State字段空&nbsp;//复制没有启动<br/>Connecting&nbsp;to&nbsp;master//没有连接上master<br/>Waiting&nbsp;for&nbsp;master&nbsp;to&nbsp;send&nbsp;event//已经连上\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主服务器上的相关命令：&nbsp;<br/>show&nbsp;master&nbsp;status&nbsp;<br/>show&nbsp;slave&nbsp;hosts&nbsp;<br/>show&nbsp;logs&nbsp;<br/>show&nbsp;binlog&nbsp;events&nbsp;<br/>purge&nbsp;logs&nbsp;to&nbsp;&#39;log_name&#39;&nbsp;<br/>purge&nbsp;logs&nbsp;before&nbsp;&#39;date&#39;&nbsp;<br/>reset&nbsp;master(老版本flush&nbsp;master)&nbsp;<br/>set&nbsp;sql_log_bin=\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    从服务器上的相关命令:&nbsp;<br/>slave&nbsp;start&nbsp;<br/>slave&nbsp;stop&nbsp;<br/>SLAVE&nbsp;STOP&nbsp;IO_THREAD&nbsp;//此线程把master段的日志写到本地&nbsp;<br/>SLAVE&nbsp;start&nbsp;IO_THREAD&nbsp;<br/>SLAVE&nbsp;STOP&nbsp;SQL_THREAD&nbsp;//此线程把写到本地的日志应用于数据库&nbsp;<br/>SLAVE&nbsp;start&nbsp;SQL_THREAD&nbsp;<br/>reset&nbsp;slave&nbsp;<br/>SET&nbsp;GLOBAL&nbsp;SQL_SLAVE_SKIP_COUNTER&nbsp;<br/>load&nbsp;data&nbsp;from&nbsp;master&nbsp;<br/>show&nbsp;slave&nbsp;status(SUPER,REPLICATION&nbsp;CLIENT)&nbsp;<br/>CHANGE&nbsp;MASTER&nbsp;TO&nbsp;MASTER_HOST=,&nbsp;MASTER_PORT=,MASTER_USER=,&nbsp;MASTER_PASSWORD=&nbsp;//动态改变master信息<br/>PURGE&nbsp;MASTER&nbsp;[before&nbsp;&#39;date&#39;]&nbsp;删除master端已同步过的日志&nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>6.3.1&nbsp;Master&nbsp;同步线程状态\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    以下列出了master的&nbsp;Binlog&nbsp;Dump&nbsp;线程&nbsp;State&nbsp;字段中最常见的几种状态。如果在master上没有&nbsp;Binlog&nbsp;Dump&nbsp;线程，那么同步就没有在运行。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    也就是说，没有slave连接上来。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Sending&nbsp;binlog&nbsp;event&nbsp;to&nbsp;slave\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    事件是由二进制日志构成，一个事件通常由更新语句加上其他信息。线程读取到一个事件并正发送到slave上。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Finished&nbsp;reading&nbsp;one&nbsp;binlog;&nbsp;switching&nbsp;to&nbsp;next&nbsp;binlog\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    读取完了一个二进制日志，正切换到下一个。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Has&nbsp;sent&nbsp;all&nbsp;binlog&nbsp;to&nbsp;slave;&nbsp;waiting&nbsp;for&nbsp;binlog&nbsp;to&nbsp;be&nbsp;updated\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经读取完全部未完成更新日志，并且全部都发送到slave了。它处于空闲状态，正等待在master上执行新的更新操作以在二进制日志中产生新\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    的事件，然后读取它们。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;to&nbsp;finalize&nbsp;termination\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前线程停止了，这个时间很短。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    6.3.2&nbsp;Slave的I/O线程状态\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    以下列出了slave的I/O线程&nbsp;State&nbsp;字段中最常见的几种状态。从MySQL&nbsp;4.1.1开始，这个状态在执行&nbsp;SHOW&nbsp;SLAVE&nbsp;STATUS&nbsp;语句结果的\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Slave_IO_State&nbsp;字段也会出现。这意味着可以只执行&nbsp;SHOW&nbsp;SLAVE&nbsp;STATUS&nbsp;语句就能了解到更多的信息。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Connecting&nbsp;to&nbsp;master\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    该线程证尝试连接到master上。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Checking&nbsp;master&nbsp;version\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    确定连接到master后出现的一个短暂的状态。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Registering&nbsp;slave&nbsp;on&nbsp;master\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    确定连接到master后出现的一个短暂的状态。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Requesting&nbsp;binlog&nbsp;dump\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    确定连接到master后出现的一个短暂的状态。该线程向master发送一个请求，告诉它要请求的二进制文件以及开始位置。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;to&nbsp;reconnect&nbsp;after&nbsp;a&nbsp;failed&nbsp;binlog&nbsp;dump&nbsp;request\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果二进制日志转储(binary&nbsp;log&nbsp;dump)请求失败了(由于连接断开)，该线程在休眠时进入这个状态，并定期重连。重连的时间间隔由&nbsp;--\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    master-connect-retry&nbsp;选项来指定。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Reconnecting&nbsp;after&nbsp;a&nbsp;failed&nbsp;binlog&nbsp;dump&nbsp;request\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    该线程正尝试重连到master。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;master&nbsp;to&nbsp;send&nbsp;event\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经连接到master，正等待它发送二进制日志。如果master闲置时，这个状态可能会持续较长时间，如果它等待超过&nbsp;slave_read_timeout&nbsp;秒\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ，就会发生超时。这时，它就会考虑断开连接，然后尝试重连。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Queueing&nbsp;master&nbsp;event&nbsp;to&nbsp;the&nbsp;relay&nbsp;log\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经读取到一个事件，正把它拷贝到中继日志中以备SQL线程处理。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;to&nbsp;reconnect&nbsp;after&nbsp;a&nbsp;failed&nbsp;master&nbsp;event&nbsp;read\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    读日志时发生错误(由于连接断开)。该线程在重连之前休眠&nbsp;master-connect-retry&nbsp;秒。<br/>Reconnecting&nbsp;after&nbsp;a&nbsp;failed&nbsp;master&nbsp;event&nbsp;read\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>正尝试重连到master。当连接确定后，状态就变成&nbsp;Waiting&nbsp;for&nbsp;master&nbsp;to&nbsp;send&nbsp;event。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;the&nbsp;slave&nbsp;SQL&nbsp;thread&nbsp;to&nbsp;free&nbsp;enough&nbsp;relay&nbsp;log&nbsp;space\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    relay_log_space_limit&nbsp;的值非零，中继日志的大小总和超过这个值了。I/O线程等待SQL线程先处理中继日志然后删除它们以释放足够的空间\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;slave&nbsp;mutex&nbsp;on&nbsp;exit\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前线程停止了，这个时间很短。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    6.3.3&nbsp;Slave的SQL线程状态\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    以下列出了slave的SQL线程&nbsp;State&nbsp;字段中最常见的几种状态：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Reading&nbsp;event&nbsp;from&nbsp;the&nbsp;relay&nbsp;log\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    从中继日志里读到一个事件以备执行。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Has&nbsp;read&nbsp;all&nbsp;relay&nbsp;log;&nbsp;waiting&nbsp;for&nbsp;the&nbsp;slave&nbsp;I/O&nbsp;thread&nbsp;to&nbsp;update&nbsp;it\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经处理完中继日志中的全部事件了，正等待I/O线程写入更新的日志。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;slave&nbsp;mutex&nbsp;on&nbsp;exit\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前线程停止了，这个时间很短。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    故障\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    问题：主从复制不止何故停止了，我该怎么办？\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    答案：复制错误多半是因为日志错误引起的，所以首先要搞清楚是主日志错误还是中继日志错误，从错误信息里一般就能判断，如果不能可以使用类似下面的mysqlbinlog命令：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    mysqlbinlog&nbsp;&lt;MASTER_BINLOG_FILE&gt;&nbsp;&gt;&nbsp;/dev/null\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    mysqlbinlog&nbsp;&lt;SLAVE_BINLOG_FILE&gt;&nbsp;&gt;&nbsp;/dev/null\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果没有错误，则不会有任何输出，反之如果有错误，则会显示出来。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果是主日志错误，则需要在从服务器使用SET&nbsp;GLOBAL&nbsp;sql_slave_skip_counter，如下：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SET&nbsp;GLOBAL&nbsp;sql_slave_skip_counter&nbsp;=&nbsp;1;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    START&nbsp;SLAVE;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    注：如果有多个错误，可能需要执行多次（提醒：主从服务器数据可能因此不一致）。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果是中继日志错误，只要在从服务器使用SHOW&nbsp;SLAVE&nbsp;STATUS结果中的日志信息重新CHANGE&nbsp;MASTER&nbsp;TO即可，系统会抛弃当前的中继日志，重新下载：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    CHANGE&nbsp;MASTER&nbsp;TO\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    MASTER_LOG_FILE=&#39;&lt;Relay_Master_Log_File&gt;&#39;,\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    MASTER_LOG_POS=&lt;Exec_Master_Log_Pos&gt;;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    START&nbsp;SLAVE;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    至于为什么使用的是Relay_Master_Log_File&nbsp;&amp;&nbsp;Exec_Master_Log_Pos，参见概述。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    问题：主服务器宕机了，如何把从服务器提升会主服务器？\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    答案：在一主多从的环境总，需选择数据最新的从服务器做新的主服务器。如下图所示：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    提升从服务器为主服务器\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在一主（Server1）两从（Server2，、Server3）的环境中，Server1宕机后，等到Server1和Server2把宕机前同步到的日志都执行完，比较Master_Log_File和Read_Master_Log_Pos就可以判断出谁快谁慢，因为Server2从&nbsp;Server1同步的数据（1582）比Server3从Server1同步的数据（1493）新，所以应该提升Server2为新的主服务器，那么&nbsp;Server3在CHANGE&nbsp;MASTER&nbsp;TO到Server2的时候应该使用什么样的参数呢？1582-1493=89，而Server2的最后的二进制日志位置是8167，所以答案是&nbsp;8167-89=8078。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    技巧\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主从服务器中的表可以使用不同的表类型。比如主服务器可以使用InnoDB表类型，提供事务，行锁等高级特性，从服务器可以使用MyISAM表类型，内存消耗少，易备份等优点。还有一个例子，一台主服务器如果同时带很多个从服务器的话，势必会影响其性能，此时可以拿出一台服务器作为从服务器代理，使用BLACKHOLE表类型，只记录日志，不写数据，由它带多台从服务器，从而提升性能。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主从服务器中的表可以使用不同的键类型。比如主服务器用InnoDB，键用VARCHAR的话节省空间，从服务器使用MyISAM，键用CHAR提高速度，因为MyISAM有静态表一说。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主从服务器中的表可以使用不同的索引。主服务器主要用来应付写操作，所以除了主键和唯一索引等保证数据关系的索引一般都可以不加，从服务器一般用来应付读操作，所以可以针对查询特征设置索引，再进一步，不同的从服务器可以针对不同的查询设置不同的索引。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    MySQL同步功能由3个线程(master上1个，slave上2个)来实现。执行&nbsp;DE&gt;START&nbsp;SLAVEDE&gt;&nbsp;语句后，slave就创建一个I/O线程。I/O线程连接到master上，并请求master发送二进制日志中的语句。master创建一个线程来把日志的内容发送到slave上。这个线程在master上执行&nbsp;DE&gt;SHOW&nbsp;PROCESSLISTDE&gt;&nbsp;语句后的结果中的&nbsp;DE&gt;Binlog&nbsp;DumpDE&gt;&nbsp;线程便是。slave上的I/O线程读取master的&nbsp;DE&gt;Binlog&nbsp;DumpDE&gt;&nbsp;线程发送的语句，并且把它们拷贝到其数据目录下的中继日志(relay&nbsp;logs)中。第三个是SQL线程，salve用它来读取中继日志，然后执行它们来更新数据。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如上所述，每个master/slave上都有3个线程。每个master上有多个线程，它为每个slave连接都创建一个线程，每个slave只有I/O和SQL线程。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    show&nbsp;slave&nbsp;master&nbsp;用于提供有关从属服务器线程的关键参数的信息\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SHOW&nbsp;SLAVE&nbsp;STATUS会返回以下字段：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Slave_IO_State\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SHOW&nbsp;PROCESSLIST输出的State字段的拷贝。SHOW&nbsp;PROCESSLIST用于从属I/O线程。如果线程正在试图连接到主服务器，正在等待来自主服务器的时间或正在连接到主服务器等，本语句会通知您\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_User\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    被用于连接主服务器的当前用户。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_Port\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前的主服务器接口。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Connect_Retry\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    –master-connect-retry选项的当前值\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_Log_File\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    I/O线程当前正在读取的主服务器二进制日志文件的名称。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Read_Master_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在当前的主服务器二进制日志中，I/O线程已经读取的位置。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Log_File\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SQL线程当前正在读取和执行的中继日志文件的名称。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在当前的中继日志中，SQL线程已读取和执行的位置。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Master_Log_File\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    由SQL线程执行的包含多数近期事件的主服务器二进制日志文件的名称。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Slave_IO_Running\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    I/O线程是否被启动并成功地连接到主服务器上。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Slave_SQL_Running\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SQL线程是否被启动。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Replicate_Do_DB,Replicate_Ignore_DB\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    使用–replicate-do-db和–replicate-ignore-db选项指定的数据库清单。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Replicate_Do_Table,Replicate_Ignore_Table,Replicate_Wild_Do_Table,Replicate_Wild_Ignore_Table\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    使用–replicate-do-table,–replicate-ignore-table,–replicate-wild-do-table和–replicate-wild-ignore_table选项指定的表清单。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Last_Errno,Last_Error\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    被多数最近被执行的查询返回的错误数量和错误消息。错误数量为0并且消息为空字符串意味着“没有错误”。如果Last_Error值不是空值，它也会在从属服务器的错误日志中作为消息显示。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    举例说明：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Last_Errno:&nbsp;1051\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Last_Error:&nbsp;error&nbsp;‘Unknown&nbsp;table&nbsp;‘z”&nbsp;on&nbsp;query&nbsp;‘drop&nbsp;table&nbsp;z’\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    该消息指示，表z曾经存在于在主服务器中并已被取消了，但是它没有在从属服务器中存在过，因此对于从属服务器，DROP&nbsp;TABLE失败。（举例说明，在设置复制时，如果您忘记了把此表拷贝到从属服务器中，则这有可能发生。）\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Skip_Counter\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    最近被使用的用于SQL_SLAVE_SKIP_COUNTER的值。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Exec_Master_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    来自主服务器的二进制日志的由SQL线程执行的上一个时间的位置（Relay_Master_Log_File）。在主服务器的二进制日志中的(Relay_Master_Log_File,&nbsp;Exec_Master_Log_Pos)对应于在中继日志中的(Relay_Log_File,Relay_Log_Pos)。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Log_Space\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    所有原有的中继日志结合起来的总大小。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Until_Condition,Until_Log_File,Until_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在START&nbsp;SLAVE语句的UNTIL子句中指定的值。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Until_Condition具有以下值：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果没有指定UNTIL子句，则没有值\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果从属服务器正在读取，直到达到主服务器的二进制日志的给定位置为止，则值为Master\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果从属服务器正在读取，直到达到其中继日志的给定位置为止，则值为Relay\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Until_Log_File和Until_Log_Pos用于指示日志文件名和位置值。日志文件名和位置值定义了SQL线程在哪个点中止执行。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_SSL_Allowed,Master_SSL_CA_File,Master_SSL_CA_Path,Master_SSL_Cert,Master_SSL_Cipher,Master_SSL_Key\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    这些字段显示了被从属服务器使用的参数。这些参数用于连接主服务器。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Master_SSL_Allowed具有以下值：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果允许对主服务器进行SSL连接，则值为Yes\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果不允许对主服务器进行SSL连接，则值为No\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果允许SSL连接，但是从属服务器没有让SSL支持被启用，则值为Ignored。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    与SSL有关的字段的值对应于–master-ca,–master-capath,–master-cert,–master-cipher和–master-key选项\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ########################################################################<br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Replication延时的类型\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、固定性的延时\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;——Slave的数据持续性的落后于Master并且一直无法与Master的数据保持一致。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;——Slave的数据经常在白天落后于Master，而在晚上可以赶上并与Master的记录保持一致。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;这种类型的延时通常是由于Slave服务器的负载已经到达了上限或在白天访问量大的时候到达上限造成的。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、非固定性的延时\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;——Slave的数据只是短暂的落后于Master，可在短时间内恢复，这类型的延时通常与批量任务和报表有关，效率差的查询也会导致这类延时。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Mysql&nbsp;Replication的限制\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　Mysql的Replication是单线程的，意味着只能有效的使用一个CPU内核和一个磁盘，一条复杂的查询或者事务都导致进程被阻塞，不过现在针对5.1版本的多线程Replication补丁，<a target=\"_blank\" href=\"http://forge.mysql.com/wiki/ReplicationFeatures/ParallelSlave\">http://forge.mysql.com/wiki/ReplicationFeatures/ParallelSlave</a>，还是pre版，有很多限制，感兴趣的可以去看看。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Replication的容量\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、理解什么是Replication的容量\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　可以将Replication暂停一个小时，重新启动Replication后，观察Slave的数据多久可以与Master一致。从Replication重新启动到和Master数据一致所花费的时间与Replication暂停的时间的比值就是Replication的容量。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、建议保持Replication的容量在3倍以上，即延迟一个小时的数据，Slave只需要20分钟就能与Master的数据一致。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Replication的优化\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、5.0的mysql中避免类似以下的更新语句\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;INSERT&nbsp;…&nbsp;SELECT\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;UPDATE&nbsp;....&nbsp;WHERE\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　复杂的查询会导致Replication线程阻塞。如果是insert或update与select结合的语句，可以讲select单独执行并保存在临时表中，然后再执行insert或者update。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　如果使用的是5.1的mysql，新功能中的行级Replication（RBR）可以解决这个问题。RBR可以将在Master上通过复杂查询后更新的结果直接传给Slave，Slave可以直接将结果更新到数据库中。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、避免大的事务\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;太大的事务会造成Replication长时间阻塞，数据会严重滞后于Master。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Slave服务器的硬件选择\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;更快的CPU内核，对于单线程的Replication多核CPU是没有任何优势的。更高速的硬盘，包括更高的转速和更好的高速缓存命中率，如果有钱的话上SSD吧。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;主从结构的扩展性问题\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、如何降低写操作的频率\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　Master的写操作会扩散到所有的Slave上，所以高频率的写操作会降低Slave的读操作效率。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;至少保持一台Slave做全库同步，其他的Slave可以只做部分表的同步。当然，这需要web应用程序的配合来分配哪些查询读哪些Slave。将一些更新操作放到memcached中，例如session和计数器。Slave使用myisam引擎，将一些写入量很大的更新操作直接在slave上执行，而不通过Replication。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、如何更有效的利用Slave的硬件资源[&nbsp;变形虫]\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;使用分区\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;有选择的对表进行同步\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;在Slave上对数据进行归档。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Session的持久化\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;为不同的应用服务器分配不同的Slave进行读操作。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;或者根据查询类型的不同来分配不同的Slave。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;3、如何使你的程序最大化的利用Slave\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　将对数据更新不敏感的查询放到Slave上，而需要实时数据的查询则放到Master。通过session的持久化，让做了修改的用户首先看到修改的内容，其他的用户可以等待Slave更新后再查看新内容。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　对于某些数据，可以用memcached来存放数据的版本号，读Slave的程序可以先对比Slave的数据和memcached数据的版本，如果不一致则去读master。用户和博客类的信息可以用这种方法。在查询前可以通过SHOW&nbsp;SLAVE&nbsp;STATUS检测Slave的状态，然后根据返回的结果进行服务器的选择。\r\n</p>\r\n<p>\r\n    							 	\r\n</p>'),(7,'<p><img src=\"images/img01.jpg\"/></p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p>');

/*Table structure for table `dh_article_course` */

DROP TABLE IF EXISTS `dh_article_course`;

CREATE TABLE `dh_article_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_uid` int(10) unsigned DEFAULT '0' COMMENT '关联老师uid',
  `class_type` tinyint(1) DEFAULT '1' COMMENT '课程类型 1一对一 2一对多',
  `num` int(10) unsigned DEFAULT '0' COMMENT '课时数',
  `sale_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '售卖价',
  `dis_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '活动价',
  `base_orders` int(10) unsigned DEFAULT '0' COMMENT '基础售卖分数',
  `credit` int(10) unsigned DEFAULT '0' COMMENT '可获学分',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned DEFAULT '0' COMMENT '结束时间',
  `characteristics` varchar(100) DEFAULT '' COMMENT '课程特色',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  `class_time` varchar(200) DEFAULT '' COMMENT '课程时间中文',
  `class_time_en` varchar(200) DEFAULT '' COMMENT '课程时间英文',
  `recruit` varchar(250) DEFAULT NULL COMMENT '招生对象中文',
  `recruit_en` varchar(250) DEFAULT NULL COMMENT '招生对象英文',
  `content` mediumtext COMMENT '内容中文',
  `content_en` mediumtext COMMENT '内容英文',
  `teacher_hour_type` tinyint(1) DEFAULT '0' COMMENT '老师课时类型',
  `video_url` varchar(300) DEFAULT '' COMMENT '视频地址',
  `show_port` varchar(100) DEFAULT '0' COMMENT '显示端口 0全部 1zh 2澳大利亚',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_course` */

insert  into `dh_article_course`(`id`,`teacher_uid`,`class_type`,`num`,`sale_price`,`dis_price`,`base_orders`,`credit`,`start_time`,`end_time`,`characteristics`,`created`,`class_time`,`class_time_en`,`recruit`,`recruit_en`,`content`,`content_en`,`teacher_hour_type`,`video_url`,`show_port`) values (43,1,1,1,'100.00','9.90',100,0,1506787200,1506873600,'',0,'上课时间中文','上课时间英文','这里是招生对象中文','这里是招生对象中文2',NULL,NULL,0,'',NULL),(42,1,1,2,'100.00','9.90',100,0,1506787200,1506873600,'',0,'上课时间中文','上课时间英文','这里是招生对象中文','这里是招生对象中文2',NULL,NULL,0,'',NULL),(24,1,1,3,'100.00','9.90',100,0,1506787200,1506873600,'',0,'上课时间中文','上课时间英文','这里是招生对象中文','这里是招生对象中文2',NULL,NULL,0,'',NULL),(44,1,1,4,'100.00','9.90',100,0,1506787200,1506873600,'',0,'上课时间中文','上课时间英文','这里是招生对象中文','这里是招生对象中文2',NULL,NULL,0,'',NULL),(45,1,1,5,'100.00','9.90',100,0,1506787200,1506873600,'',0,'上课时间中文','上课时间英文','这里是招生对象中文','这里是招生对象中文2',NULL,NULL,0,'',NULL),(46,8,1,6,'100.00','9.90',100,0,0,0,'',0,'上课时间中文','上课时间英文','这里是招生对象中文','这里是招生对象中文2',NULL,NULL,0,'',NULL),(47,8,1,6,'100.00','9.90',100,0,0,0,'80,79',0,'上课时间中文','上课时间英文','这里是招生对象中文','这里是招生对象中文2','<div class=\"img_gg\"><img src=\"/ststic/study/images/gg.jpg\"/></div><p>获得SAT官方大力学术支持的朗阁新SAT课程，紧扣College Board官方指南，为不同英语基础起点的学生制定个性化提分计划。实行签约提分制度，通过多媒体教学模式，配合朗阁7A教学模式，巩固专业培训师的教学成果。实现课前、课中、课后三段式回访制，通过多维度辅导，各方面提高能力水平，课后第二课堂全面提升学生语言吸收应用能力，高效备考</p><p>【特设研发中心】依托朗阁海外考试研发中心，自主研发新SAT教材。<br/>\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;【海量考试题库】整合新SAT考试题目类型，满足学员考前练习需求。<br/>\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;【机考模拟中心】紧贴官方电脑考试模式，还原生动的考试场景。<br/>\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;【个性定制辅导】针对学员情况，个性化定制课程计划，学习顾问课后1V1辅导</p><p>获得SAT官方大力学术支持的朗阁新SAT课程，紧扣College Board官方指南，为不同英语基础起点的学生制定个性化提分计划。实行签约提分制度，通过多媒体教学模式，配合朗阁7A教学模式，巩固专业培训师的教学成果。实现课前、课中、课后三段式回访制，通过多维度辅导，各方面提高能力水平，课后第二课堂全面提升学生语言吸收应用能力，高效备考</p>','							 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 	<div class=\"img_gg\" style=\"white-space: normal;\"><img src=\"http://admin.denha.loc/ststic/study/images/gg.jpg\"/></div><p style=\"white-space: normal;\">获得SAT官方大力学术支持的朗阁新SAT课程，紧扣College Board官方指南，为不同英语基础起点的学生制定个性化提分计划。实行签约提分制度，通过多媒体教学模式，配合朗阁7A教学模式，巩固专业培训师的教学成果。实现课前、课中、课后三段式回访制，通过多维度辅导，各方面提高能力水平，课后第二课堂全面提升学生语言吸收应用能力，高效备考</p><p style=\"white-space: normal;\">【特设研发中心】依托朗阁海外考试研发中心，自主研发新SAT教材。<br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;【海量考试题库】整合新SAT考试题目类型，满足学员考前练习需求。<br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;【机考模拟中心】紧贴官方电脑考试模式，还原生动的考试场景。<br/>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;【个性定制辅导】针对学员情况，个性化定制课程计划，学习顾问课后1V1辅导</p><p style=\"white-space: normal;\">获得SAT官方大力学术支持的朗阁新SAT课程，紧扣College Board官方指南，为不同英语基础起点的学生制定个性化提分计划。实行签约提分制度，通过多媒体教学模式，配合朗阁7A教学模式，巩固专业培训师的教学成果。实现课前、课中、课后三段式回访制，通过多维度辅导，各方面提高能力水平，课后第二课堂全面提升学生语言吸收应用能力，高效备考</p>							 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 								 	',75,'',NULL),(59,8,2,0,'100.00','0.00',0,6,0,0,'',0,'','','研究生','','<p>的三十号的梵蒂冈&nbsp;</p><p>水电费 感受到</p><p>是的发生过啊sg</p>',NULL,75,'',NULL),(62,0,3,0,'100.00','9.90',0,0,0,0,'0,0',0,'222','3333','','','沙发的撒范德萨发','\r\n							 	\r\n							 	\r\n							 	大法师打发第三方							 								 								 	',0,'/uploadfile/test/1512008723316_19.mp4',NULL),(63,0,3,0,'100.00','0.00',0,0,0,0,'0,0',0,'','','','',NULL,NULL,0,'',NULL);

/*Table structure for table `dh_article_course_schedule` */

DROP TABLE IF EXISTS `dh_article_course_schedule`;

CREATE TABLE `dh_article_course_schedule` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程文章id',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程开始时间',
  `end_time` int(11) unsigned DEFAULT '0' COMMENT '课程结束时间',
  `credit` int(10) unsigned DEFAULT '0' COMMENT '课程学分',
  `teacher_hour` int(10) DEFAULT '0' COMMENT '老师可得课时'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_course_schedule` */

insert  into `dh_article_course_schedule`(`id`,`start_time`,`end_time`,`credit`,`teacher_hour`) values (47,1511342760,1511353560,0,4),(47,1510910760,1510918080,0,3),(24,1509443640,1510910760,10,0),(24,1507629240,1510910760,10,0),(47,1510824360,1510831560,0,2),(47,1510588800,1510651560,0,1),(59,1511712000,1511715720,2,0),(59,1511366400,1511370120,2,0);

/*Table structure for table `dh_article_data` */

DROP TABLE IF EXISTS `dh_article_data`;

CREATE TABLE `dh_article_data` (
  `id` int(10) unsigned NOT NULL,
  `content` mediumtext COMMENT '文章内容',
  `content_en` mediumtext COMMENT '英文内容',
  `content_jp` mediumtext COMMENT '日文内容',
  `video` varchar(255) DEFAULT '' COMMENT '视频地址',
  `depot_id` int(11) DEFAULT '0' COMMENT '所属仓库id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_data` */

insert  into `dh_article_data`(`id`,`content`,`content_en`,`content_jp`,`video`,`depot_id`) values (7,'							 	<p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>该团队本着&#39;“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖<br/></p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p>							 	','							 	<p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p style=\"white-space: normal;\">该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖<br/></p><p style=\"white-space: normal;\">该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p><br/></p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p>							 	',NULL,NULL,0),(25,'<p>44</p>','<p>44</p>',NULL,NULL,0),(28,'','',NULL,NULL,0),(30,'<p>&nbsp; 该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p>							 								 	','<p>The team in the &quot;teaching to promote scientific research, scientific research results, the results were rewarded, the results of the project, the project awards with the team, teaching staff to promote teaching,&quot; the six-ring principle, put forward the teaching reform results of six &quot;one&quot; That is, presided over a number of topics, the construction of a number of excellent courses, publishing a number of planning materials, research and development of a group of Kaoyan brand courses to guide a group of students to participate in national competitions and award the team in &quot;teaching scientific research, scientific research results, the results were rewarded , The results of the project, the project awards with the team, teaching staff to promote teaching, &quot;the six-ring principle, put forward the results of teaching reform six&quot; one &quot;goal, that is, presided over a number of topics, the construction of a number of excellent courses, Teaching materials, research and development of a group of Kaoyan brand courses, to guide a group of students to participate in national competitions and awards</p><p>The team in the &quot;teaching to promote scientific research, scientific research results, the results were rewarded, the results of the project, the project awards with the team, teaching staff to promote teaching,&quot; the six-ring principle, put forward the teaching reform results of six &quot;one&quot; That is, presided over a number of topics, the construction of a number of excellent courses, publishing a number of planning materials, research and development of a group of Kaoyan brand courses to guide a group of students to participate in national competitions and awards</p>\r\n						 								 	',NULL,NULL,0),(31,'							 	 <strong>澳洲恒鼎学院</strong><div class=\"map_img\"><img src=\"/ststic/study/images/map.jpg\"/></div><h1>联系我们</h1><span>咨询电话：023-23654586</span><span>培训地址：重庆南岸区工惠路192号贝迪龙庭14楼2号</span><br/>							 	','							 	 <strong>澳洲恒鼎学院</strong><div class=\"map_img\"><img src=\"/ststic/study/images/map.jpg\"/></div><h1>联系我们</h1><span>咨询电话：023-23654586</span><span>培训地址：重庆南岸区工惠路192号贝迪龙庭14楼2号</span><br/>							 	',NULL,NULL,0),(32,'<p>为需要较高分数学员量身定制分科教学方案，精华汇总重难点题型解题技巧，完美诠释听说读写各项评分指标及时找到你出分路上的拦路虎，顺利突破出分瓶颈。雅思分数6分程度或同等水平，英语基础较为扎实，能以正常速度阅读长篇文章；能较为流畅地进行口头及书面表达，但对雅思缺乏明确认识；对长文章/长听力的把握力不够；口语/写作表达中缺少论证性观点，或观点表达不够到位。；词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p><img src=\"/uploadfile/ueditor/20171106/1509930757601067.jpg\" width=\"100%\" _src=\"/uploadfile/ueditor/20171106/1509930757601067.jpg\" title=\"1509930757601067.jpg\" alt=\"img.jpg\"/><p>口语/写作表达中缺少论证性观点，或观点表达不够到位。；词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p><p>词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p><p>词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p>','<p style=\"white-space: normal;\">For the need for higher scores tailored sub-teaching programs, the essence of heavy difficulty problem-solving skills, perfect interpretation of reading, writing, reading and writing the indicators in time to find you on the road to stumbling block, a smooth break out of the bottleneck. IELTS score of 6 points or equivalent, the foundation of English is solid, can read long articles at normal speed; can be more smoothly oral and written expression, but IELTS lack of a clear understanding of the long article / long listening ability is not enough; Oral / written expression of the lack of argumentation point of view, or lack of expression in place. ; Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><img src=\"http://admin.denha.loc/uploadfile/ueditor/20171106/1509930757601067.jpg\" width=\"100%\" _src=\"/uploadfile/ueditor/20171106/1509930757601067.jpg\" title=\"1509930757601067.jpg\" alt=\"img.jpg\"/><p style=\"white-space: normal;\"></p><p>Oral / written expression of the lack of argumentation point of view, or lack of expression in place. ; Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><p>Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><p>Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><p>The company is located in:</p>',NULL,NULL,0),(33,'<h3>证书查询方法</h3><span>托福成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> toefl.etest.net.cn/cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p><p style=\"width:70%; height:20px; border-bottom:#ccc 1px dashed; margin:20px auto\" class=\"clearfix\"></p><span>雅思成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> www.britishcouncil.cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p>','<h3>证书查询方法</h3><span>托福成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> toefl.etest.net.cn/cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p><p style=\"width:70%; height:20px; border-bottom:#ccc 1px dashed; margin:20px auto\" class=\"clearfix\"></p><span>雅思成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> www.britishcouncil.cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p>',NULL,NULL,0),(34,'<p>1月：07、12、14、21；2</p>							 								 	','\r\n							 	\r\n							 	January: 07,12,14,21; 2							 								 	',NULL,NULL,0),(35,'<p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p>','<p></p><p>The team sticks to the principle of &quot;six principles of teaching and promoting scientific research, fruitful achievements, rewarding achievements, rewarding projects, winning awards with projects, and promoting teaching through contingent of teachers&quot;, put forward the goal of six &quot;one&quot; education reform results, That is, presided over a number of topics, the construction of a number of quality courses, published a number of planning materials, research and development of a group Kaoyan brand courses to guide a group of students to participate in national competitions and awards The team based on &quot;teaching to promote scientific research, research results, the results were rewarded , Outcome Report Project, Project Award Team, Team of Teachers to Promote Teaching and Learning &quot;and put forward the goal of six&quot; one &quot;education reform achievements, that is, to preside over a batch of topics, build a batch of excellent courses and publish a batch of plans Teaching materials, research and development of a group of Kaoyan brand courses to guide a group of students to participate in national competitions and awards</p><p>The team sticks to the principle of &quot;six principles of teaching and promoting scientific research, fruitful achievements, rewarding achievements, rewarding projects, winning awards with projects, and promoting teaching through contingent of teachers&quot;, put forward the goal of six &quot;one&quot; education reform results, That is, presided over a number of topics, the construction of a number of quality courses, published a number of planning materials, research and development of a group Kaoyan brand courses to guide a group of students to participate in national competitions and awards</p><p><br/></p>',NULL,NULL,0),(48,'&nbsp;我来测试内容<img src=\"http://study.loc/uploadfile/test/79bc72fbc6caaadca3f1c84883b4ba9a.jpeg\" width=\"80%\">',NULL,NULL,NULL,0),(49,'\r\n							 	我来试试审核功能 和图片上传 看看有没有问题<img src=\"http://study.loc/uploadfile/test/e09f99d18f135e2fcddbeeff40b370c5.jpeg\" width=\"80%\"/>							 	','',NULL,NULL,0),(50,'\r\n							 	这是要做什么<br/><br/>							 	','',NULL,NULL,0),(51,'\r\n							 	这是要做什么<br/><br/>							 	','',NULL,NULL,0),(52,'的沙发斯蒂芬',NULL,NULL,NULL,0),(53,'都是范德萨发生大幅',NULL,NULL,NULL,0),(54,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	',NULL,NULL,0),(55,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	',NULL,NULL,0),(56,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	',NULL,NULL,0),(57,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	',NULL,NULL,0),(58,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	',NULL,NULL,0),(64,'<div class=\"about-title\"><p>EULER TUCHMAN</p><p>欧拉曲曼内衣有限公司</p></div><div class=\"about-intro\"><div><img src=\"/uploadfile/ueditor/20171204/1512354967400023.png\" title=\"1512354967400023.png\" _src=\"/uploadfile/ueditor/20171204/1512354967400023.png\" alt=\"about-img.png\"/></div><div><ul class=\" list-paddingleft-2\"><li>最权威的塑性专家</li><li>国际一流功效型品牌</li></ul></div><div><p>欧拉曲曼创立于2008年，公司总部设在美丽的山城&amp;mdash;&amp;mdash;重庆。潜心研究中国市场，开创健康无海绵内衣新时代，集品牌创立、产品研发、生产销售于一体的内衣公司，是一家产品系列多样化、销售渠道广泛化、公司发展稳定化、品牌定位国际化、合作模式多元化的企业。</p></div></div>							 	','',NULL,NULL,0),(65,'<div class=\"video-container\"><div class=\"company-intro\"><ul class=\" list-paddingleft-2\"><li><img src=\"/uploadfile/ueditor/20171204/1512358606302814.png\"/></li><li>欧拉曲曼（Euler Tuchman）成立于2008年，是一家集设计研发、品牌运营、生产销售于一体的高端内衣企业。欧拉曲曼以优异的性价比和良好的售后服务精神赢得客户的青睐。领先时尚潮流的设计优势，专业的健康理念，量身配码的贴心服务，无效双倍退款的功效承诺，使欧拉曲曼成为了高档内衣界的一匹黑马！公司产品定位为高品质、中价位、注意健康、时尚、功效、无海绵添加，重视塑美功能，致力于打造女性S身材！欧拉曲曼致力专卖店推广模式，以及品牌推广和持续经营，给予投资人和客户双重保障，成为功能内衣的杰出品牌。</li></ul></div></div>\r\n							 								 					 								 	','',NULL,NULL,0),(66,'<div class=\"contact\"><ul class=\" list-paddingleft-2\"><li><img src=\"/uploadfile/ueditor/20171204/1512359077125510.png\" title=\"1512359077125510.png\" _src=\"/uploadfile/ueditor/20171204/1512359077125510.png\" alt=\"contact-img.png\"/></li><li>重庆南岸区亚太路9号</li><li>联系电话： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span>400-667-2276&nbsp;&nbsp;023-62380323</span></li><li>www.olqm.com</li><li>欢迎您随时与我们联系，我们将第一时间为您进行咨询解答服务</li><li><img src=\"/uploadfile/ueditor/20171204/1512359129362930.png\" title=\"1512359129362930.png\" _src=\"/uploadfile/ueditor/20171204/1512359129362930.png\" alt=\"contact-QRcode.png\"/></li></ul></div>							 	','',NULL,NULL,0),(69,'<div class=\"join\"><h3><img src=\"/uploadfile/ueditor/20171204/1512370545116629.png\" title=\"1512370545116629.png\" _src=\"/uploadfile/ueditor/20171204/1512370545116629.png\" alt=\"join-text1.png\"/></h3><img src=\"/uploadfile/ueditor/20171204/1512370558385435.png\" title=\"1512370558385435.png\" _src=\"/uploadfile/ueditor/20171204/1512370558385435.png\" alt=\"join-img.png\"/><ul class=\" list-paddingleft-2\"><li><span></span>缴纳加盟保证金，如未违反规定，词款项在合同解除时退还；</li><li><span></span>公司设有换货制，让您不用担心商品流通问题；</li><li><span></span>公司免费提供店面设计及装修效果图；</li><li><span></span>公司提供开业活动策划扶持；</li><li><span></span>公司提供各种宣传单，X展架等宣传资料的设计模板；</li><li><span></span>公司官方渠道推广及引流；</li><li><span></span>公司对店铺经营进行培训辅导；</li><li><span></span>公司将有专人对店铺筹备做一系列的跟进和配合工作。</li></ul></div>							 								 								 	','',NULL,NULL,0),(70,'<div class=\"flow\"><img src=\"/uploadfile/ueditor/20171204/1512370666625940.png\" title=\"1512370666625940.png\" _src=\"/uploadfile/ueditor/20171204/1512370666625940.png\" alt=\"join-text1.png\"/> &nbsp;<img src=\"/uploadfile/ueditor/20171204/1512370691502008.png\" title=\"1512370691502008.png\" _src=\"/uploadfile/ueditor/20171204/1512370691502008.png\" alt=\"flow-text2.png\"/><ul class=\" list-paddingleft-2\"><li><ul class=\" list-paddingleft-2\"><li>1</li><li>加盟申请</li><li>请到公司填写《加盟申请表》，或登录公司网站填写加盟申请；请拨打公司加盟热线：400-677-2276；</li></ul></li><li><ul class=\" list-paddingleft-2\"><li>2</li><li>加盟评估</li><li>公司将对经营人和投资商进行评估，审核经营区域，店面位置及大小，以及经营人的精力投入情况等；</li></ul></li><li><ul class=\" list-paddingleft-2\"><li>3</li><li>加盟规划</li><li>收入保证金后，公司总部将配合加盟商进行相关经营规划工作；</li></ul></li><li><ul class=\" list-paddingleft-2\"><li>4</li><li>加盟签约</li><li>公司和加盟商在经营思路和后期规划达成一致，签订《加盟合同》；</li></ul></li><li><ul class=\" list-paddingleft-2\"><li>5</li><li>加盟筹备</li><li>加盟店和公司总部人员，整理制定筹备进度表，展开筹备工作；</li></ul></li><li><ul class=\" list-paddingleft-2\"><li>6</li><li>加盟验收</li><li>公司总部验收所有筹备工作，必须达到公司的VI要求；</li></ul></li><li><ul class=\" list-paddingleft-2\"><li>7</li><li>开业筹备</li><li>按照加盟店的形象标准，公司督导下店给予开业支持和专业指导；</li></ul></li><li><ul class=\" list-paddingleft-2\"><li>8</li><li>后期跟进</li><li>正式营业后，公司总部将配合加盟店建立完善的管理体系，随时跟进提供经营指导。</li></ul></li></ul></div>							 								 	','',NULL,NULL,0),(71,'欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,NULL,0),(72,'欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,NULL,0),(73,'欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,NULL,0),(74,'欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,NULL,0),(75,'欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....欧拉腰背夹的五大好处！很多男性都会说：我又不减肥，又不塑身，穿美体内衣干什么？那么你的观点就错了，难道.....','',NULL,NULL,0),(76,'<p><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></p><p><span style=\"white-space: normal;\"><br/></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></span></p>','',NULL,NULL,0),(77,'							 	<p><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></p><p><br/></p><p>欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻<br/></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"></span></span></span>欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻欧拉曲曼测试新闻</p>							 								 								 	','',NULL,'/uploadfile/article/1513234253171_65.mp4',0),(78,'							 	<p><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></p><p><span style=\"white-space: normal;\"><br/></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></span></p>							 	','',NULL,NULL,0),(79,'							 	<p><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></p><p><span style=\"white-space: normal;\"><br/></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></span></p>							 	','',NULL,NULL,0),(80,'							 	<p><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></p><p><span style=\"white-space: normal;\"><br/></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></span></p>							 	','',NULL,NULL,0),(81,'<p><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></p><p><span style=\"white-space: normal;\"><br/></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><br/></span></span></span></p><p><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\"><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span><span style=\"white-space: normal;\">欧拉曲曼测试新闻</span></span></span></span></p>','',NULL,NULL,0),(82,'<p>测试标题名称测试标题名称</p><p>测试标题名称</p><p>测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p>','',NULL,NULL,0),(83,'<p>测试标题名称测试标题名称</p><p>测试标题名称</p><p>测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p>','',NULL,NULL,0),(84,'<p>测试标题名称测试标题名称</p><p>测试标题名称</p><p>测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p>','',NULL,NULL,0),(85,'<p>测试标题名称测试标题名称</p><p>测试标题名称</p><p>测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p>','',NULL,NULL,0),(86,'<p>测试标题名称测试标题名称</p><p>测试标题名称</p><p>测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p>','',NULL,NULL,0),(87,'<p>测试标题名称测试标题名称</p><p>测试标题名称</p><p>测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p>测试标题名称测试标题名称测试标题名称</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p><p><br/></p><p>this is english title test</p>','',NULL,NULL,0),(88,'<div class=\"video-container\"><div class=\"video-intro\"><div><img src=\"/ststic/undies/images/video-bg.png\"/><div class=\"data-type\"></div><video src=\"/uploadfile/vdieo/video.mp4\" controls=\"controls\"></video></div><ul class=\" list-paddingleft-2\"><li>欧拉曲曼品牌宣传</li><li>领先时尚潮流，专业的健康理念</li><li>量身配码的贴心服务，无效双倍退款的功效承诺</li></ul></div></div>							 								 	','',NULL,NULL,0),(89,'这里是测试中文回答内容1','<span style=\"white-space: normal;\">这里是测试中文回答内容2</span>','<span style=\"white-space: normal;\">这里是测试中文回答内容3</span>','',0),(90,'这里是中文测试问题啊啊啊这里是中文测试问题啊啊啊','<span style=\"white-space: normal;\">这里是中文测试问题啊啊啊</span><span style=\"white-space: normal;\">这里是中文测试问题啊啊啊2</span>','<span style=\"white-space: normal;\">这里是中文测试问题啊啊啊</span><span style=\"white-space: normal;\">这里是中文测试问题啊啊啊3</span>','',0),(91,'\r\n							 	测试标题哦哦哦测试标题哦哦哦测试标题哦哦哦测试标题哦哦哦							 	','\r\n							 	测试标题哦哦哦测试标题哦哦哦测试标题哦哦哦							 	','\r\n							 	测试标题哦哦哦测试标题哦哦哦测试标题哦哦哦							 	','',771),(92,'\r\n							 	整个图片测试一下哟							 	','\r\n							 	整个图片测试一下哟							 	','\r\n							 	整个图片测试一下哟							 	','',771),(93,'\r\n							 	范德萨范德萨发							 	','							 	<span style=\"white-space: normal;\">范德萨范德萨发</span>							 	','							 	<span style=\"white-space: normal;\">范德萨范德萨发</span>							 	','',771);

/*Table structure for table `dh_article_download` */

DROP TABLE IF EXISTS `dh_article_download`;

CREATE TABLE `dh_article_download` (
  `id` int(11) DEFAULT NULL,
  `down_url` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_article_download` */

insert  into `dh_article_download`(`id`,`down_url`) values (60,'/uploadfile/test/151178135624664.zip,/uploadfile/test/151178135730629.zip'),(61,'/uploadfile/test/1511924745164_14.zip');

/*Table structure for table `dh_article_shop` */

DROP TABLE IF EXISTS `dh_article_shop`;

CREATE TABLE `dh_article_shop` (
  `id` int(10) unsigned DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `lng` varchar(20) DEFAULT '0' COMMENT '经度',
  `lat` varchar(20) DEFAULT '0' COMMENT '维度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_article_shop` */

insert  into `dh_article_shop`(`id`,`address`,`lng`,`lat`) values (67,'渝北两路口轻轨站','106.569598','29.561573'),(68,'测试店铺地址大概位置是渝中区政府','106.572041','29.591602');

/*Table structure for table `dh_article_teacher` */

DROP TABLE IF EXISTS `dh_article_teacher`;

CREATE TABLE `dh_article_teacher` (
  `id` int(10) unsigned NOT NULL,
  `teacher_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联教师用户uid',
  `position` varchar(50) DEFAULT NULL COMMENT '职位',
  `position_en` varchar(50) DEFAULT NULL COMMENT '职位英文'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_teacher` */

insert  into `dh_article_teacher`(`id`,`teacher_uid`,`position`,`position_en`) values (16,8,'深知高数讲师','Know high number of lecturers'),(36,1,'高级数学导师','Senior Math Teacher'),(39,1,'',''),(38,1,'',''),(40,1,'',''),(37,1,'',''),(41,1,'','');

/*Table structure for table `dh_banner` */

DROP TABLE IF EXISTS `dh_banner`;

CREATE TABLE `dh_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(25) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `dh_banner` */

insert  into `dh_banner`(`id`,`title`) values (1,'布里斯班处理中心'),(2,'中国'),(3,'北美'),(6,'澳洲中心');

/*Table structure for table `dh_banner_data` */

DROP TABLE IF EXISTS `dh_banner_data`;

CREATE TABLE `dh_banner_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) DEFAULT '0' COMMENT 'banner表主键',
  `path` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `description` varchar(500) DEFAULT NULL COMMENT '图片介绍',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `app_type` tinyint(1) unsigned DEFAULT '0' COMMENT 'app跳转类型',
  `app_value` varchar(250) DEFAULT '' COMMENT '跳转值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `dh_banner_data` */

insert  into `dh_banner_data`(`id`,`banner_id`,`path`,`description`,`sort`,`app_type`,`app_value`) values (2,1,'18a8cd41104cce314f3da9f0e1dbd4ad.png','222',0,1,'1'),(3,1,'789a0cc0382edfcdab89a19479aa7e30.png','2222',3,2,'1'),(4,2,'eda430b358d1babf96e4c3a985449b15.png','',0,0,''),(5,2,'c8daba28decb8775d415cf67ceb32b2a.png','',0,0,'');

/*Table structure for table `dh_category` */

DROP TABLE IF EXISTS `dh_category`;

CREATE TABLE `dh_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) unsigned DEFAULT '0' COMMENT '父级id',
  `thumb` varchar(100) DEFAULT '' COMMENT '缩略图',
  `name` varchar(100) DEFAULT '' COMMENT '分类名称',
  `name_en` varchar(100) DEFAULT '' COMMENT '英文分类名称',
  `name_jp` varchar(100) DEFAULT '' COMMENT '日文分类名称',
  `bname` varchar(100) DEFAULT '' COMMENT '别名',
  `bname_2` varchar(10) DEFAULT '' COMMENT '其他信息',
  `alias` varchar(100) DEFAULT '' COMMENT '别名',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '显示状态 1显示 0不显示',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8 COMMENT='分类表\r\n';

/*Data for the table `dh_category` */

insert  into `dh_category`(`id`,`parentid`,`thumb`,`name`,`name_en`,`name_jp`,`bname`,`bname_2`,`alias`,`sort`,`is_show`,`created`) values (1,0,'','汽车品牌','','','','','',0,1,0),(2,1,'','奥拓','','','','','',1,1,0),(3,1,'3e4daf03cb497d10e0267b0f7b7de7df.png','大众','','','','','',0,1,0),(4,0,'','爱车服务首页栏目','','','','','',0,1,0),(5,4,'','汽车贴膜','','','','','',0,1,0),(6,4,'','汽车维修','','','','','',0,1,0),(7,4,'','汽车保养','','','','','',0,1,0),(8,0,'','国家','','','国家','','',0,1,0),(9,34,'','Toronto','','','Toronto','','',0,1,0),(10,34,'','North-York','','','','','',0,1,0),(11,34,'','Downtown','','','','','',0,1,0),(12,34,'','Markham','','','','','',0,1,0),(13,34,'','Vaughan','','','','','',0,1,0),(14,34,'','Scarborough','','','','','',0,1,0),(15,34,'','Brampton','','','','','',0,1,0),(16,34,'','Mississauga','','','','','',0,1,0),(17,34,'','Richmond-hill','','','Richmond-hill','','',0,1,0),(18,34,'','Newmarket','','','','','',0,1,0),(19,0,'','店铺分类','','','','','',0,1,0),(20,19,'d85bbc8ef694ff9eddc10ebdbb0bf254.png','汽车贴膜','','','','','',0,1,0),(21,19,'cf3d5e9d9412aa9e5c2dbf051a901b52.png','汽车改装','','','','','',0,1,0),(22,19,'3cd1da8c1f0336c1c8cf68dfadc97694.png','汽车清洗','','','','','',0,1,0),(23,19,'','汽车售卖','','','','','',0,1,0),(24,19,'1e047624c9ac1d887699e3e9e9da8708.png','汽车保养','','','','','',0,1,0),(25,1,'','宝马','','','','','',0,1,0),(26,1,'','丰田','','','','','',0,1,0),(27,1,'','本田','','','','','',0,1,0),(28,1,'','雪佛兰','','','','','',0,1,0),(29,1,'','福克斯','','','','','',0,1,0),(30,1,'','雷洛','','','','','',0,1,0),(31,1,'','奥迪','','','','','',0,1,0),(32,1,'','阿尔法·罗密欧','','','','','',0,1,0),(33,1,'','讴歌','','','','','',0,1,0),(34,8,'','加拿大','Canada','','CAD','','',0,1,0),(35,8,'','中华人民共和国','China','中国','RMB','','',0,1,0),(36,35,'','北京市','Beijing City','','北京市','','',0,1,0),(37,35,'','上海市','Shanghai City','','天津市','','',0,1,0),(38,35,'','天津市','Tianjin City','','天津市','','',0,1,0),(39,35,'','重庆市','Chongqing City','','','','',0,1,0),(40,35,'','河北省','Hebei Province','','','','',0,1,0),(41,35,'','山西省','Shanxi Province','','','','',0,1,0),(42,35,'','吉林省','Jilin Province','','','','',0,1,0),(43,35,'','辽宁省','Liaoning Province','','','','',0,1,0),(44,35,'','山东省','Shandong Province','','','','',0,1,0),(45,35,'','江苏省','Jiangsu Province','','','','',0,1,0),(46,35,'','浙江省','Zhejiang Province','','','','',0,1,0),(47,35,'','安徽省','Anhui Province','','','','',0,1,0),(48,35,'','福建省','Fujian Province','','','','',0,1,0),(49,35,'','河南省','Henan Province','','','','',0,1,0),(50,35,'','湖北省','Hubei Province','','','','',0,1,0),(51,35,'','湖南省','Hunan Province','','','','',0,1,0),(52,35,'','江西省','Jiangxi Province','','','','',0,1,0),(53,35,'','四川省','Sichuan Province','','','','',0,1,0),(54,35,'','云南省','Yunnan Province','','','','',0,1,0),(55,35,'','贵州省','Guizhou Province','','','','',0,1,0),(56,35,'','西藏自治区','Tibet Autonomous Region','','','','',0,1,0),(57,35,'','宁夏回族自治区','Ningxia Hui Autonomous Region','','','','',0,1,0),(58,35,'','新疆维吾尔自治区','Xinjiang Uygur Autonomous Region','','','','',0,1,0),(59,35,'','青海省','Qinghai Province','','','','',0,1,0),(60,35,'','陕西省','Shaanxi Province','','','','',0,1,0),(61,35,'','甘肃省','Gansu province','','','','',0,1,0),(62,35,'','广东省','Guangdong Province','','','','',0,1,0),(63,35,'','广西壮族自治区','Guangxi Zhuang Autonomous Region','','广西壮族自治区','','',0,1,0),(64,35,'','海南省','Hainan Province','','','','',0,1,0),(65,35,'','香港特别行政区','Hong Kong SAR','','','','',0,1,0),(66,35,'','澳门特别行政区','Macao SAR','','','','',0,1,0),(67,35,'','台湾特别行政区','Taiwan SAR','','','','',0,1,0),(68,35,'','内蒙古自治区','Inner Mongolia','','','','',0,1,0),(69,35,'','黑龙江省','Heilongjiang Province','','','','',0,1,0),(70,19,'351a19f62839ba561f10fd26c2599a88.png','LEASE','','','','','',0,1,0),(71,19,'a5de0581a7726d26bc8fde02ad273682.png','汽车保险','','','','','',0,1,0),(72,19,'9d6a5a4b8a0c3b6135d0784ddf135219.png','交通告票','','','','','',0,1,0),(73,19,'11ac8c23d53f75c53dd07c811b515498.png','汽车维修','','','','','',0,1,0),(74,0,'','老师课程课时类型','','','老师课程课时类型','','',0,1,0),(75,74,'','一类','','','一类','','',0,1,0),(76,74,'','二类','','','二类','','',0,1,0),(77,74,'','三类','','','三类','','',0,1,0),(78,0,'','课程特色','','','课程特色','','',0,1,0),(79,78,'','证书颁发','','','certificate','','',0,1,0),(80,78,'','一对一授课','','','alone teach','','',0,1,0),(82,8,'','日本','Japan','日本','JPY','','',0,1,0),(83,8,'','澳大利亚','Australia','オーストラリア','AUD','','',0,1,0),(84,36,'','东城区','Dongcheng District','東城区','东城区','','',0,1,0),(85,36,'','西城区','Xicheng District','西城区','西城区','','',0,1,0),(86,36,'','朝阳区','Chaoyang District','朝陽区','朝阳区','','',0,1,0),(87,36,'','丰台区','Fengtai District','豊台区','丰台区','','',0,1,0),(88,36,'','海淀区','Haidian District','海澱区','海淀区','','',0,1,0),(89,36,'','房山区','Fangshan District','房山区','房山区','','',0,1,0),(90,36,'','通州区','Tongzhou District','通州区','通州区','','',0,1,0),(91,36,'','顺义区','Shunyi District','順義区','顺义区','','',0,1,0),(92,36,'','昌平区','Changping District','昌平区','昌平区','','',0,1,0),(93,36,'','大兴区','Daxing District','大興区','大兴区','','',0,1,0),(94,36,'','怀柔区','Huairou District','懐柔区','怀柔区','','',0,1,0),(95,36,'','平谷区','Pinggu District','平穀区','平谷区','','',0,1,0),(96,36,'','密云区','Miyun District','密雲区','密云区','','',0,1,0),(97,36,'','延庆区','Yanqing District','延慶区','延庆区','','',0,1,0),(98,36,'','石景山区','Shijingshan District','石の山地','石景山区','','',0,1,0),(99,36,'','门头沟区','Mentougou District','門頭溝区','门头沟区','','',0,1,0),(100,37,'','黄浦区','Huangpu District','黄浦区','黄浦区','','',0,1,0),(101,37,'','徐汇区','Xuhui District','徐匯区','徐汇区','','',0,1,0),(102,37,'','长宁区','Changning District','長寧区','长宁区','','',0,1,0),(103,37,'','静安区','Jingan District','静安区','静安区','','',0,1,0),(104,37,'','普陀区','Putuo District','Putuo区','普陀区','','',0,1,0),(105,37,'','虹口区','Hongkou District','虹口区','虹口区','','',0,1,0),(106,37,'','杨浦区','yangpu district','楊浦区','杨浦区','','',0,1,0),(107,37,'','闵行区','Minhang District','閔行区','闵行区','','',0,1,0),(108,37,'','宝山区','Baoshan District','宝山地','宝山区','','',0,1,0),(109,37,'','嘉定区','Jiading District','嘉定区','嘉定区','','',0,1,0),(110,37,'','金山区','Jinshan District','金山地','金山区','','',0,1,0),(111,37,'','松江区','Songjiang District','松江区','松江区','','',0,1,0),(112,37,'','青浦区','Qingpu District','靑浦区','青浦区','','',0,1,0),(113,37,'','奉贤区','Fengxian District','奉賢区','奉贤区','','',0,1,0),(114,37,'','浦东新区','Pudong New Area','浦東新区','浦东新区','','',0,1,0),(115,38,'','和平区','Zone of peace','平和区域','和平区','','',0,1,0),(116,38,'','河东区','Hedong District','河東区','河东区','','',0,1,0),(117,38,'','河西区','Hexi District','河西区','河西区','','',0,1,0),(118,38,'','南开区','Nankai District','南開区','南开区','','',0,1,0),(119,38,'','河北区','Hebei District','河北区','河北区','','',0,1,0),(120,38,'','红桥区','Hongqiao District','紅橋区','红桥区','','',0,1,0),(121,38,'','东丽区','dongli district','東レ区','东丽区','','',0,1,0),(122,38,'','西青区','Xiqing District','西靑区','西青区','','',0,1,0),(123,38,'','津南区','jinnan district','津南区','津南区','','',0,1,0),(124,38,'','北辰区','Beichen District','北辰区','北辰区','','',0,1,0),(125,38,'','武清区','Wuqing District','武清区','武清区','','',0,1,0),(126,38,'','宝坻区','Baodi District','宝テイ区','宝坻区','','',0,1,0),(127,38,'','宁河区','Ninghe District','寧河区','宁河区','','',0,1,0),(128,38,'','静海区','Jinghai District','静海区','静海区','','',0,1,0),(129,38,'','滨海新区','binhai new area','浜海新区','滨海新区','','',0,1,0),(130,39,'','璧山区','Bishan District','璧山区','璧山区','','',0,1,0),(131,39,'','荣昌区','Rongchang District','栄昌区','荣昌区','','',0,1,0),(132,39,'','铜梁区','Tongliang District','銅梁区','铜梁区','','',0,1,0),(133,39,'','合川区','Hechuan district','合川区','合川区','','',0,1,0),(134,39,'','巴南区','banan district','巴南区','巴南区','','',0,1,0),(135,39,'','北碚区','Beibei District','北碚区','北碚区','','',0,1,0),(136,39,'','江津区','Jiangjin District','江津区','江津区','','',0,1,0),(137,39,'','渝北区','Yubei District','渝北区','渝北区','','',0,1,0),(138,39,'','长寿区','changshou district','長寿区','长寿区','','',0,1,0),(139,39,'','永川区','yongchuan district','永川区','永川区','','',0,1,0),(140,39,'','江北区','jiangbei district','江北区','江北区','','',0,1,0),(141,39,'','南岸区','Nanan District','南岸区','南岸区','','',0,1,0),(142,39,'','九龙坡区','jiulongpo district','九竜坡区','九龙坡区','','',0,1,0),(143,39,'','沙坪坝区','shapingba district','沙坪ハ区','沙坪坝区','','',0,1,0),(144,39,'','大渡口区','dadukou district','大渡口区','大渡口区','','',0,1,0),(145,39,'','綦江区','Qijiang District','キ江区','綦江区','','',0,1,0),(146,39,'','渝中区','Yuzhong District','渝中区','渝中区','','',0,1,0),(147,39,'','高新区','Hi-tech Zone','ハイテク産業','高新区','','',0,1,0),(148,39,'','北部新区','Northern New Area','北区','北部新区','','',0,1,0),(149,39,'','万州区','Wanzhou District','万州区','万州区','','',0,1,0),(150,39,'','涪陵区','fuling district','フウ陵区','涪陵区','','',0,1,0),(151,39,'','梁平区','Liangping area','梁平区','梁平区','','',0,1,0),(152,39,'','南川区','Nanchuan District','南川区','南川区','','',0,1,0),(153,39,'','潼南区','Tongnan District','潼南区','潼南区','','',0,1,0),(154,39,'','大足区','Dazu District','大足区','大足区','','',0,1,0),(155,39,'','黔江区','Qianjiang district','おり区','黔江区','','',0,1,0),(156,39,'','武隆区','Wulong District','武隆区','武隆区','','',0,1,0),(157,39,'','丰都县','Fengdu County','丰都県','丰都县','','',0,1,0),(158,39,'','奉节县','Fengjie County','奉节県','奉节县','','',0,1,0),(159,39,'','开州区','The State District','开州区','开州区','','',0,1,0),(160,39,'','云阳县','Yunyang County','雲陽県','云阳县','','',0,1,0),(161,39,'','忠县','Zhongxian','忠县','忠县','','',0,1,0),(162,39,'','巫溪县','Wuxi County','巫溪県','巫溪县','','',0,1,0),(163,39,'','巫山县','Wushan County','巫山県','巫山县','','',0,1,0),(164,39,'','石柱县','Shizhu County','石柱県','石柱县','','',0,1,0),(165,39,'','彭水县','pengshui county','彭水県','彭水县','','',0,1,0),(166,39,'','垫江县','Dianjiang County','デン江県','垫江县','','',0,1,0),(167,39,'','酉阳县','Youyang County','酉阳県','酉阳县','','',0,1,0),(168,39,'','秀山县','Xiushan County','秀山県','秀山县','','',0,1,0),(169,39,'','城口县','Chengkou County','城口県','城口县','','',0,1,0),(170,40,'','石家庄市','Shijiazhuang City','石家荘市','石家庄市','','',0,1,0),(171,40,'','邯郸市','Handan City','邯鄲市','邯郸市','','',0,1,0),(172,40,'','邢台市','Xingtai City','ケイ台市','邢台市','','',0,1,0),(173,40,'','保定市','Baoding City','保定市','保定市','','',0,1,0),(174,40,'','张家口市','Zhangjiakou City','張家口市','张家口市','','',0,1,0),(175,40,'','承德市','Chengde City','承徳市','承德市','','',0,1,0),(176,40,'','秦皇岛市','Qinhuangdao City','秦皇島市','秦皇岛市','','',0,1,0),(177,40,'','唐山市','Tangshan City','唐山市','唐山市','','',0,1,0),(178,40,'','沧州市','Cangzhou City','滄州市','沧州市','','',0,1,0),(179,40,'','廊坊市','Langfang City','廊坊市','廊坊市','','',0,1,0),(180,40,'','衡水市','Hengshui City','衡水市','衡水市','','',0,1,0),(181,41,'','太原市','Taiyuan City','太原市','太原市','','',0,1,0),(182,41,'','大同市','Datong','大同市','大同市','','',0,1,0),(183,41,'','阳泉市','Yangquan City','陽泉市','阳泉市','','',0,1,0),(184,41,'','晋城市','Jincheng City','晋城市','晋城市','','',0,1,0),(185,41,'','朔州市','Shuozhou City','朔州市','朔州市','','',0,1,0),(186,41,'','晋中市','Jinzhong','晋中市','晋中市','','',0,1,0),(187,41,'','忻州市','xinzhou','忻州市','忻州市','','',0,1,0),(188,41,'','吕梁市','Lüliang City','呂梁山市','吕梁市','','',0,1,0),(189,41,'','临汾市','Linfen City','臨汾市','临汾市','','',0,1,0),(190,41,'','运城市','Yuncheng City','運城市','运城市','','',0,1,0),(191,41,'','长治市','Changzhi City','長治市','长治市','','',0,1,0),(192,42,'','长春市','Changchun City','長春市','长春市','','',0,1,0),(193,42,'','吉林市','Jilin City','吉林市','吉林市','','',0,1,0),(194,42,'','四平市','Siping City','四平市','四平市','','',0,1,0),(195,42,'','辽源市','Liaoyuan City','遼源市','辽源市','','',0,1,0),(196,42,'','通化市','Tonghua City','通化市','通化市','','',0,1,0),(197,42,'','白山市','Baishan City','白山市','白山市','','',0,1,0),(198,42,'','松原市','Songyuan City','松原市','松原市','','',0,1,0),(199,42,'','白城市','Baicheng City','白城市','白城市','','',0,1,0),(200,42,'','延边州','Yanbian','延方州','延边州','','',0,1,0),(201,43,'','沈阳市','Shenyang City','瀋陽市','沈阳市','','',0,1,0),(202,43,'','大连市','Dalian','大連市','大连市','','',0,1,0),(203,43,'','鞍山市','Anshan City','鞍山市','鞍山市','','',0,1,0),(204,43,'','抚顺市','Fushun City','撫順市','抚顺市','','',0,1,0),(205,43,'','本溪市','Benxi City','本渓市','本溪市','','',0,1,0),(206,43,'','丹东市','Dandong City','丹東市','丹东市','','',0,1,0),(207,43,'','锦州市','Jinzhou City','錦州市','锦州市','','',0,1,0),(208,43,'','葫芦岛市','Huludao City','葫芦島市','葫芦岛市','','',0,1,0),(209,43,'','营口市','Yingkou City','営口市','营口市','','',0,1,0),(210,43,'','盘锦市','Panjin City','盤錦市','盘锦市','','',0,1,0),(211,43,'','阜新市','Fuxin City','阜新市','阜新市','','',0,1,0),(212,43,'','辽阳市','Liaoyang City','遼陽市','辽阳市','','',0,1,0),(213,43,'','朝阳市','Chaoyang City','朝陽市','朝阳市','','',0,1,0),(214,43,'','铁岭市','tieling city','鉄嶺市','铁岭市','','',0,1,0),(215,44,'','济宁市','Jining City','済寧市','济宁市','','',0,1,0),(216,44,'','济南市','Jinan City','済南市','济南市','','',0,1,0),(217,44,'','青岛市','Qingdao City','青島市','青岛市','','',0,1,0),(218,44,'','淄博市','Zibo City','淄博市','淄博市','','',0,1,0),(219,44,'','枣庄市','Zaozhuang City','棗荘市','枣庄市','','',0,1,0),(220,44,'','东营市','Dongying City','東営市','东营市','','',0,1,0),(221,44,'','潍坊市','Weifang City','イ坊市','潍坊市','','',0,1,0),(222,44,'','烟台市','Yantai City','煙台市','烟台市','','',0,1,0),(223,44,'','威海市','Weihai City','威海市','威海市','','',0,1,0),(224,44,'','莱芜市','Laiwu','莱蕪市','莱芜市','','',0,1,0),(225,44,'','德州市','Dezhou City','徳州市','德州市','','',0,1,0),(226,44,'','临沂市','Linyi City','臨沂市','临沂市','','',0,1,0),(227,44,'','聊城市','LiaoCheng','聊城市','聊城市','','',0,1,0),(228,44,'','滨州市','Binzhou City','浜州市','滨州市','','',0,1,0),(229,44,'','菏泽市','Heze City','荷沢市','菏泽市','','',0,1,0),(230,44,'','日照市','Rizhao City','日照市','日照市','','',0,1,0),(231,44,'','泰安市','Tai\'an City','泰安市','泰安市','','',0,1,0),(232,45,'','南京市','Nanjing City','南京市','南京市','','',0,1,0),(233,45,'','徐州市','Xuzhou City','徐州市','徐州市','','',0,1,0),(234,45,'','连云港市','Lianyungang City','連雲港市','连云港市','','',0,1,0),(235,45,'','淮安市','Huaian City','淮安市','淮安市','','',0,1,0),(236,45,'','宿迁市','Suqian City','宿遷市','宿迁市','','',0,1,0),(237,45,'','盐城市','yancheng','塩城市','盐城市','','',0,1,0),(238,45,'','扬州市','Yangzhou City','揚州市','扬州市','','',0,1,0),(239,45,'','泰州市','Taizhou City','泰州市','泰州市','','',0,1,0),(240,45,'','南通市','Nantong City','南通市','南通市','','',0,1,0),(241,45,'','镇江市','Zhenjiang City','鎮江市','镇江市','','',0,1,0),(242,45,'','常州市','Changzhou City','常州市','常州市','','',0,1,0),(243,45,'','无锡市','Wuxi City','無錫市','无锡市','','',0,1,0),(244,45,'','苏州市','Suzhou City','蘇州市','苏州市','','',0,1,0),(245,46,'','宁波市','Ningbo City','寧波市','宁波市','','',0,1,0),(246,46,'','衢州市','Quzhou City','衢州市','衢州市','','',0,1,0),(247,46,'','丽水市','Lishui City','麗水市','丽水市','','',0,1,0),(248,46,'','台州市','Taizhou City','台州市','台州市','','',0,1,0),(249,46,'','舟山市','Zhoushan City','舟山市','舟山市','','',0,1,0),(250,46,'','杭州市','Hangzhou City','杭州市','杭州市','','',0,1,0),(251,46,'','温州市','Wenzhou City','温州市','温州市','','',0,1,0),(252,46,'','嘉兴市','Jiaxing City','嘉興市','嘉兴市','','',0,1,0),(253,46,'','湖州市','Huzhou City','湖州市','湖州市','','',0,1,0),(254,46,'','绍兴市','Shaoxing City','紹興市','绍兴市','','',0,1,0),(255,46,'','金华市','Jinhua City','金華市','金华市','','',0,1,0),(256,47,'','黄山市','Huangshan City','黄山市','黄山市','','',0,1,0),(257,47,'','滁州市','Chuzhou City','ジョ州市','滁州市','','',0,1,0),(258,47,'','阜阳市','Fuyang City','阜陽市','阜阳市','','',0,1,0),(259,47,'','亳州市','Bozhou City','亳州市','亳州市','','',0,1,0),(260,47,'','宿州市','Suzhou City','宿州市','宿州市','','',0,1,0),(261,47,'','池州市','chizhou','池州市','池州市','','',0,1,0),(262,47,'','六安市','Lu\'an City','六安市','六安市','','',0,1,0),(263,47,'','宣城市','Xuancheng City','宣城市','宣城市','','',0,1,0),(264,47,'','铜陵市','tongling','銅陵市','铜陵市','','',0,1,0),(265,47,'','合肥市','Hefei City','合肥市','合肥市','','',0,1,0),(266,47,'','淮南市','Huainan City','淮南市','淮南市','','',0,1,0),(267,47,'','淮北市','Huaibei City','淮北市','淮北市','','',0,1,0),(268,47,'','芜湖市','Wuhu City','蕪湖市','芜湖市','','',0,1,0),(269,47,'','蚌埠市','Bengbu City','蚌埠市','蚌埠市','','',0,1,0),(270,47,'','马鞍山市','Ma\'anshan City','鞍山市','马鞍山市','','',0,1,0),(271,47,'','安庆市','Anqing City','安慶市','安庆市','','',0,1,0),(272,48,'','福州市','Fuzhou City','福州市','福州市','','',0,1,0),(273,48,'','厦门市','Xiamen City','廈門市','厦门市','','',0,1,0),(274,48,'','三明市','Sanming City','三明市','三明市','','',0,1,0),(275,48,'','莆田市','Putian City','莆田市','莆田市','','',0,1,0),(276,48,'','泉州市','Quanzhou City','泉州市','泉州市','','',0,1,0),(277,48,'','漳州市','Zhangzhou City','漳州市','漳州市','','',0,1,0),(278,48,'','南平市','Nanping City','南平市','南平市','','',0,1,0),(279,48,'','龙岩市','Longyan City','竜岩市','龙岩市','','',0,1,0),(280,48,'','宁德市','Ningde City','寧徳市','宁德市','','',0,1,0),(281,49,'','郑州市','Zhengzhou City','鄭州市','郑州市','','',0,1,0),(282,49,'','开封市','Kaifeng City','開封市','开封市','','',0,1,0),(283,49,'','洛阳市','Luoyang City','洛陽市','洛阳市','','',0,1,0),(284,49,'','平顶山市','Pingdingshan City','平頂山市','平顶山市','','',0,1,0),(285,49,'','焦作市','Jiaozuo City','焦作市','焦作市','','',0,1,0),(286,49,'','鹤壁市','Hebi City','鶴壁市','鹤壁市','','',0,1,0),(287,49,'','新乡市','Xinxiang City','新郷市','新乡市','','',0,1,0),(288,49,'','安阳市','Anyang City','安陽市','安阳市','','',0,1,0),(289,49,'','濮阳市','Puyang City','濮陽市','濮阳市','','',0,1,0),(290,49,'','许昌市','Xuchang City','許昌市','许昌市','','',0,1,0),(291,49,'','漯河市','Luohe City','漯河市','漯河市','','',0,1,0),(292,49,'','三门峡市','Sanmenxia City','三門峡市','三门峡市','','',0,1,0),(293,49,'','南阳市','Nanyang City','南陽市','南阳市','','',0,1,0),(294,49,'','商丘市','Shangqiu City','商丘市','商丘市','','',0,1,0),(295,49,'','周口市','Zhoukou','口市','周口市','','',0,1,0),(296,49,'','驻马店市','zhumadian','駐馬店市','驻马店市','','',0,1,0),(297,49,'','信阳市','Xinyang City','信陽市','信阳市','','',0,1,0),(298,49,'','济源市','Jiyuan City','済源市','济源市','','',0,1,0),(299,50,'','孝感市','Xiaogan City','孝感市','孝感市','','',0,1,0),(300,50,'','黄冈市','Huanggang City','黄市','黄冈市','','',0,1,0),(301,50,'','咸宁市','Xianning','咸寧市','咸宁市','','',0,1,0),(302,50,'','恩施州','enshi','恩施州','恩施州','','',0,1,0),(303,50,'','鄂州市','Ezhou City','鄂州市','鄂州市','','',0,1,0),(304,50,'','荆门市','Jingmen City','荊門市','荆门市','','',0,1,0),(305,50,'','随州市','suizhou','随州市','随州市','','',0,1,0),(306,50,'','神农架林区','Shennongjia Forestry District','はせている神農架森林区','神农架林区','','',0,1,0),(307,50,'','武汉市','Wuhan City','武漢市','武汉市','','',0,1,0),(308,50,'','黄石市','Huangshi City','黄石市','黄石市','','',0,1,0),(309,50,'','襄阳市','Xiangyang','襄陽市','襄阳市','','',0,1,0),(310,50,'','十堰市','Shiyan City','十堰市','十堰市','','',0,1,0),(311,50,'','荆州市','jingzhou','荊州市','荆州市','','',0,1,0),(312,50,'','宜昌市','Yichang City','宜昌市','宜昌市','','',0,1,0),(313,50,'','潜江市','Qianjiang','潜江市','潜江市','','',0,1,0),(314,50,'','天门市','Tianmen','天門市','天门市','','',0,1,0),(315,50,'','仙桃市','Xiantao','仙桃市','仙桃市','','',0,1,0),(316,51,'','长沙市','Changsha City','長沙市','长沙市','','',0,1,0),(317,51,'','株洲市','Zhuzhou City','株洲市','株洲市','','',0,1,0),(318,51,'','湘潭市','Xiangtan City','湘潭市','湘潭市','','',0,1,0),(319,51,'','衡阳市','Hengyang City','衡陽市','衡阳市','','',0,1,0),(320,51,'','邵阳市','Shaoyang City','邵陽市','邵阳市','','',0,1,0),(321,51,'','岳阳市','Yueyang City','岳陽市','岳阳市','','',0,1,0),(322,51,'','常德市','Changde City','常徳市','常德市','','',0,1,0),(323,51,'','张家界市','Zhangjiajie City','張家界市','张家界市','','',0,1,0),(324,51,'','郴州市','Chenzhou City','チン州市','郴州市','','',0,1,0),(325,51,'','益阳市','Yiyang City','益陽市','益阳市','','',0,1,0),(326,51,'','永州市','yongzhou city','永州市','永州市','','',0,1,0),(327,51,'','怀化市','huaihua','懐化市','怀化市','','',0,1,0),(328,51,'','娄底市','Loudi City','婁底市','娄底市','','',0,1,0),(329,51,'','湘西州','The state of Xiangxi','湘西州','湘西州','','',0,1,0),(330,52,'','南昌市','Nanchang City','南昌市','南昌市','','',0,1,0),(331,52,'','景德镇市','Jingdezhen City','景徳鎮市','景德镇市','','',0,1,0),(332,52,'','萍乡市','Pingxiang City','萍乡市','萍乡市','','',0,1,0),(333,52,'','新余市','Xinyu City','新余市','新余市','','',0,1,0),(334,52,'','九江市','Jiujiang','九江市','九江市','','',0,1,0),(335,52,'','鹰潭市','Yingtan City','鷹潭市','鹰潭市','','',0,1,0),(336,52,'','上饶市','Shangrao City','上饒市','上饶市','','',0,1,0),(337,52,'','宜春市','Yichun City','宜春市','宜春市','','',0,1,0),(338,52,'','抚州市','Fuzhou City','抚州市','抚州市','','',0,1,0),(339,52,'','吉安市','Ji\'an City','吉安市','吉安市','','',0,1,0),(340,52,'','赣州市','Ganzhou City','カン州市','赣州市','','',0,1,0),(341,53,'','凉山州','Liangshan','涼山州','凉山州','','',0,1,0),(342,53,'','成都市','Chengdu City','成都の市','成都市','','',0,1,0),(343,53,'','自贡市','Zigong City','自貢市','自贡市','','',0,1,0),(344,53,'','攀枝花市','Panzhihua City','攀枝花市','攀枝花市','','',0,1,0),(345,53,'','泸州市','Luzhou City','瀘州市','泸州市','','',0,1,0),(346,53,'','绵阳市','Mianyang City','綿陽市','绵阳市','','',0,1,0),(347,53,'','德阳市','deyang','徳陽市','德阳市','','',0,1,0),(348,53,'','广元市','Guangyuan City','広元市','广元市','','',0,1,0),(349,53,'','遂宁市','suining city','遂寧市','遂宁市','','',0,1,0),(350,53,'','内江市','Neijiang City','江市','内江市','','',0,1,0),(351,53,'','乐山市','Leshan City','楽山市','乐山市','','',0,1,0),(352,53,'','宜宾市','Yibin City','宜賓市','宜宾市','','',0,1,0),(353,53,'','广安市','Guang\'an City','広安市','广安市','','',0,1,0),(354,53,'','南充市','Nanchong City','南充市','南充市','','',0,1,0),(355,53,'','达州市','Dazhou City','州市','达州市','','',0,1,0),(356,53,'','巴中市','Bazhong City','巴中市','巴中市','','',0,1,0),(357,53,'','雅安市','Ya\'an City','雅安市','雅安市','','',0,1,0),(358,53,'','眉山市','Meishan City','眉山市','眉山市','','',0,1,0),(359,53,'','资阳市','Ziyang City','資陽市','资阳市','','',0,1,0),(360,53,'','阿坝州','Aba state','アバ州','阿坝州','','',0,1,0),(361,53,'','甘孜州','Ganzi','甘孜州','甘孜州','','',0,1,0),(362,54,'','迪庆州','Diqing','迪慶州','迪庆州','','',0,1,0),(363,54,'','昆明市','Kunming City','昆明市','昆明市','','',0,1,0),(364,54,'','曲靖市','Qujing','曲靖市','曲靖市','','',0,1,0),(365,54,'','玉溪市','YuXi','玉渓市','玉溪市','','',0,1,0),(366,54,'','昭通市','zhaotong','昭通市','昭通市','','',0,1,0),(367,54,'','普洱市','Pu\'er City','普洱市','普洱市','','',0,1,0),(368,54,'','临沧市','Lincang','臨滄市','临沧市','','',0,1,0),(369,54,'','保山市','baoshan','保山市','保山市','','',0,1,0),(370,54,'','丽江市','lijiang','麗江市','丽江市','','',0,1,0),(371,54,'','文山州','The state of Wenshan','文山州','文山州','','',0,1,0),(372,54,'','红河州','Red River State','紅河州','红河州','','',0,1,0),(373,54,'','西双版纳州','Xishuangbanna','シーサンパンナ州','西双版纳州','','',0,1,0),(374,54,'','楚雄州','Chuxiong','楚雄州','楚雄州','','',0,1,0),(375,54,'','大理州','Dali','大理州','大理州','','',0,1,0),(376,54,'','德宏州','Dehong','徳州','德宏州','','',0,1,0),(377,54,'','怒江州','Nujiang','サル州','怒江州','','',0,1,0),(378,55,'','贵阳市','Guiyang City','貴陽市','贵阳市','','',0,1,0),(379,55,'','六盘水市','liupanshui city','六盤水市','六盘水市','','',0,1,0),(380,55,'','遵义市','Zunyi City','遵義市','遵义市','','',0,1,0),(381,55,'','铜仁市','Tongren','銅仁市','铜仁市','','',0,1,0),(382,55,'','毕节市','Bijie City','畢節市','毕节市','','',0,1,0),(383,55,'','安顺市','Anshun City','安順市','安顺市','','',0,1,0),(384,55,'','黔西南州','qianxinan','黔西南州','黔西南州','','',0,1,0),(385,55,'','黔东南州','Qiandongnan','黔東南州','黔东南州','','',0,1,0),(386,55,'','黔南州','Qiannan','黔南州','黔南州','','',0,1,0),(387,56,'','阿里地区','Ali Area','アリ地区','阿里地区','','',0,1,0),(388,56,'','林芝市','Linzhi City','ニンティ市','林芝市','','',0,1,0),(389,56,'','拉萨市','Lhasa City','ラサ市','拉萨市','','',0,1,0),(390,56,'','那曲地区','Nagqu area','ナクチュ地区','那曲地区','','',0,1,0),(391,56,'','山南地区','Shannan Area','山南地区','山南地区','','',0,1,0),(392,56,'','昌都地区','Changdu region','チャムド地区','昌都地区','','',0,1,0),(393,56,'','日喀则地区','Shigatse region','シガツェ地区','日喀则地区','','',0,1,0),(394,57,'','银川市','Yinchuan City','銀川市','银川市','','',0,1,0),(395,57,'','石嘴山市','Shizuishan','石嘴山市','石嘴山市','','',0,1,0),(396,57,'','吴忠市','Wuzhong city','呉忠市','吴忠市','','',0,1,0),(397,57,'','固原市','Guyuan City','固原市','固原市','','',0,1,0),(398,57,'','中卫市','Zhong Wei City','中衛市','中卫市','','',0,1,0),(399,58,'','铁门关市','Tiemenguan City','鉄門関市','铁门关市','','',0,1,0),(400,58,'','五家渠市','Wujiaqu','五家渠市','五家渠市','','',0,1,0),(401,58,'','阿拉尔市','Alar City','阿拉尔市','阿拉尔市','','',0,1,0),(402,58,'','图木舒克市','Tumxuk','トムシュク市','图木舒克市','','',0,1,0),(403,58,'','乌鲁木齐市','Urumqi City','ウルムチ市','乌鲁木齐市','','',0,1,0),(404,58,'','克拉玛依市','Karamay City','カラマイ市','克拉玛依市','','',0,1,0),(405,58,'','石河子市','Shihezi City','石河子市','石河子市','','',0,1,0),(406,58,'','吐鲁番地区','Turpan region','トルファン地区','吐鲁番地区','','',0,1,0),(407,58,'','哈密地区','Hami region','クムル地区','哈密地区','','',0,1,0),(408,58,'','和田地区','Hetian Area','ホータン地区','和田地区','','',0,1,0),(409,58,'','阿克苏地区','Akesu region','アクス地区','阿克苏地区','','',0,1,0),(410,58,'','喀什地区','Kashi region','カシュガル地区','喀什地区','','',0,1,0),(411,58,'','克孜勒苏柯尔克孜自治州','Kirgiz Autonomous Prefecture','クズルス・キルギス自治州','克孜勒苏柯尔克孜自治州','','',0,1,0),(412,58,'','巴音郭楞州','Bayinhe Guo Lengzhou','巴音郭楞州','巴音郭楞州','','',0,1,0),(413,58,'','昌吉州','changji','昌吉州','昌吉州','','',0,1,0),(414,58,'','博尔塔拉州','Bortala','ボルタラ州','博尔塔拉州','','',0,1,0),(415,58,'','伊犁州','Yili','イリ州','伊犁州','','',0,1,0),(416,58,'','塔城地区','Tacheng region','タルバガタイ地区','塔城地区','','',0,1,0),(417,58,'','阿勒泰地区','Aletai region','アルタイ地区','阿勒泰地区','','',0,1,0),(418,58,'','昆玉市','Yuxi City','兄弟市','昆玉市','','',0,1,0),(419,59,'','西宁市','Xining City','西寧市','西宁市','','',0,1,0),(420,59,'','海东地区','Haidong Prefecture','海東地区','海东地区','','',0,1,0),(421,59,'','海北州','Haibei','海北州','海北州','','',0,1,0),(422,59,'','黄南州','huangnan','黄南州','黄南州','','',0,1,0),(423,59,'','海南州','Hainan','海南州','海南州','','',0,1,0),(424,59,'','果洛州','Guoluo','果洛州','果洛州','','',0,1,0),(425,59,'','玉树州','The state of Yushu','玉樹玉樹州','玉树州','','',0,1,0),(426,59,'','海西州','Haixi','海西州','海西州','','',0,1,0),(427,60,'','延安市','Yanan City','延安市','延安市','','',0,1,0),(428,60,'','汉中市','Hanzhoung City','漢中市','汉中市','','',0,1,0),(429,60,'','榆林市','Yulin City','楡林市','榆林市','','',0,1,0),(430,60,'','商洛市','shangluo','商洛市','商洛市','','',0,1,0),(431,60,'','安康市','Ankang City','安康市','安康市','','',0,1,0),(432,60,'','西安市','Xi\'an City','西安市','西安市','','',0,1,0),(433,60,'','铜川市','Tongchuan City','銅川市','铜川市','','',0,1,0),(434,60,'','宝鸡市','Baoji City','宝鶏市','宝鸡市','','',0,1,0),(435,60,'','咸阳市','Xianyang City','咸陽市','咸阳市','','',0,1,0),(436,60,'','渭南市','Weinan City','渭南市','渭南市','','',0,1,0),(437,61,'','庆阳市','qingyang','慶陽市','庆阳市','','',0,1,0),(438,61,'','陇南市','Longnan City','隴南市','陇南市','','',0,1,0),(439,61,'','武威市','Wuwei City','武威市','武威市','','',0,1,0),(440,61,'','张掖市','Zhangye City','張掖市','张掖市','','',0,1,0),(441,61,'','酒泉市','jiuquan','酒泉市','酒泉市','','',0,1,0),(442,61,'','甘南州','Gannan','甘粛省南部州','甘南州','','',0,1,0),(443,61,'','临夏州','Linxia','臨夏州','临夏州','','',0,1,0),(444,61,'','定西市','dingxi','定西市','定西市','','',0,1,0),(445,61,'','兰州市','Lanzhou City','蘭州市','兰州市','','',0,1,0),(446,61,'','金昌市','Jinchang','金昌市','金昌市','','',0,1,0),(447,61,'','白银市','Baiyin','白銀市','白银市','','',0,1,0),(448,61,'','天水市','Tianshui','天水市','天水市','','',0,1,0),(449,61,'','嘉峪关市','Jiayuguan City','嘉峪関市','嘉峪关市','','',0,1,0),(450,61,'','平凉市','Pingliang','平涼市','平凉市','','',0,1,0),(451,62,'','广州市','Guangzhou City','広州市','广州市','','',0,1,0),(452,62,'','深圳市','Shenzhen City','深セン市','深圳市','','',0,1,0),(453,62,'','珠海市','Zhuhai City','珠海市','珠海市','','',0,1,0),(454,62,'','汕头市','Shantou City','汕頭市','汕头市','','',0,1,0),(455,62,'','韶关市','Shaoguan City','韶関市','韶关市','','',0,1,0),(456,62,'','河源市','Heyuan City','河源市','河源市','','',0,1,0),(457,62,'','梅州市','Meizhou City','梅州市','梅州市','','',0,1,0),(458,62,'','揭阳市','Jieyang City','掲陽市','揭阳市','','',0,1,0),(459,62,'','惠州市','Huizhou City','恵州市','惠州市','','',0,1,0),(460,62,'','汕尾市','Shanwei City','汕尾市','汕尾市','','',0,1,0),(461,62,'','东莞市','Dongguan City','東莞市','东莞市','','',0,1,0),(462,62,'','中山市','zhongshan','中山市','中山市','','',0,1,0),(463,62,'','江门市','Jiangmen City','江門市','江门市','','',0,1,0),(464,62,'','佛山市','Foshan City','仏山市','佛山市','','',0,1,0),(465,62,'','阳江市','Yangjiang City','陽江市','阳江市','','',0,1,0),(466,62,'','湛江市','Zhanjiang City','江江市','湛江市','','',0,1,0),(467,62,'','茂名市','Maoming City','茂名市','茂名市','','',0,1,0),(468,62,'','肇庆市','Zhaoqing City','肇慶市','肇庆市','','',0,1,0),(469,62,'','云浮市','Yunfu City','雲浮市','云浮市','','',0,1,0),(470,62,'','清远市','Qingyuan City','清遠市','清远市','','',0,1,0),(471,62,'','潮州市','Chaozhou City','潮州市','潮州市','','',0,1,0),(472,63,'','崇左市','Chongzuo City','崇左市','崇左市','','',0,1,0),(473,63,'','南宁市','Nanning City','南寧市','南宁市','','',0,1,0),(474,63,'','柳州市','Liuzhou City','柳柳市','柳州市','','',0,1,0),(475,63,'','桂林市','Guilin City','桂林市','桂林市','','',0,1,0),(476,63,'','梧州市','Wuzhou City','梧州市','梧州市','','',0,1,0),(477,63,'','北海市','Beihai City','北海市','北海市','','',0,1,0),(478,63,'','防城港市','Fangchenggang City','防城港市','防城港市','','',0,1,0),(479,63,'','钦州市','Qinzhou City','欽州市','钦州市','','',0,1,0),(480,63,'','贵港市','Guigang City','貴港市','贵港市','','',0,1,0),(481,63,'','玉林市','Yulin City','玉林市','玉林市','','',0,1,0),(482,63,'','贺州市','Hezhou','賀州市','贺州市','','',0,1,0),(483,63,'','百色市','Baise','あかつき市','百色市','','',0,1,0),(484,63,'','河池市','Hechi City','河池市','河池市','','',0,1,0),(485,63,'','来宾市','Laibin City','来賓市','来宾市','','',0,1,0),(486,64,'','三亚市','The city of Sanya','三亜市','三亚市','','',0,1,0),(487,64,'','文昌市','Wenchang City','文昌市','文昌市','','',0,1,0),(488,64,'','五指山市','Five Fingers Group City','五指市','五指山市','','',0,1,0),(489,64,'','临高县','Lingao County','臨高県','临高县','','',0,1,0),(490,64,'','澄迈县','Chengmai County','澄邁県','澄迈县','','',0,1,0),(491,64,'','定安县','Ding\'an County','定安県','定安县','','',0,1,0),(492,64,'','屯昌县','Tunchang County','屯昌県','屯昌县','','',0,1,0),(493,64,'','昌江县','Changjiang County','昌江県','昌江县','','',0,1,0),(494,64,'','白沙县','Baisha County','白沙県','白沙县','','',0,1,0),(495,64,'','琼中县','Qiongzhong County','琼中県','琼中县','','',0,1,0),(496,64,'','陵水县','Lingshui County','陵水県','陵水县','','',0,1,0),(497,64,'','保亭县','Baoting County','保亭県','保亭县','','',0,1,0),(498,64,'','乐东县','Ledong County','（県','乐东县','','',0,1,0),(499,64,'','三沙市','Sansha','三沙市','三沙市','','',0,1,0),(500,64,'','海口市','Haikou City','海口市','海口市','','',0,1,0),(501,64,'','琼海市','Qionghai City','瓊海市','琼海市','','',0,1,0),(502,64,'','万宁市','Wanning City','万寧市','万宁市','','',0,1,0),(503,64,'','东方市','Oriental City','東方市','东方市','','',0,1,0),(504,64,'','儋州市','Danzhou City','ダン州市','儋州市','','',0,1,0),(505,65,'','中西区','Western and Western Region','中西区','中西区','','',0,1,0),(506,65,'','东区','East Area','東区','东区','','',0,1,0),(507,65,'','九龙城区','Kowloon City','九竜市街','九龙城区','','',0,1,0),(508,65,'','观塘区','Kwun Tong District','观塘区','观塘区','','',0,1,0),(509,65,'','深水埗区','Sham Shui Po District','深水埠頭区','深水埗区','','',0,1,0),(510,65,'','湾仔区','wan chai','灣仔区','湾仔区','','',0,1,0),(511,65,'','黄大仙区','Huang Da Xian District','黄大仙区','黄大仙区','','',0,1,0),(512,65,'','油尖旺区','Mong District','油尖旺区','油尖旺区','','',0,1,0),(513,65,'','离岛区','Islands District','離島区','离岛区','','',0,1,0),(514,65,'','葵青区','Kwai Tsing District','葵青区','葵青区','','',0,1,0),(515,65,'','北区西','North West','北区西','北区西','','',0,1,0),(516,65,'','贡区','Gong District','貢区','贡区','','',0,1,0),(517,65,'','沙田区','sha tin district','沙田区','沙田区','','',0,1,0),(518,65,'','屯门区','Tuen Mun','屯门区','屯门区','','',0,1,0),(519,65,'','大埔区','Tai Po','大埔区','大埔区','','',0,1,0),(520,65,'','荃湾区','Tsuen Wan District','荃湾区','荃湾区','','',0,1,0),(521,65,'','元朗区','Yuen Long District','元朗区','元朗区','','',0,1,0),(522,65,'','香港','Hong Kong','香港','香港','','',0,1,0),(523,65,'','九龙','Kowloon','九竜','九龙','','',0,1,0),(524,65,'','新界','New Territories','新界','新界','','',0,1,0),(525,66,'','澳门特别行政区','Macao Special Administrative Region','マカオ特別行政区、特別行政区','澳门特别行政区','','',0,1,0),(526,66,'','澳门半岛','Macau Peninsula','マカオ半島','澳门半岛','','',0,1,0),(527,66,'','凼仔','Taipa','肥溜め仔','凼仔','','',0,1,0),(528,66,'','路凼城','Cotai','路凼城','路凼城','','',0,1,0),(529,66,'','路环','Ring Road','コロアネ','路环','','',0,1,0),(530,67,'','金门','Kinmen','金門','金门','','',0,1,0),(531,67,'','连江','Lianjiang','连江','连江','','',0,1,0),(532,67,'','苗栗','Miaoli','苗栗','苗栗','','',0,1,0),(533,67,'','南投','Nantou','南投','南投','','',0,1,0),(534,67,'','澎湖','Pescadores Islands','澎湖','澎湖','','',0,1,0),(535,67,'','屏东','Pingtung','屏東','屏东','','',0,1,0),(536,67,'','台东','Taitung','台東','台东','','',0,1,0),(537,67,'','台中','Taichung','台中','台中','','',0,1,0),(538,67,'','台南','Tainan','台南','台南','','',0,1,0),(539,67,'','台北','Taipei','台北','台北','','',0,1,0),(540,67,'','桃园','peach orchard','桃園','桃园','','',0,1,0),(541,67,'','云林','Yunlin','雲林','云林','','',0,1,0),(542,67,'','新北','New Taipei','新北','新北','','',0,1,0),(543,67,'','彰化','changhua','彰化','彰化','','',0,1,0),(544,67,'','嘉义','Chiayi','嘉義','嘉义','','',0,1,0),(545,67,'','新竹','Hsinchu','新竹','新竹','','',0,1,0),(546,67,'','花莲','Hualian','花蓮','花莲','','',0,1,0),(547,67,'','宜兰','Yilan','宜蘭','宜兰','','',0,1,0),(548,67,'','高雄','Kaohsiung','高雄','高雄','','',0,1,0),(549,67,'','基隆','Keelung','基隆','基隆','','',0,1,0),(550,68,'','呼和浩特市','Hohhot City','フフホト市','呼和浩特市','','',0,1,0),(551,68,'','包头市','Baotou City','包頭市','包头市','','',0,1,0),(552,68,'','乌海市','Wuhai City','烏海市','乌海市','','',0,1,0),(553,68,'','赤峰市','Chifeng City','赤峰市','赤峰市','','',0,1,0),(554,68,'','乌兰察布市','Wulanchabu City','ウランチャブ市','乌兰察布市','','',0,1,0),(555,68,'','锡林郭勒盟','Xilinguole Meng','シリンゴル盟','锡林郭勒盟','','',0,1,0),(556,68,'','呼伦贝尔市','Hulun Buir City','フルンボイル市','呼伦贝尔市','','',0,1,0),(557,68,'','鄂尔多斯市','ordos city','オルドス市','鄂尔多斯市','','',0,1,0),(558,68,'','巴彦淖尔市','Bayannaoer City','バヤンノール市','巴彦淖尔市','','',0,1,0),(559,68,'','阿拉善盟','alxa league','アルシャー盟','阿拉善盟','','',0,1,0),(560,68,'','兴安盟','hinggan league','ヒンガン盟','兴安盟','','',0,1,0),(561,68,'','通辽市','Tongliao City','通遼市','通辽市','','',0,1,0),(562,69,'','鹤岗市','Hegang City','鶴崗市','鹤岗市','','',0,1,0),(563,69,'','双鸭山市','Shuangyashan City','双鴨山市','双鸭山市','','',0,1,0),(564,69,'','鸡西市','Jixi City','鶏西市','鸡西市','','',0,1,0),(565,69,'','大庆市','Daqing City','大慶市','大庆市','','',0,1,0),(566,69,'','伊春市','Yichun City','伊春市の','伊春市','','',0,1,0),(567,69,'','牡丹江市','Mudanjiang City','牡丹江市','牡丹江市','','',0,1,0),(568,69,'','佳木斯市','Jiamusi City','ジャムス市','佳木斯市','','',0,1,0),(569,69,'','七台河市','Qitaihe City','七台河市','七台河市','','',0,1,0),(570,69,'','黑河市','Heihe City','黒河市','黑河市','','',0,1,0),(571,69,'','绥化市','Suihua City','綏化市','绥化市','','',0,1,0),(572,69,'','大兴安岭地区','Da Hinggan Ling Prefecture','大興安嶺地区','大兴安岭地区','','',0,1,0),(573,69,'','哈尔滨市','Harbin City','ハルビン市','哈尔滨市','','',0,1,0),(574,69,'','齐齐哈尔市','Qigihar City','チチハル市','齐齐哈尔市','','',0,1,0),(575,0,'','性别','sex','','性别','','',0,1,0),(576,575,'','男','','','男','','',0,1,0),(577,575,'','女','','','女','','',0,1,0),(578,0,'','商品类别','','','商品类别','','',0,1,0),(579,578,'','食品','','','食品','','',0,1,0),(580,578,'','化妆品','','','化妆品','','',0,1,0),(581,578,'','日用品','','','日用品','','',0,1,0),(582,578,'','电子产品','','','电子产品','','',0,1,0),(583,578,'','母婴用品','','','母婴用品','','',0,1,0),(585,0,'','仓库地址','','','仓库地址','','',0,1,0),(602,8,'','美国','U.S.A','','美国','','',0,1,0),(603,8,'','新西兰','New Zealand','','新西兰','','',0,1,0),(604,0,'','问题反馈类目','','','问题反馈类目','','',0,1,0),(605,604,'','问题优先级','','','问题优先级','','',0,1,0),(606,604,'','问题类型','','','问题类型','','',0,1,0),(607,605,'','紧急','','','紧急','','',0,1,0),(608,605,'','一般','','','一般','','',0,1,0),(609,605,'','不是很急','','','不是很急','','',0,1,0),(610,606,'','包裹问题','','','包裹问题','','',0,1,0),(611,606,'','运单问题','','','运单问题','','',0,1,0),(612,606,'','其他问题','','','其他问题','','',0,1,0),(613,0,'','快递公司','','','快递公司','','',0,1,0),(614,613,'','AAE','','','AAEWEB','','',0,1,0),(615,613,'','Aramex','','','ARAMEX','','',0,1,0),(616,613,'','DHL','','','DHL','','',0,1,0),(617,613,'','DPEX','','','DPEX','','',0,1,0),(618,613,'','D速','','','DEXP','','',0,1,0),(619,613,'','EMS','','','EMS','','',0,1,0),(620,613,'','EWE','','','EWE','','',0,1,0),(621,613,'','FedEx','','','FedEx','','',0,1,0),(622,613,'','FedEx国际','','','FEDEXIN','','',0,1,0),(623,613,'','PCA','','','PCA','','',0,1,0),(624,613,'','TNT','','','TNT','','',0,1,0),(625,613,'','UPS','','','UPS','','',0,1,0),(626,613,'','安捷','','','ANJELEX','','',0,1,0),(627,613,'','安能','','','ANE','','',0,1,0),(628,613,'','安能快递','','','ANEEX','','',0,1,0),(629,613,'','安信达','','','ANXINDA','','',0,1,0),(630,613,'','百福东方','','','EES','','',0,1,0),(631,613,'','百福东方','','','HTKY','','',0,1,0),(632,613,'','百世快运','','','BSKY','','',0,1,0),(633,613,'','程光','','','FLYWAYEX','','',0,1,0),(634,613,'','大田','','','DTW','','',0,1,0),(635,613,'','德邦','','','DEPPON','','',0,1,0),(636,613,'','飞洋','','','GCE','','',0,1,0),(637,613,'','凤凰','','','PHOENIXEXP','','',0,1,0),(638,613,'','富腾达','','','FTD','','',0,1,0),(639,613,'','共速达','','','GSD','','',0,1,0),(640,613,'','国通','','','GTO','','',0,1,0),(641,613,'','黑狗','','','BLACKDOG','','',0,1,0),(642,613,'','恒路','','','HENGLU','','',0,1,0),(643,613,'','鸿远','','','HYE','','',0,1,0),(644,613,'','华企','','','HQKY','','',0,1,0),(645,613,'','急先达','','','JOUST','','',0,1,0),(646,613,'','加运美','','','TMS','','',0,1,0),(647,613,'','佳吉','','','JIAJI','','',0,1,0),(648,613,'','佳怡','','','JIAYI','','',0,1,0),(649,613,'','嘉里物流','','','KERRY','','',0,1,0),(650,613,'','锦程快递','','','HREX','','',0,1,0),(651,613,'','晋越','','','PEWKEE','','',0,1,0),(652,613,'','京东','','','JD','','',0,1,0),(653,613,'','京广','','','KKE','','',0,1,0),(654,613,'','九曳','','','JIUYESCM','','',0,1,0),(655,613,'','跨越','','','KYEXPRESS','','',0,1,0),(656,613,'','快捷','','','FASTEXPRESS','','',0,1,0),(657,613,'','蓝天','','','BLUESKY','','',0,1,0),(658,613,'','联昊通','','','LTS','','',0,1,0),(659,613,'','龙邦','','','LBEX','','',0,1,0),(660,613,'','民航','','','CAE','','',0,1,0),(661,613,'','能达','','','ND56','','',0,1,0),(662,613,'','配思航宇','','','PEISI','','',0,1,0),(663,613,'','平安快递','','','EFSPOST','','',0,1,0),(664,613,'','秦远物流','','','CHINZ56','','',0,1,0),(665,613,'','全晨','','','QCKD','','',0,1,0),(666,613,'','全峰','','','QFKD','','',0,1,0),(667,613,'','全一','','','APEX','','',0,1,0),(668,613,'','如风达','','','RFD','','',0,1,0),(669,613,'','三态','','','SFC','','',0,1,0),(670,613,'','申通','','','STO','','',0,1,0),(671,613,'','盛丰','','','SFWL','','',0,1,0),(672,613,'','盛辉','','','SHENGHUI','','',0,1,0),(673,613,'','顺达快递','','','SDEX','','',0,1,0),(674,613,'','顺丰','','','SFEXPRESS','','',0,1,0),(675,613,'','苏宁','','','SUNING','','',0,1,0),(676,613,'','速尔','','','SURE','','',0,1,0),(677,613,'','天地华宇','','','HOAU','','',0,1,0),(678,613,'','天天','','','TTKDEX','','',0,1,0),(679,613,'','万庚','','','VANGEN','','',0,1,0),(680,613,'','万家物流','','','WANJIA','','',0,1,0),(681,613,'','万象','','','EWINSHINE','','',0,1,0),(682,613,'','文捷航空','','','GZWENJIE','','',0,1,0),(683,613,'','新邦','','','XBWL','','',0,1,0),(684,613,'','信丰','','','XFEXPRESS','','',0,1,0),(685,613,'','亚风','','','BROADASIA','','',0,1,0),(686,613,'','宜送','','','YIEXPRESS','','',0,1,0),(687,613,'','易达通','','','QEXPRESS','','',0,1,0),(688,613,'','易通达','','','ETD','','',0,1,0),(689,613,'','优速','','','UC56','','',0,1,0),(690,613,'','邮政包裹','','','CHINAPOST','','',0,1,0),(691,613,'','原飞航','','','YFHEX','','',0,1,0),(692,613,'','圆通','','','YTO','','',0,1,0),(693,613,'','源安达','','','YADEX','','',0,1,0),(694,613,'','远成','','','YCGWL','','',0,1,0),(695,613,'','越丰','','','YFEXPRESS','','',0,1,0),(696,613,'','运通','','','YTEXPRESS','','',0,1,0),(697,613,'','韵达','','','YUNDA','','',0,1,0),(698,613,'','宅急送','','','ZJS','','',0,1,0),(699,613,'','芝麻开门','','','ZMKMEX','','',0,1,0),(700,613,'','中国东方','','','COE','','',0,1,0),(701,613,'','中铁快运','','','CRE','','',0,1,0),(702,613,'','中铁物流','','','ZTKY','','',0,1,0),(703,613,'','中通','','','ZTO','','',0,1,0),(704,613,'','中通快运','','','ZTO56','','',0,1,0),(705,613,'','中邮','','','CNPL','','',0,1,0),(706,0,'','发货渠道','','','发货渠道','','',0,1,0),(707,706,'','测试渠道','','','测试渠道','','',0,1,0),(708,0,'','增值服务','','','增值服务','','',0,1,0),(709,708,'','购买箱子','','','购买箱子','','',0,1,0),(710,708,'','加固方式','','','加固方式','','',0,1,0),(711,708,'','内件清点','','','内件清点','','',0,1,0),(712,708,'','拍照','','','拍照','','',0,1,0),(713,708,'','验货','','','验货','','',0,1,0),(714,708,'','购物清单','','','购物清单','','',0,1,0),(715,709,'','小箱子','','','1.00','','',0,1,0),(716,709,'','中箱子','','','2.00','','',0,1,0),(717,709,'','大箱子','','','3.00','','',0,1,0),(718,709,'','特大箱子','','','4.00','','',0,1,0),(720,710,'','简单加固','','','1.00','','',0,1,0),(721,710,'','标准加固','','','2.00','','',0,1,0),(722,710,'','升级加固','','','3.00','','',0,1,0),(723,711,'','简单清点','','','1.00','','',0,1,0),(724,711,'','大件清点','','','2.00','','',0,1,0),(725,711,'','全部清点','','','3.00','','',0,1,0),(726,712,'','拍照','','','5.00','','',0,1,0),(727,713,'','验货','','','5.00','','',0,1,0),(728,714,'','保留','','','保留','','',0,1,0),(729,714,'','取出','','','取出','','',0,1,0),(730,0,'','包裹材料','','','包裹材料','','',0,1,0),(731,730,'','一号箱子','','','18cm*14cm*14cm','0.30','',0,1,0),(732,730,'','二号箱子','','','18cm*27cm*14cm','0.50','',0,1,0),(733,730,'','三号箱子','','','18cm*41cm*14cm','0.75','',0,1,0),(734,730,'','四号箱子','','','18cm*14cm*14cm','1.00','',0,1,0),(743,585,'','总部','总部','总部','总部','666','',0,1,0),(746,777,'','测试网点','测试网点','测试网点','测试网点','BNE1000','',0,1,0),(768,743,'','北美','北美','北美','','01','',0,1,0),(769,768,'','CA0018','CA0018','CA0018','','CA0018','',0,1,0),(770,768,'','CA0001','CA0001','CA0001','','CA0001','',0,1,0),(771,743,'','布里斯班处理中心','布里斯班处理中心','布里斯班处理中心','AUD','FG01','',0,1,0),(772,771,'','SC','SC','SC','summer','BNE0005','',0,1,0),(773,771,'','My Healthy Garden','My Healthy Garden','My Healthy Garden','澳洲童宝贝','BNE0003','',0,1,0),(774,771,'','速派布里斯班','速派布里斯班','速派布里斯班','速派布里斯班','BNE0001','',0,1,0),(775,771,'','ADA','ADA','ADA','ADA','BNE0004','',0,1,0),(776,743,'','中国','中国','中国','','86','',0,1,0),(777,743,'','澳洲中心','澳洲中心','澳洲中心','','888','',0,1,0),(778,777,'','BNE0088','BNE0088','BNE0088','','BNE0088','',0,1,0),(779,777,'','Sunnygift','Sunnygift','Sunnygift','Sunnygift','BNE0086','',0,1,0),(780,777,'','BNE0008','BNE0008','BNE0008','','BNE0008','',0,1,0),(781,777,'','BNE0073','BNE0073','BNE0073','','BNE0073','',0,1,0),(782,777,'','BNE0113','BNE0113','BNE0113','','BNE0113','',0,1,0),(783,777,'','BNE8888','BNE8888','BNE8888','','BNE8888','',0,1,0),(784,777,'','BNE0009','BNE0009','BNE0009','','BNE0009','',0,1,0),(785,777,'','BNE0115','BNE0115','BNE0115','','BNE0115','',0,1,0),(786,777,'','BNE0051','BNE0051','BNE0051','','BNE0051','',0,1,0),(787,777,'','BNE0123','BNE0123','BNE0123','','BNE0123','',0,1,0),(788,777,'','BNE0079','BNE0079','BNE0079','','BNE0079','',0,1,0),(789,777,'','BNE0112','BNE0112','BNE0112','','BNE0112','',0,1,0),(790,0,'','币种','','','币种','','',0,1,0),(791,790,'','人民币','','','CNY','','',0,1,0),(792,790,'','美元','','','USD','','',0,1,0),(793,790,'','澳币','','','AUD','','',0,1,0),(794,790,'','日元','','','JPY','','',0,1,0),(795,8,'','阿尔巴尼亚','Albania','','阿尔巴尼亚','','',0,1,0),(796,8,'','阿尔及利亚','Algeria','','阿尔及利亚','','',0,1,0),(797,8,'','阿富汗','Afghanistan','','阿富汗','','',0,1,0),(798,8,'','阿根廷','Argentina','','阿根廷','','',0,1,0),(799,8,'','阿联酋','The United Arab Emirates','','阿联酋','','',0,1,0),(800,8,'','阿鲁巴','Aruba','','阿鲁巴','','',0,1,0),(801,8,'','阿曼','Oman','','阿曼','','',0,1,0),(802,8,'','阿塞拜疆','Azerbaijan','','阿塞拜疆','','',0,1,0),(803,8,'','阿森松岛','Ascension','','阿森松岛','','',0,1,0),(804,8,'','埃及','Egypt','','埃及','','',0,1,0),(805,8,'','埃塞俄比亚','Ethiopia','','埃塞俄比亚','','',0,1,0),(806,8,'','爱尔兰','Ireland','','爱尔兰','','',0,1,0),(807,8,'','爱沙尼亚','Estonia','','爱沙尼亚','','',0,1,0),(808,8,'','安道尔','Andorra','','安道尔','','',0,1,0),(809,8,'','安哥拉','Angola','','安哥拉','','',0,1,0),(810,8,'','安圭拉','Anguilla','','安圭拉','','',0,1,0),(811,8,'','安提瓜','Antigua','','安提瓜','','',0,1,0),(812,8,'','奥地利','Austria','','奥地利','','',0,1,0),(813,8,'','澳大利亚','Australia','','澳大利亚','','',0,1,0),(814,8,'','巴巴多斯','Barbados','','巴巴多斯','','',0,1,0),(815,8,'','巴布亚新几内亚','papua new guinea','','巴布亚新几内亚','','',0,1,0),(816,8,'','巴哈马','Bahamas','','巴哈马','','',0,1,0),(817,8,'','巴基斯坦','Pakistan','','巴基斯坦','','',0,1,0),(818,8,'','巴拉圭','Paraguay','','巴拉圭','','',0,1,0),(819,8,'','巴勒斯坦','Palestine','','巴勒斯坦','','',0,1,0),(820,8,'','巴林','Bahrain','','巴林','','',0,1,0),(821,8,'','巴拿马','Panama','','巴拿马','','',0,1,0),(822,8,'','巴西','Brazil','','巴西','','',0,1,0),(823,8,'','白俄罗斯','Belarus','','白俄罗斯','','',0,1,0),(824,8,'','百慕大群岛','Bermuda','','百慕大群岛','','',0,1,0),(825,8,'','保加利亚','Bulgaria','','保加利亚','','',0,1,0),(826,8,'','北马里亚纳','Northern Mariana Islands','','北马里亚纳','','',0,1,0),(827,8,'','贝宁','Benin','','贝宁','','',0,1,0),(828,8,'','比利时','Belgium','','比利时','','',0,1,0),(829,8,'','冰岛','Iceland','','冰岛','','',0,1,0),(830,8,'','波多黎各','Puerto Rico','','波多黎各','','',0,1,0),(831,8,'','波黑','Bosnia and Herzegovina','','波黑','','',0,1,0),(832,8,'','波兰','poland','','波兰','','',0,1,0),(833,8,'','玻利维亚','bolivia','','玻利维亚','','',0,1,0),(834,8,'','伯利兹','Belize','','伯利兹','','',0,1,0),(835,8,'','博茨瓦纳','botswana','','博茨瓦纳','','',0,1,0),(836,8,'','不丹','Bhutan','','不丹','','',0,1,0),(837,8,'','布基纳法索','burkina faso','','布基纳法索','','',0,1,0),(838,8,'','布隆迪','burundi','','布隆迪','','',0,1,0),(839,8,'','朝鲜','North Korea','','朝鲜','','',0,1,0),(840,8,'','赤道几内亚','赤道几内亚','','赤道几内亚','','',0,1,0),(841,8,'','丹麦','Denmark','','丹麦','','',0,1,0),(842,8,'','德国','Germany','','德国','','',0,1,0),(843,8,'','东帝汶','Timor-Leste','','东帝汶','','',0,1,0),(844,8,'','多哥','Togo','','多哥','','',0,1,0),(845,8,'','多米尼加共和国','Dominican Republic','','多米尼加共和国','','',0,1,0),(846,8,'','多米尼克','Dominica','','多米尼克','','',0,1,0),(847,8,'','俄罗斯','Russia','','俄罗斯','','',0,1,0),(848,8,'','厄瓜多尔','Ecuador','','厄瓜多尔','','',0,1,0),(849,8,'','厄立特里亚','Eritrea','','厄立特里亚','','',0,1,0),(850,8,'','法国','France','','法国','','',0,1,0),(851,8,'','法罗群岛','Faroe Islands','','法罗群岛','','',0,1,0),(852,8,'','法属波利尼西亚','French Polynesia','','法属波利尼西亚','','',0,1,0),(853,8,'','法属圭亚那','French Guiana','','法属圭亚那','','',0,1,0),(854,8,'','法属南部领土','French Southern Territories','','法属南部领土','','',0,1,0),(855,8,'','梵蒂冈','Vatican','','梵蒂冈','','',0,1,0),(856,8,'','菲律宾','The Philippines','','菲律宾','','',0,1,0),(857,8,'','斐济','Fiji','','斐济','','',0,1,0),(858,8,'','芬兰','Finland','','芬兰','','',0,1,0),(859,8,'','佛得角','Cape Verde','','佛得角','','',0,1,0),(860,8,'','福克兰群岛','Falkland Islands','','福克兰群岛','','',0,1,0),(861,8,'','冈比亚','Gambia','','冈比亚','','',0,1,0),(862,8,'','刚果(布)','Congo (cloth)','','刚果(布)','','',0,1,0),(863,8,'','刚果(金)','Congo (gold)','','刚果(金)','','',0,1,0),(864,8,'','哥伦比亚','Columbia','','哥伦比亚','','',0,1,0),(865,8,'','哥斯达黎加','Costa Rica','','哥斯达黎加','','',0,1,0),(866,8,'','格林纳达','Grenada','','格林纳达','','',0,1,0),(867,8,'','格陵兰岛','Greenland','','格陵兰岛','','',0,1,0),(868,8,'','格鲁吉亚','Georgia','','格鲁吉亚','','',0,1,0),(869,8,'','古巴','Cuba','','古巴','','',0,1,0),(870,8,'','瓜德罗普','Gua de Ropp','','瓜德罗普','','',0,1,0),(871,8,'','关岛','Guam','','关岛','','',0,1,0),(872,8,'','圭亚那','Guyana','','圭亚那','','',0,1,0),(873,8,'','哈萨克斯坦','Kazakhstan','','哈萨克斯坦','','',0,1,0),(874,8,'','海地','Haiti','','海地','','',0,1,0),(875,8,'','韩国','The Republic of Korea','','韩国','','',0,1,0),(876,8,'','荷兰','Netherlands','','荷兰','','',0,1,0),(877,8,'','荷属安的列斯群岛','The Netherlands Antilles','','荷属安的列斯群岛','','',0,1,0),(878,8,'','赫德岛和麦克唐纳岛','Hird island and Macdonald Island','','赫德岛和麦克唐纳岛','','',0,1,0),(879,8,'','黑山','Montenegro','','黑山','','',0,1,0),(880,8,'','洪都拉斯','Honduras','','洪都拉斯','','',0,1,0),(881,8,'','基里巴斯','Kiribati','','基里巴斯','','',0,1,0),(882,8,'','吉布提','Djibouti','','吉布提','','',0,1,0),(883,8,'','吉尔吉斯斯坦','Kyrgyzstan','','吉尔吉斯斯坦','','',0,1,0),(884,8,'','几内亚','Guinea','','几内亚','','',0,1,0),(885,8,'','几内亚比绍','Guinea-Bissau','','几内亚比绍','','',0,1,0),(886,8,'','加拿大','Canada','','加拿大','','',0,1,0),(887,8,'','加那利群岛','Canary Islands','','加那利群岛','','',0,1,0),(888,8,'','加纳','Ghana','','加纳','','',0,1,0),(889,8,'','加蓬','Gabon','','加蓬','','',0,1,0),(890,8,'','柬埔寨','Cambodia','','柬埔寨','','',0,1,0),(891,8,'','捷克共和国','Czech Republic','','捷克共和国','','',0,1,0),(892,8,'','津巴布韦','zimbabwe','','津巴布韦','','',0,1,0),(893,8,'','喀麦隆','Cameroon','','喀麦隆','','',0,1,0),(894,8,'','卡奔达','Cabinda','','卡奔达','','',0,1,0),(895,8,'','卡塔尔','Qatar','','卡塔尔','','',0,1,0),(896,8,'','开曼群岛','Cayman Islands','','开曼群岛','','',0,1,0),(897,8,'','科科斯群岛','Cocos Islands','','科科斯群岛','','',0,1,0),(898,8,'','科摩罗','Comoros','','科摩罗','','',0,1,0),(899,8,'','科特迪瓦','Cote d\'Ivoire','','科特迪瓦','','',0,1,0),(900,8,'','科威特','Kuwait','','科威特','','',0,1,0),(901,8,'','克罗地亚 ','克罗地亚 ','','克罗地亚 ','','',0,1,0),(902,8,'','肯尼亚','Kenya','','肯尼亚','','',0,1,0),(903,8,'','库克群岛','Cook Islands','','库克群岛','','',0,1,0),(904,8,'','拉脱维亚','Latvia','','拉脱维亚','','',0,1,0),(905,8,'','莱索托','Lesotho','','莱索托','','',0,1,0),(906,8,'','老挝','Laos','','老挝','','',0,1,0),(907,8,'','黎巴嫩','Lebanon','','黎巴嫩','','',0,1,0),(908,8,'','立陶宛','立陶宛','','立陶宛','','',0,1,0),(909,8,'','利比里亚','Liberia','','利比里亚','','',0,1,0),(910,8,'','利比亚','Libya','','利比亚','','',0,1,0),(911,8,'','列支敦士登','Liechtenstein','','列支敦士登','','',0,1,0),(912,8,'','留尼汪岛','Reunion Island','','留尼汪岛','','',0,1,0),(913,8,'','卢森堡','Luxembourg','','卢森堡','','',0,1,0),(914,8,'','卢旺达','Rwanda','','卢旺达','','',0,1,0),(915,8,'','罗马尼亚','Romania','','罗马尼亚','','',0,1,0),(916,8,'','马达加斯加','Madagascar','','马达加斯加','','',0,1,0),(917,8,'','马德拉岛','madeira','','马德拉岛','','',0,1,0),(918,8,'','马尔代夫','Maldives','','马尔代夫','','',0,1,0),(919,8,'','马尔维纳斯群岛','Malvinas Islands','','马尔维纳斯群岛','','',0,1,0),(920,8,'','马耳他','Malta','','马耳他','','',0,1,0),(921,8,'','马拉维','Malawi','','马拉维','','',0,1,0),(922,8,'','马来西亚','Malaysia','','马来西亚','','',0,1,0),(923,8,'','马里','Mali','','马里','','',0,1,0),(924,8,'','马其顿','Macedonia','','马其顿','','',0,1,0),(925,8,'','马绍尔群岛','Marshall Islands','','马绍尔群岛','','',0,1,0),(926,8,'','马提尼克岛','Martinique Island','','马提尼克岛','','',0,1,0),(927,8,'','马约特','Mayotte','','马约特','','',0,1,0),(928,8,'','毛里求斯','Mauritius','','毛里求斯','','',0,1,0),(929,8,'','毛里塔尼亚','Mauritania','','毛里塔尼亚','','',0,1,0),(930,8,'','美国','U.S.A','','美国','','',0,1,0),(931,8,'','美属萨摩亚群岛','American samoa','','美属萨摩亚群岛','','',0,1,0),(932,8,'','美属维尔京群岛','American Virgin Islands','','美属维尔京群岛','','',0,1,0),(933,8,'','蒙古','Mongolia','','蒙古','','',0,1,0),(934,8,'','蒙特塞拉岛','Montserrat','','蒙特塞拉岛','','',0,1,0),(935,8,'','孟加拉国','The People\'s Republic of Bangladesh','','孟加拉国','','',0,1,0),(936,8,'','秘鲁','Peru','','秘鲁','','',0,1,0),(937,8,'','密克罗尼西亚','Micronesia','','密克罗尼西亚','','',0,1,0),(938,8,'','缅甸','Myanmar','','缅甸','','',0,1,0),(939,8,'','摩尔多瓦','Moldova','','摩尔多瓦','','',0,1,0),(940,8,'','摩洛哥','Morocco','','摩洛哥','','',0,1,0),(941,8,'','摩纳哥','Monaco','','摩纳哥','','',0,1,0),(942,8,'','莫桑比克','Mozambique','','莫桑比克','','',0,1,0),(943,8,'','墨西哥','Mexico','','墨西哥','','',0,1,0),(944,8,'','纳米比亚','Namibia','','纳米比亚','','',0,1,0),(945,8,'','南非','South Africa','','南非','','',0,1,0),(946,8,'','南乔治亚岛和南桑德韦奇岛','South Georgia and The South Sandwich Islands','','南乔治亚岛和南桑德韦奇岛','','',0,1,0),(947,8,'','瑙鲁','Nauru','','瑙鲁','','',0,1,0),(948,8,'','尼泊尔','Nepal','','尼泊尔','','',0,1,0),(949,8,'','尼加拉瓜','Nicaragua','','尼加拉瓜','','',0,1,0),(950,8,'','尼日尔','Niger','','尼日尔','','',0,1,0),(951,8,'','尼日利亚','Nigeria','','尼日利亚','','',0,1,0),(952,8,'','尼维斯岛','Nevis','','尼维斯岛','','',0,1,0),(953,8,'','纽埃岛','Niue','','纽埃岛','','',0,1,0),(954,8,'','挪威','Norway','','挪威','','',0,1,0),(955,8,'','诺福克岛','Norfolk Island','','诺福克岛','','',0,1,0),(956,8,'','帕劳','Palau','','帕劳','','',0,1,0),(957,8,'','皮特凯恩群岛','Pitt Kaine Islands','','皮特凯恩群岛','','',0,1,0),(958,8,'','葡萄牙','Portugal','','葡萄牙','','',0,1,0),(959,8,'','日本','Japan','','日本','','',0,1,0),(960,8,'','瑞典','Sweden','','瑞典','','',0,1,0),(961,8,'','瑞士','Switzerland','','瑞士','','',0,1,0),(962,8,'','萨尔瓦多','Salvatore','','萨尔瓦多','','',0,1,0),(963,8,'','塞尔维亚','Serbia','','塞尔维亚','','',0,1,0),(964,8,'','塞拉利昂','sierra leone','','塞拉利昂','','',0,1,0),(965,8,'','塞内加尔','Senegal','','塞内加尔','','',0,1,0),(966,8,'','塞浦路斯','Cyprus','','塞浦路斯','','',0,1,0),(967,8,'','塞舌尔','Seychelles','','塞舌尔','','',0,1,0),(968,8,'','沙特阿拉伯','Saudi Arabia','','沙特阿拉伯','','',0,1,0),(969,8,'','圣诞岛','Christmas Island','','圣诞岛','','',0,1,0),(970,8,'','圣多美和普林西比','Sao Tome and Principe','','圣多美和普林西比','','',0,1,0),(971,8,'','圣赫勒拿','Helena','','圣赫勒拿','','',0,1,0),(972,8,'','圣基茨和尼维斯','Saint Kitts and Nevis','','圣基茨和尼维斯','','',0,1,0),(973,8,'','圣卢西亚','Saint Lucia','','圣卢西亚','','',0,1,0),(974,8,'','圣马力诺','San Marino','','圣马力诺','','',0,1,0),(975,8,'','圣皮埃尔和密克隆','Saint Pierre and Miquelon','','圣皮埃尔和密克隆','','',0,1,0),(976,8,'','圣文森特和格林纳丁斯','Saint Vincent and the Grenadines','','圣文森特和格林纳丁斯','','',0,1,0),(977,8,'','斯里兰卡','Sri Lanka','','斯里兰卡','','',0,1,0),(978,8,'','斯洛伐克','Slovakia','','斯洛伐克','','',0,1,0),(979,8,'','斯洛文尼亚','Slovenia','','斯洛文尼亚','','',0,1,0),(980,8,'','斯瓦尔巴岛和扬马延岛','Svalbard and Jan Mayen','','斯瓦尔巴岛和扬马延岛','','',0,1,0),(981,8,'','斯威士兰','Swaziland','','斯威士兰','','',0,1,0),(982,8,'','苏丹','Sultan','','苏丹','','',0,1,0),(983,8,'','苏里南','Suriname','','苏里南','','',0,1,0),(984,8,'','所罗门群岛','Solomon Islands','','所罗门群岛','','',0,1,0),(985,8,'','索马里共和国','Somali Republic','','索马里共和国','','',0,1,0),(986,8,'','塔吉克斯坦','Tajikistan','','塔吉克斯坦','','',0,1,0),(987,8,'','泰国','Thailand','','泰国','','',0,1,0),(988,8,'','坦桑尼亚','Tanzania','','坦桑尼亚','','',0,1,0),(989,8,'','汤加','Tonga','','汤加','','',0,1,0),(990,8,'','特克斯和凯科斯群岛','Turks and Caicos Islands','','特克斯和凯科斯群岛','','',0,1,0),(991,8,'','特里斯达库尼亚群岛','Telisida Cunha Islands','','特里斯达库尼亚群岛','','',0,1,0),(992,8,'','特立尼达和多巴哥','Trinidad and Tobago','','特立尼达和多巴哥','','',0,1,0),(993,8,'','突尼斯','Tunisia','','突尼斯','','',0,1,0),(994,8,'','图瓦卢','Tuvalu','','图瓦卢','','',0,1,0),(995,8,'','土耳其','Turkey','','土耳其','','',0,1,0),(996,8,'','土库曼斯坦','Turkmenistan','','土库曼斯坦','','',0,1,0),(997,8,'','托克劳','Tokelau','','托克劳','','',0,1,0),(998,8,'','瓦利斯和富图那群岛','Walisihefutuna Islands','','瓦利斯和富图那群岛','','',0,1,0),(999,8,'','瓦努阿图','Vanuatu','','瓦努阿图','','',0,1,0),(1000,8,'','危地马拉','Guatemala','','危地马拉','','',0,1,0),(1001,8,'','委内瑞拉','Venezuela','','委内瑞拉','','',0,1,0),(1002,8,'','文莱','Brunei','','文莱','','',0,1,0),(1003,8,'','乌干达','Uganda','','乌干达','','',0,1,0),(1004,8,'','乌克兰','Ukraine','','乌克兰','','',0,1,0),(1005,8,'','乌拉圭','Uruguay','','乌拉圭','','',0,1,0),(1006,8,'','乌兹别克斯坦','Uzbekistan','','乌兹别克斯坦','','',0,1,0),(1007,8,'','西班牙','Spain','','西班牙','','',0,1,0),(1008,8,'','西撒哈拉','Western Sahara','','西撒哈拉','','',0,1,0),(1009,8,'','西萨摩亚','Western Samoa','','西萨摩亚','','',0,1,0),(1010,8,'','希腊','Greece','','希腊','','',0,1,0),(1011,8,'','锡金','Sikkim','','锡金','','',0,1,0),(1012,8,'','新加坡','Singapore','','新加坡','','',0,1,0),(1013,8,'','新喀里多尼亚','New Caledonia','','新喀里多尼亚','','',0,1,0),(1014,8,'','新西兰','New Zealand','','新西兰','','',0,1,0),(1015,8,'','匈牙利','Hungary','','匈牙利','','',0,1,0),(1016,8,'','叙利亚','Syria','','叙利亚','','',0,1,0),(1017,8,'','牙买加','Jamaica','','牙买加','','',0,1,0),(1018,8,'','亚美尼亚','Armenia','','亚美尼亚','','',0,1,0),(1019,8,'','亚速尔群岛和马德拉群岛','Azores and Madeira','','亚速尔群岛和马德拉群岛','','',0,1,0),(1020,8,'','也门共和国','Republic of Yemen','','也门共和国','','',0,1,0),(1021,8,'','伊夫尼','Ifni','','伊夫尼','','',0,1,0),(1022,8,'','伊拉克','Iraq','','伊拉克','','',0,1,0),(1023,8,'','伊朗','Iran','','伊朗','','',0,1,0),(1024,8,'','以色列','Israel','','以色列','','',0,1,0),(1025,8,'','意大利','Italy','','意大利','','',0,1,0),(1026,8,'','印度','India','','印度','','',0,1,0),(1027,8,'','印度尼西亚','Indonesia','','印度尼西亚','','',0,1,0),(1028,8,'','英国','Britain','','英国','','',0,1,0),(1029,8,'','英属维尔京群岛','British Virgin Islands','','英属维尔京群岛','','',0,1,0),(1030,8,'','英属印度洋地区(查各群岛)','The British India Ocean region (the archipelago)','','英属印度洋地区(查各群岛)','','',0,1,0),(1031,8,'','约旦','Jordan','','约旦','','',0,1,0),(1032,8,'','约翰斯敦岛','Johnston','','约翰斯敦岛','','',0,1,0),(1033,8,'','越南','Vietnam','','越南','','',0,1,0),(1034,8,'','赞比亚','Zambia','','赞比亚','','',0,1,0),(1035,8,'','扎伊尔','zaire','','扎伊尔','','',0,1,0),(1036,8,'','乍得','Chad','','乍得','','',0,1,0),(1037,8,'','直布罗陀','Gibraltar','','直布罗陀','','',0,1,0),(1038,8,'','智利','Chile','','智利','','',0,1,0),(1039,8,'','中非共和国','Central African Republic','','中非共和国','','',0,1,0),(1040,8,'','中国澳门','Macao China','','中国澳门','','',0,1,0),(1041,8,'','中国台湾','Taiwan, China','','中国台湾','','',0,1,0),(1042,8,'','中国香港','Hongkong, China','','中国香港','','',0,1,0);

/*Table structure for table `dh_chat_log` */

DROP TABLE IF EXISTS `dh_chat_log`;

CREATE TABLE `dh_chat_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '发送yud',
  `to_uid` int(10) unsigned DEFAULT '0' COMMENT '接收uid',
  `content` varchar(300) DEFAULT '' COMMENT '消息内容',
  `is_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '接收者是否已读 1已读 0未读',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `to_uid` (`to_uid`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='聊天记录';

/*Data for the table `dh_chat_log` */

insert  into `dh_chat_log`(`id`,`uid`,`to_uid`,`content`,`is_reader`,`created`) values (1,2,3,'这是我的回复信息',1,1506585491),(2,2,3,'这是我的回复信息',1,1506585529),(3,2,3,'啦咯啦咯来咯啦咯啦咯啦咯',1,1507520456),(4,2,4,'你明明',1,1507533768),(5,2,3,'hhhvvgg',1,1507780095),(6,1,2,'在么？',1,1507786921),(7,1,2,'在么？',1,1507786932),(8,2,1,'在的亲',1,1507787075),(9,2,3,'咨询一下',1,1507861793),(10,7,2,'方法公积金',1,1507877057),(11,2,7,'过敏明敏',1,1507877141),(12,7,1,'凤凰',1,1507877330),(13,2,0,'来来来',1,1507884187),(14,0,2,'这是一条回复信息',1,1508314650),(15,0,2,'这里是测试信息哦哦哦能收到么',1,1508315061),(16,7,1,'刚回家看看',1,1511335675),(17,7,1,'打广告',1,1511335707),(18,7,3,'还回家',1,1511335933),(19,2,3,'啦咯啦咯来咯啦咯啦咯啦咯',1,1511335989),(20,2,3,'咯哦哦',1,1511336016),(21,3,2,'啦啦啦',1,1511336025),(22,2,3,'来来来',1,1511336053),(23,2,3,'考虑考虑',1,1511336060),(24,2,1,'考虑考虑',1,1511336098),(25,2,3,'啦咯啦咯考虑',1,1511336177),(26,2,1,'啦咯啦咯考虑',1,1511336198),(27,2,3,'来来来',1,1511336248),(28,2,3,'来来来',1,1511336385),(29,2,3,'啦啦啦',1,1511336422),(30,2,3,'阿狸',1,1511336533),(31,2,3,'哦哦哦',1,1511336551),(32,2,3,'来来来',1,1511336718),(33,2,3,'拒绝',1,1511336738),(34,2,3,'阿狸',1,1511336747),(35,2,3,'来来来',1,1511336817),(36,2,3,'哦哦',1,1511336843),(37,2,3,'把',1,1511336958),(38,2,3,'的',1,1511337276),(39,2,3,'??',1,1511337317),(40,2,3,',ggh',1,1511750891),(41,2,3,'fff',1,1511750961),(42,2,3,'nnn',1,1511750972),(43,2,7,'cc',1,1511751015),(44,3,7,'bhh',1,1511751234),(45,8,7,'123456',1,1512437293),(46,8,7,'117265',1,1512437355),(47,8,2,'看哦',1,1512437607),(48,18,7,'经历了啦',1,1512439389),(49,18,7,'？我们',1,1512439928),(50,18,1,'可考虑考虑',0,1512440493),(51,18,3,'，据了解',0,1512440678),(52,18,3,'，几句',0,1512440716),(53,18,3,'我1155',0,1512440798),(54,18,7,'1222',0,1512443057),(55,8,18,'1111',0,1512443116),(56,18,8,'2222',0,1512443132),(57,8,18,'Hjgjk',0,1512443201),(58,8,18,'98ijhip',0,1512443828),(59,8,18,'Dgfs',0,1512443913),(60,8,18,'Ijhkjlh',0,1512443964),(61,8,18,'Sdfasdf',0,1512444249),(62,8,18,'Qqweqweeq',0,1512444467),(63,8,18,'Lllll',0,1512445238),(64,18,8,'123',0,1512446859),(65,18,8,'234',0,1512446867),(66,18,8,'456',0,1512446872),(67,8,18,'123123',0,1512446886),(68,3,2,'hhh',0,1512456587),(69,3,2,'jj',0,1512456899),(70,18,8,'111111111',0,1512457221),(71,3,2,'fgg',0,1512457976),(72,2,3,'改好',0,1512458185),(73,18,8,'qqwe',0,1512633675);

/*Table structure for table `dh_circle` */

DROP TABLE IF EXISTS `dh_circle`;

CREATE TABLE `dh_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1汽车',
  `title` varchar(150) DEFAULT '' COMMENT '标题',
  `thumb` varchar(100) DEFAULT '' COMMENT '封面图片',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `description` mediumtext COMMENT '详情',
  `ablum` varchar(500) DEFAULT '' COMMENT '相册',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除  0未删除',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1正常 0禁用',
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `del_status` (`del_status`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `dh_circle` */

insert  into `dh_circle`(`id`,`type`,`title`,`thumb`,`uid`,`description`,`ablum`,`created`,`del_status`,`status`) values (1,1,'','150632458755821.png',4,'','150632458755821.png,150632458712977.png',1506324587,0,1),(2,1,'','',4,'','',1506390246,0,1),(3,1,'','',4,'来点文字介绍了了了 ','',1506390269,0,1),(4,1,'','150639074685682.png',2,'我和你一样','150639074685682.png,150639074689516.png,150639074681938.png',1506390746,1,1),(5,1,'','150658772943247.jpeg',2,'不要说话','150658772943247.jpeg,150658772976354.jpeg,150658772972256.jpeg,150658772927363.jpeg',1506587729,1,1),(6,1,'','150761826747622.png',3,'我的分享','150761826747622.png',1507618267,1,1),(7,1,'','150787675668636.jpeg',7,'带个好飓风','150787675668636.jpeg',1507876756,1,1),(8,1,'','151064912972190.jpeg',7,'打得过不重重复复','151064912972190.jpeg',1510649128,0,1),(9,1,'','151064913125207.jpeg',12,'来咯KTV图咯哦哦','151064913125207.jpeg',1510649131,0,1),(10,1,'','151080236814844.jpeg',3,'好咯啦咯啦咯啦咯啦','151080236814844.jpeg',1510802367,1,1),(11,1,'','',3,'啦啦啦','',1510802404,1,1),(12,1,'','151080242252352.jpeg',3,'监控','151080242252352.jpeg,151080242264876.jpeg',1510802421,1,1),(13,1,'','',2,'啊啊啊???','',1510810372,1,1),(14,1,'','',2,'???','',1510810423,1,1),(15,1,'','',2,'呃呃呃','',1510906822,0,1),(16,1,'','',3,'hhh','',1510908051,0,1),(17,1,'','',7,'发个呵呵','',1510909015,0,1),(18,1,'','',3,'陌陌','',1510909021,0,1),(19,1,'','1512443101648_20.jpeg',18,'彭发的测试','1512443101648_20.jpeg',1512443100,1,1),(20,1,'','1513932994983_66.jpeg',2,'fastgo','1513932994983_66.jpeg',1513932994,0,1);

/*Table structure for table `dh_collection` */

DROP TABLE IF EXISTS `dh_collection`;

CREATE TABLE `dh_collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户名',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型 1汽车 2服务',
  `value` varchar(100) DEFAULT '0' COMMENT '对应值',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `del_status` (`del_status`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='收藏列表';

/*Data for the table `dh_collection` */

insert  into `dh_collection`(`id`,`uid`,`type`,`value`,`del_status`,`created`) values (1,1,1,'1',0,1505803330),(2,2,1,'8',1,1505900467),(3,2,1,'5',1,1506065736),(4,2,1,'5',1,1506067558),(5,2,1,'8',1,1506067564),(6,2,1,'5',1,1506067597),(7,2,1,'3',1,1506067600),(8,7,1,'11',1,1507877374),(9,7,1,'11',1,1507877377),(10,7,1,'11',0,1507877708),(11,18,1,'10',0,1512631261);

/*Table structure for table `dh_column` */

DROP TABLE IF EXISTS `dh_column`;

CREATE TABLE `dh_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_type` int(10) unsigned DEFAULT '1' COMMENT '站点信息',
  `parentid` int(10) unsigned DEFAULT '0' COMMENT '父级id',
  `model_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '模型id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `name_jp` varchar(30) DEFAULT '' COMMENT '英文栏目名称',
  `name_en` varchar(30) DEFAULT '' COMMENT '日文栏目名称',
  `bname` varchar(100) DEFAULT '' COMMENT '栏目别名',
  `bname_en` varchar(100) DEFAULT '' COMMENT '英文栏目别名',
  `bname_jp` varchar(100) DEFAULT '' COMMENT '日文栏目别名',
  `thumb` varchar(200) DEFAULT NULL COMMENT '图片',
  `description` varchar(250) DEFAULT '' COMMENT '栏目简介',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态 1显示 0不显示',
  `url` varchar(150) DEFAULT '' COMMENT '后台跳转地址',
  `jump_url` varchar(200) DEFAULT NULL COMMENT '前台调整地址',
  `module` varchar(50) DEFAULT '' COMMENT '模块名称',
  `controller` varchar(50) DEFAULT '' COMMENT '控制器名称',
  `action` varchar(50) DEFAULT '' COMMENT '方法名称',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `created` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`,`is_show`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='栏目列表';

/*Data for the table `dh_column` */

insert  into `dh_column`(`id`,`web_type`,`parentid`,`model_id`,`name`,`name_jp`,`name_en`,`bname`,`bname_en`,`bname_jp`,`thumb`,`description`,`is_show`,`url`,`jump_url`,`module`,`controller`,`action`,`sort`,`created`) values (1,1,0,1,'国际商学院',NULL,NULL,'Business School','','',NULL,'',1,'/content/article_list/lists','/index/business_school/about/s/cid/6','content','article_list','lists',0,1508144704),(2,1,0,1,'高中部',NULL,NULL,'High School','','',NULL,'',1,'/content/article_list/lists','/index/hight_school/about/s/cid/13','content','article_list','lists',0,1508144724),(3,1,0,1,'恒鼎社区',NULL,NULL,'Community','','',NULL,'',1,'/content/article_list/lists','/index/bbs/s/cid/23','content','article_list','lists',0,1508144740),(4,1,0,1,'入学必读',NULL,NULL,'Must Read','','',NULL,'',1,'/content/article_list/lists','/index/must_read/s/cid/4','content','article_list','lists',0,1508144771),(5,1,0,1,'关于我们',NULL,NULL,'About Us','','',NULL,'',1,'/content/article_list/lists','/index/about/s/cid/5','content','article_list','lists',0,1508144802),(6,1,1,1,'学院简介',NULL,NULL,'College Introduction','','',NULL,'',1,'/content/article_list/lists','/index/business_school/about/s/cid/6','content','article_list','lists',0,1508148724),(7,1,1,2,'恒鼎商学院教研团队',NULL,NULL,'Teaching and research team','','',NULL,'',1,'/content/article_list/lists','/index/business_school/team/s/cid/7','content','article_list','lists',0,1508148724),(8,1,1,3,'澳洲大学课程',NULL,NULL,'Australian university course','','',NULL,'',1,'/content/article_list/lists','/index/business_school/lession/s/cid/8','content','article_list','lists',0,1508148724),(9,1,1,1,'留学部',NULL,NULL,'Study Abroad','','',NULL,'',1,'/content/article_list/lists','/index/business_school/about/s/cid/9','content','article_list','lists',0,1508148724),(10,1,5,1,'恒鼎学院简介',NULL,NULL,'College Introduction','','',NULL,'',1,'/content/article_list/lists','/index/about/s/cid/10','content','article_list','lists',0,1508228818),(11,1,5,1,'联系我们',NULL,NULL,'Contact Us','','',NULL,'',1,'/content/article_list/lists','/index/about/s/cid/11','content','article_list','lists',0,1508228818),(12,1,5,1,'合作院校',NULL,NULL,'Partner Institutions','','',NULL,'',1,'/content/article_list/lists','/index/about/s/cid/12','content','article_list','lists',0,1508228818),(13,1,2,1,'部门简介',NULL,NULL,'Department Profile','','',NULL,'',1,'/content/article_list/lists','/index/hight_school/about/s/cid/13','content','article_list','lists',0,1508228969),(14,1,2,2,'高中部团队',NULL,NULL,'Team','','',NULL,'',1,'/content/article_list/lists','/index/hight_school/team/s/cid/14','content','article_list','lists',0,1508228969),(15,1,2,3,'直播课程',NULL,NULL,'Live Course','','',NULL,'',1,'/content/article_list/lists','/index/hight_school/lession/s/cid/15','content','article_list','lists',0,1508228969),(16,1,2,3,'视频课程',NULL,NULL,'Video Course','','',NULL,'',1,'/content/article_list/lists','/index/hight_school/lession/s/cid/16','content','article_list','lists',0,1508228969),(17,1,2,3,'学霸共享计划',NULL,NULL,'Hegemony Program','','',NULL,'',1,'/content/article_list/lists','/index/hight_school/lession/s/cid/17','content','article_list','lists',0,1508228969),(19,1,0,1,'其他栏目管理',NULL,NULL,'其他栏目管理','','',NULL,'',0,'/content/article_list/lists','','content','article_list','lists',0,1509931335),(20,1,19,1,'常见问题',NULL,NULL,'常见问题','','',NULL,'',1,'/content/article_list/lists','','content','article_list','lists',0,1509931438),(21,1,5,1,'最新资讯',NULL,NULL,'Latest News','','',NULL,'',1,'/content/article_list/lists','/index/about/news/s/cid/21','content','article_list','lists',0,1509932255),(22,1,5,1,'证书查询',NULL,NULL,'Certificate Inquiry','','',NULL,'',1,'/content/article_list/lists','/index/about/inquiry/s/cid/22','content','article_list','lists',0,1509932732),(23,1,3,1,'学习讨论专区',NULL,NULL,'Study Area','','',NULL,'',1,'/content/article_list/lists','/index/bbs/s/cid/23','content','article_list','lists',0,1509946955),(24,1,3,1,'留学与国际专区',NULL,NULL,'Study abroad and international zone','','',NULL,'',1,'/content/article_list/lists','/index/bbs/s/cid/24','content','article_list','lists',0,1509946955),(25,1,3,1,'生活交流专区',NULL,NULL,'Life Exchange Area','','',NULL,'',1,'/content/article_list/lists','/index/bbs/s/cid/25','content','article_list','lists',0,1509946955),(26,1,3,1,'新闻教育',NULL,NULL,'News Education','','',NULL,'',1,'/content/article_list/lists','/index/bbs/s/cid/26','content','article_list','lists',0,1509946955),(27,1,19,2,'老师资质荣誉',NULL,NULL,'老师资质荣誉','','',NULL,'',1,'/content/article_list/lists','','content','article_list','lists',0,1510198703),(28,1,19,4,'学生下载',NULL,NULL,'学生下载','','',NULL,'',1,'/content/article_list/lists','','content','article_list','lists',0,1511776943),(29,2,0,1,'关于我们',NULL,NULL,'美丽与诱惑','','','525fe8da0aba8c76c011180c48148cc7.png','',1,'/content/article_list/lists','/about/detail/s/cid/29','content','article_list','lists',0,1512352401),(30,2,0,1,'品牌简介',NULL,NULL,'美的改变为己任','','','17e5bb9d24c4bbcd97eff1dac4730a61.png','',1,'/content/article_list/lists','/about/detail/s/cid/35','content','article_list','lists',0,1512352651),(31,2,0,1,'产品中心',NULL,NULL,'引领时尚潮流','','','20a38e1d10a1694afd5c94f8502ccb17.png','',1,'/content/article_list/lists','/product/lists/s/cid/38','content','article_list','lists',0,1512352651),(32,2,0,5,'销售网点',NULL,NULL,'全国营销网络','','','531b9cf54753919ad9725aa438a00390.png','',1,'/content/article_list/lists','/shop/lists/s/cid/32','content','article_list','lists',0,1512352651),(33,2,0,1,'经营加盟',NULL,NULL,'终端营销管理','','','28bba05e989b19fbf2182b4852c10dbf.png','',1,'/content/article_list/lists','/about/detail/s/cid/45','content','article_list','lists',0,1512352651),(34,2,0,1,'新闻中心',NULL,NULL,'最新资讯信息','','','b367ee2c5a305c5aa368f872a7e242dc.png','',1,'/content/article_list/lists','/news/lists/s/cid/42','content','article_list','lists',0,1512352651),(35,2,30,1,'品牌宣传',NULL,NULL,'品牌宣传','','','','',1,'/content/article_list/lists','/about/detail/s/cid/35','content','article_list','lists',0,1512352949),(36,2,30,1,'企业概况',NULL,NULL,'企业概况','','','','',1,'/content/article_list/lists','/about/detail/s/cid/36','content','article_list','lists',0,1512352949),(37,2,30,1,'联系我们',NULL,NULL,'联系我们','','','','',1,'/content/article_list/lists','/about/detail/s/cid/37','content','article_list','lists',0,1512352949),(38,2,31,1,'美体功能',NULL,NULL,'美体功能','','','','',1,'/content/article_list/lists','/product/lists/s/cid/38','content','article_list','lists',0,1512352989),(39,2,31,1,'健康调整型',NULL,NULL,'健康调整型','','','','',1,'/content/article_list/lists','/product/lists/s/cid/39','content','article_list','lists',0,1512352989),(40,2,31,1,'至尊男士',NULL,NULL,'至尊男士','','','','',1,'/content/article_list/lists','/product/lists/s/cid/40','content','article_list','lists',0,1512352989),(41,2,31,1,'家居服',NULL,NULL,'家居服','','','','',1,'/content/article_list/lists','/product/lists/s/cid/41','content','article_list','lists',0,1512352989),(42,2,34,1,'欧拉曲曼',NULL,NULL,'欧拉曲曼','','','','',1,'/content/article_list/lists','/news/lists/s/cid/42','content','article_list','lists',0,1512353028),(43,2,34,1,'每月活动',NULL,NULL,'每月活动','','','','',1,'/content/article_list/lists','/news/lists_active/s/cid/43','content','article_list','lists',0,1512353028),(44,2,34,1,'流行资讯',NULL,NULL,'流行资讯','','','','',1,'/content/article_list/lists','/news/lists/s/cid/44','content','article_list','lists',0,1512353028),(45,2,33,1,'加盟政策',NULL,NULL,'加盟政策','','','','',1,'/content/article_list/lists','/about/detail/s/cid/45','content','article_list','lists',0,1512353097),(46,2,33,1,'加盟流程',NULL,NULL,'加盟流程','','','','',1,'/content/article_list/lists','/about/detail/s/cid/46','content','article_list','lists',0,1512353097),(47,2,33,1,'加盟申请',NULL,NULL,'加盟申请','','','','',1,'/content/article_list/lists','/about/join/s/cid/47','content','article_list','lists',0,1512353097),(48,2,30,1,'店铺形象',NULL,NULL,'店铺形象','','','','',1,'/content/article_list/lists','/about/detail/s/cid/35','content','article_list','lists',0,1513237446),(50,3,0,1,'常见问题','よくある質問','Common Problem','常见问题','','','','',1,'/content/article_list/lists','','content','article_list','lists',1,1513655226),(51,3,0,1,'流程简介','プロセス導入','Process Description','流程简介','','','','',1,'/content/article_list/lists','','content','article_list','lists',2,1513655226),(52,3,0,1,'运费报价','運賃見積もり','Freight Quote','运费报价','','','','',1,'/content/article_list/lists','','content','article_list','lists',3,1513655226),(53,3,0,1,'汇率查看','為替レートビュー','Exchange Rate View','汇率查看','','','','',1,'/content/article_list/lists','','content','article_list','lists',4,1513655226),(54,3,0,1,'包裹通知','ダイレクトメールパッケージ通知','Straight Wrap notification','直邮包裹通知','','','','',0,'/content/article_list/lists','','content','article_list','lists',0,1513906989),(56,3,0,1,'关于我们','','','关于我们','','','','',0,'/content/article_list/lists','','content','article_list','lists',0,1516583807);

/*Table structure for table `dh_comment` */

DROP TABLE IF EXISTS `dh_comment`;

CREATE TABLE `dh_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1车友圈 2汽车 3服务 4聊天来信 5社区评论',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '发布者uid',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '父级id',
  `to_uid` int(11) unsigned DEFAULT '0' COMMENT '回复者uid',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `order_sn` varchar(18) CHARACTER SET utf8 DEFAULT '' COMMENT '订单编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品id',
  `ablum` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '评价相册',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 2关闭',
  `is_uid_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '发布者阅读状态 1已读 0未读',
  `is_to_uid_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '接受者阅读状态 1已读 0未读',
  `created` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `hot` int(11) DEFAULT '0' COMMENT '点赞数量',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `parent_id` (`parent_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_comment` */

/*Table structure for table `dh_console_admin` */

DROP TABLE IF EXISTS `dh_console_admin`;

CREATE TABLE `dh_console_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consoleid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '后台用户唯一id',
  `nickname` varchar(10) DEFAULT '' COMMENT '昵称',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户',
  `password` char(128) NOT NULL DEFAULT '' COMMENT 'md5登录密码',
  `salt` char(5) NOT NULL DEFAULT '0' COMMENT '唯一码',
  `mobile` char(11) NOT NULL DEFAULT '0' COMMENT '手机号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `group` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '所属管理组',
  `create_ip` varchar(15) DEFAULT '0' COMMENT '创建ip',
  `login_ip` varchar(15) DEFAULT '0' COMMENT '登录ip',
  `created` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '创建时间',
  `login_time` int(10) DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

/*Data for the table `dh_console_admin` */

insert  into `dh_console_admin`(`id`,`consoleid`,`nickname`,`username`,`password`,`salt`,`mobile`,`status`,`group`,`create_ip`,`login_ip`,`created`,`login_time`) values (1,0,'四月','admin','8895c4947031a4019843c0d00fa303b1','50907','15923882847',1,1,'127.0.0.1','127.0.0.1',1502522576,1516761095),(4,0,'后台管理员','console','b91935189cc2442e45d86a4d0dbf8a9c','34366','15923882847',1,2,'127.0.0.1','127.0.0.1',1502531990,1509696854);

/*Table structure for table `dh_console_group` */

DROP TABLE IF EXISTS `dh_console_group`;

CREATE TABLE `dh_console_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '管理员分组名称',
  `power` mediumtext COMMENT '权限列表',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 0禁用',
  `level` tinyint(1) unsigned DEFAULT '1' COMMENT '所属等级 小数字可管理大数字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台管理分组';

/*Data for the table `dh_console_group` */

insert  into `dh_console_group`(`id`,`name`,`power`,`status`,`level`) values (1,'超级管理员','1,2,3,4,5,35,6,7,8,10,17,11,12,13,14,15,16,18,28,19,20,21,22,23,24,25,26,27,29,30,31,33,34,32,38,39,36,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55',1,0),(2,'运营组','10,17,11,12,15,16,18,28,19,20,21,29,30,31,33,34,32,40,41,44,45,46,13,14,22,23,24,25,26,27,38,39,42',1,1);

/*Table structure for table `dh_console_menus` */

DROP TABLE IF EXISTS `dh_console_menus`;

CREATE TABLE `dh_console_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1网站管理',
  `parentid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `module` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名称',
  `controller` varchar(50) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '方法名称',
  `icon` varchar(60) DEFAULT '' COMMENT 'Icon图标样式',
  `parameter` varchar(20) DEFAULT '' COMMENT '附加参数',
  `url` varchar(150) DEFAULT '' COMMENT '请求地址',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '是否有效 1有效 0无效',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示 1显示 0不显示',
  `is_white` tinyint(1) unsigned DEFAULT '0' COMMENT '是否白名单 1白名单 0不进白名单',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `dh_console_menus` */

insert  into `dh_console_menus`(`id`,`type`,`parentid`,`name`,`module`,`controller`,`action`,`icon`,`parameter`,`url`,`status`,`is_show`,`is_white`,`sort`,`del_status`,`created`) values (1,1,0,'系统管理','setting','menus','index','glyphicon glyphicon-triangle-right','','',1,1,0,0,0,1502445648),(2,1,1,'设置','setting','parameter','lists','glyphicon glyphicon-wrench','','/setting/parameter/lists',1,1,0,0,0,1507788908),(3,1,2,'配置菜单','setting','menus','index','','','/setting/menus/index',1,1,0,1,0,1502508459),(4,1,3,'添加/编辑菜单','setting','menus','edit','','','',1,0,0,0,0,1502440822),(5,1,3,'树状菜单列表','setting','menus','tree_list','','','',1,0,0,0,0,1502440812),(6,1,2,'管理员','setting','admin','index','','','/setting/admin/index',1,1,0,3,0,1502516144),(7,1,6,'管理员列表','setting','admin','index','','','/setting/admin/index',1,1,0,0,0,1502517276),(8,1,6,'管理员分组','setting','group','index','','','/setting/group/index',1,1,0,0,0,1502517279),(10,1,0,'网站管理','content','list','index','glyphicon glyphicon-triangle-right','','/content/list/index',1,1,0,0,0,1505529695),(11,1,17,'博客','content','blog','index','glyphicon glyphicon-book','','/content/blog/index',1,1,0,0,0,1505577819),(12,1,11,'文章列表','content','blog','index','','','/content/blog/index',1,1,0,0,0,1505577827),(13,1,17,'分类管理','content','category','lists','glyphicon glyphicon-book','','/content/category/lists',1,1,0,1,0,1505529783),(14,1,13,'分类列表','content','category','lists','','','/content/category/lists',1,1,0,0,0,1505462341),(15,1,17,'会员管理','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529776),(16,1,15,'会员列表','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529506),(17,1,10,'内容管理','content','category','lists','glyphicon glyphicon-hdd','','/content/category/lists',1,1,0,0,0,1512010034),(18,1,15,'积分规则','content','integral_rul','lists','','','/content/integral_rul/lists',1,1,0,0,0,1505783604),(19,1,17,'商品管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784921),(20,1,19,'汽车管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784943),(21,1,19,'服务管理','content','service','lists','','','/content/service/lists',1,1,0,0,0,1505784962),(22,1,17,'广告位管理','content','banner','lists','','','/content/banner/lists',1,1,0,0,0,1512522718),(23,1,22,'广告分类','content','banner','lists','','','/content/banner/lists',1,1,0,0,0,1505810230),(24,1,17,'搜索管理','content','search','lists','','','/content/search/lists',1,1,0,3,0,1505873873),(25,1,24,'搜索记录','content','search','lists','','','/content/search/lists',1,1,0,0,0,1505873843),(26,1,24,'推荐列表','content','search','recommend_lists','','','/content/search/recommend_lists',1,1,0,0,0,1505873952),(27,1,24,'禁用列表','content','search','disable_lists','','','/content/search/disable_lists',1,1,0,0,0,1505874438),(28,1,15,'店铺管理','content','shop','lists','','','/content/shop/lists',1,1,0,0,0,1505958027),(29,1,17,'服务管理','content','orders','lists','','','/content/orders/lists',1,1,0,0,0,1506414050),(30,1,29,'订单列表','content','orders','lists','','','/content/orders/lists',1,1,0,0,0,1506413737),(31,1,17,'推荐管理','content','recommend','car','','','/content/recommend/car',1,1,0,0,0,1506670836),(32,1,17,'抵扣卷管理','content','coupon','lists','','','/content/coupon/lists',1,1,0,0,0,1506477699),(33,1,31,'汽车列表','content','recommend','car','','','/content/recommend/car',1,1,0,0,0,1506670803),(34,1,31,'服务列表','content','recommend','service','','','/content/recommend/service',1,1,0,0,0,1506670828),(35,1,2,'参数配置','setting','parameter','lists','','','/setting/parameter/lists',1,1,0,2,0,1507778297),(36,1,10,'栏目管理','content','menus','index','glyphicon glyphicon-tasks','','/content/menus/index',1,1,0,0,0,1512010054),(37,1,36,'栏目列表','content','menus','index','','','/content/menus/index',1,1,0,0,0,1508138973),(38,1,17,'聊天管理','content','chart','lists','','','/content/chart/lists',1,1,0,4,0,1508306713),(39,1,38,'聊天记录','content','chart','lists','','','/content/chart/lists',1,1,0,0,0,1508306700),(40,1,32,'模板列表','content','coupon','lists','','','/content/coupon/lists',1,1,0,0,0,1508899352),(41,1,32,'兑换规则','content','coupon','exchange_rule_list','','','/content/coupon/exchange_rule_list',1,1,0,0,0,1508900844),(42,1,17,'APP版本管理','content','app_version','lists','','','/content/app_version/lists',1,1,0,5,0,1509524923),(43,1,6,'管理员修改','setting','personal','edit','','','/setting/personal/edit',1,1,0,0,0,1509694556),(44,1,17,'考卷管理','content','exam','lists','','','/content/exam/lists',1,1,0,0,0,1511513835),(45,1,44,'考卷列表','content','exam','lists','','','/content/exam/lists',1,1,0,0,0,1511513852),(46,1,44,'考试记录','content','exam_log','lists','','','/content/exam_log/lists',1,1,0,0,0,1512008165),(47,1,17,'在线留言','content','visitor_comment','lists','','','/content/visitor_comment/lists',1,1,0,6,0,1512629666),(48,1,17,'表单管理','content','from','lists','','','/content/form/lists',1,1,0,0,0,1512714124),(49,1,48,'表单列表','content','from','lists','','','/content/from/lists',1,1,0,0,0,1512714116),(50,1,17,'库房管理','content','warehouse','lists','','','/content/warehouse/lists',1,1,0,0,0,1514272035),(51,1,15,'问题反馈','content','feedback','lists','','','/content/feedback/lists',1,1,0,0,0,1514358513),(52,1,15,'会员等级','content','userlevel','index','','','/content/userlevel/index',1,1,0,0,0,1516440629),(53,1,10,'消息管理','notice','sys_notice_rule','index','glyphicon glyphicon-envelope','','/notice/sys_notice_rule/index',1,1,0,0,0,1516608189),(54,1,53,'系统通知','notice','sys_notice_rule','index','','','/notice/sys_notice_rule/index',1,1,0,0,0,1516588702),(55,1,54,'通知列表','notice','sys_notice_rule','index','','','/notice/sys_notice_rule/index',1,1,0,0,0,1516588741);

/*Table structure for table `dh_console_parameter` */

DROP TABLE IF EXISTS `dh_console_parameter`;

CREATE TABLE `dh_console_parameter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1单行文本 2多行文本 3下拉 4单选 5多选',
  `name` varchar(50) DEFAULT '' COMMENT '参数名称',
  `value` varchar(300) DEFAULT '' COMMENT '参数值',
  `option` varchar(500) DEFAULT '' COMMENT '参数选项',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态  1删除  0未删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='后台参数配置';

/*Data for the table `dh_console_parameter` */

insert  into `dh_console_parameter`(`id`,`type`,`name`,`value`,`option`,`del_status`) values (1,1,'车行汽车交易佣金(百分比)','4','',0),(2,1,'公司电话','','',1),(3,1,'公司地址','','',1),(4,1,'公司地址英文','','',1),(5,1,'积分抵扣规则','1000:0.9','',0);

/*Table structure for table `dh_coupon` */

DROP TABLE IF EXISTS `dh_coupon`;

CREATE TABLE `dh_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1满减 2折扣',
  `category` tinyint(1) unsigned NOT NULL COMMENT '所属分类',
  `uid` int(11) DEFAULT NULL COMMENT '发放者uid',
  `title` varchar(50) DEFAULT '' COMMENT '抵扣卷名称',
  `title_en` varchar(100) DEFAULT '' COMMENT '抵扣卷名称英文',
  `title_jp` varchar(100) DEFAULT '' COMMENT '抵扣卷名称日文',
  `full` decimal(10,0) DEFAULT '0' COMMENT '满多少钱',
  `less` decimal(10,0) DEFAULT '0' COMMENT '减少多少钱',
  `discount` float DEFAULT '0' COMMENT '折扣',
  `num` int(11) DEFAULT '0' COMMENT '发放数量',
  `start_time` int(11) DEFAULT '0' COMMENT '开始生效时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束生效时间',
  `description` varchar(500) DEFAULT '' COMMENT '抵扣卷说明中文',
  `description_en` varchar(500) DEFAULT '' COMMENT '抵扣卷说明英文',
  `description_jp` varchar(500) DEFAULT '' COMMENT '抵扣卷说明日文',
  `unit` char(4) DEFAULT 'CNY' COMMENT '抵扣货币单位',
  `remainder_num` int(11) DEFAULT '0' COMMENT '剩余领取数量',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_exchange` tinyint(1) DEFAULT '1' COMMENT '是否允许积分兑换 1允许 0不允许',
  `version` int(11) DEFAULT '1' COMMENT '版本控制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='抵扣卷模板';

/*Data for the table `dh_coupon` */

insert  into `dh_coupon`(`id`,`type`,`category`,`uid`,`title`,`title_en`,`title_jp`,`full`,`less`,`discount`,`num`,`start_time`,`end_time`,`description`,`description_en`,`description_jp`,`unit`,`remainder_num`,`status`,`del_status`,`created`,`is_exchange`,`version`) values (2,1,23,1,'5折优惠卷','','','10','5',0,100,1505701881,1510329600,NULL,'','','CNY',92,1,0,1506411977,1,9),(3,1,21,1,'5折优惠卷','','','1000','100',0,100,1505701881,1507564800,NULL,'','','CNY',98,1,0,1506411977,1,9),(4,1,20,3,'满100减10','','','200','5',0,400,1509465600,1512057600,NULL,'','','CNY',397,1,0,1506483325,1,4),(5,2,20,3,'这个是名称','','','0','0',8,55,1506787200,1509465600,NULL,'','','CNY',300,1,0,1506483455,1,1),(6,1,21,1,'5折优惠卷','','','1000','100',0,100,1505701881,1507564800,NULL,'','','CNY',100,1,0,1506491073,1,1),(7,1,21,1,'5折优惠卷','','','1000','100',0,100,1505701881,1507564800,NULL,'','','CNY',100,1,0,1506491125,1,1),(8,1,23,3,'满100减5','','','100','5',0,200,1506528000,1506700800,NULL,'','','CNY',199,1,0,1506562539,1,2),(9,2,21,1,'11111','','','0','0',5,100,2024,2026,NULL,'','','CNY',100,1,0,1509086696,1,1),(10,1,72,47,'啦啦啦','','','50','5',0,1,1511413200,1511499600,NULL,'','','CNY',1,1,0,1511413885,1,1),(11,2,72,1,'该喝喝','','','0','0',1,10,1514563200,1546185600,NULL,'','','CNY',10,1,0,1511415379,1,1);

/*Table structure for table `dh_coupon_exchange_rule` */

DROP TABLE IF EXISTS `dh_coupon_exchange_rule`;

CREATE TABLE `dh_coupon_exchange_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '兑换名称',
  `category` int(11) DEFAULT NULL COMMENT '所属分类ID',
  `integral` int(10) unsigned DEFAULT NULL COMMENT '所需积分',
  `ico` varchar(150) DEFAULT NULL COMMENT '对应图标地址',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='抵扣券兑换规则';

/*Data for the table `dh_coupon_exchange_rule` */

insert  into `dh_coupon_exchange_rule`(`id`,`name`,`category`,`integral`,`ico`,`sort`,`status`) values (1,'汽车贴膜优惠卷',20,600,'',0,1),(2,'汽车改装优惠卷',21,1000,'',0,1),(3,'汽车清洗优惠卷',22,300,'',0,1),(4,'汽车交易优惠卷',23,1000,'',0,1),(5,'汽车保养优惠卷',24,400,'',0,1);

/*Table structure for table `dh_coupon_log` */

DROP TABLE IF EXISTS `dh_coupon_log`;

CREATE TABLE `dh_coupon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT '0' COMMENT '所属用户uid',
  `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '抵扣卷模板id',
  `order_sn` char(18) DEFAULT '0' COMMENT '使用的订单号',
  `use_time` int(11) unsigned DEFAULT '0' COMMENT '使用时间',
  `created` int(11) unsigned DEFAULT '0' COMMENT '领取时间',
  `origin` tinyint(1) DEFAULT '1' COMMENT '抵扣卷来源 1赠送 2兑换',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `coupon_id` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='抵扣卷列表';

/*Data for the table `dh_coupon_log` */

insert  into `dh_coupon_log`(`id`,`uid`,`coupon_id`,`order_sn`,`use_time`,`created`,`origin`) values (48,27,2,'0',0,1508914728,2),(49,27,2,'0',0,1508915046,2),(50,27,2,'0',0,1508915047,2),(51,27,4,'0',0,1510650815,2),(52,27,4,'0',0,1511147108,2);

/*Table structure for table `dh_coupon_send_rule` */

DROP TABLE IF EXISTS `dh_coupon_send_rule`;

CREATE TABLE `dh_coupon_send_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(10) unsigned DEFAULT '0' COMMENT '分类id',
  `integral` int(10) unsigned DEFAULT '0' COMMENT '赠送积分',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dh_coupon_send_rule` */

/*Table structure for table `dh_course_comment` */

DROP TABLE IF EXISTS `dh_course_comment`;

CREATE TABLE `dh_course_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户uid',
  `teacher_uid` int(10) unsigned DEFAULT '0' COMMENT '老师uid',
  `content` varchar(500) DEFAULT '' COMMENT '内容',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id user_course_log主键',
  `order_sn` char(18) DEFAULT '' COMMENT '订单编号',
  `goods_id` int(10) unsigned DEFAULT '0' COMMENT '课程id',
  `shipping_score` tinyint(1) unsigned DEFAULT '50' COMMENT '课程安排评分 满分50 每10分一颗星',
  `teacher_score` tinyint(1) unsigned DEFAULT '50' COMMENT '老师专业评分 满分50 每10分一颗星',
  `created` int(10) unsigned DEFAULT '0' COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_course_comment` */

insert  into `dh_course_comment`(`id`,`uid`,`teacher_uid`,`content`,`course_id`,`order_sn`,`goods_id`,`shipping_score`,`teacher_score`,`created`) values (12,10,8,'1',7,'173175139456615895',47,10,50,1511237044),(13,7,8,'满意',11,'173253093980531653',59,40,40,1511334182);

/*Table structure for table `dh_depot` */

DROP TABLE IF EXISTS `dh_depot`;

CREATE TABLE `dh_depot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `type_copy` varchar(20) DEFAULT '' COMMENT '类别文案',
  `brand` varchar(20) DEFAULT '' COMMENT '品牌',
  `spec` varchar(20) DEFAULT '' COMMENT '规格',
  `stock` int(10) unsigned DEFAULT '0' COMMENT '库存',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='库房管理';

/*Data for the table `dh_depot` */

/*Table structure for table `dh_enjoy` */

DROP TABLE IF EXISTS `dh_enjoy`;

CREATE TABLE `dh_enjoy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1车友圈 2文章 3评论',
  `value` varchar(10) DEFAULT '' COMMENT '对于值',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户uid',
  `ip` char(20) DEFAULT '0.0.0.0' COMMENT 'ip',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='用户喜欢表';

/*Data for the table `dh_enjoy` */

insert  into `dh_enjoy`(`id`,`type`,`value`,`uid`,`ip`,`created`) values (7,1,'4',2,'0.0.0.0',1506587887),(8,1,'1',3,'0.0.0.0',1507689475),(9,1,'4',3,'0.0.0.0',1507689478),(10,1,'5',7,'0.0.0.0',1507876874),(11,1,'6',7,'0.0.0.0',1507876886),(12,1,'6',2,'0.0.0.0',1507885864),(13,2,'49',10,'0.0.0.0',1510900428),(14,3,'49',10,'0.0.0.0',1510900671),(15,3,'50',10,'0.0.0.0',1510900747),(16,2,'50',10,'0.0.0.0',1510902819),(17,1,'2',2,'0.0.0.0',1513935663),(22,1,'20',18,'0.0.0.0',1514455810),(23,1,'18',18,'0.0.0.0',1514455813),(24,1,'17',18,'0.0.0.0',1514455816),(25,1,'16',18,'0.0.0.0',1514455818),(26,1,'16',22,'0.0.0.0',1514957379),(27,1,'17',22,'0.0.0.0',1514957384),(28,1,'18',22,'0.0.0.0',1514957392),(29,1,'18',3,'0.0.0.0',1516068659),(32,1,'18',27,'0.0.0.0',1516583812),(33,1,'17',27,'0.0.0.0',1516583816);

/*Table structure for table `dh_exam_data` */

DROP TABLE IF EXISTS `dh_exam_data`;

CREATE TABLE `dh_exam_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) unsigned DEFAULT NULL COMMENT '对于考卷id',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1单选 2多选 3文字',
  `title` varchar(500) DEFAULT NULL COMMENT '题目',
  `score` int(10) unsigned DEFAULT '0' COMMENT '题目分值',
  `content` mediumtext COMMENT '答案存放',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `exam_id` (`exam_id`,`del_status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='考卷题目';

/*Data for the table `dh_exam_data` */

insert  into `dh_exam_data`(`id`,`exam_id`,`type`,`title`,`score`,`content`,`del_status`,`sort`) values (3,6,2,'建立班级干部轮换制度、定期评议制度、值日生制度等，体现了班级( )管理',20,'[{\"answer\":\"\\u5e73\\u884c\",\"is_answer\":\"1\"},{\"answer\":\"\\u6c11\\u4e3b\",\"is_answer\":\"0\"},{\"answer\":\"\\u76ee\\u6807\",\"is_answer\":\"1\"},{\"answer\":\"\\u5e38\\u89c4\",\"is_answer\":\"1\"}]',0,0),(4,6,1,'现代班级管理强调以( )为核心来建立班级管理机制',20,'[{\"answer\":\"\\u5b66\\u6821\",\"is_answer\":\"0\"},{\"answer\":\"\\u6559\\u5e08\",\"is_answer\":\"1\"},{\"answer\":\"\\u5b66\\u751f\",\"is_answer\":\"0\"},{\"answer\":\"\\u6559\\u80b2\\u5185\\u5bb9\\u6559\\u80b2\\u5185\\u5bb9\",\"is_answer\":\"0\"}]',0,0),(5,6,1,'以下哪一项不属于班主任的常规工作',20,'[{\"answer\":\"\\u5efa\\u7acb\\u5b66\\u751f\\u6210\\u957f\\u6863\\u6848\",\"is_answer\":\"0\"},{\"answer\":\"\\u534f\\u8c03\\u5404\\u79cd\\u6559\\u80b2\\u5f71\\u54cd\",\"is_answer\":\"0\"},{\"answer\":\"\\u7ec4\\u7ec7\\u548c\\u57f9\\u517b\\u73ed\\u96c6\\u4f53\",\"is_answer\":\"0\"},{\"answer\":\"\\u540e\\u8fdb\\u751f\\u7684\\u4e2a\\u522b\\u6559\\u80b2\",\"is_answer\":\"1\"}]',0,0);

/*Table structure for table `dh_exam_list` */

DROP TABLE IF EXISTS `dh_exam_list`;

CREATE TABLE `dh_exam_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '' COMMENT '考卷名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `exam_time` int(11) DEFAULT '0' COMMENT '考试时间 0不限时间',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='考卷列表';

/*Data for the table `dh_exam_list` */

insert  into `dh_exam_list`(`id`,`name`,`status`,`exam_time`,`del_status`,`created`,`sort`) values (1,'测试考卷',1,NULL,0,0,0),(2,'测试考卷',1,NULL,0,0,0),(3,'测试试卷',1,NULL,0,0,0),(4,'测试试卷',1,NULL,0,0,0),(5,'测试考卷2',1,NULL,0,0,0),(6,'测试试卷0001',1,20,0,0,0);

/*Table structure for table `dh_finance_log` */

DROP TABLE IF EXISTS `dh_finance_log`;

CREATE TABLE `dh_finance_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned DEFAULT '1' COMMENT '类型 1佣金提成 2充值 3提现 3本地直邮 4国家转运',
  `title` varchar(200) DEFAULT '' COMMENT '支付标题',
  `uid` int(11) DEFAULT '0' COMMENT '所属用户uid',
  `pay_sn` char(18) DEFAULT '' COMMENT '支付编号 唯一',
  `order_sn` char(18) DEFAULT '' COMMENT '标识编码',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `pay_money` decimal(10,2) DEFAULT '0.00' COMMENT '支付金额',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '是否支付 1支付 0未支付',
  `is_lock` tinyint(1) unsigned DEFAULT '0' COMMENT '禁止操作 1禁止 0不禁止',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `issue_status` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态 0正常 1支付金额不一致 2支付币种不一致',
  `unit` varchar(20) DEFAULT 'CNY' COMMENT '货币种类',
  `pay_type` tinyint(1) unsigned DEFAULT '0' COMMENT '支付类型 1支付宝 2微信',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`uid`,`order_sn`,`is_pay`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COMMENT='财务记录';

/*Data for the table `dh_finance_log` */

insert  into `dh_finance_log`(`id`,`type`,`title`,`uid`,`pay_sn`,`order_sn`,`money`,`pay_money`,`is_pay`,`is_lock`,`created`,`issue_status`,`unit`,`pay_type`) values (228,4,'支付',18,'180176206014347396','180174448309212096','100.00','0.00',0,0,1516262060,0,'AUD',1),(229,4,'支付',18,'180176207120610026','180174448309212096','100.00','0.00',0,0,1516262071,0,'AUD',1),(230,4,'支付',18,'180176214132211707','180174448309212096','100.00','0.00',0,0,1516262141,0,'AUD',1),(231,4,'支付',2,'180176520718847946','180174636887698207','40.00','0.00',0,0,1516265206,0,'AUD',1),(232,4,'支付',2,'180176527546537830','180174636887698207','40.00','0.00',0,0,1516265275,0,'AUD',1),(233,4,'支付',2,'180176579252795096','180174636887698207','50.00','0.00',0,0,1516265792,0,'AUD',1),(234,4,'支付',2,'180176579830328519','180174636887698207','40.00','0.00',0,0,1516265798,0,'AUD',1),(235,4,'支付',2,'180176581188105882','180174636887698207','50.00','0.00',0,0,1516265811,0,'AUD',1),(236,4,'支付',2,'180176584247080500','180174636887698207','40.00','0.00',0,0,1516265842,0,'AUD',1),(237,4,'支付',2,'180176585551555169','180174636887698207','40.00','0.00',0,0,1516265855,0,'AUD',1),(238,4,'支付',2,'180176588949849934','180174636887698207','40.00','0.00',0,0,1516265889,0,'AUD',1),(239,4,'支付',2,'180176591484394430','180174636887698207','50.00','0.00',0,0,1516265914,0,'AUD',1),(240,4,'支付',2,'180176595011296410','180174636887698207','100.00','0.00',0,0,1516265949,0,'AUD',1),(241,4,'支付',2,'180176612336987705','180174636887698207','40.00','0.00',0,0,1516266123,0,'AUD',1),(242,4,'支付',2,'180176647718511519','180174636887698207','50.00','0.00',0,0,1516266477,0,'AUD',1),(243,4,'支付',2,'180176660125020184','180174636887698207','50.00','0.00',0,0,1516266601,0,'AUD',1),(244,4,'支付',2,'180176663758928223','180174636887698207','50.00','0.00',0,0,1516266637,0,'AUD',1),(245,4,'支付',2,'180176665179309419','180174636887698207','40.00','0.00',0,0,1516266651,0,'AUD',1),(246,4,'支付',2,'180176745775519942','180174636887698207','50.00','0.00',0,0,1516267457,0,'AUD',1);

/*Table structure for table `dh_footprints` */

DROP TABLE IF EXISTS `dh_footprints`;

CREATE TABLE `dh_footprints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '类型 1汽车',
  `value` int(10) DEFAULT NULL COMMENT '浏览id记录',
  `value2` varchar(10) DEFAULT NULL COMMENT '记录其他信息',
  `del_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `ip` varchar(18) DEFAULT NULL COMMENT 'IP',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `value2` (`value2`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户浏览记录';

/*Data for the table `dh_footprints` */

insert  into `dh_footprints`(`id`,`uid`,`type`,`value`,`value2`,`del_status`,`ip`,`created`) values (3,1,1,1,'1',0,'127.0.0.1',1508220861),(4,2,1,8,'3',0,'127.0.0.1',1512458240),(5,4,1,2,'1',0,'127.0.0.1',1506065062),(6,2,1,5,'3',0,'127.0.0.1',1512458014),(7,2,1,3,'3',0,'127.0.0.1',1512614992),(8,4,1,1,'1',0,'127.0.0.1',1506303637),(9,2,1,18,'2',0,'127.0.0.1',1507877617),(10,2,1,15,'4',0,'127.0.0.1',1507534150),(11,2,1,17,'2',0,'127.0.0.1',1507877223),(12,2,1,11,'1',0,'127.0.0.1',1510815003),(13,2,1,13,'4',0,'127.0.0.1',1507533764),(14,2,1,16,'2',0,'127.0.0.1',1507534978),(15,1,1,5,'3',0,'127.0.0.1',1507622804),(16,3,1,8,'3',0,'127.0.0.1',1507888057),(17,4,1,15,'4',0,'127.0.0.1',1507875418),(18,1,1,11,'1',0,'127.0.0.1',1507877804),(19,7,1,19,'7',0,'127.0.0.1',1507877563),(20,3,1,3,'3',0,'127.0.0.1',1507886104),(21,3,1,5,'3',0,'127.0.0.1',1507887044),(22,4,1,14,'4',0,'127.0.0.1',1508147580),(23,2,1,1,'1',0,'127.0.0.1',1510814930),(24,7,1,5,'3',0,'127.0.0.1',1511252151),(25,7,1,20,'12',0,'127.0.0.1',1510650495),(26,12,1,20,'12',0,'127.0.0.1',1510649215),(27,7,1,21,'7',0,'127.0.0.1',1510650491),(28,12,1,21,'7',0,'127.0.0.1',1510649201),(29,7,1,11,'1',0,'127.0.0.1',1511149109),(30,7,1,10,'1',0,'127.0.0.1',1511150205),(31,2,1,23,'2',0,'127.0.0.1',1510814899),(32,2,1,21,'7',0,'127.0.0.1',1512616696),(33,2,1,7,'1',0,'127.0.0.1',1510814923),(34,7,1,23,'2',0,'127.0.0.1',1511149103),(35,7,1,12,'4',0,'127.0.0.1',1511252133),(36,7,1,25,'7',0,'127.0.0.1',1511339019),(37,7,1,22,'7',0,'127.0.0.1',1511339197),(38,2,1,26,'2',0,'127.0.0.1',1511489611),(39,2,1,1,'3',0,'127.0.0.1',1512110934),(40,18,1,1,'3',0,'127.0.0.1',1512633886),(41,18,1,22,'7',0,'127.0.0.1',1512631253),(42,18,1,21,'7',0,'127.0.0.1',1512440333),(43,18,1,27,'3',0,'127.0.0.1',1512465229),(44,18,1,7,'1',0,'127.0.0.1',1512440450),(45,18,1,11,'1',0,'127.0.0.1',1512440459),(46,18,1,10,'1',0,'127.0.0.1',1512631259),(47,18,1,24,'2',0,'127.0.0.1',1512440643),(48,18,1,29,'8',0,'127.0.0.1',1512464698),(49,2,1,29,'8',0,'127.0.0.1',1512614510),(50,2,1,28,'2',0,'127.0.0.1',1512616687),(51,2,1,27,'3',0,'127.0.0.1',1512616692),(52,2,1,24,'2',0,'127.0.0.1',1512616708),(53,18,1,9,'1',0,'127.0.0.1',1512630446),(54,18,1,8,'3',0,'127.0.0.1',1512631237),(55,18,1,3,'3',0,'127.0.0.1',1512631833),(56,18,1,5,'3',0,'127.0.0.1',1512632691),(57,18,1,25,'7',0,'127.0.0.1',1512631247),(58,18,1,28,'2',0,'127.0.0.1',1512633565);

/*Table structure for table `dh_from_join` */

DROP TABLE IF EXISTS `dh_from_join`;

CREATE TABLE `dh_from_join` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `apply_name` varchar(100) DEFAULT NULL COMMENT '申请人姓名',
  `join_city` varchar(100) DEFAULT NULL COMMENT '加盟城市/区域',
  `open_shop_time` varchar(100) DEFAULT NULL COMMENT '计划开店时间',
  `market_positioning` varchar(100) DEFAULT NULL COMMENT '市场定位',
  `brand_Style` varchar(100) DEFAULT NULL COMMENT '品牌风格',
  `main_series` varchar(100) DEFAULT NULL COMMENT '主营系列',
  `price` varchar(100) DEFAULT NULL COMMENT '货品价格',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(100) DEFAULT NULL COMMENT '性别',
  `age` varchar(100) DEFAULT NULL COMMENT '年龄',
  `culture` varchar(100) DEFAULT NULL COMMENT '文化程度',
  `mobile` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `work` varchar(100) DEFAULT NULL COMMENT '现从事行业',
  `qq` varchar(100) DEFAULT NULL COMMENT 'qq',
  `weixin` varchar(200) DEFAULT NULL COMMENT '微信',
  `address` varchar(200) DEFAULT NULL COMMENT '现住址',
  `average_income` varchar(200) DEFAULT NULL COMMENT '平均房价/平均收入',
  `h_shop_name` varchar(200) DEFAULT NULL COMMENT '该城市高档商圈',
  `is_ideal_shop` varchar(200) DEFAULT NULL COMMENT '目前是否有理想店面',
  `invest_funds` varchar(200) DEFAULT NULL COMMENT '计划投入资金',
  `run_type` varchar(200) DEFAULT NULL COMMENT '经营方式',
  `management_type` varchar(200) DEFAULT NULL COMMENT '管理方式',
  `join_type` varchar(200) DEFAULT NULL COMMENT '申请加盟方式',
  `sale_desc` varchar(300) DEFAULT NULL COMMENT '目前该城市做的好的内衣专卖',
  `code` varchar(200) DEFAULT NULL COMMENT '身份证照片',
  `experience` varchar(500) DEFAULT NULL COMMENT '其他加盟品牌经历',
  `plan` varchar(500) DEFAULT NULL COMMENT '具体的发展计划',
  `ip` char(20) DEFAULT '',
  `created` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_from_join` */

insert  into `dh_from_join`(`id`,`apply_name`,`join_city`,`open_shop_time`,`market_positioning`,`brand_Style`,`main_series`,`price`,`name`,`sex`,`age`,`culture`,`mobile`,`work`,`qq`,`weixin`,`address`,`average_income`,`h_shop_name`,`is_ideal_shop`,`invest_funds`,`run_type`,`management_type`,`join_type`,`sale_desc`,`code`,`experience`,`plan`,`ip`,`created`) values (1,'看','看','2017-12-06','定位','哦哦哦','咯考虑','看','那么快','男','6','哦哦哦','55','66','964676','jksh','bbzh','bjj','ghh','njj','666','个人','本人','商场店','bbb','1512531903278_23.jpeg','哦哦哦','考虑考虑','127.0.0.1',1512531903),(2,'看','看','2017-12-06','定位','哦哦哦','咯考虑','看','那么快','男','6','哦哦哦','联系方式','事业','9999','jksh','bbzh','bjj','ghh','njj','666','个人','本人','商场店','bbb','1512531983739_24.jpeg','哦哦哦','考虑考虑','127.0.0.1',1512531983),(3,'看','看','2017-12-06','定位','哦哦哦','咯考虑','看','那么快','男','年龄','哦哦哦','联系方式','事业','9999','jksh','bbzh','bjj','ghh','njj','666','个人','本人','商场店','bbb','1512531993487_25.jpeg','哦哦哦','考虑考虑','127.0.0.1',1512531993),(4,'As','123','2017-12-07','123','123','123','123','As','男','123','123','123','123','123','123','123123','123','123','123','123','合伙','雇员工','社区店','123123','1512615308787_27.jpeg','123123','Sdfafsad sadf sad','127.0.0.1',1512615308);

/*Table structure for table `dh_gift` */

DROP TABLE IF EXISTS `dh_gift`;

CREATE TABLE `dh_gift` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1抵扣卷',
  `uid` int(11) unsigned DEFAULT NULL COMMENT '接受者uid',
  `order_sn` char(18) DEFAULT '0' COMMENT '订单编号',
  `value` varbinary(10) DEFAULT '0' COMMENT '赠送类型',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态 1领取 0未领取',
  `created` int(11) unsigned DEFAULT '0' COMMENT '赠送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='赠送信息';

/*Data for the table `dh_gift` */

insert  into `dh_gift`(`id`,`type`,`uid`,`order_sn`,`value`,`status`,`created`) values (1,1,4,'172646797722115621','3',1,1506500328),(2,1,2,'172670845735945735','8',1,1506562670),(3,1,2,'172717592252214453','8',1,1506677084);

/*Table structure for table `dh_goods_ablum` */

DROP TABLE IF EXISTS `dh_goods_ablum`;

CREATE TABLE `dh_goods_ablum` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `type` tinyint(1) DEFAULT '1' COMMENT '1汽车信息',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '图片地址',
  `description` varchar(500) DEFAULT '' COMMENT '图片描述',
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `dh_goods_ablum` */

insert  into `dh_goods_ablum`(`goods_id`,`type`,`path`,`description`) values (8,1,'150587084778216.png','车辆左侧图片'),(7,1,'150580908094311.png','第一张图的介绍'),(7,1,'150580908088887.png','第二张图的介绍'),(7,1,'150580908030846.png','第三张图的介绍'),(8,1,'150587084722911.png','车辆右侧图片'),(8,1,'150587084720442.png','车辆全方位图片'),(9,1,'150596089940011.png',''),(9,1,'150596089953019.jpeg',''),(10,1,'150596096882383.png',''),(10,1,'150596096843093.jpeg',''),(11,1,'150908448330096.jpeg','Dfdsfgdsfgs'),(11,1,'150908448343332.jpeg',''),(12,1,'150641899559070.png',''),(12,1,'150641899567442.png',''),(13,1,'150641904798483.png',''),(13,1,'150641904741132.png',''),(14,1,'150641910419409.png',''),(14,1,'150641910499508.png',''),(15,1,'150641947518717.png',''),(15,1,'150641947595036.png',''),(16,1,'',''),(17,1,'150642085914589.jpeg','第一张'),(17,1,'150642085933505.jpeg','第二张'),(17,1,'150642085934886.jpeg','第三张'),(18,1,'150647576846741.jpeg','第一张'),(18,1,'150647576885042.jpeg','第二张'),(18,1,'150647576860457.jpeg','第三张'),(19,1,'150787632893180.jpeg','富太太'),(19,1,'150787632814051.jpeg','地方'),(19,1,'150787632828731.jpeg',''),(19,1,'150787632878128.jpeg',''),(1,1,'',''),(1,1,'150882867853818.png','1111'),(1,1,'150882867856620.png','22222'),(1,1,'150882881288469.png','1111'),(2,1,'150882884757710.png','1111'),(2,1,'150882884775209.png','22222'),(20,1,'151064777177412.jpeg','看看咯哦'),(21,1,'151064783456296.jpeg','C#jkkgft');

/*Table structure for table `dh_goods_car` */

DROP TABLE IF EXISTS `dh_goods_car`;

CREATE TABLE `dh_goods_car` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家',
  `uid` int(11) unsigned DEFAULT NULL COMMENT 'uid',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `thumb` varchar(50) DEFAULT '' COMMENT '封面图片',
  `brand` int(11) unsigned DEFAULT '0' COMMENT '品牌',
  `style` varchar(10) DEFAULT '' COMMENT '款号',
  `produce_time` int(5) unsigned DEFAULT '0' COMMENT '生产日期',
  `model` varchar(10) DEFAULT '' COMMENT '车型',
  `buy_time` int(10) DEFAULT '0' COMMENT '购买时间戳',
  `mileage` float(10,1) unsigned DEFAULT '0.0' COMMENT '里程 万公里',
  `city` varchar(5) DEFAULT '' COMMENT '车牌城市',
  `gearbox` varchar(6) DEFAULT '' COMMENT '变数箱',
  `gases` varchar(5) DEFAULT '' COMMENT '排放标准',
  `displacement` varchar(10) DEFAULT '' COMMENT '排量',
  `model_remark` varchar(10) DEFAULT '' COMMENT '车型备注',
  `price` varchar(200) DEFAULT '0.00' COMMENT '报价',
  `vin` varchar(20) DEFAULT '' COMMENT 'vin',
  `guarantee` varchar(10) DEFAULT '0' COMMENT '保障状态 1一年保修 2三次保养 3LEASE',
  `is_lease` tinyint(1) unsigned DEFAULT '1' COMMENT '是否转手 1是 2否',
  `mobile` char(11) DEFAULT '' COMMENT '联系电话',
  `weixin` varchar(20) DEFAULT '' COMMENT '微信号',
  `qq` varchar(20) DEFAULT '' COMMENT 'qq',
  `address` varchar(150) DEFAULT '' COMMENT '地址',
  `description` mediumtext COMMENT '简介',
  `banner` varchar(500) DEFAULT '' COMMENT 'banner图片',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1上架 2下架 3后台删除 4用户删除',
  `hot` int(11) unsigned DEFAULT '1' COMMENT '浏览次数',
  `is_recommend` tinyint(1) unsigned DEFAULT '0' COMMENT '首页平台推荐 1推荐 0不推荐',
  `is_urgency` tinyint(1) unsigned DEFAULT '0' COMMENT '是否急售 1是 0不是',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示 1显示  0不显示',
  `created` int(11) unsigned DEFAULT '0' COMMENT '发布时间',
  `content` mediumtext COMMENT '详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='新车信息';

/*Data for the table `dh_goods_car` */

insert  into `dh_goods_car`(`id`,`type`,`uid`,`title`,`thumb`,`brand`,`style`,`produce_time`,`model`,`buy_time`,`mileage`,`city`,`gearbox`,`gases`,`displacement`,`model_remark`,`price`,`vin`,`guarantee`,`is_lease`,`mobile`,`weixin`,`qq`,`address`,`description`,`banner`,`status`,`hot`,`is_recommend`,`is_urgency`,`is_show`,`created`,`content`) values (1,2,3,'奥拓 A6L 1.6L 纪念版2','150578956279606.png',2,'A6L',0,' 三厢',0,1.2,'12','自动','','1.6L','纪念版2','18.00','111111','',0,'','','','','','150578956240119.jpeg,1160b7d04cc2b90ed1f42f5ff21a3a6b.jpeg,7ebadd60cc078df3d2d1fe253b02d716.jpeg',1,39,0,0,1,1505701881,'							 								 	<p><img src=\"/uploadfile/ueditor/20171128/1511867550532518.jpg\" title=\"1511867550532518.jpg\" _src=\"/uploadfile/ueditor/20171128/1511867550532518.jpg\" alt=\"002.jpg\"/></p><p><img src=\"/uploadfile/car/150882867853818.png\"/></p><p>1111</p><p><img src=\"/uploadfile/car/150882867856620.png\"/></p><p>22222</p><p><img src=\"/uploadfile/car/150882881288469.png\"/></p><p>1111</p>							 								 	'),(2,2,1,'奥迪 2013 A6L 1.6L 纪念版2','150578956279606.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','3',0,'15923882847','weixin','qq','这里是测试地址信息的','','150578956279606.png,150578956240119.jpeg',1,24,0,0,1,1505701942,NULL),(3,2,3,'大众 2017 x5 2.0 很好','150596096890834.jpeg',3,'x5',2017,'2',1420041600,2.0,'14','2','2','2.0','很好','20.00','888888','0',1,'','','','','九成新，值得入手','',1,7,1,1,1,1505706388,NULL),(4,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','',1,1,0,0,1,1505706629,NULL),(5,2,3,'奥迪 2017 23 888 很好','150596096890834.jpeg',2,'23',2017,'1',1420041600,5.0,'14','2','1','888','很好','5.00','88888996','0',0,'','','','','很好的啦','',1,15,1,1,1,1505706882,NULL),(6,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580886964585.png,150580886964659.jpeg',1,4,0,0,1,1505808869,NULL),(7,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580908058688.png,150580908096283.jpeg',1,5,0,0,1,1505809080,NULL),(8,2,3,'奥迪 2017 x6 2.0 很好的汽车，九成新','150587084744692.png',2,'x6',2017,'5',1420041600,5.0,'14','1','1','2.0','很好的汽车，九成新','20.00','66666666','0',0,'','','','','很好哦，九成新，值得入手，不要犹豫','150587084744692.png,150587084733090.png',1,15,1,1,1,1505870847,NULL),(9,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','',1,22,0,0,1,1505960899,NULL),(10,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150596096890834.jpeg,150596096837567.jpeg,150596096889744.png',1,11,0,0,1,1505960968,NULL),(11,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150908448373047.jpeg',1,'A6L',2013,' 三厢',1970,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','',0,'','','','','这里是输入商品详情的地方11111','150908448373047.jpeg,150908448396094.jpeg',1,8,0,0,1,1505961155,NULL),(12,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641899599456.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641899599456.png,150641899599165.png,150641899581683.png',1,5,0,0,1,1506418995,NULL),(13,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641904739627.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641904739627.png,150641904789466.png,150641904730885.png',1,9,0,0,1,1506419047,NULL),(14,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641910488810.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641910488810.png,150641910457982.png,150641910411562.png',1,1,0,0,1,1506419104,NULL),(15,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641947515130.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641947515130.png,150641947565011.png,150641947546598.png',1,5,0,0,1,1506419475,NULL),(16,1,2,'奥迪 2017 j6','150641999361907.jpeg',2,'j6',2017,'',1504195200,6.0,'4','','','','','13.00','','0',0,'','','','','','150641999361907.jpeg,150641999321747.jpeg,150641999369548.jpeg',1,11,0,0,1,1506419993,NULL),(17,1,2,'奥迪 2017 l6 6 备注','150642085932332.png',2,'l6',2017,'2',1504195200,6.0,'4','2','1','6','备注','13.00','kdkxjxj','0',0,'','','','','差个明模式我说问一下','150642085932332.png,150642085925946.png,150642085922650.png',2,1,0,0,1,1506420859,NULL),(18,1,2,'奥迪 2017 c6 6 备注啦啦','150647576838026.jpeg',2,'c6',2017,'1',1501516800,5.0,'2','2','1','6','备注啦啦','13.00','646797997','0',0,'','','','','详细备注，让客户更好了解车子','150647576838026.jpeg,150647576843596.jpeg,150647576844041.jpeg',1,3,0,0,1,1506475768,NULL),(19,1,7,'宝马 2017 方法个 1.6','150787632875679.jpeg',25,'方法个',2017,'1',1412092800,1.0,'1','1','1','1.6','','200000.00','地方呵呵','0',0,'','','','','','150787632875679.jpeg,150787632875775.jpeg',2,8,1,1,1,1507876328,NULL),(20,1,12,'奥拓 2016 j\'k jlade','151064777164956.jpeg',2,'j\'k',2016,'轿车',0,5.0,'18','','','','jlade','42696.00','','0',0,'','','','','kleddefenjjkkkl','151064777164956.jpeg',1,9,0,0,1,1510647771,NULL),(21,1,7,'大众 2010 Gg SDgf','151064783460072.jpeg',3,'Gg',2010,'2',1501516800,2.0,'10','','','','SDgf','57888.00','','0',0,'','','','','DffFggggvvbbv','151064783460072.jpeg',1,11,0,0,1,1510647833,NULL),(22,1,7,'奥拓 1995 jk','151071339053179.jpeg',2,'jk',1995,'两厢',0,5.0,'11','','','','','556555.00','','0',0,'','','','','','151071339053179.jpeg',1,9,0,0,1,1510713390,NULL),(23,1,2,'大众 井口 3000-5000','151080029794413.jpeg',3,'井口',0,'',0,0.0,'15','100-20','','3000-5000','','55566.00','','0',0,'','','','','','151080029794413.jpeg',1,8,0,0,1,1510800297,NULL),(24,1,2,'大众 gg','151114603617434.jpeg',3,'gg',0,'',0,0.0,'15','','','','','55.66','','0',0,'','','','','','151114603617434.jpeg',1,3,0,0,1,1511146035,NULL),(25,1,7,'大众 jj','151133554684429.jpeg',3,'jj',0,'',0,0.0,'11','','','','','25456.00','','0',1,'','','','','','151133554684429.jpeg',1,3,0,0,1,1511335545,NULL),(26,1,2,'丰田 jh','151148960645716.jpeg',26,'jh',0,'',0,0.0,'11','','','','','5555.00','','0',0,'','','','','','151148960645716.jpeg',1,2,0,0,1,1511489605,NULL),(27,2,3,'大众 hh','151175145173734.jpeg',3,'hh',0,'',1509465600,0.0,'15','','','','','5556.00','','',0,'','','','','ghh','151175145173734.jpeg',1,8,0,0,1,1511751451,NULL),(28,1,2,'大众 hh','151175175310604.jpeg',3,'hh',0,'',1509465600,0.0,'11','','','','','85655.00','','0',0,'','','','','','151175175310604.jpeg,151175185631744.jpeg',1,3,0,0,1,1511751753,NULL),(29,2,8,'大众 23','1512446146602_22.jpeg',3,'23',0,'',0,0.0,'12','','','','','12','','',0,'','','','','','1512446146602_22.jpeg,1513049862697_44.jpeg,1513049862740_45.jpeg,1513049862365_46.jpeg,1513049862573_47.jpeg',1,4,0,0,1,1512446146,'0'),(30,1,73,'Nissan 尼桑 2016 GTR 45000 GTR 16 premium 转lease','151344775374804.jpeg',97,'GTR',2016,'二手',0,32000.0,'10','880','','45000','GTR 16 pre','45000','','0',1,'4165677666','653303797','','','16款 白色GTR premium 从来没有下过赛道 \nclean car proof 没有事故记录\ndp付了4w5 每个月880月供 还有八个月车lease到期\n到期之后还可以继续lease 尾款四万多五万\n现在车32000m 有兴趣联系问价','151344775374804.jpeg,151344775340940.jpeg,151344775320774.jpeg',1,1,0,0,1,1513447753,NULL);

/*Table structure for table `dh_goods_service` */

DROP TABLE IF EXISTS `dh_goods_service`;

CREATE TABLE `dh_goods_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'uid',
  `title` varchar(60) DEFAULT '' COMMENT '标题',
  `thumb` varchar(150) DEFAULT '' COMMENT '封面图',
  `type` tinyint(1) DEFAULT '0' COMMENT '服务类型',
  `price` varchar(200) DEFAULT '0.00' COMMENT '价格',
  `ablum` varchar(500) DEFAULT '' COMMENT '相册',
  `description` mediumtext COMMENT '详情',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1上架 2下架 3后台删除 4用户删除',
  `hot` int(11) DEFAULT '0' COMMENT '浏览次数',
  `orders` int(11) DEFAULT '0' COMMENT '订单总量',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '显示状态 1显示 0不显示',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='服务信息';

/*Data for the table `dh_goods_service` */

insert  into `dh_goods_service`(`id`,`uid`,`title`,`thumb`,`type`,`price`,`ablum`,`description`,`status`,`hot`,`orders`,`is_show`,`del_status`,`created`) values (2,1,'免费贴膜','150578927012952.jpeg',5,'9.90','150821383156398.png,150821331844571.jpeg,150821331888741.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1,0,1,0,1505702940),(3,1,'免费贴膜','150578927012952.jpeg',20,'9.90','','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505703219),(4,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570322945362.png,150570322992738.jpeg,150570322914812.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505703229),(5,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570424689878.png,150570424614177.jpeg,150570424697703.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704246),(6,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570433438039.png,150570433448718.jpeg,150570433473341.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704334),(7,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570437049342.png,150570437077162.jpeg,150570437034977.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,3,0,1,0,1505704370),(8,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570449431456.png,150570449497171.jpeg,150570449483501.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,6,1,1,0,1505704494),(10,1,'哇哈哈哈哈','150570605387503.png',20,'面议','150570605387503.png,150570605341278.jpeg,150570605343313.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,18,2,1,0,1505706053),(11,3,'200','150578927012952.jpeg',1,'200.00','150571629162506.jpeg,150571629146095.jpeg','主要针对劳斯莱斯、布加迪等维修保养',1,45,2,1,0,1505716291),(12,3,'500000','',23,'500000.00','150667581778763.jpeg,150821479867131.png','服务详情还能再说什么',2,0,0,1,0,1506675817),(13,8,'Do Che','',22,'25.00','','Asdfsadfsadfwer',1,4,2,1,0,1511148592),(14,3,'看看','',24,'800.00','','涂抹木事啊！',4,0,0,1,0,1511243240);

/*Table structure for table `dh_help_car` */

DROP TABLE IF EXISTS `dh_help_car`;

CREATE TABLE `dh_help_car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `brand` varchar(10) DEFAULT '' COMMENT '品牌',
  `price` varchar(10) DEFAULT '0' COMMENT '期望价格',
  `buy_time` varchar(10) DEFAULT '0' COMMENT '期望车龄',
  `mileage` varchar(10) DEFAULT '0' COMMENT '期望里程',
  `description` mediumtext COMMENT '详情',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1申请 2失败 3完成',
  `recommend_id` varchar(300) DEFAULT '' COMMENT '推荐id',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1已删除 0未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='帮我买车';

/*Data for the table `dh_help_car` */

insert  into `dh_help_car`(`id`,`uid`,`brand`,`price`,`buy_time`,`mileage`,`description`,`created`,`status`,`recommend_id`,`del_status`) values (2,1,'大众','10万以内','今年','23万公里内的','这里是简介信息',1505957035,3,'18,17,16,15,14,13,2,1',0),(3,2,'奥迪','20万以上','一年两个月','','',1505964715,3,'18,17,16,15,14,13,12,11,10,9,6,5',0),(4,7,'风格','50000','1','5000','大概好纠结',1507878092,3,'19,18',0),(5,2,'大众','0','','5','期望',1508145659,3,'19',0);

/*Table structure for table `dh_help_service` */

DROP TABLE IF EXISTS `dh_help_service`;

CREATE TABLE `dh_help_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '申请uid',
  `sign` tinyint(1) unsigned DEFAULT '0' COMMENT '服务类型id',
  `price` varchar(30) DEFAULT '0' COMMENT '服务价格',
  `description` varchar(500) DEFAULT '' COMMENT '服务详情',
  `created` int(11) DEFAULT '0' COMMENT '发布时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1申请 2推荐完成',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1已删除 0未删除',
  `recommend_id` varchar(300) DEFAULT '' COMMENT '推荐id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dh_help_service` */

insert  into `dh_help_service`(`id`,`uid`,`sign`,`price`,`description`,`created`,`status`,`del_status`,`recommend_id`) values (1,4,1,'0-500元','这里是输入简介测试的地方',1506407793,3,0,'1'),(2,2,21,'5000','期望值',1508145637,3,0,'1');

/*Table structure for table `dh_integral_log` */

DROP TABLE IF EXISTS `dh_integral_log`;

CREATE TABLE `dh_integral_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `flag` varchar(100) DEFAULT '' COMMENT 'Rule表标识符',
  `value` int(11) DEFAULT '0' COMMENT '积分',
  `content` varchar(250) DEFAULT '' COMMENT '操作内容',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `flag` (`flag`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='积分详情';

/*Data for the table `dh_integral_log` */

insert  into `dh_integral_log`(`id`,`uid`,`flag`,`value`,`content`,`created`) values (1,1,'user_daily_bonus',30,'每日签到',1508997148),(2,1,'user_daily_bonus',30,'每日签到',1509087244),(3,10,'user_registered',300,'注册赠送',1510108380),(4,11,'user_registered',300,'注册赠送',1510111463),(5,12,'user_daily_bonus',30,'每日签到',1510646672),(6,7,'user_daily_bonus',30,'每日签到',1510646674),(7,7,'user_share',50,'每日分享赠送',1510649128),(8,12,'user_share',50,'每日分享赠送',1510649131),(9,7,'buy_orders_car',1000,'汽车订单交易完成',1510650761),(10,7,'user_get_coupon',-600,'领取汽车贴膜优惠卷',1510650815),(11,7,'buy_orders_service',100,'汽车服务交易完成',1510651077),(12,7,'buy_orders_car',1000,'汽车订单交易完成',1510651600),(13,7,'buy_orders_service',100,'汽车服务交易完成',1510651854),(14,1,'user_daily_bonus',30,'每日签到',1510651924),(15,2,'buy_orders_service',100,'汽车服务交易完成',1510652236),(16,7,'buy_orders_service',100,'汽车服务交易完成',1510652259),(17,7,'buy_orders_car',1000,'汽车订单交易完成',1510652429),(18,13,'user_registered',300,'注册赠送',1510734649),(19,3,'user_share',50,'每日分享赠送',1510802367),(20,2,'user_share',50,'每日分享赠送',1510810372),(21,2,'user_share',50,'每日分享赠送',1510906822),(22,3,'user_share',50,'每日分享赠送',1510908051),(23,7,'user_share',50,'每日分享赠送',1510909015),(24,2,'user_get_coupon',-600,'领取汽车贴膜优惠卷',1511147108),(25,7,'buy_orders_service',100,'汽车服务交易完成',1511148966),(26,14,'user_registered',300,'注册赠送',1511416067),(27,15,'user_registered',300,'注册赠送',1511424260),(28,16,'user_registered',300,'注册赠送',1511428543),(29,17,'user_registered',300,'注册赠送',1512101040),(30,18,'user_registered',300,'注册赠送',1512439193),(31,18,'user_share',50,'每日分享赠送',1512443100),(32,18,'buy_orders_service',100,'汽车服务交易完成',1512445875),(33,2,'buy_orders_car',1000,'汽车订单交易完成',1512457996),(34,2,'buy_orders_service',100,'汽车服务交易完成',1512458072),(35,18,'user_daily_bonus',30,'每日签到',1512459456),(36,2,'user_share',50,'每日分享赠送',1513932994),(37,19,'user_registered',300,'注册赠送',1514263996),(38,20,'user_registered',300,'注册赠送',1514264127),(39,21,'user_registered',300,'注册赠送',1514264462),(40,22,'user_registered',300,'注册赠送',1514269561),(41,23,'user_registered',300,'注册赠送',1514881390),(42,27,'user_registered',300,'注册赠送',1516437621);

/*Table structure for table `dh_integral_rule` */

DROP TABLE IF EXISTS `dh_integral_rule`;

CREATE TABLE `dh_integral_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `flag` varchar(100) DEFAULT '' COMMENT '标识符',
  `value` int(11) DEFAULT NULL COMMENT '积分数',
  `content` varchar(350) DEFAULT '' COMMENT '规则内容中文',
  `content_en` varchar(350) DEFAULT '' COMMENT '规则内容英文',
  `content_jp` varchar(350) DEFAULT '' COMMENT '规则内容日文',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `limit` varchar(500) DEFAULT '' COMMENT '限制参数 json格式',
  PRIMARY KEY (`id`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='积分规则';

/*Data for the table `dh_integral_rule` */

insert  into `dh_integral_rule`(`id`,`flag`,`value`,`content`,`content_en`,`content_jp`,`status`,`limit`) values (1,'user_registered',300,'注册赠送','Registered Gift','登録贈り物',1,''),(2,'user_daily_bonus',30,'每日签到','Check In Daily','毎日チェックイン',1,''),(3,'user_share',50,'每日分享赠送','Daily Sharing Gift','毎日の共有ギフト',1,''),(4,'user_orders_gift',0,'订单交易获得','Order transaction to gitf','取得するトランザクションを注文する',1,''),(5,'user_orders_pay',0,'订单交易支付','Order transaction payment','取引の支払いを注文する',1,'');

/*Table structure for table `dh_logistics` */

DROP TABLE IF EXISTS `dh_logistics`;

CREATE TABLE `dh_logistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1直邮 2转运 3国际预报包裹',
  `order_sn` char(18) DEFAULT '' COMMENT '订单编号',
  `batch_sn` varchar(100) DEFAULT '' COMMENT '批次编号',
  `position_sn` varchar(100) DEFAULT '' COMMENT '包裹位置编号',
  `storage_transport_sn` varchar(50) DEFAULT '' COMMENT '入库转运单号',
  `outbound_transport_sn` varchar(50) DEFAULT '' COMMENT '出库转运单号',
  `storage_transport_id` int(11) DEFAULT '0' COMMENT '入库转运物流公司ID 分类物流公司获取',
  `outbound_transport_id` int(11) DEFAULT '0' COMMENT '出库转运物流公司ID 分类物流公司获取',
  `ship_address_id` int(11) DEFAULT '0' COMMENT '寄件人UserAddress主键ID',
  `uid` int(11) DEFAULT '0' COMMENT '寄件人uid',
  `name` varchar(50) DEFAULT '' COMMENT '寄件人姓名',
  `mobile` varchar(20) DEFAULT '' COMMENT '寄件人电话',
  `address` varchar(255) DEFAULT '' COMMENT '寄件人地址',
  `address_id` int(11) DEFAULT '0' COMMENT '收件人UserAddress主键ID',
  `logistics_name` varchar(50) DEFAULT '' COMMENT '收件人姓名',
  `logistics_mobile` varbinary(20) DEFAULT '' COMMENT '收件人电话',
  `logistics_country` varchar(20) DEFAULT '' COMMENT '收件人国家',
  `logistics_province` varchar(20) DEFAULT '' COMMENT '收件人省份',
  `logistics_city` varchar(20) DEFAULT '' COMMENT '收件人城市',
  `logistics_area` varchar(20) DEFAULT '' COMMENT '收件人区县',
  `logistics_zip_code` varchar(15) DEFAULT 'N/A' COMMENT '收件人邮编',
  `logistics_address` varchar(255) DEFAULT '' COMMENT '收件人地址',
  `logistics_code` char(20) DEFAULT '' COMMENT '收件人身份证',
  `logistics_back_code` varchar(100) DEFAULT '' COMMENT '收件人身份证背面照片',
  `logistics_positive_code` varchar(100) DEFAULT '' COMMENT '收件人身份证正面照片',
  `length` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '长',
  `breadth` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '宽',
  `height` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '高',
  `volume` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '体积',
  `volume_weight` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '体积重量',
  `real_weight` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '实际重量',
  `fee_weight` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '计费重量',
  `is_buy_safe` tinyint(1) DEFAULT '0' COMMENT '购买保险 1购买 0未购买',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `declared_price` decimal(10,2) DEFAULT '0.00' COMMENT '申报价值',
  `aegis_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '保价金额',
  `aegis_price` decimal(10,2) DEFAULT '0.00' COMMENT '保价费用',
  `warehouse_id` varchar(20) DEFAULT '0' COMMENT '仓库网点编号',
  `channel_id` int(11) DEFAULT '0' COMMENT '渠道分类id',
  `console_ablum` varchar(100) DEFAULT '' COMMENT '管理员上传照片',
  `user_ablum` varchar(100) DEFAULT '' COMMENT '用户上传照片',
  `issue_album` varchar(500) DEFAULT '' COMMENT '问题处理照片集 逗号分隔',
  `outbound_ablum` varchar(200) DEFAULT '' COMMENT '出库拍照',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0待入库/待打包 1已入库/打包完成 2已出库 3问题包(通过issue_status > 1算出) 4预报包裹',
  `package_status` int(11) DEFAULT '0' COMMENT '包裹状态 0信息 1到件(这里会产生价格) 2揽件 3入库 4退件完成 5配袋 6上板 7机场 8清关 9放行 10检查 11转运',
  `issue_status` int(11) DEFAULT '1' COMMENT '问题处理状态 1正常 2始发地退件-超标 3始发地退件 4海关/商检查验 404拒收/退件 403超时未更新 412快递柜/驿站超时未取 5破损/丢件',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `issue_time` int(11) DEFAULT '0' COMMENT '状态处理时间',
  `package_time` int(11) DEFAULT '0' COMMENT '包裹状态更变时间',
  `storage_time` int(11) DEFAULT '0' COMMENT '入库时间',
  `outbound_time` int(11) DEFAULT '0' COMMENT '出库时间',
  `vat` varchar(500) DEFAULT '' COMMENT '增值服务json 服务类别:服务id',
  `outbound_company` varchar(100) DEFAULT '' COMMENT '选择转运目的地公司',
  `is_pull` tinyint(1) DEFAULT '0' COMMENT '推送状态 1推送成功 0未推送',
  `sign` tinyint(1) DEFAULT '0' COMMENT '1原箱 2分箱 3合箱',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`),
  KEY `type` (`type`),
  KEY `is_pull` (`is_pull`,`del_status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='物流包裹';

/*Data for the table `dh_logistics` */

insert  into `dh_logistics`(`id`,`type`,`order_sn`,`batch_sn`,`position_sn`,`storage_transport_sn`,`outbound_transport_sn`,`storage_transport_id`,`outbound_transport_id`,`ship_address_id`,`uid`,`name`,`mobile`,`address`,`address_id`,`logistics_name`,`logistics_mobile`,`logistics_country`,`logistics_province`,`logistics_city`,`logistics_area`,`logistics_zip_code`,`logistics_address`,`logistics_code`,`logistics_back_code`,`logistics_positive_code`,`length`,`breadth`,`height`,`volume`,`volume_weight`,`real_weight`,`fee_weight`,`is_buy_safe`,`created`,`declared_price`,`aegis_total_price`,`aegis_price`,`warehouse_id`,`channel_id`,`console_ablum`,`user_ablum`,`issue_album`,`outbound_ablum`,`status`,`package_status`,`issue_status`,`del_status`,`issue_time`,`package_time`,`storage_time`,`outbound_time`,`vat`,`outbound_company`,`is_pull`,`sign`) values (1,2,'TEST00002KO','','','2258','',614,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','2566.00','0.00','0.00',0,1516692698,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(2,2,'TEST00005KO','','test','8564676677','',628,0,0,2,'Mark|2','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','2.00','0.00','0.00',0,1516693070,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(3,2,'TEST00006KO','','','133544','',628,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','2.00','0.00','0.00',0,1516693089,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(4,1,'TEST00007KO','','','','',0,0,0,2,'Mark|2','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',3,'boxian','185235635558','Timor-Leste','Shanghai City','Baoshan District','','568838','address/jjjjjj','568534763253','1514268925754_79.jpeg','1514268925979_80.jpeg','0.00','0.00','0.00','0.00','2.00','0.00','0.00',0,1516694088,'1.00','2.00','2.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'{\"712\":\"726\",\"713\":\"727\",\"709\":\"715\",\"710\":\"720\",\"714\":\"728\",\"711\":\"723\"}','',0,0),(5,2,'TEST00008KO','','','646467676','',628,0,0,2,'Mark|2','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','2.00','0.00','0.00',0,1516696034,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(6,1,'TEST00009KO','','','','',0,0,0,2,'Fastgo','61731032888','UNIT 4 & 5,  33 STOCKWELL PLACE, ARCHERFIELD, QUEENSLAND  4108',3,'boxian','185235635558','Timor-Leste','Shanghai City','Baoshan District','','568838','address/jjjjjj','568534763253','1514268925754_79.jpeg','1514268925979_80.jpeg','0.00','0.00','0.00','0.00','1.00','0.00','0.00',1,1516696061,'1.00','3.00','2.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'{\"712\":\"726\",\"713\":\"727\",\"709\":\"715\",\"710\":\"720\",\"714\":\"728\",\"711\":\"723\"}','',0,0),(7,2,'TEST00010KO','','','99999','',627,0,0,2,'Mark|2','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','2.00','0.00','0.00',0,1516696205,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(8,2,'TEST00011KO','','','9764979979','',614,0,0,2,'Mark|2','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','5.00','0.00','0.00',0,1516696264,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(9,1,'TEST00012KO','','','','',0,0,0,2,'Mark|2','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',3,'boxian','185235635558','Timor-Leste','Shanghai City','Baoshan District','','568838','address/jjjjjj','568534763253','1514268925754_79.jpeg','1514268925979_80.jpeg','0.00','0.00','0.00','0.00','5.00','0.00','0.00',0,1516696638,'1.00','3.00','5.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'{\"712\":\"726\",\"713\":\"727\",\"709\":\"715\",\"710\":\"720\",\"714\":\"728\",\"711\":\"724\"}','',0,0),(10,1,'TEST00014KO','','','','',0,0,0,2,'Mark','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',1,'伯贤','18223563220','','四川省','攀枝花市','','569555','光华大道56号','569853575688456686','1514268925754_79.jpeg','1514268925979_80.jpeg','0.00','0.00','0.00','0.00','2.00','0.00','0.00',1,1516700022,'0.00','0.00','0.00','FG01',0,'','1516700057398_170.jpeg','','',0,0,1,0,0,0,0,0,'','',0,0),(11,1,'TEST00015KO','','','','',0,0,707,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',15,'彭光见','18725796416','','重庆市','九龙坡区','','40000','1233456','500234199206031851','1516610553862_164.jpeg','1516610553757_165.jpeg','0.00','0.00','0.00','0.00','12.00','0.00','0.00',0,1516762029,'123.00','123.00','123.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'[]','',0,1),(12,2,'TEST00016KO','','','122355553','',627,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','4.00','0.00','0.00',0,1516762148,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(13,2,'TEST00017KO','','','5566985','',626,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','12.00','0.00','0.00',0,1516762185,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(14,2,'TEST00018KO','','','2333','',626,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','4.00','0.00','0.00',0,1516762268,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(15,2,'TEST00019KO','','','12333','',627,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','110.00','0.00','0.00',0,1516763388,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(16,1,'TEST00020KO','','','','',0,0,707,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',15,'彭光见','18725796416','','重庆市','九龙坡区','','40000','1233456','500234199206031851','1516610553862_164.jpeg','1516610553757_165.jpeg','0.00','0.00','0.00','0.00','12.00','0.00','0.00',0,1516764553,'1233.00','122.00','122.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'[]','',0,1),(17,2,'TEST00021KO','','','1336','',628,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','365.00','0.00','0.00',0,1516764756,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(18,1,'TEST00022KO','','','','',0,0,707,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',16,'22666','1585598566','Indonesia','2685','2666','','33666','556986','528455856955685574','1516765026627_171.jpeg','1516765026635_172.jpeg','0.00','0.00','0.00','0.00','22.00','0.00','0.00',0,1516765246,'0.00','0.00','0.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'[]','邮政海运包裹',0,1),(19,2,'TEST00023KO','','','12266','',628,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','4.00','0.00','0.00',0,1516784632,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(20,1,'TEST00024KO','','','','',0,0,707,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',16,'22666','1585598566','Indonesia','2685','2666','','33666','556986','528455856955685574','1516765026627_171.jpeg','1516765026635_172.jpeg','0.00','0.00','0.00','0.00','5.00','0.00','0.00',0,1516785482,'0.00','0.00','0.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'[]','邮政航空包裹',0,1),(21,1,'TEST00025KO','','','','',0,0,707,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',16,'22666','1585598566','Indonesia','2685','2666','','33666','556986','528455856955685574','1516765026627_171.jpeg','1516765026635_172.jpeg','0.00','0.00','0.00','0.00','255.00','0.00','0.00',0,1516785558,'0.00','0.00','0.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'[]','EMS 特快',0,1),(22,2,'TEST00026KO','','','5585555','',627,0,0,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',0,'','','','','','','N/A','','','','','0.00','0.00','0.00','0.00','27.00','0.00','0.00',0,1516785886,'0.00','0.00','0.00','FG01',0,'','','','',4,0,1,0,0,0,0,0,'','',0,0),(23,2,'TEST00027KO','','','','',0,0,707,27,'Mark|27','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108',16,'22666','1585598566','Indonesia','2685','2666','','33666','556986','528455856955685574','1516765026627_171.jpeg','1516765026635_172.jpeg','0.00','0.00','0.00','0.00','58.00','0.00','0.00',0,1516785929,'0.00','0.00','0.00','FG01',707,'','','','',0,0,1,0,0,0,0,0,'[]','邮政航空包裹',0,1);

/*Table structure for table `dh_mail_log` */

DROP TABLE IF EXISTS `dh_mail_log`;

CREATE TABLE `dh_mail_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to` varchar(50) DEFAULT NULL COMMENT '接收者邮箱',
  `title` varchar(50) DEFAULT NULL COMMENT '发送标题',
  `md5` char(128) DEFAULT NULL COMMENT '内容md5编码',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '发送状态 1成功 0失败',
  `created` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `md5` (`md5`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='邮箱发送记录';

/*Data for the table `dh_mail_log` */

insert  into `dh_mail_log`(`id`,`to`,`title`,`md5`,`ip`,`status`,`created`) values (1,'350375092@qq.com','这里是标题','098a5d2b96f2d7575e1c103023deb4ba','127.0.0.1',1,1509092146),(2,'350375092@qq.com','app.denha.loc致命错误','1f1bd6a0c99842822b02ec4291434cb7','127.0.0.1',1,1509098326),(3,'350375092@qq.com','app.denha.loc致命错误','49775d4a1d66fa9673a75fb4916f7aeb','127.0.0.1',1,1509098328),(4,'350375092@qq.com','app.denha.loc有一个致命错误','1f1bd6a0c99842822b02ec4291434cb7','127.0.0.1',1,1509098398),(5,'350375092@qq.com','app.denha.loc有一个致命错误','67ae4689593cac681074814606f9bc75','127.0.0.1',1,1509098447),(6,'350375092@qq.com','app.denha.loc有一个致命错误','1f1bd6a0c99842822b02ec4291434cb7','127.0.0.1',1,1509098500),(7,'350375092@qq.com','app.denha.loc有一个致命错误','1f1bd6a0c99842822b02ec4291434cb7','127.0.0.1',1,1509098502),(8,'350375092@qq.com','app.denha.loc有一个致命错误','89e96cd5eab13be5caefea902f15ec1c','127.0.0.1',1,1509098914),(9,'350375092@qq.com','app.denha.loc有一个致命错误','89e96cd5eab13be5caefea902f15ec1c','127.0.0.1',1,1509098933),(10,'350375092@qq.com','app.denha.loc有一个致命错误','49775d4a1d66fa9673a75fb4916f7aeb','127.0.0.1',1,1509326538),(11,'350375092@qq.com','app.denha.loc有一个致命错误','49775d4a1d66fa9673a75fb4916f7aeb','127.0.0.1',1,1509328983),(12,'350375092@qq.com','app.denha.loc 有一个致命错误','cab6beba88c53dba8a3a05ad8a850920','127.0.0.1',1,1509415169);

/*Table structure for table `dh_mail_verify` */

DROP TABLE IF EXISTS `dh_mail_verify`;

CREATE TABLE `dh_mail_verify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) NOT NULL DEFAULT '',
  `code` char(5) NOT NULL DEFAULT '',
  `created` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='邮箱验证信息';

/*Data for the table `dh_mail_verify` */

insert  into `dh_mail_verify`(`id`,`mail`,`code`,`created`) values (1,'350375092@qq.com','77431',1514341148),(2,'641072257@qq.com','28481',1514343593),(3,'879176344@qq.com','18511',1514518087);

/*Table structure for table `dh_material` */

DROP TABLE IF EXISTS `dh_material`;

CREATE TABLE `dh_material` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `material_sn` char(18) DEFAULT '' COMMENT '任务编号',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '所属店铺uid',
  `assign_uid` int(10) unsigned DEFAULT '0' COMMENT '分配用户uid',
  `console_uid` int(11) DEFAULT '0' COMMENT '操作人员uid',
  `apply_time` int(10) unsigned DEFAULT '0' COMMENT '申请取件时间',
  `num` int(10) unsigned DEFAULT '0' COMMENT '预计包裹数量',
  `success_num` int(11) DEFAULT '0' COMMENT '实际揽收包裹',
  `message` varchar(500) DEFAULT '' COMMENT '留言备注',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 0未完成 1揽货完成 2入库完成',
  `sign_album` varchar(200) DEFAULT '' COMMENT '签名图片',
  `success_time` int(11) DEFAULT '0' COMMENT '完成时间',
  `success_sn` varchar(500) DEFAULT '' COMMENT '揽件编号,逗号分隔',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`apply_time`,`status`),
  KEY `material_sn` (`material_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_material` */

insert  into `dh_material`(`id`,`material_sn`,`uid`,`assign_uid`,`console_uid`,`apply_time`,`num`,`success_num`,`message`,`created`,`status`,`sign_album`,`success_time`,`success_sn`) values (1,'180079087648720366',18,0,0,1515743520,5,0,'',1515390876,0,'',0,''),(2,'180079125219965727',1,5,5,1515743520,5,0,'',1515391252,0,'',0,''),(3,'180079154414015614',1,0,0,1515743520,5,0,'阿哦哦哦哦',1515391544,0,'',0,''),(4,'180086097992404645',3,0,0,1515743520,2,0,'备注',1515460979,0,'',0,''),(5,'180096863167301524',3,0,0,1515743520,2,0,'备注一下',1515568631,0,'',0,'');

/*Table structure for table `dh_material_goods` */

DROP TABLE IF EXISTS `dh_material_goods`;

CREATE TABLE `dh_material_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '所属用户uid',
  `material_sn` char(1) DEFAULT '' COMMENT '订单编号',
  `num` int(10) unsigned DEFAULT '0' COMMENT '商品数量',
  `goods_id` int(11) DEFAULT '0' COMMENT '产品id',
  `name` varchar(200) DEFAULT '' COMMENT '商品名称',
  `spec` varchar(100) DEFAULT '' COMMENT '商品规格',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '商品总价',
  PRIMARY KEY (`id`),
  KEY `material_sn` (`material_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_material_goods` */

insert  into `dh_material_goods`(`id`,`uid`,`material_sn`,`num`,`goods_id`,`name`,`spec`,`created`,`price`,`account`) values (1,1,'1',5,731,'test','18cm*14cm*14cm',0,'0.00','0.00'),(2,1,'1',2,734,'test','18cm*14cm*14cm',0,'0.00','0.00'),(3,3,'1',1,731,'一号箱子','18cm*14cm*14cm',0,'0.30','0.30'),(4,3,'1',2,734,'四号箱子','18cm*14cm*14cm',0,'1.00','2.00'),(5,3,'1',2,731,'一号箱子','18cm*14cm*14cm',0,'0.30','0.60');

/*Table structure for table `dh_material_use_log` */

DROP TABLE IF EXISTS `dh_material_use_log`;

CREATE TABLE `dh_material_use_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '使用店铺uid',
  `num` int(10) unsigned DEFAULT '0' COMMENT '使用数量',
  `goods_id` int(10) unsigned DEFAULT '0' COMMENT '使用商品id',
  `created` int(10) unsigned DEFAULT '0' COMMENT '使用时间',
  `spec` varchar(100) DEFAULT '' COMMENT '规格',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '总价',
  `name` varchar(100) DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='耗材使用记录';

/*Data for the table `dh_material_use_log` */

/*Table structure for table `dh_merge_sn` */

DROP TABLE IF EXISTS `dh_merge_sn`;

CREATE TABLE `dh_merge_sn` (
  `order_sn` char(18) NOT NULL,
  `merge_sn` char(18) NOT NULL,
  PRIMARY KEY (`order_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='合并订单编号记录';

/*Data for the table `dh_merge_sn` */

/*Table structure for table `dh_my_car` */

DROP TABLE IF EXISTS `dh_my_car`;

CREATE TABLE `dh_my_car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户uid',
  `ablum` varchar(60) DEFAULT '' COMMENT '头图',
  `brand` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `style` varchar(10) DEFAULT '' COMMENT '款号',
  `produce_time` varchar(10) DEFAULT '' COMMENT '生成时间',
  `buy_time` int(10) unsigned DEFAULT '0' COMMENT '购买时间戳',
  `mileage` decimal(10,1) unsigned DEFAULT '0.0' COMMENT '里程数',
  `vin` varchar(60) DEFAULT '' COMMENT 'vin编码',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `model` varchar(10) DEFAULT '' COMMENT '车型',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='我的车库';

/*Data for the table `dh_my_car` */

insert  into `dh_my_car`(`id`,`uid`,`ablum`,`brand`,`style`,`produce_time`,`buy_time`,`mileage`,`vin`,`del_status`,`model`,`created`) values (2,4,'150630642578788.png',21,'A9','2017',1000000,'0.0','100',0,'',1506306425),(3,4,'150630652116685.png',21,'A8','2017',1000000,'0.0','100',0,'',1506306521),(4,2,'150632597311131.jpeg',2,'j8','2016年09月',1504195200,'5.0','568856889',1,'',1506325973),(5,2,'150632771442590.jpeg',3,'j8','2016年',1504195200,'5.0','568856889',1,'三厢',1506327119),(6,2,'',2,'推荐','2017年',1509465600,'5.0','855588',0,'两厢',1510652153);

/*Table structure for table `dh_note_data` */

DROP TABLE IF EXISTS `dh_note_data`;

CREATE TABLE `dh_note_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户uid',
  `files_id` int(10) unsigned DEFAULT '0' COMMENT 'noteFiles 主键id',
  `content` mediumtext COMMENT '记录内容',
  `title` varchar(100) DEFAULT '' COMMENT '记录标题',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `modifyd` int(10) DEFAULT NULL COMMENT '修改时间',
  `is_share` tinyint(1) DEFAULT '0' COMMENT '分享状态 1分享 0未分享',
  `share_password` varchar(255) DEFAULT '' COMMENT '分享密码',
  `is_privacy` tinyint(1) DEFAULT '0' COMMENT '隐私状态 1加密 0未加密',
  `privacy_password` varchar(255) DEFAULT '' COMMENT '隐私密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_note_data` */

insert  into `dh_note_data`(`id`,`uid`,`files_id`,`content`,`title`,`del_status`,`created`,`modifyd`,`is_share`,`share_password`,`is_privacy`,`privacy_password`) values (15,10,0,'http://kfcqmu.gotoip1.com/\r\nkfcqmu.gotoftp1.com\r\nkfcqmu\r\n7pz5uurp','康复医院',0,1515382046,1515382046,0,'',0,''),(14,10,0,'支付接口paysapi \r\nhttps://www.royalpay.com.au/zh/index.html\r\nmymcse@hotmail.com\r\nFastgo2018！','fastgo',0,1515053174,1515053186,0,'',0,''),(13,10,0,'http://www.mob.com','免费的短信平台',0,1514253029,1514253029,0,'',0,''),(12,10,0,'宜小信\r\n132261198811160681','身份证',1,1513834636,1513834636,0,'',0,''),(10,10,0,'shanjun564@163.com\r\n1wobuzhidao','恒鼎微信开放平台',0,1513559614,1513559614,0,'',0,''),(11,10,0,'211.149.215.174\r\nlysaght\r\ncnwtoo_lysaght321\r\nhttp://www.lysaght.com.cn','来实FTP/Msyql',0,1513665880,1513672938,0,'',0,''),(16,10,0,'M1709023\r\nhttp://www.xiaokangxuan.com/weixin.html','康轩关注程序',0,1516584456,1516584456,0,'',0,'');

/*Table structure for table `dh_note_files` */

DROP TABLE IF EXISTS `dh_note_files`;

CREATE TABLE `dh_note_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `parentid` int(11) DEFAULT '0' COMMENT '上级文件id',
  `name` varchar(100) DEFAULT '' COMMENT '文件名称',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '文件排序',
  `created` int(11) DEFAULT '0' COMMENT '文件创建时间',
  `password` varchar(255) DEFAULT '' COMMENT '文件密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_note_files` */

/*Table structure for table `dh_orders` */

DROP TABLE IF EXISTS `dh_orders`;

CREATE TABLE `dh_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1汽车 2服务 3课程 4包裹直邮 5国际转运',
  `tags` varchar(50) DEFAULT '' COMMENT '订单标注信息文案',
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
  `merge_sn` char(18) DEFAULT '' COMMENT '合并订单编号',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '买家id',
  `seller_uid` int(10) unsigned DEFAULT '0' COMMENT '卖家id',
  `message` varchar(300) DEFAULT '' COMMENT '买家留言',
  `seller_message` varchar(300) DEFAULT '' COMMENT '卖家留言',
  `order_status` tinyint(1) DEFAULT '1' COMMENT '订单状态 1待确认 2待完成 3已完成 4待评价 5已评价',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '审核状态 0代审核 1审核通过 2另设时间 3直接拒绝',
  `del_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态 0未删除 1删除',
  `del_uid` tinyint(1) DEFAULT '0' COMMENT '买家删除 1删除 0未删除',
  `del_seller` tinyint(1) DEFAULT '0' COMMENT '卖家删除 1删除 0未删除',
  `acount_original` varchar(200) DEFAULT '0.00' COMMENT '订单金额',
  `acount` varchar(200) DEFAULT '0.00' COMMENT '实付金额(订单金额 - 优惠金额 + 运费）',
  `coupon_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '抵扣卷优惠金额',
  `integral_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '积分抵扣金额',
  `balance_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '余额抵扣金额',
  `fare_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `unit` varchar(10) DEFAULT 'CNY' COMMENT '货币单位',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态 1支付 0未支付',
  `is_modify` tinyint(1) unsigned DEFAULT '0' COMMENT '是否修改价格 1修改 0未修改',
  `is_temp` tinyint(1) DEFAULT '0' COMMENT '是否临时订单 1是 0否',
  `is_percentage` tinyint(1) DEFAULT '0' COMMENT '手续费结算 1已收取 0未收取',
  `is_back` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态 0正常 1申请退款 2退款完成 3拒绝退款 4取消退款',
  `pass_time` int(10) unsigned DEFAULT '0' COMMENT '订单确认操作时间',
  `status_time` int(10) unsigned DEFAULT '0' COMMENT '订单审核操作时间',
  `close_time` int(11) unsigned DEFAULT '0' COMMENT '订单关闭操作时间',
  `success_time` int(11) unsigned DEFAULT '0' COMMENT '订单完成时间',
  `origin` tinyint(1) unsigned DEFAULT '0' COMMENT '来源 0未知 1安卓 2IOS 3PC 4微信 5WAP',
  `version` varchar(10) DEFAULT '0' COMMENT '版本号',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `tax` decimal(10,2) DEFAULT '0.00' COMMENT '税费',
  `coupon_id` int(11) DEFAULT '0' COMMENT '使用抵扣卷',
  `use_integral` int(11) DEFAULT '0' COMMENT '使用积分',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `dh_orders` */

insert  into `dh_orders`(`id`,`type`,`tags`,`order_sn`,`merge_sn`,`uid`,`seller_uid`,`message`,`seller_message`,`order_status`,`status`,`del_status`,`del_uid`,`del_seller`,`acount_original`,`acount`,`coupon_price`,`integral_price`,`balance_price`,`fare_price`,`unit`,`is_pay`,`is_modify`,`is_temp`,`is_percentage`,`is_back`,`pass_time`,`status_time`,`close_time`,`success_time`,`origin`,`version`,`created`,`tax`,`coupon_id`,`use_integral`) values (2,5,'','TEST00005KO','',2,0,'备注','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516693070,'0.00',0,0),(3,5,'','TEST00006KO','',27,0,'1226','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516693089,'0.00',0,0),(4,5,'','TEST00007KO','',2,0,'被','',1,1,0,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516694088,'2.00',0,0),(5,5,'','TEST00008KO','',2,0,'备注','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516696034,'0.00',0,0),(6,5,'','TEST00009KO','',2,0,'哦哦哦','',1,1,0,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516696061,'2.00',0,0),(7,5,'','TEST00010KO','',2,0,'被','',1,1,1,1,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516696205,'0.00',0,0),(8,5,'','TEST00011KO','',2,0,'备注','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516696264,'0.00',0,0),(9,5,'','TEST00012KO','',2,0,'把','',1,0,0,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516696638,'2.00',0,0),(10,4,'','TEST00014KO','180220006817698067',2,26,'hhhh','',1,1,0,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516700022,'0.00',0,0),(11,5,'','TEST00015KO','',27,0,'','',1,1,0,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516762029,'123.00',0,0),(12,5,'','TEST00016KO','',27,0,'距离了姐说','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516762148,'0.00',0,0),(13,5,'','TEST00017KO','',27,0,'222','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516762185,'0.00',0,0),(14,5,'','TEST00018KO','',27,0,'1266','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516762268,'0.00',0,0),(15,5,'','TEST00019KO','',27,0,'','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516763388,'0.00',0,0),(16,5,'','TEST00020KO','',27,0,'','',1,0,0,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516764553,'123.00',0,0),(17,5,'','TEST00021KO','',27,0,'3696','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516764756,'0.00',0,0),(18,5,'','TEST00022KO','',27,0,'','',1,0,0,0,0,'75.254','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516765246,'0.00',0,0),(19,5,'','TEST00023KO','180238592966079371',27,0,'','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516784632,'0.00',0,0),(20,5,'','TEST00024KO','',27,0,'','',1,0,0,0,0,'59.23','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516785482,'0.00',0,0),(21,5,'','TEST00025KO','',27,0,'','',1,0,0,0,0,'0','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516785558,'0.00',0,0),(22,5,'','TEST00026KO','180238592966079371',27,0,'','',1,1,1,0,0,'0.00','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516785886,'0.00',0,0),(23,5,'','TEST00027KO','180238592966079371',27,0,'','',1,0,0,0,0,'233.6','0.00','0.00','0.00','0.00','0.00','AUD',0,0,0,0,0,0,0,0,0,0,'0',1516785929,'0.00',0,0);

/*Table structure for table `dh_orders_car` */

DROP TABLE IF EXISTS `dh_orders_car`;

CREATE TABLE `dh_orders_car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` char(18) NOT NULL COMMENT '订单编号',
  `ascription` tinyint(1) DEFAULT '1' COMMENT '归属 1个人 2店铺',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始预约时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束预约时间',
  `goods_id` int(10) unsigned DEFAULT '0' COMMENT '商品id',
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '商品标题',
  `thumb` varchar(60) DEFAULT '' COMMENT '商品图片',
  `produce_time` varchar(10) DEFAULT '' COMMENT '生成日期',
  `mileage` varchar(10) DEFAULT '' COMMENT '里程数',
  `price_original` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品原价',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品先价',
  `is_modify` tinyint(1) unsigned DEFAULT '0' COMMENT '价格修改状态 1修改 0未修改',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠卷id',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '电话号码',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `dh_orders_car` */

insert  into `dh_orders_car`(`id`,`order_sn`,`ascription`,`start_time`,`end_time`,`goods_id`,`title`,`thumb`,`produce_time`,`mileage`,`price_original`,`price`,`is_modify`,`coupon_id`,`mobile`) values (3,'173175149025196950',2,1510737840,0,10,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg','2013','1.2','18.00','18.00',0,0,'15558'),(4,'173175238505612764',2,1510736440,2017,11,'汽车品牌 2013 A6L 1.6L 纪念版2','150908448373047.jpeg','2013','1.2','18.00','18.00',0,0,'67788'),(5,'173384619282889510',2,1512529257,2017,29,'大众 23','1512446146602_22.jpeg','0','0.0','12.00','12.00',0,0,'18725796416'),(6,'173385702809663152',2,1512489480,0,5,'奥迪 2017 23 888 很好','150596096890834.jpeg','2017','5.0','5.00','5.00',0,0,'5555585'),(7,'173385802379058870',2,1512468900,0,5,'奥迪 2017 23 888 很好','150596096890834.jpeg','2017','5.0','5.00','5.00',0,0,'18568788'),(8,'173385824849543856',2,1512548280,0,8,'奥迪 2017 x6 2.0 很好的汽车，九成新','150587084744692.png','2017','5.0','20.00','20.00',0,0,'55578'),(9,'173403185985461736',2,1512716432,2017,3,'大众 2017 x5 2.0 很好','150596096890834.jpeg','2017','2.0','20.00','20.00',0,0,'1'),(10,'173403188768620980',2,1512716432,2017,3,'大众 2017 x5 2.0 很好','150596096890834.jpeg','2017','2.0','20.00','20.00',0,0,'1'),(11,'173403197211803896',2,1512716434,2017,5,'奥迪 2017 23 888 很好','150596096890834.jpeg','2017','5.0','5.00','5.00',0,0,'滴滴'),(12,'173403270442991202',2,1512716446,2017,5,'奥迪 2017 23 888 很好','150596096890834.jpeg','2017','5.0','5.00','5.00',0,0,'不喝牛奶精华');

/*Table structure for table `dh_orders_course` */

DROP TABLE IF EXISTS `dh_orders_course`;

CREATE TABLE `dh_orders_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_uid` int(10) unsigned DEFAULT '0' COMMENT '上课老师',
  `order_sn` char(18) NOT NULL DEFAULT '0' COMMENT '订单编号',
  `title` varchar(100) DEFAULT '' COMMENT '课程名称',
  `btitle` varchar(100) DEFAULT '' COMMENT '课程名称英文',
  `goods_id` int(11) DEFAULT NULL COMMENT '课程id',
  `sign` tinyint(3) unsigned DEFAULT '1' COMMENT '课程类型',
  `num` int(10) unsigned DEFAULT '0' COMMENT '课时数',
  `class_time` varchar(100) DEFAULT '' COMMENT '课程时间中文',
  `class_time_en` varchar(100) DEFAULT '' COMMENT '课程时间英文',
  `thumb` varchar(200) DEFAULT '' COMMENT '封面图',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '用户电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='课程表';

/*Data for the table `dh_orders_course` */

insert  into `dh_orders_course`(`id`,`teacher_uid`,`order_sn`,`title`,`btitle`,`goods_id`,`sign`,`num`,`class_time`,`class_time_en`,`thumb`,`nickname`,`mobile`) values (13,8,'173175139456615895','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','哈哈哈','11111'),(14,8,'173200718493192019','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','哈哈哈','123445'),(15,8,'173253093980531653','测试','',59,1,0,'','','','17300289310','17300289310'),(16,8,'173262342700608941','测试','',59,2,0,'','','','','15923882848'),(17,8,'173262955579563106','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','','1111'),(18,8,'173324012403488419','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','','15923882847');

/*Table structure for table `dh_orders_package` */

DROP TABLE IF EXISTS `dh_orders_package`;

CREATE TABLE `dh_orders_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
  `name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `brand` varchar(50) DEFAULT '' COMMENT '商品品牌',
  `category` varchar(50) DEFAULT '' COMMENT '商品分类',
  `spec` float unsigned DEFAULT '0' COMMENT '商品规格kg',
  `num` int(10) unsigned DEFAULT '0' COMMENT '商品数量',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品单价',
  `account` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品总价',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '物品存在状态 1存在 0未存在',
  `warehouse_id` int(10) unsigned DEFAULT '0' COMMENT '小仓库商品id',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='订单包裹信息';

/*Data for the table `dh_orders_package` */

insert  into `dh_orders_package`(`id`,`order_sn`,`name`,`brand`,`category`,`spec`,`num`,`price`,`account`,`status`,`warehouse_id`) values (1,'TEST00002KO','1111','1222','化妆品',1333,4,'5.00','20.00',1,0),(2,'TEST00005KO','厕所','斤','食品',1,2,'20.00','40.00',1,0),(3,'TEST00006KO','2266','223','日用品',1,2,'3000.00','6000.00',1,0),(4,'TEST00007KO','厕所','斤','食品',1,2,'20.00','40.00',1,0),(5,'TEST00008KO','呢','兰蔻','食品',1,2,'3.00','6.00',1,0),(7,'TEST00010KO','(⊙o⊙)哦','696','电子产品',1,2,'3.00','6.00',1,0),(8,'TEST00011KO','哟','帮宝适','母婴用品',2,5,'30.00','150.00',1,0),(9,'TEST00012KO','哟','帮宝适','母婴用品',2,5,'30.00','150.00',1,0),(10,'TEST00014KO','k','h','食品',2,2,'20.00','40.00',1,0),(11,'TEST00015KO','2266','223','日用品',1,2,'3000.00','6000.00',1,0),(12,'TEST00016KO','2255','5555','电子产品',2,2,'2085.00','4170.00',1,0),(13,'TEST00017KO','13696','236','日用品',2,6,'368.00','2208.00',1,0),(14,'TEST00018KO','2255','5555','电子产品',2,2,'2085.00','4170.00',1,0),(15,'TEST00019KO','1223','3982','食品',2,55,'23.00','1265.00',1,0),(16,'TEST00020KO','2255','5555','电子产品',2,2,'2085.00','4170.00',1,0),(17,'TEST00021KO','3669','369','母婴用品',665,3,'365.00','1095.00',1,0),(18,'TEST00022KO','13696','236','日用品',2,6,'368.00','2208.00',1,0),(19,'TEST00009KO','呢','兰蔻','食品',1,2,'3.00','6.00',0,0),(20,'TEST00023KO','2255','5555','电子产品',2,2,'2085.00','4170.00',1,0),(21,'TEST00024KO','2255','5555','电子产品',2,2,'2085.00','4170.00',1,0),(22,'TEST00025KO','1223','3982','食品',2,55,'23.00','1265.00',1,0),(23,'TEST00025KO','3669','369','母婴用品',665,3,'365.00','1095.00',1,0),(24,'TEST00026KO','68896','3685','日用品',3,9,'865.00','7785.00',1,0),(25,'TEST00027KO','2255','5555','电子产品',2,2,'2085.00','4170.00',1,0),(26,'TEST00027KO','68896','3685','日用品',3,9,'865.00','7785.00',1,0);

/*Table structure for table `dh_orders_service` */

DROP TABLE IF EXISTS `dh_orders_service`;

CREATE TABLE `dh_orders_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '服务类型',
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
  `vin` varchar(60) DEFAULT '' COMMENT 'vin编号',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '开始预约时间',
  `end_time` int(10) unsigned DEFAULT '0' COMMENT '结束预约时间',
  `ablum` varchar(500) DEFAULT '' COMMENT '详情图',
  `brand` varchar(10) DEFAULT '' COMMENT '品牌文字',
  `style` varchar(10) DEFAULT '' COMMENT '款号文字',
  `produce_time` varchar(10) DEFAULT '' COMMENT '生产时间',
  `buy_time` int(10) unsigned DEFAULT '0' COMMENT '购买时间戳',
  `mileage` decimal(10,1) unsigned DEFAULT '0.0' COMMENT '里程数',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `price_original` decimal(10,2) DEFAULT '0.00' COMMENT '商品原价',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `thumb` varchar(100) DEFAULT '' COMMENT '封面图片',
  `model` varchar(10) DEFAULT '' COMMENT '车型',
  `mobile` varchar(11) DEFAULT '' COMMENT '预约电话',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='订单服务详情';

/*Data for the table `dh_orders_service` */

insert  into `dh_orders_service`(`id`,`type`,`order_sn`,`vin`,`start_time`,`end_time`,`ablum`,`brand`,`style`,`produce_time`,`buy_time`,`mileage`,`goods_id`,`price`,`price_original`,`title`,`thumb`,`model`,`mobile`) values (3,1,'173175150355360857','',1510824360,0,'','大众','j8','2016年',1504195200,'5.0',11,'200.00','200.00','200','150578927012952.jpeg','','4558755885'),(4,20,'173175178358449589','',1510738200,0,'','大众','','',0,'556588.0',8,'10.00','10.00','免费贴膜','150578927012952.jpeg','','556588'),(5,20,'173175223026959624','',1510738680,2017,'','奥拓','','',0,'55667.0',10,'9.90','9.90','免费贴膜','150578927012952.jpeg','','55667'),(6,22,'173234890291506702','',1511321760,2017,'','大众','','',0,'999999999.9',13,'25.00','25.00','Do Che','','','15572695368'),(7,20,'173254170084106089','',1511359740,0,'','丰田','','',0,'999999999.9',7,'10.00','10.00','免费贴膜','150578927012952.jpeg','','1596555255'),(8,20,'173254200159989178','',1511352840,0,'','奥迪','','',0,'159655222.0',10,'0.00','0.00','哇哈哈哈哈','150570605387503.png','','159655222'),(9,20,'173254225276371328','',1511349480,0,'','汽车改装','A8','2017',1000000,'0.0',10,'0.00','0.00','哇哈哈哈哈','150570605387503.png','','15566886'),(10,22,'173384543590459253','',1512531900,2017,'','大众','','',0,'999999999.9',13,'25.00','25.00','Do Che','','','18725796416'),(11,22,'173384594150551197','',1512532380,2017,'','奥拓','','',0,'999999999.9',13,'25.00','25.00','Do Che','','','18725796416'),(12,1,'173385805385130514','',1512468900,0,'','奥拓','推荐','2017年',1509465600,'5.0',11,'200.00','200.00','200','150578927012952.jpeg','','5655688'),(13,1,'173385809015437381','',1512465360,0,'','奥拓','推荐','2017年',1509465600,'5.0',11,'200.00','200.00','200','150578927012952.jpeg','','88856');

/*Table structure for table `dh_pond_orders` */

DROP TABLE IF EXISTS `dh_pond_orders`;

CREATE TABLE `dh_pond_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '1本地直邮 2国际转运',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '店铺uid',
  `is_use` tinyint(1) unsigned DEFAULT '0' COMMENT '是否使用',
  `order_sn` char(18) DEFAULT '' COMMENT '申请编号',
  `created` int(10) unsigned DEFAULT '0' COMMENT '申请时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='订单编号池';

/*Data for the table `dh_pond_orders` */

insert  into `dh_pond_orders`(`id`,`type`,`uid`,`is_use`,`order_sn`,`created`) values (1,1,25,1,'TEST00002KO',1516692698),(2,1,25,1,'TEST00003KO',1516692698),(3,1,25,1,'TEST00004KO',1516692698),(4,1,25,1,'TEST00005KO',1516692698),(5,1,25,1,'TEST00006KO',1516692698),(6,1,25,1,'TEST00007KO',1516692698),(7,1,25,1,'TEST00008KO',1516692698),(8,1,25,1,'TEST00009KO',1516692698),(9,1,25,1,'TEST00010KO',1516692698),(10,1,25,1,'TEST00011KO',1516692698),(11,1,25,1,'TEST00012KO',1516692698),(12,1,25,1,'TEST00013KO',1516692698),(13,1,25,1,'TEST00014KO',1516692698),(14,1,25,1,'TEST00015KO',1516692698),(15,1,25,1,'TEST00016KO',1516692698),(16,1,25,1,'TEST00017KO',1516692698),(17,1,25,1,'TEST00018KO',1516692698),(18,1,25,1,'TEST00019KO',1516692698),(19,1,25,1,'TEST00020KO',1516692698),(20,1,25,1,'TEST00021KO',1516692698),(21,1,25,1,'TEST00022KO',1516692698),(22,1,25,1,'TEST00023KO',1516692698),(23,1,25,1,'TEST00024KO',1516692698),(24,1,25,1,'TEST00025KO',1516692698),(25,1,25,1,'TEST00026KO',1516692698),(26,1,25,1,'TEST00027KO',1516692698),(27,1,25,0,'TEST00028KO',1516692698),(28,1,25,0,'TEST00029KO',1516692698),(29,1,25,0,'TEST00030KO',1516692698),(30,1,25,0,'TEST00031KO',1516692698),(31,1,25,0,'TEST00032KO',1516692698),(32,1,25,0,'TEST00033KO',1516692698),(33,1,25,0,'TEST00034KO',1516692698),(34,1,25,0,'TEST00035KO',1516692698),(35,1,25,0,'TEST00036KO',1516692698),(36,1,25,0,'TEST00037KO',1516692698),(37,1,25,0,'TEST00038KO',1516692698),(38,1,25,0,'TEST00039KO',1516692698),(39,1,25,0,'TEST00040KO',1516692698),(40,1,25,0,'TEST00041KO',1516692698),(41,1,25,0,'TEST00042KO',1516692698),(42,1,25,0,'TEST00043KO',1516692698),(43,1,25,0,'TEST00044KO',1516692698),(44,1,25,0,'TEST00045KO',1516692698),(45,1,25,0,'TEST00046KO',1516692698),(46,1,25,0,'TEST00047KO',1516692698),(47,1,25,0,'TEST00048KO',1516692698),(48,1,25,0,'TEST00049KO',1516692698),(49,1,25,0,'TEST00050KO',1516692698),(50,1,25,0,'TEST00051KO',1516692698),(51,1,25,0,'TEST00052KO',1516692698),(52,1,25,0,'TEST00053KO',1516692698),(53,1,25,0,'TEST00054KO',1516692698),(54,1,25,0,'TEST00055KO',1516692698),(55,1,25,0,'TEST00056KO',1516692698),(56,1,25,0,'TEST00057KO',1516692698),(57,1,25,0,'TEST00058KO',1516692698),(58,1,25,0,'TEST00059KO',1516692698),(59,1,25,0,'TEST00060KO',1516692698),(60,1,25,0,'TEST00061KO',1516692698),(61,1,25,0,'TEST00062KO',1516692698),(62,1,25,0,'TEST00063KO',1516692698),(63,1,25,0,'TEST00064KO',1516692698),(64,1,25,0,'TEST00065KO',1516692698),(65,1,25,0,'TEST00066KO',1516692698),(66,1,25,0,'TEST00067KO',1516692698),(67,1,25,0,'TEST00068KO',1516692698),(68,1,25,0,'TEST00069KO',1516692698),(69,1,25,0,'TEST00070KO',1516692698),(70,1,25,0,'TEST00071KO',1516692698),(71,1,25,0,'TEST00072KO',1516692698),(72,1,25,0,'TEST00073KO',1516692698),(73,1,25,0,'TEST00074KO',1516692698),(74,1,25,0,'TEST00075KO',1516692698),(75,1,25,0,'TEST00076KO',1516692698),(76,1,25,0,'TEST00077KO',1516692698),(77,1,25,0,'TEST00078KO',1516692698),(78,1,25,0,'TEST00079KO',1516692698),(79,1,25,0,'TEST00080KO',1516692698),(80,1,25,0,'TEST00081KO',1516692698),(81,1,25,0,'TEST00082KO',1516692698),(82,1,25,0,'TEST00083KO',1516692698),(83,1,25,0,'TEST00084KO',1516692698),(84,1,25,0,'TEST00085KO',1516692698),(85,1,25,0,'TEST00086KO',1516692698),(86,1,25,0,'TEST00087KO',1516692698),(87,1,25,0,'TEST00088KO',1516692698),(88,1,25,0,'TEST00089KO',1516692698),(89,1,25,0,'TEST00090KO',1516692698),(90,1,25,0,'TEST00091KO',1516692698),(91,1,25,0,'TEST00092KO',1516692698),(92,1,25,0,'TEST00093KO',1516692698),(93,1,25,0,'TEST00094KO',1516692698),(94,1,25,0,'TEST00095KO',1516692698),(95,1,25,0,'TEST00096KO',1516692698),(96,1,25,0,'TEST00097KO',1516692698),(97,1,25,0,'TEST00098KO',1516692698),(98,1,25,0,'TEST00099KO',1516692698),(99,1,25,0,'TEST00100KO',1516692698),(100,1,25,0,'TEST00101KO',1516692698),(101,1,25,0,'TEST00102KO',1516692698),(102,1,25,0,'TEST00103KO',1516692698),(103,1,25,0,'TEST00104KO',1516692698),(104,1,25,0,'TEST00105KO',1516692698),(105,1,25,0,'TEST00106KO',1516692698),(106,1,25,0,'TEST00107KO',1516692698),(107,1,25,0,'TEST00108KO',1516692698),(108,1,25,0,'TEST00109KO',1516692698),(109,1,25,0,'TEST00110KO',1516692698),(110,1,25,0,'TEST00111KO',1516692698),(111,1,25,0,'TEST00112KO',1516692698),(112,1,25,0,'TEST00113KO',1516692698),(113,1,25,0,'TEST00114KO',1516692698),(114,1,25,0,'TEST00115KO',1516692698),(115,1,25,0,'TEST00116KO',1516692698),(116,1,25,0,'TEST00117KO',1516692698),(117,1,25,0,'TEST00118KO',1516692698),(118,1,25,0,'TEST00119KO',1516692698),(119,1,25,0,'TEST00120KO',1516692698),(120,1,25,0,'TEST00121KO',1516692698),(121,1,25,0,'TEST00122KO',1516692698),(122,1,25,0,'TEST00123KO',1516692698),(123,1,25,0,'TEST00124KO',1516692698),(124,1,25,0,'TEST00125KO',1516692698),(125,1,25,0,'TEST00126KO',1516692698),(126,1,25,0,'TEST00127KO',1516692698),(127,1,25,0,'TEST00128KO',1516692698),(128,1,25,0,'TEST00129KO',1516692698),(129,1,25,0,'TEST00130KO',1516692698),(130,1,25,0,'TEST00131KO',1516692698),(131,1,25,0,'TEST00132KO',1516692698),(132,1,25,0,'TEST00133KO',1516692698),(133,1,25,0,'TEST00134KO',1516692698),(134,1,25,0,'TEST00135KO',1516692698),(135,1,25,0,'TEST00136KO',1516692698),(136,1,25,0,'TEST00137KO',1516692698),(137,1,25,0,'TEST00138KO',1516692698),(138,1,25,0,'TEST00139KO',1516692698),(139,1,25,0,'TEST00140KO',1516692698),(140,1,25,0,'TEST00141KO',1516692698),(141,1,25,0,'TEST00142KO',1516692698),(142,1,25,0,'TEST00143KO',1516692698),(143,1,25,0,'TEST00144KO',1516692698),(144,1,25,0,'TEST00145KO',1516692698),(145,1,25,0,'TEST00146KO',1516692698),(146,1,25,0,'TEST00147KO',1516692698),(147,1,25,0,'TEST00148KO',1516692698),(148,1,25,0,'TEST00149KO',1516692698),(149,1,25,0,'TEST00150KO',1516692698),(150,1,25,0,'TEST00151KO',1516692698),(151,1,25,0,'TEST00152KO',1516692698),(152,1,25,0,'TEST00153KO',1516692698),(153,1,25,0,'TEST00154KO',1516692698),(154,1,25,0,'TEST00155KO',1516692698),(155,1,25,0,'TEST00156KO',1516692698),(156,1,25,0,'TEST00157KO',1516692698),(157,1,25,0,'TEST00158KO',1516692698),(158,1,25,0,'TEST00159KO',1516692698),(159,1,25,0,'TEST00160KO',1516692698),(160,1,25,0,'TEST00161KO',1516692698),(161,1,25,0,'TEST00162KO',1516692698),(162,1,25,0,'TEST00163KO',1516692698),(163,1,25,0,'TEST00164KO',1516692698),(164,1,25,0,'TEST00165KO',1516692698),(165,1,25,0,'TEST00166KO',1516692698),(166,1,25,0,'TEST00167KO',1516692698),(167,1,25,0,'TEST00168KO',1516692698),(168,1,25,0,'TEST00169KO',1516692698),(169,1,25,0,'TEST00170KO',1516692698),(170,1,25,0,'TEST00171KO',1516692698),(171,1,25,0,'TEST00172KO',1516692698),(172,1,25,0,'TEST00173KO',1516692698),(173,1,25,0,'TEST00174KO',1516692698),(174,1,25,0,'TEST00175KO',1516692698),(175,1,25,0,'TEST00176KO',1516692698),(176,1,25,0,'TEST00177KO',1516692698),(177,1,25,0,'TEST00178KO',1516692698),(178,1,25,0,'TEST00179KO',1516692698),(179,1,25,0,'TEST00180KO',1516692698),(180,1,25,0,'TEST00181KO',1516692698),(181,1,25,0,'TEST00182KO',1516692698),(182,1,25,0,'TEST00183KO',1516692698),(183,1,25,0,'TEST00184KO',1516692698),(184,1,25,0,'TEST00185KO',1516692698),(185,1,25,0,'TEST00186KO',1516692698),(186,1,25,0,'TEST00187KO',1516692698),(187,1,25,0,'TEST00188KO',1516692698),(188,1,25,0,'TEST00189KO',1516692698),(189,1,25,0,'TEST00190KO',1516692698),(190,1,25,0,'TEST00191KO',1516692698),(191,1,25,0,'TEST00192KO',1516692698),(192,1,25,0,'TEST00193KO',1516692698),(193,1,25,0,'TEST00194KO',1516692698),(194,1,25,0,'TEST00195KO',1516692698),(195,1,25,0,'TEST00196KO',1516692698),(196,1,25,0,'TEST00197KO',1516692698),(197,1,25,0,'TEST00198KO',1516692698),(198,1,25,0,'TEST00199KO',1516692698),(199,1,25,0,'TEST00200KO',1516692698),(200,1,25,0,'TEST00201KO',1516692698),(201,1,25,0,'TEST00202KO',1516692698),(202,1,25,0,'TEST00203KO',1516692698),(203,1,25,0,'TEST00204KO',1516692698),(204,1,25,0,'TEST00205KO',1516692698),(205,1,25,0,'TEST00206KO',1516692698),(206,1,25,0,'TEST00207KO',1516692698),(207,1,25,0,'TEST00208KO',1516692698),(208,1,25,0,'TEST00209KO',1516692698),(209,1,25,0,'TEST00210KO',1516692698),(210,1,25,0,'TEST00211KO',1516692698),(211,1,25,0,'TEST00212KO',1516692698),(212,1,25,0,'TEST00213KO',1516692698),(213,1,25,0,'TEST00214KO',1516692698),(214,1,25,0,'TEST00215KO',1516692698),(215,1,25,0,'TEST00216KO',1516692698),(216,1,25,0,'TEST00217KO',1516692698),(217,1,25,0,'TEST00218KO',1516692698),(218,1,25,0,'TEST00219KO',1516692698),(219,1,25,0,'TEST00220KO',1516692698),(220,1,25,0,'TEST00221KO',1516692698),(221,1,25,0,'TEST00222KO',1516692698),(222,1,25,0,'TEST00223KO',1516692698),(223,1,25,0,'TEST00224KO',1516692698),(224,1,25,0,'TEST00225KO',1516692698),(225,1,25,0,'TEST00226KO',1516692698),(226,1,25,0,'TEST00227KO',1516692698),(227,1,25,0,'TEST00228KO',1516692698),(228,1,25,0,'TEST00229KO',1516692698),(229,1,25,0,'TEST00230KO',1516692698),(230,1,25,0,'TEST00231KO',1516692698),(231,1,25,0,'TEST00232KO',1516692698),(232,1,25,0,'TEST00233KO',1516692698),(233,1,25,0,'TEST00234KO',1516692698),(234,1,25,0,'TEST00235KO',1516692698),(235,1,25,0,'TEST00236KO',1516692698),(236,1,25,0,'TEST00237KO',1516692698),(237,1,25,0,'TEST00238KO',1516692698),(238,1,25,0,'TEST00239KO',1516692698),(239,1,25,0,'TEST00240KO',1516692698),(240,1,25,0,'TEST00241KO',1516692698),(241,1,25,0,'TEST00242KO',1516692698),(242,1,25,0,'TEST00243KO',1516692698),(243,1,25,0,'TEST00244KO',1516692698),(244,1,25,0,'TEST00245KO',1516692698),(245,1,25,0,'TEST00246KO',1516692698),(246,1,25,0,'TEST00247KO',1516692698),(247,1,25,0,'TEST00248KO',1516692698),(248,1,25,0,'TEST00249KO',1516692698),(249,1,25,0,'TEST00250KO',1516692698),(250,1,25,0,'TEST00251KO',1516692698),(251,1,25,0,'TEST00252KO',1516692698),(252,1,25,0,'TEST00253KO',1516692698),(253,1,25,0,'TEST00254KO',1516692698),(254,1,25,0,'TEST00255KO',1516692698),(255,1,25,0,'TEST00256KO',1516692698),(256,1,25,0,'TEST00257KO',1516692698),(257,1,25,0,'TEST00258KO',1516692698),(258,1,25,0,'TEST00259KO',1516692698),(259,1,25,0,'TEST00260KO',1516692698),(260,1,25,0,'TEST00261KO',1516692698),(261,1,25,0,'TEST00262KO',1516692698),(262,1,25,0,'TEST00263KO',1516692698),(263,1,25,0,'TEST00264KO',1516692698),(264,1,25,0,'TEST00265KO',1516692698),(265,1,25,0,'TEST00266KO',1516692698),(266,1,25,0,'TEST00267KO',1516692698),(267,1,25,0,'TEST00268KO',1516692698),(268,1,25,0,'TEST00269KO',1516692698),(269,1,25,0,'TEST00270KO',1516692698),(270,1,25,0,'TEST00271KO',1516692698),(271,1,25,0,'TEST00272KO',1516692698),(272,1,25,0,'TEST00273KO',1516692698),(273,1,25,0,'TEST00274KO',1516692698),(274,1,25,0,'TEST00275KO',1516692698),(275,1,25,0,'TEST00276KO',1516692698),(276,1,25,0,'TEST00277KO',1516692698),(277,1,25,0,'TEST00278KO',1516692698),(278,1,25,0,'TEST00279KO',1516692698),(279,1,25,0,'TEST00280KO',1516692698),(280,1,25,0,'TEST00281KO',1516692698),(281,1,25,0,'TEST00282KO',1516692698),(282,1,25,0,'TEST00283KO',1516692698),(283,1,25,0,'TEST00284KO',1516692698),(284,1,25,0,'TEST00285KO',1516692698),(285,1,25,0,'TEST00286KO',1516692698),(286,1,25,0,'TEST00287KO',1516692698),(287,1,25,0,'TEST00288KO',1516692698),(288,1,25,0,'TEST00289KO',1516692698),(289,1,25,0,'TEST00290KO',1516692698),(290,1,25,0,'TEST00291KO',1516692698),(291,1,25,0,'TEST00292KO',1516692698),(292,1,25,0,'TEST00293KO',1516692698),(293,1,25,0,'TEST00294KO',1516692698),(294,1,25,0,'TEST00295KO',1516692698),(295,1,25,0,'TEST00296KO',1516692698),(296,1,25,0,'TEST00297KO',1516692698),(297,1,25,0,'TEST00298KO',1516692698),(298,1,25,0,'TEST00299KO',1516692698),(299,1,25,0,'TEST00300KO',1516692698),(300,1,25,0,'TEST00301KO',1516692698),(301,1,25,0,'TEST00302KO',1516692698),(302,1,25,0,'TEST00303KO',1516692698),(303,1,25,0,'TEST00304KO',1516692698),(304,1,25,0,'TEST00305KO',1516692698),(305,1,25,0,'TEST00306KO',1516692698),(306,1,25,0,'TEST00307KO',1516692698),(307,1,25,0,'TEST00308KO',1516692698),(308,1,25,0,'TEST00309KO',1516692698),(309,1,25,0,'TEST00310KO',1516692698),(310,1,25,0,'TEST00311KO',1516692698),(311,1,25,0,'TEST00312KO',1516692698),(312,1,25,0,'TEST00313KO',1516692698),(313,1,25,0,'TEST00314KO',1516692698),(314,1,25,0,'TEST00315KO',1516692698),(315,1,25,0,'TEST00316KO',1516692698),(316,1,25,0,'TEST00317KO',1516692698),(317,1,25,0,'TEST00318KO',1516692698),(318,1,25,0,'TEST00319KO',1516692698),(319,1,25,0,'TEST00320KO',1516692698),(320,1,25,0,'TEST00321KO',1516692698),(321,1,25,0,'TEST00322KO',1516692698),(322,1,25,0,'TEST00323KO',1516692698),(323,1,25,0,'TEST00324KO',1516692698),(324,1,25,0,'TEST00325KO',1516692698),(325,1,25,0,'TEST00326KO',1516692698),(326,1,25,0,'TEST00327KO',1516692698),(327,1,25,0,'TEST00328KO',1516692698),(328,1,25,0,'TEST00329KO',1516692698),(329,1,25,0,'TEST00330KO',1516692698),(330,1,25,0,'TEST00331KO',1516692698),(331,1,25,0,'TEST00332KO',1516692698),(332,1,25,0,'TEST00333KO',1516692698),(333,1,25,0,'TEST00334KO',1516692698),(334,1,25,0,'TEST00335KO',1516692698),(335,1,25,0,'TEST00336KO',1516692698),(336,1,25,0,'TEST00337KO',1516692698),(337,1,25,0,'TEST00338KO',1516692698),(338,1,25,0,'TEST00339KO',1516692698),(339,1,25,0,'TEST00340KO',1516692698),(340,1,25,0,'TEST00341KO',1516692698),(341,1,25,0,'TEST00342KO',1516692698),(342,1,25,0,'TEST00343KO',1516692698),(343,1,25,0,'TEST00344KO',1516692698),(344,1,25,0,'TEST00345KO',1516692698),(345,1,25,0,'TEST00346KO',1516692698),(346,1,25,0,'TEST00347KO',1516692698),(347,1,25,0,'TEST00348KO',1516692698),(348,1,25,0,'TEST00349KO',1516692698),(349,1,25,0,'TEST00350KO',1516692698),(350,1,25,0,'TEST00351KO',1516692698),(351,1,25,0,'TEST00352KO',1516692698),(352,1,25,0,'TEST00353KO',1516692698),(353,1,25,0,'TEST00354KO',1516692698),(354,1,25,0,'TEST00355KO',1516692698),(355,1,25,0,'TEST00356KO',1516692698),(356,1,25,0,'TEST00357KO',1516692698),(357,1,25,0,'TEST00358KO',1516692698),(358,1,25,0,'TEST00359KO',1516692698),(359,1,25,0,'TEST00360KO',1516692698),(360,1,25,0,'TEST00361KO',1516692698),(361,1,25,0,'TEST00362KO',1516692698),(362,1,25,0,'TEST00363KO',1516692698),(363,1,25,0,'TEST00364KO',1516692698),(364,1,25,0,'TEST00365KO',1516692698),(365,1,25,0,'TEST00366KO',1516692698),(366,1,25,0,'TEST00367KO',1516692698),(367,1,25,0,'TEST00368KO',1516692698),(368,1,25,0,'TEST00369KO',1516692698),(369,1,25,0,'TEST00370KO',1516692698),(370,1,25,0,'TEST00371KO',1516692698),(371,1,25,0,'TEST00372KO',1516692698),(372,1,25,0,'TEST00373KO',1516692698),(373,1,25,0,'TEST00374KO',1516692698),(374,1,25,0,'TEST00375KO',1516692698),(375,1,25,0,'TEST00376KO',1516692698),(376,1,25,0,'TEST00377KO',1516692698),(377,1,25,0,'TEST00378KO',1516692698),(378,1,25,0,'TEST00379KO',1516692698),(379,1,25,0,'TEST00380KO',1516692698),(380,1,25,0,'TEST00381KO',1516692698),(381,1,25,0,'TEST00382KO',1516692698),(382,1,25,0,'TEST00383KO',1516692698),(383,1,25,0,'TEST00384KO',1516692698),(384,1,25,0,'TEST00385KO',1516692698),(385,1,25,0,'TEST00386KO',1516692698),(386,1,25,0,'TEST00387KO',1516692698),(387,1,25,0,'TEST00388KO',1516692698),(388,1,25,0,'TEST00389KO',1516692698),(389,1,25,0,'TEST00390KO',1516692698),(390,1,25,0,'TEST00391KO',1516692698),(391,1,25,0,'TEST00392KO',1516692698),(392,1,25,0,'TEST00393KO',1516692698),(393,1,25,0,'TEST00394KO',1516692698),(394,1,25,0,'TEST00395KO',1516692698),(395,1,25,0,'TEST00396KO',1516692698),(396,1,25,0,'TEST00397KO',1516692698),(397,1,25,0,'TEST00398KO',1516692698),(398,1,25,0,'TEST00399KO',1516692698),(399,1,25,0,'TEST00400KO',1516692698),(400,1,25,0,'TEST00401KO',1516692698),(401,1,25,0,'TEST00402KO',1516692698),(402,1,25,0,'TEST00403KO',1516692698),(403,1,25,0,'TEST00404KO',1516692698),(404,1,25,0,'TEST00405KO',1516692698),(405,1,25,0,'TEST00406KO',1516692698),(406,1,25,0,'TEST00407KO',1516692698),(407,1,25,0,'TEST00408KO',1516692698),(408,1,25,0,'TEST00409KO',1516692698),(409,1,25,0,'TEST00410KO',1516692698),(410,1,25,0,'TEST00411KO',1516692698),(411,1,25,0,'TEST00412KO',1516692698),(412,1,25,0,'TEST00413KO',1516692698),(413,1,25,0,'TEST00414KO',1516692698),(414,1,25,0,'TEST00415KO',1516692698),(415,1,25,0,'TEST00416KO',1516692698),(416,1,25,0,'TEST00417KO',1516692698),(417,1,25,0,'TEST00418KO',1516692698),(418,1,25,0,'TEST00419KO',1516692698),(419,1,25,0,'TEST00420KO',1516692698),(420,1,25,0,'TEST00421KO',1516692698),(421,1,25,0,'TEST00422KO',1516692698),(422,1,25,0,'TEST00423KO',1516692698),(423,1,25,0,'TEST00424KO',1516692698),(424,1,25,0,'TEST00425KO',1516692698),(425,1,25,0,'TEST00426KO',1516692698),(426,1,25,0,'TEST00427KO',1516692698),(427,1,25,0,'TEST00428KO',1516692698),(428,1,25,0,'TEST00429KO',1516692698),(429,1,25,0,'TEST00430KO',1516692698),(430,1,25,0,'TEST00431KO',1516692698),(431,1,25,0,'TEST00432KO',1516692698),(432,1,25,0,'TEST00433KO',1516692698),(433,1,25,0,'TEST00434KO',1516692698),(434,1,25,0,'TEST00435KO',1516692698),(435,1,25,0,'TEST00436KO',1516692698),(436,1,25,0,'TEST00437KO',1516692698),(437,1,25,0,'TEST00438KO',1516692698),(438,1,25,0,'TEST00439KO',1516692698),(439,1,25,0,'TEST00440KO',1516692698),(440,1,25,0,'TEST00441KO',1516692698),(441,1,25,0,'TEST00442KO',1516692698),(442,1,25,0,'TEST00443KO',1516692698),(443,1,25,0,'TEST00444KO',1516692698),(444,1,25,0,'TEST00445KO',1516692698),(445,1,25,0,'TEST00446KO',1516692698),(446,1,25,0,'TEST00447KO',1516692698),(447,1,25,0,'TEST00448KO',1516692698),(448,1,25,0,'TEST00449KO',1516692698),(449,1,25,0,'TEST00450KO',1516692698),(450,1,25,0,'TEST00451KO',1516692698),(451,1,25,0,'TEST00452KO',1516692698),(452,1,25,0,'TEST00453KO',1516692698),(453,1,25,0,'TEST00454KO',1516692698),(454,1,25,0,'TEST00455KO',1516692698),(455,1,25,0,'TEST00456KO',1516692698),(456,1,25,0,'TEST00457KO',1516692698),(457,1,25,0,'TEST00458KO',1516692698),(458,1,25,0,'TEST00459KO',1516692698),(459,1,25,0,'TEST00460KO',1516692698),(460,1,25,0,'TEST00461KO',1516692698),(461,1,25,0,'TEST00462KO',1516692698),(462,1,25,0,'TEST00463KO',1516692698),(463,1,25,0,'TEST00464KO',1516692698),(464,1,25,0,'TEST00465KO',1516692698),(465,1,25,0,'TEST00466KO',1516692698),(466,1,25,0,'TEST00467KO',1516692698),(467,1,25,0,'TEST00468KO',1516692698),(468,1,25,0,'TEST00469KO',1516692698),(469,1,25,0,'TEST00470KO',1516692698),(470,1,25,0,'TEST00471KO',1516692698),(471,1,25,0,'TEST00472KO',1516692698),(472,1,25,0,'TEST00473KO',1516692698),(473,1,25,0,'TEST00474KO',1516692698),(474,1,25,0,'TEST00475KO',1516692698),(475,1,25,0,'TEST00476KO',1516692698),(476,1,25,0,'TEST00477KO',1516692698),(477,1,25,0,'TEST00478KO',1516692698),(478,1,25,0,'TEST00479KO',1516692698),(479,1,25,0,'TEST00480KO',1516692698),(480,1,25,0,'TEST00481KO',1516692698),(481,1,25,0,'TEST00482KO',1516692698),(482,1,25,0,'TEST00483KO',1516692698),(483,1,25,0,'TEST00484KO',1516692698),(484,1,25,0,'TEST00485KO',1516692698),(485,1,25,0,'TEST00486KO',1516692698),(486,1,25,0,'TEST00487KO',1516692698),(487,1,25,0,'TEST00488KO',1516692698),(488,1,25,0,'TEST00489KO',1516692698),(489,1,25,0,'TEST00490KO',1516692698),(490,1,25,0,'TEST00491KO',1516692698),(491,1,25,0,'TEST00492KO',1516692698),(492,1,25,0,'TEST00493KO',1516692698),(493,1,25,0,'TEST00494KO',1516692698),(494,1,25,0,'TEST00495KO',1516692698),(495,1,25,0,'TEST00496KO',1516692698),(496,1,25,0,'TEST00497KO',1516692698),(497,1,25,0,'TEST00498KO',1516692698),(498,1,25,0,'TEST00499KO',1516692698),(499,1,25,0,'TEST00500KO',1516692698),(500,1,25,0,'TEST00501KO',1516692698),(501,1,25,0,'TEST00502KO',1516693025),(502,1,25,0,'TEST00503KO',1516693025),(503,1,25,0,'TEST00504KO',1516693025),(504,1,25,0,'TEST00505KO',1516693025),(505,1,25,0,'TEST00506KO',1516693025),(506,1,25,0,'TEST00507KO',1516693025),(507,1,25,0,'TEST00508KO',1516693025),(508,1,25,0,'TEST00509KO',1516693025),(509,1,25,0,'TEST00510KO',1516693025),(510,1,25,0,'TEST00511KO',1516693025),(511,1,25,0,'TEST00512KO',1516693025),(512,1,25,0,'TEST00513KO',1516693025),(513,1,25,0,'TEST00514KO',1516693025),(514,1,25,0,'TEST00515KO',1516693025),(515,1,25,0,'TEST00516KO',1516693025),(516,1,25,0,'TEST00517KO',1516693025),(517,1,25,0,'TEST00518KO',1516693025),(518,1,25,0,'TEST00519KO',1516693025),(519,1,25,0,'TEST00520KO',1516693025),(520,1,25,0,'TEST00521KO',1516693025),(521,1,25,0,'TEST00522KO',1516693025),(522,1,25,0,'TEST00523KO',1516693025),(523,1,25,0,'TEST00524KO',1516693025),(524,1,25,0,'TEST00525KO',1516693025),(525,1,25,0,'TEST00526KO',1516693025),(526,1,25,0,'TEST00527KO',1516693025),(527,1,25,0,'TEST00528KO',1516693025),(528,1,25,0,'TEST00529KO',1516693025),(529,1,25,0,'TEST00530KO',1516693025),(530,1,25,0,'TEST00531KO',1516693025),(531,1,25,0,'TEST00532KO',1516693025),(532,1,25,0,'TEST00533KO',1516693025),(533,1,25,0,'TEST00534KO',1516693025),(534,1,25,0,'TEST00535KO',1516693025),(535,1,25,0,'TEST00536KO',1516693025),(536,1,25,0,'TEST00537KO',1516693025),(537,1,25,0,'TEST00538KO',1516693025),(538,1,25,0,'TEST00539KO',1516693025),(539,1,25,0,'TEST00540KO',1516693025),(540,1,25,0,'TEST00541KO',1516693025),(541,1,25,0,'TEST00542KO',1516693025),(542,1,25,0,'TEST00543KO',1516693025),(543,1,25,0,'TEST00544KO',1516693025),(544,1,25,0,'TEST00545KO',1516693025),(545,1,25,0,'TEST00546KO',1516693025),(546,1,25,0,'TEST00547KO',1516693025),(547,1,25,0,'TEST00548KO',1516693025),(548,1,25,0,'TEST00549KO',1516693025),(549,1,25,0,'TEST00550KO',1516693025),(550,1,25,0,'TEST00551KO',1516693025),(551,1,25,0,'TEST00552KO',1516693025),(552,1,25,0,'TEST00553KO',1516693025),(553,1,25,0,'TEST00554KO',1516693025),(554,1,25,0,'TEST00555KO',1516693025),(555,1,25,0,'TEST00556KO',1516693025),(556,1,25,0,'TEST00557KO',1516693025),(557,1,25,0,'TEST00558KO',1516693025),(558,1,25,0,'TEST00559KO',1516693025),(559,1,25,0,'TEST00560KO',1516693025),(560,1,25,0,'TEST00561KO',1516693025),(561,1,25,0,'TEST00562KO',1516693025),(562,1,25,0,'TEST00563KO',1516693025),(563,1,25,0,'TEST00564KO',1516693025),(564,1,25,0,'TEST00565KO',1516693025),(565,1,25,0,'TEST00566KO',1516693025),(566,1,25,0,'TEST00567KO',1516693025),(567,1,25,0,'TEST00568KO',1516693025),(568,1,25,0,'TEST00569KO',1516693025),(569,1,25,0,'TEST00570KO',1516693025),(570,1,25,0,'TEST00571KO',1516693025),(571,1,25,0,'TEST00572KO',1516693025),(572,1,25,0,'TEST00573KO',1516693025),(573,1,25,0,'TEST00574KO',1516693025),(574,1,25,0,'TEST00575KO',1516693025),(575,1,25,0,'TEST00576KO',1516693025),(576,1,25,0,'TEST00577KO',1516693025),(577,1,25,0,'TEST00578KO',1516693025),(578,1,25,0,'TEST00579KO',1516693025),(579,1,25,0,'TEST00580KO',1516693025),(580,1,25,0,'TEST00581KO',1516693025),(581,1,25,0,'TEST00582KO',1516693025),(582,1,25,0,'TEST00583KO',1516693025),(583,1,25,0,'TEST00584KO',1516693025),(584,1,25,0,'TEST00585KO',1516693025),(585,1,25,0,'TEST00586KO',1516693025),(586,1,25,0,'TEST00587KO',1516693025),(587,1,25,0,'TEST00588KO',1516693025),(588,1,25,0,'TEST00589KO',1516693025),(589,1,25,0,'TEST00590KO',1516693025),(590,1,25,0,'TEST00591KO',1516693025),(591,1,25,0,'TEST00592KO',1516693025),(592,1,25,0,'TEST00593KO',1516693025),(593,1,25,0,'TEST00594KO',1516693025),(594,1,25,0,'TEST00595KO',1516693025),(595,1,25,0,'TEST00596KO',1516693025),(596,1,25,0,'TEST00597KO',1516693025),(597,1,25,0,'TEST00598KO',1516693025),(598,1,25,0,'TEST00599KO',1516693025),(599,1,25,0,'TEST00600KO',1516693025),(600,1,25,0,'TEST00601KO',1516693025),(601,1,25,0,'TEST00602KO',1516693025),(602,1,25,0,'TEST00603KO',1516693025),(603,1,25,0,'TEST00604KO',1516693025),(604,1,25,0,'TEST00605KO',1516693025),(605,1,25,0,'TEST00606KO',1516693025),(606,1,25,0,'TEST00607KO',1516693025),(607,1,25,0,'TEST00608KO',1516693025),(608,1,25,0,'TEST00609KO',1516693025),(609,1,25,0,'TEST00610KO',1516693025),(610,1,25,0,'TEST00611KO',1516693025),(611,1,25,0,'TEST00612KO',1516693025),(612,1,25,0,'TEST00613KO',1516693025),(613,1,25,0,'TEST00614KO',1516693025),(614,1,25,0,'TEST00615KO',1516693025),(615,1,25,0,'TEST00616KO',1516693025),(616,1,25,0,'TEST00617KO',1516693025),(617,1,25,0,'TEST00618KO',1516693025),(618,1,25,0,'TEST00619KO',1516693025),(619,1,25,0,'TEST00620KO',1516693025),(620,1,25,0,'TEST00621KO',1516693025),(621,1,25,0,'TEST00622KO',1516693025),(622,1,25,0,'TEST00623KO',1516693025),(623,1,25,0,'TEST00624KO',1516693025),(624,1,25,0,'TEST00625KO',1516693025),(625,1,25,0,'TEST00626KO',1516693025),(626,1,25,0,'TEST00627KO',1516693025),(627,1,25,0,'TEST00628KO',1516693025),(628,1,25,0,'TEST00629KO',1516693025),(629,1,25,0,'TEST00630KO',1516693025),(630,1,25,0,'TEST00631KO',1516693025),(631,1,25,0,'TEST00632KO',1516693025),(632,1,25,0,'TEST00633KO',1516693025),(633,1,25,0,'TEST00634KO',1516693025),(634,1,25,0,'TEST00635KO',1516693025),(635,1,25,0,'TEST00636KO',1516693025),(636,1,25,0,'TEST00637KO',1516693025),(637,1,25,0,'TEST00638KO',1516693025),(638,1,25,0,'TEST00639KO',1516693025),(639,1,25,0,'TEST00640KO',1516693025),(640,1,25,0,'TEST00641KO',1516693025),(641,1,25,0,'TEST00642KO',1516693025),(642,1,25,0,'TEST00643KO',1516693025),(643,1,25,0,'TEST00644KO',1516693025),(644,1,25,0,'TEST00645KO',1516693025),(645,1,25,0,'TEST00646KO',1516693025),(646,1,25,0,'TEST00647KO',1516693025),(647,1,25,0,'TEST00648KO',1516693025),(648,1,25,0,'TEST00649KO',1516693025),(649,1,25,0,'TEST00650KO',1516693025),(650,1,25,0,'TEST00651KO',1516693025),(651,1,25,0,'TEST00652KO',1516693025),(652,1,25,0,'TEST00653KO',1516693025),(653,1,25,0,'TEST00654KO',1516693025),(654,1,25,0,'TEST00655KO',1516693025),(655,1,25,0,'TEST00656KO',1516693025),(656,1,25,0,'TEST00657KO',1516693025),(657,1,25,0,'TEST00658KO',1516693025),(658,1,25,0,'TEST00659KO',1516693025),(659,1,25,0,'TEST00660KO',1516693025),(660,1,25,0,'TEST00661KO',1516693025),(661,1,25,0,'TEST00662KO',1516693025),(662,1,25,0,'TEST00663KO',1516693025),(663,1,25,0,'TEST00664KO',1516693025),(664,1,25,0,'TEST00665KO',1516693025),(665,1,25,0,'TEST00666KO',1516693025),(666,1,25,0,'TEST00667KO',1516693025),(667,1,25,0,'TEST00668KO',1516693025),(668,1,25,0,'TEST00669KO',1516693025),(669,1,25,0,'TEST00670KO',1516693025),(670,1,25,0,'TEST00671KO',1516693025),(671,1,25,0,'TEST00672KO',1516693025),(672,1,25,0,'TEST00673KO',1516693025),(673,1,25,0,'TEST00674KO',1516693025),(674,1,25,0,'TEST00675KO',1516693025),(675,1,25,0,'TEST00676KO',1516693025),(676,1,25,0,'TEST00677KO',1516693025),(677,1,25,0,'TEST00678KO',1516693025),(678,1,25,0,'TEST00679KO',1516693025),(679,1,25,0,'TEST00680KO',1516693025),(680,1,25,0,'TEST00681KO',1516693025),(681,1,25,0,'TEST00682KO',1516693025),(682,1,25,0,'TEST00683KO',1516693025),(683,1,25,0,'TEST00684KO',1516693025),(684,1,25,0,'TEST00685KO',1516693025),(685,1,25,0,'TEST00686KO',1516693025),(686,1,25,0,'TEST00687KO',1516693025),(687,1,25,0,'TEST00688KO',1516693025),(688,1,25,0,'TEST00689KO',1516693025),(689,1,25,0,'TEST00690KO',1516693025),(690,1,25,0,'TEST00691KO',1516693025),(691,1,25,0,'TEST00692KO',1516693025),(692,1,25,0,'TEST00693KO',1516693025),(693,1,25,0,'TEST00694KO',1516693025),(694,1,25,0,'TEST00695KO',1516693025),(695,1,25,0,'TEST00696KO',1516693025),(696,1,25,0,'TEST00697KO',1516693025),(697,1,25,0,'TEST00698KO',1516693025),(698,1,25,0,'TEST00699KO',1516693025),(699,1,25,0,'TEST00700KO',1516693025),(700,1,25,0,'TEST00701KO',1516693025),(701,1,25,0,'TEST00702KO',1516693025),(702,1,25,0,'TEST00703KO',1516693025),(703,1,25,0,'TEST00704KO',1516693025),(704,1,25,0,'TEST00705KO',1516693025),(705,1,25,0,'TEST00706KO',1516693025),(706,1,25,0,'TEST00707KO',1516693025),(707,1,25,0,'TEST00708KO',1516693025),(708,1,25,0,'TEST00709KO',1516693025),(709,1,25,0,'TEST00710KO',1516693025),(710,1,25,0,'TEST00711KO',1516693025),(711,1,25,0,'TEST00712KO',1516693025),(712,1,25,0,'TEST00713KO',1516693025),(713,1,25,0,'TEST00714KO',1516693025),(714,1,25,0,'TEST00715KO',1516693025),(715,1,25,0,'TEST00716KO',1516693025),(716,1,25,0,'TEST00717KO',1516693025),(717,1,25,0,'TEST00718KO',1516693025),(718,1,25,0,'TEST00719KO',1516693025),(719,1,25,0,'TEST00720KO',1516693025),(720,1,25,0,'TEST00721KO',1516693025),(721,1,25,0,'TEST00722KO',1516693025),(722,1,25,0,'TEST00723KO',1516693025),(723,1,25,0,'TEST00724KO',1516693025),(724,1,25,0,'TEST00725KO',1516693025),(725,1,25,0,'TEST00726KO',1516693025),(726,1,25,0,'TEST00727KO',1516693025),(727,1,25,0,'TEST00728KO',1516693025),(728,1,25,0,'TEST00729KO',1516693025),(729,1,25,0,'TEST00730KO',1516693025),(730,1,25,0,'TEST00731KO',1516693025),(731,1,25,0,'TEST00732KO',1516693025),(732,1,25,0,'TEST00733KO',1516693025),(733,1,25,0,'TEST00734KO',1516693025),(734,1,25,0,'TEST00735KO',1516693025),(735,1,25,0,'TEST00736KO',1516693025),(736,1,25,0,'TEST00737KO',1516693025),(737,1,25,0,'TEST00738KO',1516693025),(738,1,25,0,'TEST00739KO',1516693025),(739,1,25,0,'TEST00740KO',1516693025),(740,1,25,0,'TEST00741KO',1516693025),(741,1,25,0,'TEST00742KO',1516693025),(742,1,25,0,'TEST00743KO',1516693025),(743,1,25,0,'TEST00744KO',1516693025),(744,1,25,0,'TEST00745KO',1516693025),(745,1,25,0,'TEST00746KO',1516693025),(746,1,25,0,'TEST00747KO',1516693025),(747,1,25,0,'TEST00748KO',1516693025),(748,1,25,0,'TEST00749KO',1516693025),(749,1,25,0,'TEST00750KO',1516693025),(750,1,25,0,'TEST00751KO',1516693025),(751,1,25,0,'TEST00752KO',1516693025),(752,1,25,0,'TEST00753KO',1516693025),(753,1,25,0,'TEST00754KO',1516693025),(754,1,25,0,'TEST00755KO',1516693025),(755,1,25,0,'TEST00756KO',1516693025),(756,1,25,0,'TEST00757KO',1516693025),(757,1,25,0,'TEST00758KO',1516693025),(758,1,25,0,'TEST00759KO',1516693025),(759,1,25,0,'TEST00760KO',1516693025),(760,1,25,0,'TEST00761KO',1516693025),(761,1,25,0,'TEST00762KO',1516693025),(762,1,25,0,'TEST00763KO',1516693025),(763,1,25,0,'TEST00764KO',1516693025),(764,1,25,0,'TEST00765KO',1516693025),(765,1,25,0,'TEST00766KO',1516693025),(766,1,25,0,'TEST00767KO',1516693025),(767,1,25,0,'TEST00768KO',1516693025),(768,1,25,0,'TEST00769KO',1516693025),(769,1,25,0,'TEST00770KO',1516693025),(770,1,25,0,'TEST00771KO',1516693025),(771,1,25,0,'TEST00772KO',1516693025),(772,1,25,0,'TEST00773KO',1516693025),(773,1,25,0,'TEST00774KO',1516693025),(774,1,25,0,'TEST00775KO',1516693025),(775,1,25,0,'TEST00776KO',1516693025),(776,1,25,0,'TEST00777KO',1516693025),(777,1,25,0,'TEST00778KO',1516693025),(778,1,25,0,'TEST00779KO',1516693025),(779,1,25,0,'TEST00780KO',1516693025),(780,1,25,0,'TEST00781KO',1516693025),(781,1,25,0,'TEST00782KO',1516693025),(782,1,25,0,'TEST00783KO',1516693025),(783,1,25,0,'TEST00784KO',1516693025),(784,1,25,0,'TEST00785KO',1516693025),(785,1,25,0,'TEST00786KO',1516693025),(786,1,25,0,'TEST00787KO',1516693025),(787,1,25,0,'TEST00788KO',1516693025),(788,1,25,0,'TEST00789KO',1516693025),(789,1,25,0,'TEST00790KO',1516693025),(790,1,25,0,'TEST00791KO',1516693025),(791,1,25,0,'TEST00792KO',1516693025),(792,1,25,0,'TEST00793KO',1516693025),(793,1,25,0,'TEST00794KO',1516693025),(794,1,25,0,'TEST00795KO',1516693025),(795,1,25,0,'TEST00796KO',1516693025),(796,1,25,0,'TEST00797KO',1516693025),(797,1,25,0,'TEST00798KO',1516693025),(798,1,25,0,'TEST00799KO',1516693025),(799,1,25,0,'TEST00800KO',1516693025),(800,1,25,0,'TEST00801KO',1516693025),(801,1,25,0,'TEST00802KO',1516693025),(802,1,25,0,'TEST00803KO',1516693025),(803,1,25,0,'TEST00804KO',1516693025),(804,1,25,0,'TEST00805KO',1516693025),(805,1,25,0,'TEST00806KO',1516693025),(806,1,25,0,'TEST00807KO',1516693025),(807,1,25,0,'TEST00808KO',1516693025),(808,1,25,0,'TEST00809KO',1516693025),(809,1,25,0,'TEST00810KO',1516693025),(810,1,25,0,'TEST00811KO',1516693025),(811,1,25,0,'TEST00812KO',1516693025),(812,1,25,0,'TEST00813KO',1516693025),(813,1,25,0,'TEST00814KO',1516693025),(814,1,25,0,'TEST00815KO',1516693025),(815,1,25,0,'TEST00816KO',1516693025),(816,1,25,0,'TEST00817KO',1516693025),(817,1,25,0,'TEST00818KO',1516693025),(818,1,25,0,'TEST00819KO',1516693025),(819,1,25,0,'TEST00820KO',1516693025),(820,1,25,0,'TEST00821KO',1516693025),(821,1,25,0,'TEST00822KO',1516693025),(822,1,25,0,'TEST00823KO',1516693025),(823,1,25,0,'TEST00824KO',1516693025),(824,1,25,0,'TEST00825KO',1516693025),(825,1,25,0,'TEST00826KO',1516693025),(826,1,25,0,'TEST00827KO',1516693025),(827,1,25,0,'TEST00828KO',1516693025),(828,1,25,0,'TEST00829KO',1516693025),(829,1,25,0,'TEST00830KO',1516693025),(830,1,25,0,'TEST00831KO',1516693025),(831,1,25,0,'TEST00832KO',1516693025),(832,1,25,0,'TEST00833KO',1516693025),(833,1,25,0,'TEST00834KO',1516693025),(834,1,25,0,'TEST00835KO',1516693025),(835,1,25,0,'TEST00836KO',1516693025),(836,1,25,0,'TEST00837KO',1516693025),(837,1,25,0,'TEST00838KO',1516693025),(838,1,25,0,'TEST00839KO',1516693025),(839,1,25,0,'TEST00840KO',1516693025),(840,1,25,0,'TEST00841KO',1516693025),(841,1,25,0,'TEST00842KO',1516693025),(842,1,25,0,'TEST00843KO',1516693025),(843,1,25,0,'TEST00844KO',1516693025),(844,1,25,0,'TEST00845KO',1516693025),(845,1,25,0,'TEST00846KO',1516693025),(846,1,25,0,'TEST00847KO',1516693025),(847,1,25,0,'TEST00848KO',1516693025),(848,1,25,0,'TEST00849KO',1516693025),(849,1,25,0,'TEST00850KO',1516693025),(850,1,25,0,'TEST00851KO',1516693025),(851,1,25,0,'TEST00852KO',1516693025),(852,1,25,0,'TEST00853KO',1516693025),(853,1,25,0,'TEST00854KO',1516693025),(854,1,25,0,'TEST00855KO',1516693025),(855,1,25,0,'TEST00856KO',1516693025),(856,1,25,0,'TEST00857KO',1516693025),(857,1,25,0,'TEST00858KO',1516693025),(858,1,25,0,'TEST00859KO',1516693025),(859,1,25,0,'TEST00860KO',1516693025),(860,1,25,0,'TEST00861KO',1516693025),(861,1,25,0,'TEST00862KO',1516693025),(862,1,25,0,'TEST00863KO',1516693025),(863,1,25,0,'TEST00864KO',1516693025),(864,1,25,0,'TEST00865KO',1516693025),(865,1,25,0,'TEST00866KO',1516693025),(866,1,25,0,'TEST00867KO',1516693025),(867,1,25,0,'TEST00868KO',1516693025),(868,1,25,0,'TEST00869KO',1516693025),(869,1,25,0,'TEST00870KO',1516693025),(870,1,25,0,'TEST00871KO',1516693025),(871,1,25,0,'TEST00872KO',1516693025),(872,1,25,0,'TEST00873KO',1516693025),(873,1,25,0,'TEST00874KO',1516693025),(874,1,25,0,'TEST00875KO',1516693025),(875,1,25,0,'TEST00876KO',1516693025),(876,1,25,0,'TEST00877KO',1516693025),(877,1,25,0,'TEST00878KO',1516693025),(878,1,25,0,'TEST00879KO',1516693025),(879,1,25,0,'TEST00880KO',1516693025),(880,1,25,0,'TEST00881KO',1516693025),(881,1,25,0,'TEST00882KO',1516693025),(882,1,25,0,'TEST00883KO',1516693025),(883,1,25,0,'TEST00884KO',1516693025),(884,1,25,0,'TEST00885KO',1516693025),(885,1,25,0,'TEST00886KO',1516693025),(886,1,25,0,'TEST00887KO',1516693025),(887,1,25,0,'TEST00888KO',1516693025),(888,1,25,0,'TEST00889KO',1516693025),(889,1,25,0,'TEST00890KO',1516693025),(890,1,25,0,'TEST00891KO',1516693025),(891,1,25,0,'TEST00892KO',1516693025),(892,1,25,0,'TEST00893KO',1516693025),(893,1,25,0,'TEST00894KO',1516693025),(894,1,25,0,'TEST00895KO',1516693025),(895,1,25,0,'TEST00896KO',1516693025),(896,1,25,0,'TEST00897KO',1516693025),(897,1,25,0,'TEST00898KO',1516693025),(898,1,25,0,'TEST00899KO',1516693025),(899,1,25,0,'TEST00900KO',1516693025),(900,1,25,0,'TEST00901KO',1516693025),(901,1,25,0,'TEST00902KO',1516693025),(902,1,25,0,'TEST00903KO',1516693025),(903,1,25,0,'TEST00904KO',1516693025),(904,1,25,0,'TEST00905KO',1516693025),(905,1,25,0,'TEST00906KO',1516693025),(906,1,25,0,'TEST00907KO',1516693025),(907,1,25,0,'TEST00908KO',1516693025),(908,1,25,0,'TEST00909KO',1516693025),(909,1,25,0,'TEST00910KO',1516693025),(910,1,25,0,'TEST00911KO',1516693025),(911,1,25,0,'TEST00912KO',1516693025),(912,1,25,0,'TEST00913KO',1516693025),(913,1,25,0,'TEST00914KO',1516693025),(914,1,25,0,'TEST00915KO',1516693025),(915,1,25,0,'TEST00916KO',1516693025),(916,1,25,0,'TEST00917KO',1516693025),(917,1,25,0,'TEST00918KO',1516693025),(918,1,25,0,'TEST00919KO',1516693025),(919,1,25,0,'TEST00920KO',1516693025),(920,1,25,0,'TEST00921KO',1516693025),(921,1,25,0,'TEST00922KO',1516693025),(922,1,25,0,'TEST00923KO',1516693025),(923,1,25,0,'TEST00924KO',1516693025),(924,1,25,0,'TEST00925KO',1516693025),(925,1,25,0,'TEST00926KO',1516693025),(926,1,25,0,'TEST00927KO',1516693025),(927,1,25,0,'TEST00928KO',1516693025),(928,1,25,0,'TEST00929KO',1516693025),(929,1,25,0,'TEST00930KO',1516693025),(930,1,25,0,'TEST00931KO',1516693025),(931,1,25,0,'TEST00932KO',1516693025),(932,1,25,0,'TEST00933KO',1516693025),(933,1,25,0,'TEST00934KO',1516693025),(934,1,25,0,'TEST00935KO',1516693025),(935,1,25,0,'TEST00936KO',1516693025),(936,1,25,0,'TEST00937KO',1516693025),(937,1,25,0,'TEST00938KO',1516693025),(938,1,25,0,'TEST00939KO',1516693025),(939,1,25,0,'TEST00940KO',1516693025),(940,1,25,0,'TEST00941KO',1516693025),(941,1,25,0,'TEST00942KO',1516693025),(942,1,25,0,'TEST00943KO',1516693025),(943,1,25,0,'TEST00944KO',1516693025),(944,1,25,0,'TEST00945KO',1516693025),(945,1,25,0,'TEST00946KO',1516693025),(946,1,25,0,'TEST00947KO',1516693025),(947,1,25,0,'TEST00948KO',1516693025),(948,1,25,0,'TEST00949KO',1516693025),(949,1,25,0,'TEST00950KO',1516693025),(950,1,25,0,'TEST00951KO',1516693025),(951,1,25,0,'TEST00952KO',1516693025),(952,1,25,0,'TEST00953KO',1516693025),(953,1,25,0,'TEST00954KO',1516693025),(954,1,25,0,'TEST00955KO',1516693025),(955,1,25,0,'TEST00956KO',1516693025),(956,1,25,0,'TEST00957KO',1516693025),(957,1,25,0,'TEST00958KO',1516693025),(958,1,25,0,'TEST00959KO',1516693025),(959,1,25,0,'TEST00960KO',1516693025),(960,1,25,0,'TEST00961KO',1516693025),(961,1,25,0,'TEST00962KO',1516693025),(962,1,25,0,'TEST00963KO',1516693025),(963,1,25,0,'TEST00964KO',1516693025),(964,1,25,0,'TEST00965KO',1516693025),(965,1,25,0,'TEST00966KO',1516693025),(966,1,25,0,'TEST00967KO',1516693025),(967,1,25,0,'TEST00968KO',1516693025),(968,1,25,0,'TEST00969KO',1516693025),(969,1,25,0,'TEST00970KO',1516693025),(970,1,25,0,'TEST00971KO',1516693025),(971,1,25,0,'TEST00972KO',1516693025),(972,1,25,0,'TEST00973KO',1516693025),(973,1,25,0,'TEST00974KO',1516693025),(974,1,25,0,'TEST00975KO',1516693025),(975,1,25,0,'TEST00976KO',1516693025),(976,1,25,0,'TEST00977KO',1516693025),(977,1,25,0,'TEST00978KO',1516693025),(978,1,25,0,'TEST00979KO',1516693025),(979,1,25,0,'TEST00980KO',1516693025),(980,1,25,0,'TEST00981KO',1516693025),(981,1,25,0,'TEST00982KO',1516693025),(982,1,25,0,'TEST00983KO',1516693025),(983,1,25,0,'TEST00984KO',1516693025),(984,1,25,0,'TEST00985KO',1516693025),(985,1,25,0,'TEST00986KO',1516693025),(986,1,25,0,'TEST00987KO',1516693025),(987,1,25,0,'TEST00988KO',1516693025),(988,1,25,0,'TEST00989KO',1516693025),(989,1,25,0,'TEST00990KO',1516693025),(990,1,25,0,'TEST00991KO',1516693025),(991,1,25,0,'TEST00992KO',1516693025),(992,1,25,0,'TEST00993KO',1516693025),(993,1,25,0,'TEST00994KO',1516693025),(994,1,25,0,'TEST00995KO',1516693025),(995,1,25,0,'TEST00996KO',1516693025),(996,1,25,0,'TEST00997KO',1516693025),(997,1,25,0,'TEST00998KO',1516693025),(998,1,25,0,'TEST00999KO',1516693025),(999,1,25,0,'TEST01000KO',1516693025),(1000,1,25,0,'TEST01001KO',1516693025);

/*Table structure for table `dh_report_log` */

DROP TABLE IF EXISTS `dh_report_log`;

CREATE TABLE `dh_report_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1文章',
  `uid` int(11) DEFAULT '0' COMMENT '举报用户uid',
  `goods_id` int(10) unsigned DEFAULT '0' COMMENT 'id值',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  `ip` varchar(20) DEFAULT '127.0.0.1' COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='举报记录表';

/*Data for the table `dh_report_log` */

insert  into `dh_report_log`(`id`,`type`,`uid`,`goods_id`,`created`,`ip`) values (2,1,0,1,1506650373,'127.0.0.1');

/*Table structure for table `dh_score` */

DROP TABLE IF EXISTS `dh_score`;

CREATE TABLE `dh_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1店铺',
  `uid` int(11) DEFAULT '0' COMMENT '打分用户uid',
  `shop_uid` int(11) DEFAULT '0' COMMENT '店铺uid',
  `score` int(10) unsigned DEFAULT '0' COMMENT '打分',
  `created` int(10) unsigned DEFAULT '0' COMMENT '打分时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='打分';

/*Data for the table `dh_score` */

insert  into `dh_score`(`id`,`type`,`uid`,`shop_uid`,`score`,`created`) values (1,1,4,0,0,1506504617),(2,1,2,0,0,1506677745),(3,1,2,0,0,1506677941),(4,1,7,1,40,1510651612),(5,1,7,1,50,1510651860),(6,1,7,1,50,1511148993);

/*Table structure for table `dh_search_disable` */

DROP TABLE IF EXISTS `dh_search_disable`;

CREATE TABLE `dh_search_disable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1汽车',
  `value` varchar(200) NOT NULL COMMENT '禁用搜索内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 0关闭',
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='搜索禁用';

/*Data for the table `dh_search_disable` */

/*Table structure for table `dh_search_log` */

DROP TABLE IF EXISTS `dh_search_log`;

CREATE TABLE `dh_search_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1车型',
  `value` varchar(100) DEFAULT '' COMMENT '搜索内容',
  `uid` int(10) DEFAULT '0' COMMENT '用户uid',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  `hot` int(11) DEFAULT '1' COMMENT '搜索次数',
  PRIMARY KEY (`id`),
  KEY `keyword` (`value`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='搜索记录';

/*Data for the table `dh_search_log` */

insert  into `dh_search_log`(`id`,`type`,`value`,`uid`,`created`,`hot`) values (2,1,'奥迪',0,1505875793,2),(3,1,'大众',0,1505876306,5),(4,1,'大众',1,1505876338,2),(5,1,'html',0,1506590163,1),(6,1,'111',0,1506739702,3),(7,1,'四月工作室',0,1506740474,3),(8,1,'大众',2,1507529997,7),(9,1,'奥迪',2,1507530054,11),(10,1,'奥迪',7,1507874912,2),(11,1,'我去',2,1507882189,6),(12,1,'奔驰',2,1507882352,5),(13,1,'我说',2,1507882584,4),(14,1,'Dd',0,1510648696,2),(15,1,'啦啦啦',12,1510648698,1);

/*Table structure for table `dh_search_remmond` */

DROP TABLE IF EXISTS `dh_search_remmond`;

CREATE TABLE `dh_search_remmond` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `value` varchar(100) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `del_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `created` int(11) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='搜索推荐';

/*Data for the table `dh_search_remmond` */

insert  into `dh_search_remmond`(`id`,`type`,`value`,`status`,`del_status`,`sort`,`created`) values (3,1,'奥迪',1,0,0,1505886446),(4,1,'大众',1,0,0,1505888139);

/*Table structure for table `dh_shop_hot_log` */

DROP TABLE IF EXISTS `dh_shop_hot_log`;

CREATE TABLE `dh_shop_hot_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '店铺uid',
  `num` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '访问次数',
  `time` varchar(10) NOT NULL DEFAULT '' COMMENT '当日访问记录',
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `dh_shop_hot_log` */

insert  into `dh_shop_hot_log`(`id`,`uid`,`num`,`time`) values (20,7,1,'2017-10-18'),(19,1,8,'2017-10-17'),(18,4,1,'2017-10-16'),(17,7,1,'2017-10-13'),(16,1,10,'2017-10-13'),(15,2,5,'2017-10-13'),(14,4,1,'2017-10-13'),(13,3,9,'2017-10-13'),(12,3,1,'2017-10-12'),(11,1,1,'2017-10-11'),(21,3,2,'2017-10-18'),(22,1,3,'2017-10-23'),(23,4,1,'2017-10-27'),(24,1,2,'2017-10-31'),(25,1,81,'2017-11-01'),(26,3,3,'2017-11-01'),(27,1,4,'2017-11-02'),(28,3,9,'2017-11-14'),(29,12,6,'2017-11-14'),(30,7,3,'2017-11-14'),(31,1,7,'2017-11-14'),(32,3,1,'2017-11-15'),(33,7,8,'2017-11-16'),(34,12,2,'2017-11-16'),(35,2,8,'2017-11-16'),(36,3,4,'2017-11-16'),(37,1,5,'2017-11-16'),(38,3,23,'2017-11-20'),(39,1,6,'2017-11-20'),(40,8,2,'2017-11-20'),(41,2,1,'2017-11-20'),(42,1,1,'2017-11-21'),(43,4,1,'2017-11-21'),(44,3,1,'2017-11-21'),(45,3,24,'2017-11-22'),(46,1,19,'2017-11-22'),(47,2,1,'2017-11-22'),(48,7,2,'2017-11-22'),(49,1,3,'2017-11-23'),(50,2,1,'2017-11-24'),(51,1,1,'2017-11-24'),(52,4,3,'2017-11-28'),(53,3,13,'2017-11-28'),(54,3,1,'2017-12-01'),(55,3,13,'2017-12-05'),(56,7,3,'2017-12-05'),(57,1,8,'2017-12-05'),(58,2,1,'2017-12-05'),(59,8,4,'2017-12-05'),(60,8,1,'2017-12-07'),(61,3,12,'2017-12-07'),(62,7,4,'2017-12-07'),(63,2,3,'2017-12-07'),(64,1,2,'2017-12-07');

/*Table structure for table `dh_shop_notice` */

DROP TABLE IF EXISTS `dh_shop_notice`;

CREATE TABLE `dh_shop_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '店铺所属uid',
  `title` varchar(255) DEFAULT '' COMMENT '通知标题',
  `content` mediumtext COMMENT '通知内容',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='店铺通知';

/*Data for the table `dh_shop_notice` */

insert  into `dh_shop_notice`(`id`,`uid`,`title`,`content`,`created`) values (3,3,'哦哦','家里',1515205128);

/*Table structure for table `dh_sms_log` */

DROP TABLE IF EXISTS `dh_sms_log`;

CREATE TABLE `dh_sms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag` varchar(20) DEFAULT NULL COMMENT '标识符',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `ip` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `created` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`),
  KEY `created` (`created`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='短信发送记录';

/*Data for the table `dh_sms_log` */

insert  into `dh_sms_log`(`id`,`flag`,`mobile`,`content`,`ip`,`created`) values (1,'verification',NULL,'Code:15445','127.0.0.1',1508384351),(2,'verification','18725796416','Code:38273','127.0.0.1',1508755600),(3,'verification','18725796416','Code:48179','127.0.0.1',1508757424),(4,'verification','15923882847','[POCKET auto.ca] Verif Code:69620','127.0.0.1',1511323222),(5,'verification','18523563220','[POCKET auto.ca] Verif Code:54977','127.0.0.1',1511328888),(6,'verification','18523563220','[POCKET auto.ca] Verif Code:44674','127.0.0.1',1511329947),(7,'verification','18523563220','[POCKET auto.ca] Verif Code:64523','127.0.0.1',1511330652),(8,'verification','18523563220','[POCKET auto.ca] Verif Code:29983','127.0.0.1',1511331783),(9,'verification','18523563220','[POCKET auto.ca] Verif Code:32408','127.0.0.1',1511332482),(10,'verification','18523563220','[POCKET auto.ca] Verif Code:35080','127.0.0.1',1511332919),(11,'verification','13896568031','[POCKET auto.ca] Verif Code:70798','127.0.0.1',1511332952),(12,'verification','13896568031','[POCKET auto.ca] Verif Code:46449','127.0.0.1',1511333748),(13,'verification','17300289310','[POCKET auto.ca] Verif Code:66761','127.0.0.1',1511335827),(14,'verification','18725796416','[POCKET auto.ca] Verif Code:41330','127.0.0.1',1512436447);

/*Table structure for table `dh_sms_verify` */

DROP TABLE IF EXISTS `dh_sms_verify`;

CREATE TABLE `dh_sms_verify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` char(12) DEFAULT '0' COMMENT '手机号',
  `code` char(5) DEFAULT '0' COMMENT '值',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='短信验证码记录';

/*Data for the table `dh_sms_verify` */

/*Table structure for table `dh_sys_notice_rule` */

DROP TABLE IF EXISTS `dh_sys_notice_rule`;

CREATE TABLE `dh_sys_notice_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag` varchar(200) DEFAULT '' COMMENT '标识符',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `title_en` varchar(200) DEFAULT '' COMMENT '标题英文',
  `title_jp` varchar(200) DEFAULT '' COMMENT '标题日文',
  `content` varchar(500) DEFAULT '' COMMENT '内容中文',
  `content_en` varchar(500) DEFAULT '' COMMENT '内容英文',
  `content_jp` varchar(500) DEFAULT '' COMMENT '内容日文',
  `limit` varchar(500) DEFAULT '' COMMENT '限制规则',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 0关闭',
  PRIMARY KEY (`id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_sys_notice_rule` */

insert  into `dh_sys_notice_rule`(`id`,`flag`,`title`,`title_en`,`title_jp`,`content`,`content_en`,`content_jp`,`limit`,`status`) values (1,'user_register','注册成功','registration success','登録された','恭喜你成为会员','Congratulations on becoming a member','メンバーになることをお祝いします','',1),(2,'user_logistics_2','网点{$shop_name}已揽件','Network {$shop_name} has been the file','ネットワーク{$shop_name}がファイルになりました','运单号{$order_sn}已被网点揽收','Waybill number {$order_sn} has been received network outlets','送迎番号{$order_sn}がネットワークアウトレットに届いています','',1),(3,'user_logistics_3','包裹入库','Parcel storage','荷物の保管','运单号{$order_sn}包裹已入库','Waybill number {$order_sn} package has been stored','ウェイビル番号{$order_sn}パッケージが保存されています','',1),(4,'user_logistics_4','包裹出库','Parcel out of the library','図書館の小包','运单号{$order_sn}已经出库','Waybill number {$order_sn} has been out of the library','運送状番号{$order_sn}が図書館の外にありました','',1);

/*Table structure for table `dh_upload_log` */

DROP TABLE IF EXISTS `dh_upload_log`;

CREATE TABLE `dh_upload_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ext` varchar(10) DEFAULT '' COMMENT '后缀',
  `name` varchar(200) DEFAULT '' COMMENT '源文件名称',
  `size` int(10) unsigned DEFAULT '0' COMMENT '文件大小',
  `path` varchar(100) DEFAULT '' COMMENT '保存文件夹名称',
  `url` varchar(300) DEFAULT '' COMMENT '完整url地址',
  `created` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COMMENT='附件上传记录';

/*Data for the table `dh_upload_log` */

insert  into `dh_upload_log`(`id`,`ext`,`name`,`size`,`path`,`url`,`created`) values (20,'jpg','1512443190122.5668950.jpg',763073,'circle','1512443101648_20.jpeg',1512443100),(19,'mp4','1080P测试视频.mp4',394566,'test','1512008723316_19.mp4',1512008723),(18,'zip','002.zip',13386,'category','1512007690259_18.zip',1512007690),(17,'zip','002.zip',13386,'test','1511948364644_17.zip',1511948364),(16,'zip','002.zip',13386,'test','1511948358134_16.zip',1511948358),(15,'zip','002.zip',13386,'test','1511948337489_1.zip',1511948337),(21,'jpg','1512446205153.9768070.jpg',16794,'avatar','1512446115130_21.jpeg',1512446115),(22,'jpg','1512446236098.7919920.jpg',27404,'car','1512446146602_22.jpeg',1512446146),(23,'jpg','YYZSmm.jpg',49354,'code','1512531903278_23.jpeg',1512531903),(24,'jpg','YYZSmm.jpg',49354,'code','1512531983739_24.jpeg',1512531983),(25,'jpg','YYZSmm.jpg',49354,'code','1512531993487_25.jpeg',1512531993),(26,'jpg','YYZSmm.jpg',1043275,'code','1512532036896_26.jpeg',1512532036),(27,'jpg','1512615399161.8808590.jpg',1050168,'code','1512615308787_27.jpeg',1512615308),(28,'GIF','IMG_7490.GIF',15775860,'banner','1513048404151_28.f',1513048404),(29,'GIF','IMG_7490.GIF',15775860,'banner','1513049431419_29.gif',1513049431),(30,'GIF','IMG_7490.GIF',15775860,'banner','1513049553208_30.gif',1513049553),(31,'GIF','IMG_7490.GIF',15775860,'banner','1513049608179_31.gif',1513049608),(32,'GIF','IMG_7490.GIF',15775860,'banner','1513049629258_32.gif',1513049629),(33,'GIF','IMG_7490.GIF',15775860,'banner','1513049641160_33.gif',1513049641),(34,'GIF','IMG_7490.GIF',15775860,'banner','1513049704140_34.gif',1513049704),(35,'GIF','IMG_7490.GIF',15775860,'banner','1513049724378_35.gif',1513049724),(36,'GIF','IMG_7490.GIF',15775860,'banner','1513049730963_36.gif',1513049730),(37,'GIF','IMG_7490.GIF',15775860,'banner','1513049766175_37.gif',1513049766),(38,'GIF','IMG_7490.GIF',15775860,'banner','1513049785802_38.gif',1513049785),(39,'jpg','002.jpg',13484,'car','1513049845192_39.jpeg',1513049845),(40,'jpg','003.jpg',21107,'car','1513049845590_40.jpeg',1513049845),(41,'jpg','004.jpg',28334,'car','1513049845588_41.jpeg',1513049845),(42,'jpg','timg.jpg',8904,'car','1513049845480_42.jpeg',1513049845),(43,'jpg','恒鼎.jpg',6376,'car','1513049845206_43.jpeg',1513049845),(44,'jpg','002.jpg',13484,'car','1513049862697_44.jpeg',1513049862),(45,'jpg','003.jpg',21107,'car','1513049862740_45.jpeg',1513049862),(46,'jpg','timg.jpg',8904,'car','1513049862365_46.jpeg',1513049862),(47,'jpg','004.jpg',28334,'car','1513049862573_47.jpeg',1513049862),(48,'jpg','恒鼎.jpg',6376,'car','1513049862909_48.jpeg',1513049862),(49,'zip','002.zip',13386,'test','1513050024145_49.octet-stream',1513050024),(50,'zip','002.zip',13386,'test','1513050044875_50.octet-stream',1513050044),(51,'zip','002.zip',13386,'test','1513059101892_51.octet-stream',1513059101),(52,'zip','002.zip',13386,'test','1513059179297_52.octet-stream',1513059179),(53,'zip','002.zip',13386,'test','1513059196336_53.octet-stream',1513059196),(54,'zip','002.zip',13386,'test','1513059205748_54.octet-stream',1513059204),(55,'zip','002.zip',13386,'test','1513059241818_55.zip',1513059241),(56,'jpg','002.jpg',13484,'test','1513059337169_56.jpeg',1513059337),(57,'zip','002.zip',13386,'test','1513059375635_57.zip',1513059375),(58,'zip','002.zip',13386,'test','1513059448818_58.zip',1513059448),(59,'mp4','公司宣传片 [自定义](1).mp4',25884620,'article','1513146937393_59.mp4',1513146937),(60,'mp4','公司宣传片 [自定义](1).mp4',25884620,'article','1513146973805_60.mp4',1513146972),(61,'zip','002.zip',13386,'article','1513233927459_61.zip',1513233927),(62,'mp4','公司宣传片 [自定义](1).mp4',25884620,'article','1513233979614_62.mp4',1513233979),(63,'mp4','公司宣传片 [自定义](1).mp4',25884620,'article','1513234090605_63.mp4',1513234090),(64,'mp4','公司宣传片 [自定义].mp4',18054584,'article','1513234140110_64.mp4',1513234140),(65,'mp4','公司宣传片 [自定义].mp4',18054584,'article','1513234253171_65.mp4',1513234253),(66,'jpg','2051e68bd5fde99714e9cd653fa49c6c.jpg',12847,'circle','1513932994983_66.jpeg',1513932994),(67,'jpg','8a51b9f77a7b5960121d1c3d1f3084bb.jpg',25906,'code','1514254832767_67.jpeg',1514254832),(68,'jpg','1bb07d9104508b0907bc4bdaacfdd7ac.jpg',68630,'code','1514254832507_68.jpeg',1514254832),(69,'jpg','1bb07d9104508b0907bc4bdaacfdd7ac.jpg',68630,'code','1514254886463_69.jpeg',1514254886),(70,'jpg','1bb07d9104508b0907bc4bdaacfdd7ac.jpg',68630,'code','1514254886475_70.jpeg',1514254886),(71,'png',']O81ZOGX87]_~]ABKA24]E2.png',353786,'banner','1514257608915_71.png',1514257608),(72,'png',']O81ZOGX87]_~]ABKA24]E2.png',353786,'shop','1514257883980_72.png',1514257883),(73,'png',']O81ZOGX87]_~]ABKA24]E2.png',353786,'shop','1514264452431_73.png',1514264452),(74,'png','~N72A}@{WA1I1WVQBQEN1B9.png',429612,'shop','1514266616685_74.png',1514266616),(75,'png','~N72A}@{WA1I1WVQBQEN1B9.png',429612,'shop','1514266659122_75.png',1514266659),(76,'png','~N72A}@{WA1I1WVQBQEN1B9.png',429612,'shop','1514266739590_76.png',1514266739),(77,'jpg','be8b567f8527f27ff2ee9c80e3939abf.jpg',140232,'code','1514268621547_77.jpeg',1514268621),(78,'jpg','1bb07d9104508b0907bc4bdaacfdd7ac.jpg',68630,'code','1514268621328_78.jpeg',1514268621),(79,'jpg','be8b567f8527f27ff2ee9c80e3939abf.jpg',140232,'code','1514268925754_79.jpeg',1514268925),(80,'jpg','1bb07d9104508b0907bc4bdaacfdd7ac.jpg',68630,'code','1514268925979_80.jpeg',1514268925),(81,'jpg','2051e68bd5fde99714e9cd653fa49c6c.jpg',12847,'avatar','1514276750689_81.jpeg',1514276750),(82,'jpg','54414e0ea8e01b97b588fa3b39d87159.jpg',106773,'avatar','1514279742104_82.jpeg',1514279742),(83,'jpg','af022471d4cb06d657361fcc94a62017.jpg',98486,'feedBack','1514431623148_83.jpeg',1514431623),(84,'jpg','1bb07d9104508b0907bc4bdaacfdd7ac.jpg',68630,'feedBack','1514431623542_84.jpeg',1514431623),(85,'jpg','1514433264264.1599120.jpg',20971,'avatar','1514433164199_85.jpeg',1514433164),(86,'jpg','1514444296212.1921390.jpg',40743,'code','1514444196766_86.jpeg',1514444196),(87,'jpg','1514444296219.3898930.jpg',25798,'code','1514444196722_87.jpeg',1514444196),(88,'jpg','1514447120025.7438960.jpg',19019,'code','1514447020308_88.jpeg',1514447020),(89,'jpg','1514452017597.4509280.jpg',42123,'code','1514451918743_89.jpeg',1514451918),(90,'jpg','1514452017608.0629880.jpg',26283,'code','1514451918177_90.jpeg',1514451918),(91,'jpg','1514452357943.3200680.jpg',38677,'code','1514452258182_91.jpeg',1514452258),(92,'jpg','1514452357966.5229490.jpg',41342,'code','1514452258892_92.jpeg',1514452258),(93,'jpg','1514515759303.5200200.jpg',697783,'feedBack','1514515658672_93.jpeg',1514515658),(94,'jpg','1514515775261.8178710.jpg',697783,'feedBack','1514515675173_94.jpeg',1514515675),(95,'jpg','1514515775411.1479491.jpg',593726,'feedBack','1514515675977_95.jpeg',1514515675),(96,'jpg','1514515775552.9890142.jpg',491516,'feedBack','1514515675232_96.jpeg',1514515675),(97,'jpg','1514515791006.7199710.jpg',697783,'feedBack','1514515691950_97.jpeg',1514515691),(98,'jpg','1514515791160.1691891.jpg',593726,'feedBack','1514515691539_98.jpeg',1514515691),(99,'jpg','1514515791302.7829592.jpg',491516,'feedBack','1514515691915_99.jpeg',1514515691),(100,'jpg','af022471d4cb06d657361fcc94a62017.jpg',98486,'logistics','1514540268831_100.jpeg',1514540268),(101,'jpg','1514860420410.7299800.jpg',638243,'logistics','1514860317137_101.jpeg',1514860317),(102,'jpg','1514861061614.7580570.jpg',422966,'logistics','1514860958161_102.jpeg',1514860958),(103,'jpg','1514861241540.8229980.jpg',664813,'logistics','1514861138507_103.jpeg',1514861138),(104,'jpg','538dcfde7a39b0f1eba0b1a3bbc286ba.jpg',44046,'logistics','1514875617991_104.jpeg',1514875616),(105,'jpg','5da5ad3503e240624990f03b5667569e.jpg',16685,'logistics','1514875734756_105.jpeg',1514875734),(106,'jpg','5bf40bebff07d583b363d33048d56e9e.jpg',8371,'logistics','1514877328800_106.jpeg',1514877328),(107,'jpg','87c359c55be5f031b7ed3b85c5bf9518.jpg',13002,'logistics','1514883839158_107.jpeg',1514883839),(108,'jpg','b6070fd52f015ae1548b7802e43bc62f.jpg',27665,'logistics','1515062330527_108.jpeg',1515062330),(109,'jpg','1515114968289.7060550.jpg',542461,'logistics','1515114863626_109.jpeg',1515114863),(110,'jpg','1515139736459.1679690.jpg',46303,'shop','1515139632885_110.jpeg',1515139632),(111,'jpg','1515139736479.9851070.jpg',25062,'avatar','1515139632895_111.jpeg',1515139632),(112,'jpg','1515139786241.4838870.jpg',46303,'shop','1515139682838_112.jpeg',1515139681),(113,'jpg','1515139786259.4599610.jpg',25062,'avatar','1515139682545_113.jpeg',1515139681),(114,'jpg','1515139851533.4248050.jpg',36591,'shop','1515139747391_114.jpeg',1515139747),(115,'jpg','1515139851549.1389161.jpg',48926,'shop','1515139747874_115.jpeg',1515139747),(116,'jpg','1515139869885.7341310.jpg',36591,'shop','1515139765945_116.jpeg',1515139765),(117,'jpg','1515139869907.0190431.jpg',48926,'shop','1515139765884_117.jpeg',1515139765),(118,'jpg','1515139900539.7709960.jpg',36591,'shop','1515139796427_118.jpeg',1515139796),(119,'jpg','1515139900561.1359861.jpg',48926,'shop','1515139796215_119.jpeg',1515139796),(120,'jpg','1515140011325.0041500.jpg',50800,'shop','1515139907367_120.jpeg',1515139906),(121,'jpg','1515140164626.1689450.jpg',50800,'shop','1515140060409_121.jpeg',1515140060),(122,'jpg','1515140286859.2229000.jpg',42537,'shop','1515140182291_122.jpeg',1515140182),(123,'jpg','1515140386592.5231930.jpg',42546,'shop','1515140282173_123.jpeg',1515140282),(124,'jpg','1515140386565.3049320.jpg',56187,'shop','1515140282128_124.jpeg',1515140282),(125,'jpg','1515141145994.5200200.jpg',42554,'shop','1515141041142_125.jpeg',1515141041),(126,'jpg','1515228124917.7629390.jpg',596305,'code','1515228020420_126.jpeg',1515228020),(127,'jpg','1515228125064.9760740.jpg',560764,'code','1515228020975_127.jpeg',1515228020),(128,'jpg','1515229929057.7548830.jpg',645759,'logistics','1515229824412_128.jpeg',1515229824),(129,'jpg','1515230416348.5041500.jpg',502503,'logistics','1515230312850_129.jpeg',1515230311),(130,'jpg','1515230437074.6289060.jpg',553370,'logistics','1515230332934_130.jpeg',1515230332),(131,'jpg','1515230451089.8139650.jpg',618069,'logistics','1515230346654_131.jpeg',1515230346),(132,'jpg','1515230460508.3198240.jpg',539486,'logistics','1515230356278_132.jpeg',1515230355),(133,'jpg','1515230473617.2849120.jpg',474174,'logistics','1515230369403_133.jpeg',1515230369),(134,'jpg','1515377748719.9758300.jpg',670412,'fastgo','1515377646275_134.jpeg',1515377645),(135,'jpg','1515395506705.8701170.jpg',42551,'shop','1515395400313_135.jpeg',1515395400),(136,'jpg','1515461119166.7629390.jpg',597146,'logistics','1515461012903_136.jpeg',1515461012),(137,'jpg','1515461238846.7409670.jpg',431289,'logistics','1515461132927_137.jpeg',1515461132),(138,'jpg','1515463893065.9331050.jpg',501469,'logistics','1515463786918_138.jpeg',1515463786),(139,'jpg','1515467048142.7141110.jpg',506348,'logistics','1515466942171_139.jpeg',1515466942),(140,'jpg','1515467489100.3408200.jpg',398211,'logistics','1515467382228_140.jpeg',1515467382),(141,'jpg','1515468360275.2900390.jpg',457471,'logistics','1515468254598_141.jpeg',1515468254),(142,'jpg','1515468367706.4938960.jpg',580466,'logistics','1515468261581_142.jpeg',1515468261),(143,'jpg','790a937497c1bff0e1cb61a9085cfc0f.jpg',54707,'shop','1515469749799_143.jpeg',1515469749),(144,'jpg','130ead9573f8b6e64092f67c3965fa69.jpg',54876,'shop','1515469749244_144.jpeg',1515469749),(145,'jpg','0acd690d559c497fe809b46a1dc678d8.jpg',33041,'shop','1515469749114_145.jpeg',1515469749),(146,'jpg','5670e71ffedc3a53f4d9d56d5aca352a.jpg',24704,'shop','1515478411390_146.jpeg',1515478411),(147,'jpg','39ebd9c44153762636599ec8ad4a354a.jpg',38708,'shop','1515478504653_147.jpeg',1515478504),(148,'jpg','315145cb6ffb4fc5761016043ff5027e.jpg',17812,'shop','1515478674191_148.jpeg',1515478674),(149,'jpg','0acd690d559c497fe809b46a1dc678d8.jpg',33041,'shop','1515478783166_149.jpeg',1515478783),(150,'jpg','e592248c0206b322d2e7d38901ca4481.jpg',38783,'code','1515484391409_150.jpeg',1515484391),(151,'jpg','410a7de0eb34dfbf301666db9353f662.jpg',18161,'code','1515484391427_151.jpeg',1515484391),(152,'jpg','9fe16985ef8f613e00c109d1a6ecba0f.jpg',41053,'logistics','1515484423998_152.jpeg',1515484423),(153,'jpg','39ebd9c44153762636599ec8ad4a354a.jpg',38708,'logistics','1515488918169_153.jpeg',1515488918),(154,'jpg','15b98b2c9c8eaf029063f95c0b683152.jpg',27742,'logistics','1515490564429_154.jpeg',1515490564),(155,'jpg','1515822064975.0781250.jpg',541998,'code','1515821956182_155.jpeg',1515821956),(156,'jpg','1515822065133.9541020.jpg',556846,'code','1515821956647_156.jpeg',1515821956),(157,'jpg','1515822590248.7412110.jpg',501488,'logistics','1515822481142_157.jpeg',1515822481),(158,'jpg','1515827816929.7519530.jpg',24014,'avatar','1515827708591_158.jpeg',1515827708),(159,'jpg','5da5ad3503e240624990f03b5667569e.jpg',16685,'logistics','1516240941472_159.jpeg',1516240940),(160,'jpg','1516328751687.0378420.jpg',568950,'logistics','1516328641176_160.jpeg',1516328641),(161,'jpg','1516331098012.9360350.jpg',611031,'code','1516330987702_161.jpeg',1516330987),(162,'jpg','1516331098164.7182620.jpg',537559,'code','1516330987818_162.jpeg',1516330987),(163,'jpg','001.jpg',47485,'article','1516345250242_163.jpeg',1516345250),(164,'jpg','1516610665347.9980470.jpg',534298,'code','1516610553862_164.jpeg',1516610553),(165,'jpg','1516610665498.2968750.jpg',503965,'code','1516610553757_165.jpeg',1516610553),(166,'jpg','1516610755226.7270510.jpg',369929,'logistics','1516610642935_166.jpeg',1516610642),(167,'jpg','1516612318772.2680660.jpg',473017,'logistics','1516612206100_167.jpeg',1516612206),(168,'jpg','831df3d45c17375fa7374a6d8ce4f872.jpg',24307,'logistics','1516674883556_168.jpeg',1516674880),(169,'jpg','831df3d45c17375fa7374a6d8ce4f872.jpg',24307,'logistics','1516676410866_169.jpeg',1516676410),(170,'jpg','831df3d45c17375fa7374a6d8ce4f872.jpg',24307,'logistics','1516700057398_170.jpeg',1516700057),(171,'jpg','1516765139744.5900880.jpg',569407,'code','1516765026627_171.jpeg',1516765026),(172,'jpg','1516765139903.4572750.jpg',455946,'code','1516765026635_172.jpeg',1516765026);

/*Table structure for table `dh_user` */

DROP TABLE IF EXISTS `dh_user`;

CREATE TABLE `dh_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家 3揽货 4仓库管理员',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `user_sn` char(100) DEFAULT '' COMMENT '用户编码',
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `avatar` varchar(60) DEFAULT 'default.png' COMMENT '头像地址',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `mail` varchar(50) DEFAULT '' COMMENT '邮箱',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `address` varchar(300) DEFAULT '' COMMENT '家庭地址',
  `salt` char(5) DEFAULT '' COMMENT '随机码',
  `token` char(32) DEFAULT '' COMMENT 'token值',
  `time_out` int(10) unsigned DEFAULT '0' COMMENT 'token到期时间',
  `ip` varchar(18) DEFAULT '' COMMENT '注册ip',
  `integral` int(10) unsigned DEFAULT '0' COMMENT '积分',
  `experience` int(11) DEFAULT '0' COMMENT '经验值',
  `country` int(10) DEFAULT '35' COMMENT '国家ID 默认中国',
  `province` int(11) DEFAULT '0' COMMENT '省份ID',
  `city` int(11) DEFAULT '0' COMMENT '城市ID',
  `area` int(11) DEFAULT '0' COMMENT '地区ID',
  `sex` int(10) DEFAULT '576' COMMENT '性别ID 默认男',
  `moeny` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '用户余额',
  `moeny_aud` decimal(18,2) unsigned DEFAULT '0.00' COMMENT '用户澳币余额',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 2禁用',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `login_ip` char(18) DEFAULT '' COMMENT '最近一次登录ip',
  `login_time` int(10) unsigned DEFAULT '0' COMMENT '最近一次登录时间',
  `created` int(11) unsigned DEFAULT '0' COMMENT '注册时间',
  `is_bind_mail` tinyint(1) DEFAULT '0' COMMENT '邮箱绑定 1绑定 0未绑定',
  `is_message` tinyint(1) DEFAULT '1' COMMENT '锁屏新消息是否开启 1开启 0不开启',
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  `imei` varchar(300) DEFAULT '' COMMENT '设备编码',
  `default_transfer` varchar(50) DEFAULT NULL COMMENT '默认中转编号',
  `cid` varchar(20) DEFAULT '0' COMMENT '所属处理中心编号',
  `api_secret` varchar(500) DEFAULT '' COMMENT '用户API密钥',
  `is_auto_moeny` tinyint(1) DEFAULT '0' COMMENT '余额自动抵扣 1自动 0不自动',
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `username` (`username`),
  KEY `mail` (`mail`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user` */

insert  into `dh_user`(`id`,`type`,`uid`,`user_sn`,`username`,`nickname`,`real_name`,`avatar`,`mobile`,`mail`,`password`,`address`,`salt`,`token`,`time_out`,`ip`,`integral`,`experience`,`country`,`province`,`city`,`area`,`sex`,`moeny`,`moeny_aud`,`status`,`del_status`,`login_ip`,`login_time`,`created`,`is_bind_mail`,`is_message`,`version`,`imei`,`default_transfer`,`cid`,`api_secret`,`is_auto_moeny`) values (1,2,1,'','cheng6251','','四月','1515139682545_113.jpeg','13425778542','','8716773dd45d75071f72af288df92cbc','','26979','78d454d1c8592cf3a4f95820b6b38ac8',1517555642,'127.0.0.1',3090,0,35,0,0,0,576,'5.00','10.00',1,0,'127.0.0.1',1515827642,1505292648,0,1,0,'DDCCC68DA79A441D8E1F951AE40AFAA8','0','BNE1000','',0),(2,1,2,'','weixuelin','魏雪','','1514279742104_82.jpeg','18523563220','641072257@qq.com','8bd0f5ab11bb757fdbefb7d8194f8c55','','21749','4bfcc8f2bc5c56692aa672ada39406ba',1518426465,'127.0.0.1',96340,0,35,0,0,0,577,'500.00','50.00',1,0,'127.0.0.1',1516698465,1505293289,1,0,0,'3d19d2171c92b029','0','0','',1),(3,2,3,'','kuangxin','kuangxin','四月2','150631954346095.jpeg','13896568031','','01bafc44de12208bb48680dca2ea4c16','','12532','3e111f45e5d16aa6a56ca47027977e7e',1518402653,'127.0.0.1',100220,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516674652,1505368006,0,1,0,'3d19d2171c92b029','0','BNE1000','',0),(4,3,4,'','lsd0101','四月个人用户','揽货员','b68334b285d00235e85ef3950af64902.jpeg','15923882848','','8716773dd45d75071f72af288df92cbc','','26979','17e08a2ab93cd2de6a40d27322feaa32',1518424300,'127.0.0.1',92030,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516696298,1506063155,0,1,0,'89b95b112415113e','0','BNE1000','',0),(5,4,5,'','lsd01','123456','仓库管理员','default.png','15923882847','','8716773dd45d75071f72af288df92cbc','','26979','6e7b4f53bc8ec2e5f3ac306aaee6b363',1518424662,'127.0.0.1',100000,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516696660,1506395554,0,1,0,'','0','BNE1000','',0),(6,1,6,'','1234567','1234567','','default.png','15923882847','','de7a8d21b859e33d6fbee46781a4e08d','','50621','',0,'127.0.0.1',100000,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1506395715,0,1,0,'','0','0','',0),(7,1,7,'','17300289310','17300289310','张妮莎','38f93e0fa73c6611748b77395171054b.jpeg','17300289310','','f06e72440b2e292521da336f02a48ff4','','26979','9de1b66a80b4028d7c113d477063b5d8',1511514047,'127.0.0.1',3060,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1511335892,1507874410,0,1,0,'1a7afa9face43399','0','0','',0),(8,2,8,'','17300289310','17300289310','sasa','1512446115130_21.jpeg','17300289310','','737b15b43038cfb42518a58e374d0e48','','41893','3b3d89f4b395a1b2d0c0cb783740ee52',1512635002,'127.0.0.1',130,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1512459677,1507879382,0,1,0,'6BA8402370784AEB846E72D3FADB558C','0','BNE1000','',0),(9,3,9,'','lsd0102','aaaa','张三','default.png','15923882849','','91f0d0a199ecfcfe871da82021a1740c','','71111','',0,'127.0.0.1',100,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1508130313,0,1,0,'','0','BNE1000','',0),(10,1,10,'','cheng6251','四月程序开发','四月学生','74c418dca7b80a5334c8a83cdce0c710.jpeg','15923882847','350375092@qq.com','2ebe69b2efe2b1886817cff244fe23dd','这里是家庭地址显示信息','92683','d3c862f3eec6e5403314a890401ae75a',1516930839,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516758039,1510108380,0,1,0,'DDCCC68DA79A441D8E1F951AE40AFAA8','0','0','',0),(11,1,11,'','cheng62511','cheng62511','','default.png','15923882847','12345','def745d7c9e2bd66dc312cd4ca47dd61','','34235','',0,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1510111463,0,1,0,'','0','0','',0),(12,1,12,'','Ce shi@qq.bvc','Ce shi@qq.bvc','','151064961335946.jpeg','18696784295','','37adb45d9a61beca41b3d931c1eb3ec4','','70327','140fb730442712b0fb2d6edb99166848',1510822487,'14.111.53.175',80,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1510646668,1510547361,0,1,0,'ADAB602A37C145D5976C69E196F03CFD','0','0','',0),(13,1,13,'','aaa','aaa','','default.png','15923882846','350375092@qq.com','155be0fcabfc9117c654fdfb53840368','','51500','',0,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1510734649,0,1,0,'','0','0','',0),(14,1,14,'','abcaaaa','abcaaaa','','default.png','159222222','981622394@qq.com','549ad49ea9bef745a6f68f31b7d1efa4','','61970','',0,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1511416067,0,1,0,'','0','0','',0),(16,1,16,'','测试','测试','','default.png','15215051909','','b1b5fe199cb168e7c74fa4cff227fb32','','51616','',0,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1511428543,0,1,0,'','0','0','',0),(17,1,17,'','12','12','33','default.png','111','','a6505e3634d2c4b9eed13b1206a30846','','80405','',0,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1512101040,0,1,0,'','0','0','',0),(18,1,18,'','18725796410','18725796410','','1514433164199_85.jpeg','18725796410','','448ed07380a45ab6d4c39b9a3b5fe040','','67016','10ece767cbb687a3615e937583f86a8a',1518160228,'127.0.0.1',480,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516432227,1512439193,0,1,0,'DDCCC68DA79A441D8E1F951AE40AFAA8','0','0','',0),(21,2,21,'','苏泊尔旗舰店','苏泊尔旗舰店','','default.png','15215051908','','34731959636b0571466fe7f2d209fc26','','36575','dea26dbc84d80080561785a9090b9da6',1515119166,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1514283673,1514264462,0,1,0,'','1','BNE1000','',0),(22,1,22,'','15182971261','15182971261','','default.png','15182971261','','5d70518adbd5796962ef67a3bd9934bc','','10579','00910198fa49191536be7d1de2f90370',1518055982,'127.0.0.1',300,0,0,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1514888541,1514269561,0,1,0,'ba53b0cc742434b9','0','0','',0),(23,2,123456,'','12345','12345','','default.png','','','647c8d4d78692d2396a85a67a56632ad','','65129','',0,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1514881390,0,1,0,'','0','BNE1000','',0),(24,4,24,'FG01','test20','test20','测试仓库管理员','default.png','','','47cbdbc2375cff80ed8a583c9092bf66','','36594','209dbe039a8419382b758fd476eed422',1518514063,'180.112.174.112',300,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516786061,1516261226,0,1,0,'','0','FG01','M0IwRTUyNjAtQkVFNS00MTJBLTk2RjYtNTBDQjhFMERGNjgwLDI3NEM3QTg0LTVBQzctNEU2NS1BQjkxLTY1NTU1NDcwMTNGOA==',0),(25,2,25,'BNE0005','test21','test21','测试网点操作员','default.png','','','a4142cf2659989fa52ab92507a6c773a','','21996','',0,'180.112.174.112',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1516261233,0,1,0,'','0','FG01','QzU3MkI0OTUtQkZGNS00NEYyLTg5MEQtMEQ1NERBRjg1RUQzLEMyQjQ5NDNFLUFBMzEtNDcyMy1CNzE5LUU4QUFDNjJGNzk1NA==',0),(26,2,26,'BNE0001','test22','test22','测试网点操作员(普通用户)','default.png','','','5f85f4bce1392c843cae99ffa246016f','','79489','b1cd28aa9f8b23a76544e0b18eecf915',1518404444,'180.112.174.112',300,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516676444,1516261676,0,1,0,'3d19d2171c92b029','0','FG01','Qjc1OEU2N0MtRjc0MC00Nzk0LTk5NzMtNTQ4OTBFM0YxRTA3LENBRDg3NDJFLUMzRDEtNDYxNC05QTI5LTVBRjlCMkFGOEM3OA==',0),(27,1,27,'','用户名','用户名','','default.png','18725796416','','af14d25df56ab56849569ef82261dc07','','93405','eef1a8d006e1b266464695d0fe68d88c',1518404251,'127.0.0.1',300,0,35,0,0,0,576,'0.00','0.00',1,0,'127.0.0.1',1516676251,1516437621,0,1,0,'DDCCC68DA79A441D8E1F951AE40AFAA8',NULL,'0','',1),(29,3,24,'FG01','test23','test23','网点揽货员','default.png','','','47cbdbc2375cff80ed8a583c9092bf66','','36594','',0,'180.112.174.112',300,0,35,0,0,0,576,'0.00','0.00',1,0,'',0,1516261226,0,1,0,'','0','FG01','M0IwRTUyNjAtQkVFNS00MTJBLTk2RjYtNTBDQjhFMERGNjgwLDI3NEM3QTg0LTVBQzctNEU2NS1BQjkxLTY1NTU1NDcwMTNGOA==',0);

/*Table structure for table `dh_user_address` */

DROP TABLE IF EXISTS `dh_user_address`;

CREATE TABLE `dh_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '1本地直邮 2国际转运',
  `sign` tinyint(1) DEFAULT '1' COMMENT '1收件人 2发件人',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `name` varchar(50) DEFAULT '' COMMENT '姓名',
  `mobile` varchar(20) DEFAULT '' COMMENT '电话',
  `address` varchar(255) DEFAULT '' COMMENT '详细地址',
  `country` varchar(20) DEFAULT '' COMMENT '国家',
  `province` varchar(50) DEFAULT '' COMMENT '省份',
  `city` varchar(50) DEFAULT '' COMMENT '城市',
  `area` varchar(50) DEFAULT '' COMMENT '地区',
  `zip_code` varchar(20) DEFAULT '' COMMENT '邮编',
  `code` varchar(25) DEFAULT '' COMMENT '身份证号',
  `back_code` varchar(255) DEFAULT '' COMMENT '身份证背面图片',
  `positive_code` varchar(255) DEFAULT '' COMMENT '身份证证明图片',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认 1默认 0不默认',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_user_address` */

insert  into `dh_user_address`(`id`,`type`,`sign`,`uid`,`name`,`mobile`,`address`,`country`,`province`,`city`,`area`,`zip_code`,`code`,`back_code`,`positive_code`,`is_default`,`created`) values (1,1,1,2,'伯贤','18223563220','光华大道56号','','四川省','攀枝花市','','569555','569853575688456686','1514268925754_79.jpeg','1514268925979_80.jpeg',1,1514190330),(2,1,1,2,'收件人','18223563220','光华大道56号','','四川省','攀枝花市','','569555','569853575688456686','','',0,1514190331),(3,2,1,2,'boxian','185235635558','address/jjjjjj','Timor-Leste','Shanghai City','Baoshan District','','568838','568534763253','1514268925754_79.jpeg','1514268925979_80.jpeg',0,1514254832),(4,2,2,2,'suho','18654895258','hushan','Uzbekistan','Inner Mongolia','Wulanchabu City','','568423','56843675334128','1514254886463_69.jpeg','1514254886475_70.jpeg',1,1514254886),(5,1,1,18,'彭1','18725796416','111111.里','','天津市','东丽区','','40000','500789456308031851','1514444196766_86.jpeg','1514444196722_87.jpeg',1,1514444196),(8,1,2,18,'张1','18756493652','哦婆婆 Mr','','云南省','丽江市','','','67686686868555','','',1,1514449982),(7,1,1,18,'彭3','157973495685','MSN婆婆','','云南省','丽江市','','','','1514447020308_88.jpeg','',0,1514447020),(9,2,1,18,'Hdjd','273783394','Hdjdkjf|JFK','Hdjdj','June','Jdjdjjf','','63876','673874849hh','1514452258182_91.jpeg','1514452258892_92.jpeg',1,1514452258),(10,1,1,1,'彭小小','15874256985','口咯哦想我哦','','重庆市','巴南区','','40000','500258963258965985','1515228020420_126.jpeg','1515228020975_127.jpeg',1,1515228020),(11,1,1,3,'世勋','1869568889','观花花园酒店管理','','北京市','朝阳区','','186656','468568563585365875688','1515484391409_150.jpeg','1515484391427_151.jpeg',1,1515482900),(12,1,1,3,'SUHO','186548655','大草原','','云南省','丽江市','','569526','69826024695231586','','',0,1515484326),(13,1,1,10,'Penri','7276393844','Jxudjididi','','天津市','东丽区','','38763','638364277496373618','1515821956182_155.jpeg','1515821956647_156.jpeg',1,1515821956),(14,1,1,26,'Huh','14635777','Hivggyjk','','北京市','丰台区','','45757','347827658994','1516330987702_161.jpeg','1516330987818_162.jpeg',0,1516330987),(15,1,1,27,'彭光见','18725796416','1233456','','重庆市','九龙坡区','','40000','500234199206031851','1516610553862_164.jpeg','1516610553757_165.jpeg',1,1516610553),(16,2,1,27,'22666','1585598566','556986','Indonesia','2685','2666','','33666','528455856955685574','1516765026627_171.jpeg','1516765026635_172.jpeg',1,1516765026);

/*Table structure for table `dh_user_classroom_log` */

DROP TABLE IF EXISTS `dh_user_classroom_log`;

CREATE TABLE `dh_user_classroom_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '类型 1老师 2学生',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户uid',
  `goods_id` int(10) unsigned DEFAULT NULL COMMENT '课程编号',
  `course_id` int(10) unsigned DEFAULT NULL COMMENT '课程id',
  `created` int(10) unsigned DEFAULT NULL COMMENT '进入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`,`goods_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_user_classroom_log` */

/*Table structure for table `dh_user_course_log` */

DROP TABLE IF EXISTS `dh_user_course_log`;

CREATE TABLE `dh_user_course_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sign` tinyint(1) DEFAULT '1' COMMENT '类型 1对一 2对多',
  `order_sn` char(18) DEFAULT '0' COMMENT '订单编号',
  `goods_id` int(10) DEFAULT '0' COMMENT '课程id',
  `teacher_uid` int(10) unsigned DEFAULT '0' COMMENT '老师uid',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '学生uid',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '结束时间',
  `end_time` int(10) unsigned DEFAULT '0' COMMENT '开始时间',
  `lesson` int(10) unsigned DEFAULT '0' COMMENT '课时',
  `credit` int(10) unsigned DEFAULT '0' COMMENT '学分',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '预约状态 0预约中 1老师同意 2修改时间 3老师拒绝 4学生拒绝',
  `user_msg` varchar(300) DEFAULT '' COMMENT '学生留言内容',
  `teacher_msg` varchar(300) DEFAULT '' COMMENT '老师留言内容',
  `mobile` varchar(30) DEFAULT '' COMMENT '联系方式',
  `user_agree` tinyint(1) DEFAULT '0' COMMENT '学生同意状态 0无 1同意 2拒绝',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户课程记录';

/*Data for the table `dh_user_course_log` */

insert  into `dh_user_course_log`(`id`,`sign`,`order_sn`,`goods_id`,`teacher_uid`,`uid`,`start_time`,`end_time`,`lesson`,`credit`,`status`,`user_msg`,`teacher_msg`,`mobile`,`user_agree`) values (1,1,'173139653541562130',47,8,10,1511342760,1511353560,0,0,1,'','','',0),(2,1,'173139653541562130',47,8,10,1510824360,1510831560,0,0,1,'','','',0),(3,1,'173139653541562130',47,8,10,1510588800,1510651560,0,0,1,'','','',0),(4,1,'173139653541562130',47,8,10,1510910760,1510918080,0,0,1,'','','',0),(6,1,'173175139456615895',47,8,10,1510880400,1510882200,0,0,1,'hhhh','这里是老师回复内容','1111',0),(7,1,'173175139456615895',47,8,10,1432083600,1432134000,0,0,2,'的说法的','','',0),(8,1,'173175139456615895',47,8,10,1432083600,1432134000,0,0,2,'是打发打发','','',0),(9,1,'173175139456615895',47,8,10,1432083600,1432134000,0,0,1,'大是非得失','','',1),(10,1,'173175139456615895',47,1,10,1511569800,1511571600,0,0,0,'地方撒地方','','大师傅',0),(11,1,'173253093980531653',59,8,7,1511366400,1511370120,0,2,1,'','','',0),(12,1,'173253093980531653',59,8,7,1511712000,1511715720,0,2,1,'','','',0),(13,2,'173262342700608941',59,8,4,1511366400,1511370120,0,2,1,'','','',0),(14,2,'173262342700608941',59,8,4,1511852400,1511856000,0,2,1,'','','',0),(15,1,'173175139456615895',47,8,10,1432083600,1432134000,0,0,1,'hhhh','这里是老师回复内容','',1),(16,1,'173324012403488419',47,8,10,1511342760,1511353560,4,0,1,'','','',0),(17,1,'173324012403488419',47,8,10,1510910760,1510918080,3,0,1,'','','',0),(18,1,'173324012403488419',47,8,10,1510824360,1510831560,2,0,1,'','','',0),(19,1,'173324012403488419',47,8,10,1511934595,1511952595,1,0,1,'','','',0);

/*Table structure for table `dh_user_exam_log` */

DROP TABLE IF EXISTS `dh_user_exam_log`;

CREATE TABLE `dh_user_exam_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '考试uid',
  `exam_id` int(10) unsigned DEFAULT '0' COMMENT '考试id',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '开始考试时间',
  `end_time` int(10) unsigned DEFAULT '0' COMMENT '结束考试时间',
  `score` int(10) unsigned DEFAULT '0' COMMENT '获得分数',
  `answer` mediumtext COMMENT '保存答题内容',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`exam_id`,`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户考试记录';

/*Data for the table `dh_user_exam_log` */

insert  into `dh_user_exam_log`(`id`,`uid`,`exam_id`,`start_time`,`end_time`,`score`,`answer`) values (1,10,6,1512027014,1512027019,60,'{\"3\":[\"1\",\"0\",\"1\",\"1\"],\"4\":[\"0\",\"1\",\"0\",\"0\"],\"5\":[\"1\",\"0\",\"0\",\"0\"]}');

/*Table structure for table `dh_user_experience` */

DROP TABLE IF EXISTS `dh_user_experience`;

CREATE TABLE `dh_user_experience` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned DEFAULT '0' COMMENT '结束时间',
  `content` mediumtext COMMENT '经验内容',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户相关经验';

/*Data for the table `dh_user_experience` */

/*Table structure for table `dh_user_feedback` */

DROP TABLE IF EXISTS `dh_user_feedback`;

CREATE TABLE `dh_user_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `priority` int(6) NOT NULL DEFAULT '0' COMMENT '优先级',
  `type` int(5) NOT NULL DEFAULT '0' COMMENT '问题类型',
  `number` varchar(100) NOT NULL COMMENT '运单号',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '所属用户descr',
  `description` mediumtext NOT NULL COMMENT '问题描述',
  `remark` varchar(255) NOT NULL COMMENT '问题备注',
  `file_name` varchar(255) NOT NULL COMMENT '附件信息',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `result` mediumtext NOT NULL COMMENT '反馈结果',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '反馈时间',
  `status` int(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='问题反馈表';

/*Data for the table `dh_user_feedback` */

insert  into `dh_user_feedback`(`id`,`priority`,`type`,`number`,`uid`,`description`,`remark`,`file_name`,`create_time`,`result`,`update_time`,`status`) values (1,607,610,'123456',21,'问题比较严重','','111',1514351950,'稍后我们这边会连专人为您处理',1514365565,1),(2,608,610,'4256687566884',2,'默默无闻','备注啊','',1514427042,'',0,0),(3,609,610,'546464645',2,'描述','备注','',1514427072,'',0,0),(4,607,611,'5668552',2,'我的描述','备注','',1514428383,'',0,0),(5,609,610,'5697533',2,'我的包裹什么时候送达','貌似没得什么备注','1514431623148_83.jpeg,1514431623542_84.jpeg',1514431623,'',0,0),(6,608,612,'2558569',18,'阿里距离咯哦哦图灵教育咯','','1514515658672_93.jpeg',1514515658,'',0,0),(7,608,610,'2558569',18,'阿里距离咯哦哦图灵教育咯','','1514515675173_94.jpeg,1514515675977_95.jpeg,1514515675232_96.jpeg',1514515675,'',0,0),(8,608,611,'2558569',18,'阿里距离咯哦哦图灵教育咯摩托找我健康know 鱼头咯哦哦','','1514515691950_97.jpeg,1514515691539_98.jpeg,1514515691915_99.jpeg',1514515691,'',0,0);

/*Table structure for table `dh_user_mail` */

DROP TABLE IF EXISTS `dh_user_mail`;

CREATE TABLE `dh_user_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '发送人',
  `to_uid` int(11) DEFAULT '0' COMMENT '接收人',
  `uid_important` tinyint(1) DEFAULT '0' COMMENT '发送者是否标记重要 1标记 0未标记',
  `to_uid_important` tinyint(1) DEFAULT '0' COMMENT '接收者是否标记重要 1标记 0未标记',
  `title` varchar(250) DEFAULT '' COMMENT '标题',
  `content` mediumtext COMMENT '内容',
  `is_reader` tinyint(1) DEFAULT '0' COMMENT '接收者是否已读 1已读 0未读',
  `annex` varchar(500) DEFAULT '' COMMENT '附件地址',
  `created` int(11) DEFAULT '0' COMMENT '发送时间',
  `to_uid_del_status` tinyint(1) DEFAULT '0' COMMENT '接收者删除状态 1删除 0未删除',
  `uid_del_status` tinyint(1) DEFAULT '0' COMMENT '发送者删除状态 1删除 0未删除',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `to_uid` (`to_uid`),
  KEY `to_uid_del_status` (`to_uid_del_status`),
  KEY `uid_del_status` (`uid_del_status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_mail` */

insert  into `dh_user_mail`(`id`,`uid`,`to_uid`,`uid_important`,`to_uid_important`,`title`,`content`,`is_reader`,`annex`,`created`,`to_uid_del_status`,`uid_del_status`) values (1,8,10,0,0,'你好哦','',0,'',1510629847,0,0),(2,8,10,0,0,'哈哈哈哈','',0,'',1510630096,0,0),(3,8,10,0,0,'你好哦好','你好哦',1,'',1510631242,0,0),(4,8,10,0,0,'hhhhhh',' 哈哈哈哈或',1,'',1510631327,0,0),(5,10,8,0,0,'回复：hhhhhh','--------原文件内容--------\r\n\r\n 哈哈哈哈或\r\n\r\n--------回复内容--------\r\n           \r\n老师我收到了哦哦哦                 ',1,'',1510640684,0,0),(6,8,10,0,1,'你好哦哦哦哦','大法师打发送达方式大',1,'/uploadfile/test/151064540599241.doc:::口袋车接口文档.doc,/uploadfile/test/151064540862281.doc:::口袋车接口文档 - 副本.doc',1510645419,0,0),(7,10,8,0,0,'你好老师','hhhhh',1,'/uploadfile/test/151080173396932.doc:::口袋车接口文档.doc,/uploadfile/test/151080173520228.doc:::口袋车接口文档 - 副本.doc',1510801747,0,0);

/*Table structure for table `dh_user_message` */

DROP TABLE IF EXISTS `dh_user_message`;

CREATE TABLE `dh_user_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1系统通知 2本地直邮 3国家转运',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '发送者uid 0系统消息',
  `to_uid` int(10) unsigned DEFAULT '0' COMMENT '接受信息用户id',
  `flag` varchar(200) DEFAULT '' COMMENT '消息标识符',
  `param` varchar(500) DEFAULT '' COMMENT '动态参数',
  `jump_app` varchar(300) DEFAULT '' COMMENT 'app原生跳转参数',
  `is_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '读取状态 1已读 0未读',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  `uid_important` tinyint(1) DEFAULT '0' COMMENT '发送者标记重要 1标记 0未标记',
  `touid_important` tinyint(1) DEFAULT '0' COMMENT '接收者标记重要 1标记 0未标记',
  `uid_del_status` tinyint(1) DEFAULT '0' COMMENT '发送者删除状态 1删除 0未删除',
  `touid_del_status` tinyint(1) DEFAULT '0' COMMENT '发送者删除状态 1删除 0未删除',
  PRIMARY KEY (`id`),
  KEY `flag` (`flag`,`type`,`uid`,`to_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_message` */

insert  into `dh_user_message`(`id`,`type`,`uid`,`to_uid`,`flag`,`param`,`jump_app`,`is_reader`,`del_status`,`created`,`uid_important`,`touid_important`,`uid_del_status`,`touid_del_status`) values (1,2,0,27,'user_logistics_3','{\"order_sn\":\"TEST00019KO\"}','',0,0,1516785912,0,0,0,0);

/*Table structure for table `dh_user_red_packets_log` */

DROP TABLE IF EXISTS `dh_user_red_packets_log`;

CREATE TABLE `dh_user_red_packets_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户uid',
  `integral` int(10) unsigned DEFAULT '0' COMMENT '积分数',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`start_time`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='红包雨记录';

/*Data for the table `dh_user_red_packets_log` */

insert  into `dh_user_red_packets_log`(`id`,`uid`,`integral`,`start_time`,`end_time`) values (7,1,0,1511336996,1511337060),(6,1,0,1511336649,1511336649),(5,1,0,1511336639,1511336639);

/*Table structure for table `dh_user_schedule` */

DROP TABLE IF EXISTS `dh_user_schedule`;

CREATE TABLE `dh_user_schedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '所属用户uid',
  `time` char(15) NOT NULL DEFAULT '0,1,2,3,4,5,6' COMMENT '周标识 0星期天 1星期一 2星期二 3星期三 4星期四 5星期五 6星期六',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1开启 2关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='一周排班计划';

/*Data for the table `dh_user_schedule` */

insert  into `dh_user_schedule`(`id`,`uid`,`time`,`status`) values (1,4,'0,1,2,3,4,5,6',1),(2,9,'0,1,2,3,4,5,6',1),(3,5,'0,1,2,3,4,5,6',1);

/*Table structure for table `dh_user_schedule_log` */

DROP TABLE IF EXISTS `dh_user_schedule_log`;

CREATE TABLE `dh_user_schedule_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户所属uid',
  `start_time` int(11) DEFAULT '0' COMMENT '上班打卡时间',
  `end_time` int(11) DEFAULT '0' COMMENT '下班打卡时间',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  `license` varchar(50) DEFAULT '' COMMENT '当日派车',
  `console_uid` int(11) DEFAULT '0' COMMENT '操作人员',
  `week` tinyint(1) DEFAULT '0' COMMENT '所属星期几 0-6',
  PRIMARY KEY (`id`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_user_schedule_log` */

insert  into `dh_user_schedule_log`(`id`,`uid`,`start_time`,`end_time`,`created`,`license`,`console_uid`,`week`) values (2,4,0,1515743520,1515743777,'',5,5),(3,5,1515743520,0,1515744027,'车牌号显示',5,5),(4,4,2147483647,0,1515830265,'',0,6),(5,9,2147483647,0,1515830534,'',0,6),(6,5,2147483647,2147483647,1515830620,'',0,6);

/*Table structure for table `dh_user_scores` */

DROP TABLE IF EXISTS `dh_user_scores`;

CREATE TABLE `dh_user_scores` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT '0' COMMENT '学生uid',
  `teacher_uid` int(11) unsigned DEFAULT '0' COMMENT '老师uid',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '课程id',
  `title` varchar(200) DEFAULT '' COMMENT '成绩项目',
  `total` int(11) unsigned DEFAULT '100' COMMENT '总分',
  `score` int(11) unsigned DEFAULT '0' COMMENT '得分',
  `time` int(11) unsigned DEFAULT '0' COMMENT '审批时间',
  `created` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='学生成绩表';

/*Data for the table `dh_user_scores` */

insert  into `dh_user_scores`(`id`,`uid`,`teacher_uid`,`goods_id`,`title`,`total`,`score`,`time`,`created`,`del_status`) values (1,10,8,47,'测试项目',100,60,1510675200,1510732378,0);

/*Table structure for table `dh_user_shop` */

DROP TABLE IF EXISTS `dh_user_shop`;

CREATE TABLE `dh_user_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '所属用户uid',
  `shop_sn` varchar(20) DEFAULT '' COMMENT '店铺编号',
  `name` varchar(50) DEFAULT '' COMMENT '店铺名称',
  `bname` varchar(50) DEFAULT '' COMMENT '店铺别名',
  `real_name` varchar(50) DEFAULT '' COMMENT '联系人',
  `avatar` varchar(60) DEFAULT '' COMMENT '店铺头像',
  `credit_level` tinyint(1) unsigned DEFAULT '0' COMMENT '平均信用等级 共50分 5星',
  `woker_time` varchar(100) DEFAULT '' COMMENT '工作时间',
  `address` varchar(150) DEFAULT '' COMMENT '地址',
  `category` varchar(20) DEFAULT '0' COMMENT '分类id',
  `qr` varchar(100) DEFAULT '' COMMENT '自定义二维码图片',
  `ablum` varchar(300) DEFAULT '' COMMENT '店铺照片',
  `ide_ablum` varchar(300) DEFAULT '' COMMENT '认证照片',
  `is_ide` tinyint(1) unsigned DEFAULT '0' COMMENT '认证状态 0未认证 1已认证 2认证未通过 3申请认证中',
  `is_message` tinyint(1) unsigned DEFAULT '1' COMMENT '锁屏新消息是否开启 1开启 0不开启',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '店铺状态 1开启 2关闭',
  `is_recommend` tinyint(1) unsigned DEFAULT '0' COMMENT '店铺推荐 1推荐 0未推荐',
  `lng` float unsigned DEFAULT '0' COMMENT '经度',
  `lat` float unsigned DEFAULT '0' COMMENT '维度',
  `goods_num` int(11) unsigned DEFAULT '0' COMMENT '服务类商品数量',
  `orders` int(11) DEFAULT '0' COMMENT '订单成功总量',
  `orders_service` int(11) DEFAULT '0' COMMENT '服务订单交易数量',
  `sign` tinyint(1) DEFAULT '0' COMMENT '1加盟 2直营',
  `city_id` varchar(20) DEFAULT '0' COMMENT '仓库地址id',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `api_secret` varchar(255) DEFAULT '' COMMENT '店铺授权码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_shop` */

insert  into `dh_user_shop`(`id`,`uid`,`shop_sn`,`name`,`bname`,`real_name`,`avatar`,`credit_level`,`woker_time`,`address`,`category`,`qr`,`ablum`,`ide_ablum`,`is_ide`,`is_message`,`status`,`is_recommend`,`lng`,`lat`,`goods_num`,`orders`,`orders_service`,`sign`,`city_id`,`mobile`,`api_secret`) values (2,3,'','kuangxin','','555','150588957988857.jpeg',49,'09:00-18:00','重庆市南岸区湖滨路172号','70,72,71,23,21,22,73','1515469749114_145.jpeg','1515478674191_148.jpeg,1515478783166_149.jpeg','150588960214710.png',1,0,1,1,106.563,29.5272,1,0,2,0,'BNE1000','1386558655',''),(3,8,'','17300289310','','','1512446115130_21.jpeg',30,'5～7','重庆市南岸区南坪西路174号','70,72,24,71,23,21,22',NULL,'','',1,1,1,0,106.563,29.5272,1,0,2,0,'BNE1000','',''),(6,21,'','苏泊尔旗舰店','','','1514266739590_76.png',50,'','','0',NULL,'','',1,1,1,0,0,0,0,0,0,0,'BNE1000','',''),(8,25,'BNE0005','SC','','测试网点操作员','',50,'','','0',NULL,'','',0,1,1,0,0,0,0,0,0,2,'FG01','','QzU3MkI0OTUtQkZGNS00NEYyLTg5MEQtMEQ1NERBRjg1RUQzLEMyQjQ5NDNFLUFBMzEtNDcyMy1CNzE5LUU4QUFDNjJGNzk1NA=='),(9,26,'BNE0001','速派布里斯班','','测试网点操作员(普通用户)','',50,'','','0',NULL,'','',0,1,1,0,0,0,0,0,0,1,'FG01','','Qjc1OEU2N0MtRjc0MC00Nzk0LTk5NzMtNTQ4OTBFM0YxRTA3LENBRDg3NDJFLUMzRDEtNDYxNC05QTI5LTVBRjlCMkFGOEM3OA==');

/*Table structure for table `dh_user_third_party` */

DROP TABLE IF EXISTS `dh_user_third_party`;

CREATE TABLE `dh_user_third_party` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `weixin_id` varchar(300) DEFAULT NULL COMMENT '微信openid',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(300) DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='第三方登录信息';

/*Data for the table `dh_user_third_party` */

insert  into `dh_user_third_party`(`id`,`uid`,`weixin_id`,`nickname`,`avatar`) values (1,0,'o0AhPuAVM-atrra8LT0dr7yirVV4','四月一日','http://wx.qlogo.cn/mmopen/vi_32/P20nZfsvjEId1S1WEUljJzicTAWVxNhXGLyN2qtj9UUvGQjNYAP0YvMFbKGm4F6MicBp7foHzpLIrBXVKO4JBAGw/0');

/*Table structure for table `dh_user_up_work` */

DROP TABLE IF EXISTS `dh_user_up_work`;

CREATE TABLE `dh_user_up_work` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '学生uid',
  `goods_id` int(11) DEFAULT '0' COMMENT '课程id',
  `work_id` int(11) DEFAULT '0' COMMENT '作业id',
  `teacher_uid` int(11) DEFAULT '0' COMMENT '老师uid',
  `annex` varchar(500) DEFAULT '' COMMENT '附件',
  `created` int(11) DEFAULT NULL COMMENT '发送时间',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `is_reader` tinyint(1) DEFAULT '0' COMMENT '老师查看状态 1已查看 0未查看',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='学生上传作业';

/*Data for the table `dh_user_up_work` */

insert  into `dh_user_up_work`(`id`,`uid`,`goods_id`,`work_id`,`teacher_uid`,`annex`,`created`,`del_status`,`is_reader`) values (1,10,47,6,8,'/uploadfile/test/151065435624683.doc:::口袋车接口文档.doc',1510654387,0,1),(2,10,47,7,8,'/uploadfile/test/151072552559419.doc:::口袋车接口文档.doc,/uploadfile/test/151072552735974.doc:::口袋车接口文档 - 副本.doc',1510725527,0,1);

/*Table structure for table `dh_user_warehouse` */

DROP TABLE IF EXISTS `dh_user_warehouse`;

CREATE TABLE `dh_user_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户uid',
  `name` varchar(100) DEFAULT '' COMMENT '商品名称',
  `category` varchar(50) DEFAULT '' COMMENT '商品类别',
  `brand` varchar(50) DEFAULT '' COMMENT '商品品牌',
  `spec` float DEFAULT '0' COMMENT '商品规格kg',
  `num` int(10) unsigned DEFAULT '0' COMMENT '商品数量',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '商品单价',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='用户库房';

/*Data for the table `dh_user_warehouse` */

insert  into `dh_user_warehouse`(`id`,`uid`,`name`,`category`,`brand`,`spec`,`num`,`price`,`created`) values (7,2,'名称','食品','洋洋',1,0,'2.00',1514274328),(8,2,'打基础','母婴用品','洋洋',1000,0,'2.00',1514274468),(9,2,'就','日用品','需要',500,0,'60.00',1514274521),(10,18,'商品123','电子产品','123',0.8,10,'50.00',1514864940),(12,18,'，啦啦啦啦啦啦喽','电子产品','咯来咯来咯哦哦哦',5,0,'200.00',1514877688),(15,1,'1789','食品','阿哦哦',0.5,0,'10.00',1515228624),(14,1,'1234','化妆品','咯哦123',1,0,'500.00',1515228570),(16,2,'美白','化妆品','兰蔻',2,0,'50.00',1516676391);

/*Table structure for table `dh_user_work` */

DROP TABLE IF EXISTS `dh_user_work`;

CREATE TABLE `dh_user_work` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1课程安排 2作业安排 3试卷安排',
  `teacher_uid` int(11) unsigned DEFAULT '0' COMMENT '老师id',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '课程id',
  `schedule_id` int(11) unsigned DEFAULT '0' COMMENT '对应课程表主键id',
  `exam_id` int(10) unsigned DEFAULT '0' COMMENT '对应exam_list主键id',
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(500) DEFAULT '' COMMENT '描述内容',
  `annex` varchar(500) DEFAULT '' COMMENT '附件信息',
  `start_time` int(11) unsigned DEFAULT '0' COMMENT '开始时间',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  `del_stauts` tinyint(1) unsigned DEFAULT '0' COMMENT '状态 1删除  0未删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_work` */

insert  into `dh_user_work`(`id`,`type`,`teacher_uid`,`goods_id`,`schedule_id`,`exam_id`,`title`,`content`,`annex`,`start_time`,`created`,`del_stauts`) values (2,1,8,47,0,0,NULL,'哈哈哈','',1510588800,1510648361,0),(3,1,8,47,0,0,NULL,'就将计就计','/uploadfile/test/151064883198593.doc:::口袋车接口文档 - 副本.doc,/uploadfile/test/151064883331110.doc:::口袋车接口文档.doc',1510588800,1510648833,0),(4,1,8,47,0,0,NULL,'hhhhh','/uploadfile/test/151065006380515.doc:::口袋车接口文档.doc',1510588800,1510650063,0),(5,1,8,47,0,0,NULL,'好的很哦','/uploadfile/test/151065021932294.doc:::口袋车接口文档 - 副本.doc',1510588800,1510650220,0),(6,2,8,47,0,0,NULL,'这里就是课程安排了哦哦哦','/uploadfile/test/151065023979776.doc:::口袋车接口文档.doc',1510588800,1510650239,0),(7,2,8,47,0,0,NULL,'哈哈哈好好','/uploadfile/test/151065033788524.doc:::口袋车接口文档.doc',1510588800,1510650337,0),(11,3,1,45,0,6,NULL,'哈哈哈哈','',1511712000,1511773846,0),(10,3,1,45,0,6,NULL,'哈哈哈','',1511712000,1511773768,0),(12,3,8,47,0,6,NULL,'hhh','',1511712000,1511775839,0);

/*Table structure for table `dh_user_work_remak` */

DROP TABLE IF EXISTS `dh_user_work_remak`;

CREATE TABLE `dh_user_work_remak` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `created` int(11) DEFAULT NULL COMMENT '创建时间',
  `goods_id` int(11) DEFAULT NULL COMMENT '课程id',
  `uid` int(11) DEFAULT NULL COMMENT '学生uid',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_work_remak` */

insert  into `dh_user_work_remak`(`id`,`time`,`content`,`created`,`goods_id`,`uid`) values (1,1510675200,'哈哈哈哈',NULL,47,10),(2,1510675200,'哦哦哦哦',NULL,47,10);

/*Table structure for table `dh_visitor_comment` */

DROP TABLE IF EXISTS `dh_visitor_comment`;

CREATE TABLE `dh_visitor_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '类型 1文章 2留言',
  `goods_id` int(10) unsigned DEFAULT '0' COMMENT '商品id',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '上级id',
  `content` varchar(500) DEFAULT '' COMMENT '评论内容',
  `nickname` varchar(10) DEFAULT '' COMMENT '昵称',
  `mail` varchar(20) DEFAULT '' COMMENT '邮箱',
  `ip` varchar(20) DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1显示 0不显示',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_id` int(11) DEFAULT '0' COMMENT '回复id',
  `to_nickname` varchar(10) DEFAULT '' COMMENT '回复昵称',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `parent_id` (`parent_id`),
  KEY `is_show` (`is_show`),
  KEY `nickname` (`nickname`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='游客评论';

/*Data for the table `dh_visitor_comment` */

insert  into `dh_visitor_comment`(`id`,`type`,`goods_id`,`parent_id`,`content`,`nickname`,`mail`,`ip`,`is_show`,`created`,`to_id`,`to_nickname`,`mobile`) values (1,1,3,0,'33333','111',NULL,'127.0.0.1',1,1506592498,0,'',NULL),(2,1,5,0,'这里是测试留言内容','四月','12353.1@qq.com','127.0.0.1',1,1507707987,0,'',NULL),(3,1,5,0,'啊啊啊','四月','12353.1@qq.com','127.0.0.1',1,1507708932,0,'',NULL),(6,1,58,0,'sdafsdf','ggg','sfasdf','127.0.0.1',1,1511407810,0,'',NULL);

/*Table structure for table `dh_warehouse_info` */

DROP TABLE IF EXISTS `dh_warehouse_info`;

CREATE TABLE `dh_warehouse_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(20) DEFAULT '0' COMMENT '国家id',
  `category_id` varchar(50) DEFAULT '0' COMMENT 'category主键bname_2 仓库编号',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `zip_code` varchar(20) DEFAULT NULL COMMENT '收货人邮编',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_warehouse_info` */

insert  into `dh_warehouse_info`(`id`,`country_id`,`category_id`,`name`,`mobile`,`address`,`zip_code`) values (4,'0','FG01','Mark','07 3103 2888','Unit 4&5，33 Stockwell Place,Archerfield,QLD 4108','10001'),(5,'0','01','Fastgo','61731032888','UNIT 4 & 5,  33 STOCKWELL PLACE, ARCHERFIELD, QUEENSLAND  4108',NULL),(6,'0','86','Fastgo','61731032888','UNIT 4 & 5,  33 STOCKWELL PLACE, ARCHERFIELD, QUEENSLAND  4108',NULL),(7,'0','888','Fastgo','61731032888','UNIT 4 & 5,  33 STOCKWELL PLACE, ARCHERFIELD, QUEENSLAND  4108','0001');

/*Table structure for table `dh_web_log` */

DROP TABLE IF EXISTS `dh_web_log`;

CREATE TABLE `dh_web_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1日常记录 2错误记录',
  `level` tinyint(1) unsigned DEFAULT '1' COMMENT '错误等级',
  `message` varchar(500) DEFAULT NULL COMMENT '内容',
  `url` varchar(500) DEFAULT '' COMMENT '请求地址',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='错误日志记录';

/*Data for the table `dh_web_log` */

insert  into `dh_web_log`(`id`,`type`,`level`,`message`,`url`,`created`) values (1,2,1,'财务记录插入异常,请立即查明原因','/v1/common/Deposit/add',1516010368),(2,2,1,'财务记录插入异常,请立即查明原因','/v1/common/Deposit/add',1516010388);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
