/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.5.53-log : Database - koudaiche
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hengdin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

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
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `btitle` varchar(50) NOT NULL DEFAULT '' COMMENT '附标题',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) DEFAULT '' COMMENT '简介',
  `description_en` varchar(500) DEFAULT NULL COMMENT '英文简介',
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
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `dh_article` */

insert  into `dh_article`(`id`,`uid`,`column_id`,`model_id`,`tag`,`title`,`btitle`,`thumb`,`description`,`description_en`,`origin`,`is_top`,`is_show`,`is_recommend`,`is_review`,`hot`,`publish_time`,`comment_num`,`comment_uid`,`comment_time`,`del_status`,`created`) values (1,0,0,1,'6','Nginx 实现跨域使用字体文件','','','Nginx 实现跨域使用字体文件',NULL,'',0,1,1,1,19,0,0,0,0,0,1504970134),(2,0,0,1,'6','Nginx 跨域访问php  ','','','Access-Control-Allow-Origin 错误',NULL,'',0,1,0,1,40,0,0,0,0,0,1504970371),(3,0,0,1,'10','Html 文字内容只显示一行','','','css控制文字内容只显示一行',NULL,'',0,1,0,1,163,0,0,0,0,0,1505020972),(4,0,0,1,'8','docker 手把手教你基于官网镜像搭建mysql+php+nginx（一）','','','使用的是官网镜像mysql:5.7php:5.6nignx:last准备工作你需要先安装dockerdocker-compose并且需要有一个github账户创建本地文件apahcemysqlsrv这里用不到主要需要创建的docker文件夹文件夹下创建对应mysqlnginxphp文件里面文件内容我们需要从容器里面拷贝出来后自己调整修改OK准备工作完成了先从php开始吧抓取php需要的配置文件保存在本地方便自己以后修改创建phpDockerfile在php下创建Docker',NULL,'',0,1,1,1,39,0,0,0,0,0,1507688317),(5,0,0,1,'9','linux命令之crontab定时执行任务','','','一般情况下，我们在操作和运维VPS、服务器的时候可能会用到crontab定时任务的配置，比如定时的重启服务器、定时备份数据等操作使用的还是比较多的。这里就离不开使用crontab命令的任务配置，在这篇文章中，老左将会整理较为齐全的crontab命令使用的方法以及常用的实例操作。从上图中，我们其实就可以看到crontab具体用法。一共有6个段落，前面5个标示定时的时间设定，后面一个标示文件的路径定时执行。第一、crontab安装一般我们使用的centos或者debian发行版本都自带crontab定时软件支',NULL,'http://www.laozuo.org/7110.html',0,1,0,1,109,0,0,0,0,0,1507694379),(6,0,0,1,'3','mysql数据库主从服务器常见问题处理','','','Slave_IO_Running Checking master version',NULL,'http://blog.csdn.net/lvyongyi_2010/article/details/23336249',0,1,0,1,14,0,0,0,0,0,1507701439),(7,0,6,1,'1','学院介绍','','ded101245a4174a5173a8e98a32d680d.jpeg','该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖','这里是英文摘要','',0,1,0,1,0,0,0,0,0,0,1508232750),(16,0,7,2,'1','大卫','Da Wei','6109903a4f0399518bc5829b01559ccc.jpeg','ETS官方培训师、British Council（英国教育文化协会）雅思考试年度工作坊特邀嘉宾','ETS Official Trainer, British Council (UK Education and Culture Association) IELTS Annual Workshop Specialist','',0,1,0,1,0,0,0,0,0,0,1508492185),(24,0,8,3,'1','课程名称中文','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1509438430),(30,0,10,1,'1','恒鼎学院简介','ABOUT  US','d6fb1ac5f3a5111a7bf3aa08384cf4a8.jpeg','创立至今始终坚持帮助更多中国人快乐、自信、便捷地掌握流利英语，并实现成功梦想为使命，全方位地解决不同学员英语学习中遇到的各种问题和困难。每年为国家公务员、跨国机构、各行业职员、在校大学生等等在内的数万学员提高英语水平。我们和你都有共同的目标，那就是让你有更加优质的生活，并在学习英语的过程中给予最大的帮助','Since the creation has always been to help more Chinese people happy, confident, easy to master fluent in English, and to achieve a successful dream for the mission, all-round solution to different students in English learning problems and difficulties encountered. Each year for the national civil servants, multinational institutions, industry staff, college students, etc., including tens of thousands of students to improve the level of English. We and you have a common goal, that is to let you ','',0,1,0,1,0,0,0,0,0,0,1509592877),(31,0,11,1,'1','澳洲恒鼎学院','Australia Heng Ding College','','','','',0,1,0,1,0,0,0,0,0,0,1509691386),(32,0,4,1,'1','入学必读','Admission must be read','','','','',0,1,0,1,0,0,0,0,0,0,1509930812),(33,0,22,1,'1','证书查询方法','Certificate inquiry method','','','','',0,1,0,1,0,0,0,0,0,0,1509941443),(34,0,20,1,'1','雅思考试时间','IELTS test time','','','','',0,1,0,1,0,0,0,0,0,0,1510133421),(35,0,13,1,'1','部门介绍','Department introduction','','该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖','The team sticks to the principle of \"six principles of teaching and promoting scientific research, scientific achievements, achievements award, achievements reporting project, project awards and teaching force and teaching and learning\" and puts forward six \"one\" That is, presided over a number of topics, the construction of a number of quality courses, published a number of planning materials, research and development of a group Kaoyan brand courses to guide a group of students to participate i','',0,1,0,1,0,0,0,0,0,0,1510193921),(36,0,14,2,'1','张三老师','Zhangs San','eb83c791e527e2c6c1ce95b2f74f8599.jpeg','本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促 教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程。本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程。','In line with the principle of \"six disciplines of promoting scientific research through teaching, achievements of scientific research, awarding of achievements, reporting of projects with achievements, project awards with teams, and teaching teams promoted by teachers\", the goal of six \"one\" education reform achievements is proposed A number of topics, building a number of quality courses. In line with the principle of \"six disciplines of promoting scientific research through teaching, achieveme','',0,1,0,1,0,0,0,0,0,0,1510195002),(37,0,27,2,'1','高级荣誉','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1510198807),(38,0,27,2,'1','高级荣誉','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1510198807),(39,0,27,2,'1','高级荣誉','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1510198807),(40,0,27,2,'1','高级荣誉','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1510198807),(41,0,27,2,'1','高级荣誉','高级荣誉英文','40fe85cdb74cbd9f8d1b5734c1a0b34d.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1510198807),(42,0,8,3,'1','课程名称中文','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1509438430),(43,0,8,3,'1','课程名称中文','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1509438430),(44,0,8,3,'1','课程名称中文','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','','',0,1,0,1,0,0,0,0,0,0,1509438430),(45,0,8,3,'1','课程名称中文','课程名称英文','6109903a4f0399518bc5829b01559ccc.jpeg','','','',0,1,0,1,1,0,0,0,0,0,1509438430),(46,0,8,3,'1','学霸英文教程','学霸英文教程英文版','6109903a4f0399518bc5829b01559ccc.jpeg','','','',0,1,0,1,1,0,0,0,0,0,1509438430),(47,0,8,3,'1','雅思7.5分精品课程','雅思7.5分精品课程','6109903a4f0399518bc5829b01559ccc.jpeg','','','',0,1,1,1,28,1509438430,0,0,0,0,1509438430),(49,1,23,1,'1','可以哦','','','','','',0,1,0,1,48,1509438430,3,10,1510898365,0,1510817001),(50,10,23,1,'1','hhhh','','','','','',0,1,1,1,5,1510889253,0,0,0,0,1510889253),(51,10,23,1,'1','hhhh2','','','','','',0,1,1,1,31,1510889476,3,10,1511510984,0,1510889476),(52,10,23,1,NULL,'范德萨发生大','','','',NULL,'',0,1,0,0,4,1510889486,0,0,0,0,1510889486),(53,10,23,1,NULL,'的说法的','','','',NULL,'',0,1,0,0,2,1510889529,0,0,0,1,1510889529),(54,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','','',0,1,0,1,4,1511244700,0,0,0,0,1511244700),(55,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','','',0,1,0,1,0,1511244700,0,0,0,0,1511244700),(56,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','','',0,1,0,1,0,1511244700,0,0,0,0,1511244700),(57,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','','',0,1,0,1,0,1511244700,0,0,0,0,1511244700),(58,0,21,1,'1','站在高起点，着眼“高端雅思高端雅','站在高起点，着眼“高端雅思高端雅222','f2ad4b342aea70e6b6ce7bfa3b28fced.jpeg','','','',0,1,0,1,10,1511244700,0,0,0,0,1511244700),(59,0,8,3,'1','测试','','','','','',0,1,0,1,18,1511330439,0,0,0,0,1511330439),(60,0,28,4,'1','测试下载资料显示','测试下载资料显示2','','测试下载资料显示33','测试下载资料显示5555','',0,1,1,1,0,1511781359,0,0,0,0,1511781359),(61,0,28,4,'1','测试下载资料显示','测试下载资料显示2','','测试下载资料显示33','测试下载资料显示5555','',0,1,1,1,0,1511781359,0,0,0,0,1511781359),(62,0,17,3,'1','测试计划','111','af7bb23cae72f3390eb5155a166d16be.jpeg','','','',0,1,0,1,23,1512008757,0,0,0,0,1512008757),(63,0,17,3,'1','测试重复提交','测试重复提交','','','','',0,1,0,1,1,1512009708,0,0,0,0,1512009708);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_data` */

insert  into `dh_article_data`(`id`,`content`,`content_en`) values (7,'							 	<p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>该团队本着&#39;“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖<br/></p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p>							 	','							 	<p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p><p style=\"white-space: normal;\">该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖<br/></p><p style=\"white-space: normal;\">该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p><br/></p><p>							 	</p><p>							 	</p><p>							 	</p><p>							 	</p>							 	'),(25,'<p>44</p>','<p>44</p>'),(28,'',''),(30,'<p>&nbsp; 该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p>							 								 	','<p>The team in the &quot;teaching to promote scientific research, scientific research results, the results were rewarded, the results of the project, the project awards with the team, teaching staff to promote teaching,&quot; the six-ring principle, put forward the teaching reform results of six &quot;one&quot; That is, presided over a number of topics, the construction of a number of excellent courses, publishing a number of planning materials, research and development of a group of Kaoyan brand courses to guide a group of students to participate in national competitions and award the team in &quot;teaching scientific research, scientific research results, the results were rewarded , The results of the project, the project awards with the team, teaching staff to promote teaching, &quot;the six-ring principle, put forward the results of teaching reform six&quot; one &quot;goal, that is, presided over a number of topics, the construction of a number of excellent courses, Teaching materials, research and development of a group of Kaoyan brand courses, to guide a group of students to participate in national competitions and awards</p><p>The team in the &quot;teaching to promote scientific research, scientific research results, the results were rewarded, the results of the project, the project awards with the team, teaching staff to promote teaching,&quot; the six-ring principle, put forward the teaching reform results of six &quot;one&quot; That is, presided over a number of topics, the construction of a number of excellent courses, publishing a number of planning materials, research and development of a group of Kaoyan brand courses to guide a group of students to participate in national competitions and awards</p>\r\n						 								 	'),(31,'							 	 <strong>澳洲恒鼎学院</strong><div class=\"map_img\"><img src=\"/ststic/study/images/map.jpg\"/></div><h1>联系我们</h1><span>咨询电话：023-23654586</span><span>培训地址：重庆南岸区工惠路192号贝迪龙庭14楼2号</span><br/>							 	','							 	 <strong>澳洲恒鼎学院</strong><div class=\"map_img\"><img src=\"/ststic/study/images/map.jpg\"/></div><h1>联系我们</h1><span>咨询电话：023-23654586</span><span>培训地址：重庆南岸区工惠路192号贝迪龙庭14楼2号</span><br/>							 	'),(32,'<p>为需要较高分数学员量身定制分科教学方案，精华汇总重难点题型解题技巧，完美诠释听说读写各项评分指标及时找到你出分路上的拦路虎，顺利突破出分瓶颈。雅思分数6分程度或同等水平，英语基础较为扎实，能以正常速度阅读长篇文章；能较为流畅地进行口头及书面表达，但对雅思缺乏明确认识；对长文章/长听力的把握力不够；口语/写作表达中缺少论证性观点，或观点表达不够到位。；词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p><img src=\"/uploadfile/ueditor/20171106/1509930757601067.jpg\" width=\"100%\" _src=\"/uploadfile/ueditor/20171106/1509930757601067.jpg\" title=\"1509930757601067.jpg\" alt=\"img.jpg\"/><p>口语/写作表达中缺少论证性观点，或观点表达不够到位。；词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p><p>词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p><p>词汇量6000+左右。将雅思口语及写作话题多方面细化，在广泛吸收题库旧题的基础上勇于创新，对未来考试进行合理预测，并透彻讲解高品质范文/范例选取大量雅思阅读及听力新题，利用其出题特点及语言风格上的高仿真度，提升学员的应考能力和技战术水平</p>','<p style=\"white-space: normal;\">For the need for higher scores tailored sub-teaching programs, the essence of heavy difficulty problem-solving skills, perfect interpretation of reading, writing, reading and writing the indicators in time to find you on the road to stumbling block, a smooth break out of the bottleneck. IELTS score of 6 points or equivalent, the foundation of English is solid, can read long articles at normal speed; can be more smoothly oral and written expression, but IELTS lack of a clear understanding of the long article / long listening ability is not enough; Oral / written expression of the lack of argumentation point of view, or lack of expression in place. ; Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><img src=\"http://admin.denha.loc/uploadfile/ueditor/20171106/1509930757601067.jpg\" width=\"100%\" _src=\"/uploadfile/ueditor/20171106/1509930757601067.jpg\" title=\"1509930757601067.jpg\" alt=\"img.jpg\"/><p style=\"white-space: normal;\"></p><p>Oral / written expression of the lack of argumentation point of view, or lack of expression in place. ; Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><p>Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><p>Vocabulary of about 6000 +. The IELTS spoken and writing topics in many aspects of refinement, the extensive absorption of questions on the basis of the old questions courage to innovate, the future of the test to make a reasonable prediction, and a thorough explanation of high quality Pham Van / sample selection of a large number of IELTS reading and hearing new questions, the use of its Problem characteristics and language style on the high degree of simulation, to enhance students&#39; ability to test and technical and tactical level</p><p>The company is located in:</p>'),(33,'<h3>证书查询方法</h3><span>托福成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> toefl.etest.net.cn/cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p><p style=\"width:70%; height:20px; border-bottom:#ccc 1px dashed; margin:20px auto\" class=\"clearfix\"></p><span>雅思成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> www.britishcouncil.cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p>','<h3>证书查询方法</h3><span>托福成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> toefl.etest.net.cn/cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p><p style=\"width:70%; height:20px; border-bottom:#ccc 1px dashed; margin:20px auto\" class=\"clearfix\"></p><span>雅思成绩查询方法&gt;&gt;</span><p>1、登录教育部托福考试报名网站 (<a href=\"#\"> www.britishcouncil.cn</a> ) ;</p><p>2、输入考生的NEED用户ID和密码登陆;</p><p>3、在“我的首页”点击“查看成绩”进行托福考试成绩查询。</p>'),(34,'<p>1月：07、12、14、21；2</p>							 								 	','\r\n							 	\r\n							 	January: 07,12,14,21; 2							 								 	'),(35,'<p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p><p>该团队本着“教学促科研，科研出成果，成果获奖励，成果报项目，项目奖项带队伍，教师队伍促教学”的六环紧扣原则，提出了教改成果六个“一”的目标，即主持一批课题、建设一批精品课程、出版一批规划教材、研发一组考研品牌课程、指导一批学生参加国家赛事并获奖</p>','<p></p><p>The team sticks to the principle of &quot;six principles of teaching and promoting scientific research, fruitful achievements, rewarding achievements, rewarding projects, winning awards with projects, and promoting teaching through contingent of teachers&quot;, put forward the goal of six &quot;one&quot; education reform results, That is, presided over a number of topics, the construction of a number of quality courses, published a number of planning materials, research and development of a group Kaoyan brand courses to guide a group of students to participate in national competitions and awards The team based on &quot;teaching to promote scientific research, research results, the results were rewarded , Outcome Report Project, Project Award Team, Team of Teachers to Promote Teaching and Learning &quot;and put forward the goal of six&quot; one &quot;education reform achievements, that is, to preside over a batch of topics, build a batch of excellent courses and publish a batch of plans Teaching materials, research and development of a group of Kaoyan brand courses to guide a group of students to participate in national competitions and awards</p><p>The team sticks to the principle of &quot;six principles of teaching and promoting scientific research, fruitful achievements, rewarding achievements, rewarding projects, winning awards with projects, and promoting teaching through contingent of teachers&quot;, put forward the goal of six &quot;one&quot; education reform results, That is, presided over a number of topics, the construction of a number of quality courses, published a number of planning materials, research and development of a group Kaoyan brand courses to guide a group of students to participate in national competitions and awards</p><p><br/></p>'),(48,'&nbsp;我来测试内容<img src=\"http://study.loc/uploadfile/test/79bc72fbc6caaadca3f1c84883b4ba9a.jpeg\" width=\"80%\">',NULL),(49,'\r\n							 	我来试试审核功能 和图片上传 看看有没有问题<img src=\"http://study.loc/uploadfile/test/e09f99d18f135e2fcddbeeff40b370c5.jpeg\" width=\"80%\"/>							 	',''),(50,'\r\n							 	这是要做什么<br/><br/>							 	',''),(51,'\r\n							 	这是要做什么<br/><br/>							 	',''),(52,'的沙发斯蒂芬',NULL),(53,'都是范德萨发生大幅',NULL),(54,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	'),(55,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	'),(56,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	'),(57,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	'),(58,'							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	','							 	<a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a><a href=\"http://study.loc/#\" style=\"padding: 0px 0px 0px 20px; margin: 0px; text-decoration-line: none; display: block; width: 260px; color: rgb(102, 102, 102); height: 45px; line-height: 45px; overflow: hidden; font-family: -apple-system-font, &quot;Helvetica Neue&quot;, Helvetica, &quot;Hiragino Sans GB&quot;, STHeitiSC-Light, &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: medium; white-space: normal; background-color: rgb(249, 249, 249);\">站在高起点，着眼“高端雅思高端雅</a>							 	');

/*Table structure for table `dh_article_download` */

DROP TABLE IF EXISTS `dh_article_download`;

CREATE TABLE `dh_article_download` (
  `id` int(11) DEFAULT NULL,
  `down_url` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_article_download` */

insert  into `dh_article_download`(`id`,`down_url`) values (60,'/uploadfile/test/151178135624664.zip,/uploadfile/test/151178135730629.zip'),(61,'/uploadfile/test/1511924745164_14.zip');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dh_banner` */

insert  into `dh_banner`(`id`,`title`) values (1,'首页顶部广告');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_banner_data` */

insert  into `dh_banner_data`(`id`,`banner_id`,`path`,`description`,`sort`,`app_type`,`app_value`) values (2,1,'4eb18891b7bff8e89da7bcda5e3b6741.jpeg','222',0,1,'1'),(3,1,'43bc6adcffe0be147572626263455e2d.jpeg','2222',3,2,'1');

/*Table structure for table `dh_category` */

DROP TABLE IF EXISTS `dh_category`;

CREATE TABLE `dh_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) unsigned DEFAULT '0' COMMENT '父级id',
  `thumb` varchar(100) DEFAULT '' COMMENT '缩略图',
  `name` varchar(20) DEFAULT '' COMMENT '分类名称',
  `bname` varchar(100) DEFAULT '' COMMENT '别名',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '显示状态 1显示 0不显示',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='分类表\r\n';

/*Data for the table `dh_category` */

insert  into `dh_category`(`id`,`parentid`,`thumb`,`name`,`bname`,`sort`,`is_show`,`created`) values (1,0,'','汽车品牌','',0,1,0),(2,1,'','奥拓','',1,1,0),(3,1,'3e4daf03cb497d10e0267b0f7b7de7df.png','大众','',0,1,0),(4,0,'','爱车服务首页栏目','',0,1,0),(5,4,'','汽车贴膜','',0,1,0),(6,4,'','汽车维修','',0,1,0),(7,4,'','汽车保养','',0,1,0),(8,0,'','城市','',0,1,0),(9,34,'','Toronto','Toronto',0,1,0),(10,34,'','North-York','',0,1,0),(11,34,'','Downtown','',0,1,0),(12,34,'','Markham','',0,1,0),(13,34,'','Vaughan','',0,1,0),(14,34,'','Scarborough','',0,1,0),(15,34,'','Brampton','',0,1,0),(16,34,'','Mississauga','',0,1,0),(17,34,'','Richmond-hill','Richmond-hill',0,1,0),(18,34,'','Newmarket','',0,1,0),(19,0,'','店铺分类','',0,1,0),(20,19,'d85bbc8ef694ff9eddc10ebdbb0bf254.png','汽车贴膜','',0,1,0),(21,19,'cf3d5e9d9412aa9e5c2dbf051a901b52.png','汽车改装','',0,1,0),(22,19,'3cd1da8c1f0336c1c8cf68dfadc97694.png','汽车清洗','',0,1,0),(23,19,'','汽车售卖','',0,1,0),(24,19,'1e047624c9ac1d887699e3e9e9da8708.png','汽车保养','',0,1,0),(25,1,'','宝马','',0,1,0),(26,1,'','丰田','',0,1,0),(27,1,'','本田','',0,1,0),(28,1,'','雪佛兰','',0,1,0),(29,1,'','福克斯','',0,1,0),(30,1,'','雷洛','',0,1,0),(31,1,'','奥迪','',0,1,0),(32,1,'','阿尔法·罗密欧','',0,1,0),(33,1,'','讴歌','',0,1,0),(34,8,'','加拿大','',0,1,0),(35,8,'','中国','',0,1,0),(36,35,'','北京','',0,1,0),(37,35,'','上海','',0,1,0),(38,35,'','天津','',0,1,0),(39,35,'','重庆','',0,1,0),(40,35,'','河北','',0,1,0),(41,35,'','山西','',0,1,0),(42,35,'','吉林','',0,1,0),(43,35,'','辽宁','',0,1,0),(44,35,'','山东','',0,1,0),(45,35,'','江苏','',0,1,0),(46,35,'','浙江','',0,1,0),(47,35,'','安徽','',0,1,0),(48,35,'','福建','',0,1,0),(49,35,'','河南','',0,1,0),(50,35,'','湖北','',0,1,0),(51,35,'','湖南','',0,1,0),(52,35,'','江西','',0,1,0),(53,35,'','四川','',0,1,0),(54,35,'','云南','',0,1,0),(55,35,'','贵州','',0,1,0),(56,35,'','西藏','',0,1,0),(57,35,'','宁夏','',0,1,0),(58,35,'','新疆','',0,1,0),(59,35,'','青海','',0,1,0),(60,35,'','陕西','',0,1,0),(61,35,'','甘肃','',0,1,0),(62,35,'','广东','',0,1,0),(63,35,'','广西','',0,1,0),(64,35,'','海南','',0,1,0),(65,35,'','香港','',0,1,0),(66,35,'','澳门','',0,1,0),(67,35,'','台湾','',0,1,0),(68,35,'','内蒙古','',0,1,0),(69,35,'','黑龙江','',0,1,0),(70,19,'351a19f62839ba561f10fd26c2599a88.png','LEASE','',0,1,0),(71,19,'a5de0581a7726d26bc8fde02ad273682.png','汽车保险','',0,1,0),(72,19,'9d6a5a4b8a0c3b6135d0784ddf135219.png','交通告票','',0,1,0),(73,19,'11ac8c23d53f75c53dd07c811b515498.png','汽车维修','',0,1,0),(74,0,'','老师课程课时类型','老师课程课时类型',0,1,0),(75,74,'','一类','一类',0,1,0),(76,74,'','二类','二类',0,1,0),(77,74,'','三类','三类',0,1,0),(78,0,'','课程特色','课程特色',0,1,0),(79,78,'','证书颁发','证书颁发',0,1,0),(80,78,'','一对一授课','一对一授课',0,1,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='聊天记录';

/*Data for the table `dh_chat_log` */

insert  into `dh_chat_log`(`id`,`uid`,`to_uid`,`content`,`is_reader`,`created`) values (1,2,3,'这是我的回复信息',1,1506585491),(2,2,3,'这是我的回复信息',1,1506585529),(3,2,3,'啦咯啦咯来咯啦咯啦咯啦咯',1,1507520456),(4,2,4,'你明明',1,1507533768),(5,2,3,'hhhvvgg',1,1507780095),(6,1,2,'在么？',1,1507786921),(7,1,2,'在么？',1,1507786932),(8,2,1,'在的亲',1,1507787075),(9,2,3,'咨询一下',1,1507861793),(10,7,2,'方法公积金',1,1507877057),(11,2,7,'过敏明敏',1,1507877141),(12,7,1,'凤凰',1,1507877330),(13,2,0,'来来来',1,1507884187),(14,0,2,'这是一条回复信息',1,1508314650),(15,0,2,'这里是测试信息哦哦哦能收到么',1,1508315061),(16,7,1,'刚回家看看',1,1511335675),(17,7,1,'打广告',1,1511335707),(18,7,3,'还回家',1,1511335933),(19,2,3,'啦咯啦咯来咯啦咯啦咯啦咯',1,1511335989),(20,2,3,'咯哦哦',1,1511336016),(21,3,2,'啦啦啦',1,1511336025),(22,2,3,'来来来',1,1511336053),(23,2,3,'考虑考虑',1,1511336060),(24,2,1,'考虑考虑',1,1511336098),(25,2,3,'啦咯啦咯考虑',1,1511336177),(26,2,1,'啦咯啦咯考虑',1,1511336198),(27,2,3,'来来来',1,1511336248),(28,2,3,'来来来',1,1511336385),(29,2,3,'啦啦啦',1,1511336422),(30,2,3,'阿狸',1,1511336533),(31,2,3,'哦哦哦',1,1511336551),(32,2,3,'来来来',1,1511336718),(33,2,3,'拒绝',1,1511336738),(34,2,3,'阿狸',1,1511336747),(35,2,3,'来来来',1,1511336817),(36,2,3,'哦哦',1,1511336843),(37,2,3,'把',1,1511336958),(38,2,3,'的',1,1511337276),(39,2,3,'??',1,1511337317),(40,2,3,',ggh',1,1511750891),(41,2,3,'fff',1,1511750961),(42,2,3,'nnn',1,1511750972),(43,2,7,'cc',1,1511751015),(44,3,7,'bhh',1,1511751234);

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `dh_circle` */

insert  into `dh_circle`(`id`,`type`,`title`,`thumb`,`uid`,`description`,`ablum`,`created`,`del_status`,`status`) values (1,1,'','150632458755821.png',4,'','150632458755821.png,150632458712977.png',1506324587,0,1),(2,1,'','',4,'','',1506390246,0,1),(3,1,'','',4,'来点文字介绍了了了 ','',1506390269,0,1),(4,1,'','150639074685682.png',2,'我和你一样','150639074685682.png,150639074689516.png,150639074681938.png',1506390746,1,1),(5,1,'','150658772943247.jpeg',2,'不要说话','150658772943247.jpeg,150658772976354.jpeg,150658772972256.jpeg,150658772927363.jpeg',1506587729,1,1),(6,1,'','150761826747622.png',3,'我的分享','150761826747622.png',1507618267,1,1),(7,1,'','150787675668636.jpeg',7,'带个好飓风','150787675668636.jpeg',1507876756,1,1),(8,1,'','151064912972190.jpeg',7,'打得过不重重复复','151064912972190.jpeg',1510649128,0,1),(9,1,'','151064913125207.jpeg',12,'来咯KTV图咯哦哦','151064913125207.jpeg',1510649131,0,1),(10,1,'','151080236814844.jpeg',3,'好咯啦咯啦咯啦咯啦','151080236814844.jpeg',1510802367,1,1),(11,1,'','',3,'啦啦啦','',1510802404,1,1),(12,1,'','151080242252352.jpeg',3,'监控','151080242252352.jpeg,151080242264876.jpeg',1510802421,1,1),(13,1,'','',2,'啊啊啊???','',1510810372,1,1),(14,1,'','',2,'???','',1510810423,1,1),(15,1,'','',2,'呃呃呃','',1510906822,0,1),(16,1,'','',3,'hhh','',1510908051,0,1),(17,1,'','',7,'发个呵呵','',1510909015,0,1),(18,1,'','',3,'陌陌','',1510909021,0,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='收藏列表';

/*Data for the table `dh_collection` */

insert  into `dh_collection`(`id`,`uid`,`type`,`value`,`del_status`,`created`) values (1,1,1,'1',0,1505803330),(2,2,1,'8',1,1505900467),(3,2,1,'5',1,1506065736),(4,2,1,'5',1,1506067558),(5,2,1,'8',1,1506067564),(6,2,1,'5',1,1506067597),(7,2,1,'3',1,1506067600),(8,7,1,'11',1,1507877374),(9,7,1,'11',1,1507877377),(10,7,1,'11',0,1507877708);

/*Table structure for table `dh_column` */

DROP TABLE IF EXISTS `dh_column`;

CREATE TABLE `dh_column` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT '0' COMMENT '父级id',
  `model_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '模型id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `bname` varchar(60) DEFAULT '' COMMENT '栏目别名',
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='栏目列表';

/*Data for the table `dh_column` */

insert  into `dh_column`(`id`,`parentid`,`model_id`,`name`,`bname`,`description`,`is_show`,`url`,`jump_url`,`module`,`controller`,`action`,`sort`,`created`) values (1,0,1,'国际商学院','Business School','',1,'/content/article_list/lists','/index/business_school/about/s/cid/6','content','article_list','lists',0,1508144704),(2,0,1,'高中部','High School','',1,'/content/article_list/lists','/index/hight_school/about/s/cid/13','content','article_list','lists',0,1508144724),(3,0,1,'恒鼎社区','Community','',1,'/content/article_list/lists','/index/bbs/s/cid/23','content','article_list','lists',0,1508144740),(4,0,1,'入学必读','Must Read','',1,'/content/article_list/lists','/index/must_read/s/cid/4','content','article_list','lists',0,1508144771),(5,0,1,'关于我们','About Us','',1,'/content/article_list/lists','/index/about/s/cid/5','content','article_list','lists',0,1508144802),(6,1,1,'学院简介','College Introduction','',1,'/content/article_list/lists','/index/business_school/about/s/cid/6','content','article_list','lists',0,1508148724),(7,1,2,'恒鼎商学院教研团队','Teaching and research team','',1,'/content/article_list/lists','/index/business_school/team/s/cid/7','content','article_list','lists',0,1508148724),(8,1,3,'澳洲大学课程','Australian university course','',1,'/content/article_list/lists','/index/business_school/lession/s/cid/8','content','article_list','lists',0,1508148724),(9,1,1,'留学部','Study Abroad','',1,'/content/article_list/lists','/index/business_school/about/s/cid/9','content','article_list','lists',0,1508148724),(10,5,1,'恒鼎学院简介','College Introduction','',1,'/content/article_list/lists','/index/about/s/cid/10','content','article_list','lists',0,1508228818),(11,5,1,'联系我们','Contact Us','',1,'/content/article_list/lists','/index/about/s/cid/11','content','article_list','lists',0,1508228818),(12,5,1,'合作院校','Partner Institutions','',1,'/content/article_list/lists','/index/about/s/cid/12','content','article_list','lists',0,1508228818),(13,2,1,'部门简介','Department Profile','',1,'/content/article_list/lists','/index/hight_school/about/s/cid/13','content','article_list','lists',0,1508228969),(14,2,2,'高中部团队','Team','',1,'/content/article_list/lists','/index/hight_school/team/s/cid/14','content','article_list','lists',0,1508228969),(15,2,3,'直播课程','Live Course','',1,'/content/article_list/lists','/index/hight_school/lession/s/cid/15','content','article_list','lists',0,1508228969),(16,2,3,'视频课程','Video Course','',1,'/content/article_list/lists','/index/hight_school/lession/s/cid/16','content','article_list','lists',0,1508228969),(17,2,3,'学霸共享计划','Hegemony Program','',1,'/content/article_list/lists','/index/hight_school/lession/s/cid/17','content','article_list','lists',0,1508228969),(19,0,1,'其他栏目管理','其他栏目管理','',0,'/content/article_list/lists','','content','article_list','lists',0,1509931335),(20,19,1,'常见问题','常见问题','',1,'/content/article_list/lists','','content','article_list','lists',0,1509931438),(21,5,1,'最新资讯','Latest News','',1,'/content/article_list/lists','/index/about/news/s/cid/21','content','article_list','lists',0,1509932255),(22,5,1,'证书查询','Certificate Inquiry','',1,'/content/article_list/lists','/index/about/inquiry/s/cid/22','content','article_list','lists',0,1509932732),(23,3,1,'学习讨论专区','学习讨论专区','',1,'/content/article_list/lists','/index/bbs/s/cid/23','content','article_list','lists',0,1509946955),(24,3,1,'留学与国际专区','留学与国际专区','',1,'/content/article_list/lists','/index/bbs/s/cid/24','content','article_list','lists',0,1509946955),(25,3,1,'生活交流专区','生活交流专区','',1,'/content/article_list/lists','/index/bbs/s/cid/25','content','article_list','lists',0,1509946955),(26,3,1,'新闻教育','新闻教育','',1,'/content/article_list/lists','/index/bbs/s/cid/26','content','article_list','lists',0,1509946955),(27,19,2,'老师资质荣誉','老师资质荣誉','',1,'/content/article_list/lists','','content','article_list','lists',0,1510198703),(28,19,4,'学生下载','学生下载','',1,'/content/article_list/lists','','content','article_list','lists',0,1511776943);

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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;

/*Data for the table `dh_comment` */

insert  into `dh_comment`(`id`,`type`,`uid`,`parent_id`,`to_uid`,`content`,`del_status`,`order_sn`,`goods_id`,`ablum`,`status`,`is_uid_reader`,`is_to_uid_reader`,`created`,`hot`) values (1,1,3,0,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506327966,0),(2,1,3,0,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506327999,0),(3,1,4,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046,0),(4,1,3,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046,0),(5,1,3,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046,0),(6,1,3,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046,0),(8,2,4,0,1,'啊啊啊啊啊',0,'172646797722115621',2,'',1,0,0,1506503620,0),(10,2,4,0,1,'啊啊啊啊啊',0,'172646797722115621',2,'',1,0,0,1506504617,0),(11,1,2,0,4,'这是我的评论',0,'',1,'',1,0,0,1506566061,0),(12,1,3,0,2,'这是第一条评论',0,'',4,'',1,0,1,1506580025,0),(13,1,2,12,3,'这是我的回复信息',0,'',4,'',1,0,1,1506583717,0),(14,1,2,4,3,'哈哈哈',0,'',1,'',1,0,1,1506584079,0),(15,1,2,0,2,'明年',0,'',4,'',1,0,1,1506584114,0),(16,1,2,4,3,'回复一次',0,'',1,'',1,0,1,1506584137,0),(17,1,3,4,2,'多试一下',0,'',1,'',1,0,1,1506586051,0),(18,1,3,4,2,'我要成功',0,'',1,'',1,0,1,1506586384,0),(19,1,2,12,3,'再试一次',0,'',4,'',1,0,1,1506586970,0),(20,1,2,12,3,'最后一个',0,'',4,'',1,0,1,1506587332,0),(21,1,2,0,2,'回复所有人',0,'',4,'',1,0,1,1506588087,0),(22,2,2,0,3,'好吃吗，还不错',0,'172670845735945735',5,'150667774515869.jpeg,150667774532563.jpeg',1,0,1,1506677745,0),(23,2,2,0,3,'评价回复',0,'172717592252214453',1,'150667794196918.jpeg',1,0,1,1506677941,0),(24,1,3,0,4,'评论',0,'',3,'',1,0,0,1507623260,0),(25,1,7,0,4,'发个呵呵',0,'',1,'',1,0,0,1507876462,0),(26,1,2,0,4,'萍聚',0,'',1,'',1,0,0,1507876527,0),(27,1,1,0,4,'测试评论内容',0,'',1,'',1,0,0,1507876682,0),(28,1,1,0,4,'测试评论内容',0,'',1,'',1,0,0,1507876763,0),(29,1,7,0,2,'4一个小很可靠',0,'',5,'',1,0,1,1507876981,0),(30,1,7,0,7,'l lo o o l l l',0,'',8,'',1,0,1,1510649788,0),(31,1,7,0,7,'l lo o o l l l',0,'',8,'',1,0,1,1510649789,0),(34,1,2,0,12,'啦咯啦咯考虑',0,'',9,'',1,0,0,1510800204,0),(35,1,2,0,12,'默默',0,'',9,'',1,0,0,1510800210,0),(36,1,2,0,12,'聊聊',0,'',9,'',1,0,0,1510800216,0),(37,1,2,0,12,'得得',0,'',9,'',1,0,0,1510800221,0),(38,1,2,0,7,'寂寞了',0,'',8,'',1,0,0,1510800230,0),(39,1,2,0,7,'模拟',0,'',8,'',1,0,0,1510800235,0),(41,1,2,0,2,'胡咯哦哦',0,'',4,'',1,0,1,1510802161,0),(42,1,2,0,2,'看啦',0,'',5,'',1,0,1,1510802185,0),(46,5,10,0,0,'好啊',0,'',49,'',1,0,0,1510897486,0),(47,5,10,0,0,'我不知道你在说什么',0,'',49,'',1,0,0,1510897510,0),(48,5,10,0,0,'好得很哦',1,'',49,'',1,0,0,1510897640,0),(49,5,10,0,0,'哈哈哈哈',1,'',49,'',1,0,0,1510897721,0),(50,5,1,0,0,'这里显示评论信息哦',0,'',49,'',1,0,0,1510898365,0),(51,1,10,50,1,'你在说什么哦',0,'',49,'',1,0,0,1510900983,0),(52,1,10,50,1,'你管我说什么哦',0,'',49,'',1,0,0,1510901252,0),(53,1,2,30,7,'回复你',0,'',8,'',1,0,0,1510903774,0),(54,1,2,30,7,'摸摸',0,'',8,'',1,0,0,1510903793,0),(55,1,2,34,2,'第一条',0,'',9,'',1,0,1,1510904045,0),(56,1,2,30,7,'再试试',0,'',8,'',1,0,0,1510904764,0),(57,1,2,24,3,'啦啦啦',0,'',3,'',1,0,0,1510904787,0),(58,1,2,34,2,'啦啦啦',0,'',9,'',1,0,1,1510904831,0),(59,1,2,37,2,'把',0,'',9,'',1,0,1,1510904997,0),(60,1,2,36,2,'井口',0,'',9,'',1,0,1,1510905127,0),(61,1,2,2,2,'啊啊啊',0,'',1,'',1,0,1,1510905201,0),(62,1,2,39,2,'喇叭',0,'',8,'',1,0,1,1510905218,0),(63,1,2,28,1,'啦咯啦咯考虑',0,'',1,'',1,0,0,1510905995,0),(64,1,2,28,1,'啊啊啊',0,'',1,'',1,0,0,1510906017,0),(65,1,2,30,7,'啊啊啊',0,'',8,'',1,0,0,1510906780,0),(66,1,2,30,2,'啊啊啊',0,'',8,'',1,0,1,1510906793,0),(67,1,2,0,2,'啊啊啊',0,'',15,'',1,0,1,1510907179,0),(68,1,2,67,2,'的',0,'',15,'',1,0,1,1510907247,0),(69,1,7,0,2,'jjki',0,'',15,'',1,0,0,1510907698,0),(70,1,2,69,7,'啦啦啦',0,'',15,'',1,0,0,1510907711,0),(71,1,2,69,7,'tt',0,'',15,'',1,0,0,1510907892,0),(72,1,2,69,2,'ui',0,'',15,'',1,0,0,1510907900,0),(73,1,3,69,7,'jj',0,'',15,'',1,0,0,1510908012,0),(74,1,3,67,2,'ggg',0,'',15,'',1,0,0,1510908019,0),(75,1,7,0,3,'uuu',0,'',16,'',1,0,0,1510908057,0),(76,1,3,75,7,'yuu',0,'',16,'',1,0,0,1510908064,0),(77,1,3,75,3,'uu',0,'',16,'',1,0,0,1510908343,0),(78,1,3,0,7,'啦咯啦咯考虑',0,'',17,'',1,0,0,1510909029,0),(79,1,7,78,3,'唱歌干活',0,'',17,'',1,0,0,1510909045,0),(80,1,3,78,7,'啦啦啦',0,'',17,'',1,0,0,1510909068,0),(81,1,7,0,3,'大概哼哼唧唧',0,'',18,'',1,0,0,1510909204,0),(82,2,7,0,1,'123123',0,'173175238505612764',11,'',1,0,0,1511148993,0),(83,1,2,0,2,'yy',0,'',15,'',1,0,0,1511159889,0),(84,5,10,0,0,'fsaf',0,'',51,'',1,0,0,1511510977,0),(85,5,10,0,0,'fdsaf',0,'',51,'',1,0,0,1511510981,0),(86,5,10,0,0,'sdafdsfasdf',0,'',51,'',1,0,0,1511510984,0);

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

insert  into `dh_console_admin`(`id`,`consoleid`,`nickname`,`username`,`password`,`salt`,`mobile`,`status`,`group`,`create_ip`,`login_ip`,`created`,`login_time`) values (1,0,'四月','admin','8895c4947031a4019843c0d00fa303b1','50907','15923882847',1,1,'127.0.0.1','127.0.0.1',1502522576,1512009773),(4,0,'四月2','lingsi','b91935189cc2442e45d86a4d0dbf8a9c','34366','15923882847',1,2,'127.0.0.1','127.0.0.1',1502531990,1509696854),(5,0,'四月22','lingsi2','b8754f152f17cc72a63e6a42908ddd9b','17676','124567890',1,2,'127.0.0.1','0',1509697537,0);

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

insert  into `dh_console_group`(`id`,`name`,`power`,`status`,`level`) values (1,'超级管理员','1,2,3,4,5,35,6,7,8,10,17,11,12,13,14,15,16,18,28,19,20,21,22,23,24,25,26,27,29,30,31,33,34,32,38,39,36,37,40,41,42,43,44,45,46',1,0),(2,'运营组','1,2,35,6,7,10,17,13,14,15,16,18,28,19,20,21,22,23,24,25,26,27,29,30,31,33,34,32',1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `dh_console_menus` */

insert  into `dh_console_menus`(`id`,`type`,`parentid`,`name`,`module`,`controller`,`action`,`icon`,`parameter`,`url`,`status`,`is_show`,`is_white`,`sort`,`del_status`,`created`) values (1,1,0,'系统管理','setting','menus','index','glyphicon glyphicon-triangle-right','','',1,1,0,0,0,1502445648),(2,1,1,'设置','setting','parameter','lists','glyphicon glyphicon-wrench','','/setting/parameter/lists',1,1,0,0,0,1507788908),(3,1,2,'配置菜单','setting','menus','index','','','/setting/menus/index',1,1,0,1,0,1502508459),(4,1,3,'添加/编辑菜单','setting','menus','edit','','','',1,0,0,0,0,1502440822),(5,1,3,'树状菜单列表','setting','menus','tree_list','','','',1,0,0,0,0,1502440812),(6,1,2,'管理员','setting','admin','index','','','/setting/admin/index',1,1,0,3,0,1502516144),(7,1,6,'管理员列表','setting','admin','index','','','/setting/admin/index',1,1,0,0,0,1502517276),(8,1,6,'管理员分组','setting','group','index','','','/setting/group/index',1,1,0,0,0,1502517279),(10,1,0,'网站管理','content','list','index','glyphicon glyphicon-triangle-right','','/content/list/index',1,1,0,0,0,1505529695),(11,1,17,'博客','content','blog','index','glyphicon glyphicon-book','','/content/blog/index',1,1,0,0,0,1505577819),(12,1,11,'文章列表','content','blog','index','','','/content/blog/index',1,1,0,0,0,1505577827),(13,1,17,'分类管理','content','category','lists','glyphicon glyphicon-book','','/content/category/lists',1,1,0,1,0,1505529783),(14,1,13,'分类列表','content','category','lists','','','/content/category/lists',1,1,0,0,0,1505462341),(15,1,17,'会员管理','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529776),(16,1,15,'会员列表','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529506),(17,1,10,'内容管理','content','category','lists','glyphicon glyphicon-hdd','','/content/category/lists',1,1,0,0,0,1512010034),(18,1,15,'积分规则','content','integral_rul','lists','','','/content/integral_rul/lists',1,1,0,0,0,1505783604),(19,1,17,'商品管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784921),(20,1,19,'汽车管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784943),(21,1,19,'服务管理','content','service','lists','','','/content/service/lists',1,1,0,0,0,1505784962),(22,1,17,'广告图片管理','content','banner','lists','','','/content/banner/lists',1,1,0,2,0,1505809594),(23,1,22,'广告分类','content','banner','lists','','','/content/banner/lists',1,1,0,0,0,1505810230),(24,1,17,'搜索管理','content','search','lists','','','/content/search/lists',1,1,0,3,0,1505873873),(25,1,24,'搜索记录','content','search','lists','','','/content/search/lists',1,1,0,0,0,1505873843),(26,1,24,'推荐列表','content','search','recommend_lists','','','/content/search/recommend_lists',1,1,0,0,0,1505873952),(27,1,24,'禁用列表','content','search','disable_lists','','','/content/search/disable_lists',1,1,0,0,0,1505874438),(28,1,15,'店铺管理','content','shop','lists','','','/content/shop/lists',1,1,0,0,0,1505958027),(29,1,17,'服务管理','content','orders','lists','','','/content/orders/lists',1,1,0,0,0,1506414050),(30,1,29,'订单列表','content','orders','lists','','','/content/orders/lists',1,1,0,0,0,1506413737),(31,1,17,'推荐管理','content','recommend','car','','','/content/recommend/car',1,1,0,0,0,1506670836),(32,1,17,'抵扣卷管理','content','coupon','lists','','','/content/coupon/lists',1,1,0,0,0,1506477699),(33,1,31,'汽车列表','content','recommend','car','','','/content/recommend/car',1,1,0,0,0,1506670803),(34,1,31,'服务列表','content','recommend','service','','','/content/recommend/service',1,1,0,0,0,1506670828),(35,1,2,'参数配置','setting','parameter','lists','','','/setting/parameter/lists',1,1,0,2,0,1507778297),(36,1,10,'栏目管理','content','menus','index','glyphicon glyphicon-tasks','','/content/menus/index',1,1,0,0,0,1512010054),(37,1,36,'栏目列表','content','menus','index','','','/content/menus/index',1,1,0,0,0,1508138973),(38,1,17,'聊天管理','content','chart','lists','','','/content/chart/lists',1,1,0,4,0,1508306713),(39,1,38,'聊天记录','content','chart','lists','','','/content/chart/lists',1,1,0,0,0,1508306700),(40,1,32,'模板列表','content','coupon','lists','','','/content/coupon/lists',1,1,0,0,0,1508899352),(41,1,32,'兑换规则','content','coupon','exchange_rule_list','','','/content/coupon/exchange_rule_list',1,1,0,0,0,1508900844),(42,1,17,'APP版本管理','content','app_version','lists','','','/content/app_version/lists',1,1,0,5,0,1509524923),(43,1,6,'管理员修改','setting','personal','edit','','','/setting/personal/edit',1,1,0,0,0,1509694556),(44,1,17,'考卷管理','content','exam','lists','','','/content/exam/lists',1,1,0,0,0,1511513835),(45,1,44,'考卷列表','content','exam','lists','','','/content/exam/lists',1,1,0,0,0,1511513852),(46,1,44,'考试记录','content','exam_log','lists','','','/content/exam_log/lists',1,1,0,0,0,1512008165);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台参数配置';

/*Data for the table `dh_console_parameter` */

insert  into `dh_console_parameter`(`id`,`type`,`name`,`value`,`option`,`del_status`) values (1,1,'车行汽车交易佣金(百分比)','4','',0),(2,1,'公司电话','','',1),(3,1,'公司地址','','',1),(4,1,'公司地址英文','','',1);

/*Table structure for table `dh_coupon` */

DROP TABLE IF EXISTS `dh_coupon`;

CREATE TABLE `dh_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1满减 2折扣',
  `category` tinyint(1) unsigned NOT NULL COMMENT '所属分类',
  `uid` int(11) DEFAULT NULL COMMENT '发放者uid',
  `title` varchar(50) DEFAULT NULL COMMENT '抵扣卷名称',
  `full` decimal(10,0) DEFAULT '0' COMMENT '满多少钱',
  `less` decimal(10,0) DEFAULT '0' COMMENT '减少多少钱',
  `discount` float DEFAULT '0' COMMENT '折扣',
  `num` int(11) DEFAULT '0' COMMENT '发放数量',
  `start_time` int(11) DEFAULT '0' COMMENT '开始生效时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束生效时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `remainder_num` int(11) DEFAULT '0' COMMENT '剩余领取数量',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  `is_exchange` tinyint(1) DEFAULT '1' COMMENT '是否允许积分兑换 1允许 0不允许',
  `version` int(11) DEFAULT '1' COMMENT '版本控制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='抵扣卷模板';

/*Data for the table `dh_coupon` */

insert  into `dh_coupon`(`id`,`type`,`category`,`uid`,`title`,`full`,`less`,`discount`,`num`,`start_time`,`end_time`,`status`,`remainder_num`,`del_status`,`created`,`is_exchange`,`version`) values (2,1,23,1,'5折优惠卷','10','5',0,100,1505701881,1510329600,1,92,0,1506411977,1,9),(3,1,21,1,'5折优惠卷','1000','100',0,100,1505701881,1507564800,1,98,0,1506411977,1,9),(4,1,20,3,'满100减10','200','5',0,400,1509465600,1512057600,1,397,0,1506483325,1,4),(5,2,20,3,'这个是名称','0','0',8,55,1506787200,1509465600,1,300,0,1506483455,1,1),(6,1,21,1,'5折优惠卷','1000','100',0,100,1505701881,1507564800,1,100,0,1506491073,1,1),(7,1,21,1,'5折优惠卷','1000','100',0,100,1505701881,1507564800,1,100,0,1506491125,1,1),(8,1,23,3,'满100减5','100','5',0,200,1506528000,1506700800,1,199,0,1506562539,1,2),(9,2,21,1,'11111','0','0',5,100,2024,2026,1,100,0,1509086696,1,1),(10,1,72,47,'啦啦啦','50','5',0,1,1511413200,1511499600,1,1,0,1511413885,1,1),(11,2,72,1,'该喝喝','0','0',1,10,1514563200,1546185600,1,10,0,1511415379,1,1);

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

insert  into `dh_coupon_log`(`id`,`uid`,`coupon_id`,`order_sn`,`use_time`,`created`,`origin`) values (48,4,2,'0',0,1508914728,2),(49,4,2,'0',0,1508915046,2),(50,4,2,'0',0,1508915047,2),(51,7,4,'0',0,1510650815,2),(52,2,4,'0',0,1511147108,2);

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

/*Table structure for table `dh_enjoy` */

DROP TABLE IF EXISTS `dh_enjoy`;

CREATE TABLE `dh_enjoy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1车友圈 2文章 3评论',
  `value` varchar(10) DEFAULT '' COMMENT '对于值',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户uid',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户喜欢表';

/*Data for the table `dh_enjoy` */

insert  into `dh_enjoy`(`id`,`type`,`value`,`uid`,`created`) values (3,1,'2',2,1506577947),(4,1,'3',2,1506577953),(7,1,'4',2,1506587887),(8,1,'1',3,1507689475),(9,1,'4',3,1507689478),(10,1,'5',7,1507876874),(11,1,'6',7,1507876886),(12,1,'6',2,1507885864),(13,2,'49',10,1510900428),(14,3,'49',10,1510900671),(15,3,'50',10,1510900747),(16,2,'50',10,1510902819);

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
  `type` tinyint(4) unsigned DEFAULT '1' COMMENT '类型 1佣金提成',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `content` varchar(500) DEFAULT '' COMMENT '内容',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '是否支付 1支付 0未支付',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='财务记录';

/*Data for the table `dh_finance_log` */

insert  into `dh_finance_log`(`id`,`type`,`money`,`content`,`is_pay`,`created`) values (1,1,'2000.00','172725122012655001',0,0),(2,1,'400.00','172670845735945735',0,1507864856),(3,1,'400.00','172670367752827418',0,1507864874),(4,1,'0.28','172646797722115621',0,1507864879),(5,1,'888.88','173175238505612764',0,1510652429);

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='用户浏览记录';

/*Data for the table `dh_footprints` */

insert  into `dh_footprints`(`id`,`uid`,`type`,`value`,`value2`,`del_status`,`ip`,`created`) values (3,1,1,1,'1',0,'127.0.0.1',1508220861),(4,2,1,8,'3',0,'127.0.0.1',1511149987),(5,4,1,2,'1',0,'127.0.0.1',1506065062),(6,2,1,5,'3',0,'127.0.0.1',1510815012),(7,2,1,3,'3',0,'127.0.0.1',1506582976),(8,4,1,1,'1',0,'127.0.0.1',1506303637),(9,2,1,18,'2',0,'127.0.0.1',1507877617),(10,2,1,15,'4',0,'127.0.0.1',1507534150),(11,2,1,17,'2',0,'127.0.0.1',1507877223),(12,2,1,11,'1',0,'127.0.0.1',1510815003),(13,2,1,13,'4',0,'127.0.0.1',1507533764),(14,2,1,16,'2',0,'127.0.0.1',1507534978),(15,1,1,5,'3',0,'127.0.0.1',1507622804),(16,3,1,8,'3',0,'127.0.0.1',1507888057),(17,4,1,15,'4',0,'127.0.0.1',1507875418),(18,1,1,11,'1',0,'127.0.0.1',1507877804),(19,7,1,19,'7',0,'127.0.0.1',1507877563),(20,3,1,3,'3',0,'127.0.0.1',1507886104),(21,3,1,5,'3',0,'127.0.0.1',1507887044),(22,4,1,14,'4',0,'127.0.0.1',1508147580),(23,2,1,1,'1',0,'127.0.0.1',1510814930),(24,7,1,5,'3',0,'127.0.0.1',1511252151),(25,7,1,20,'12',0,'127.0.0.1',1510650495),(26,12,1,20,'12',0,'127.0.0.1',1510649215),(27,7,1,21,'7',0,'127.0.0.1',1510650491),(28,12,1,21,'7',0,'127.0.0.1',1510649201),(29,7,1,11,'1',0,'127.0.0.1',1511149109),(30,7,1,10,'1',0,'127.0.0.1',1511150205),(31,2,1,23,'2',0,'127.0.0.1',1510814899),(32,2,1,21,'7',0,'127.0.0.1',1510814905),(33,2,1,7,'1',0,'127.0.0.1',1510814923),(34,7,1,23,'2',0,'127.0.0.1',1511149103),(35,7,1,12,'4',0,'127.0.0.1',1511252133),(36,7,1,25,'7',0,'127.0.0.1',1511339019),(37,7,1,22,'7',0,'127.0.0.1',1511339197),(38,2,1,26,'2',0,'127.0.0.1',1511489611);

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
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '报价',
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='新车信息';

/*Data for the table `dh_goods_car` */

insert  into `dh_goods_car`(`id`,`type`,`uid`,`title`,`thumb`,`brand`,`style`,`produce_time`,`model`,`buy_time`,`mileage`,`city`,`gearbox`,`gases`,`displacement`,`model_remark`,`price`,`vin`,`guarantee`,`is_lease`,`mobile`,`weixin`,`qq`,`address`,`description`,`banner`,`status`,`hot`,`is_recommend`,`is_urgency`,`is_show`,`created`,`content`) values (1,2,3,'奥拓 A6L 1.6L 纪念版2','150578956279606.png',2,'A6L',0,' 三厢',0,1.2,'12','自动','','1.6L','纪念版2','18.00','111111','',0,'','','','','','150578956240119.jpeg,1160b7d04cc2b90ed1f42f5ff21a3a6b.jpeg,7ebadd60cc078df3d2d1fe253b02d716.jpeg',1,33,0,0,1,1505701881,'							 								 	<p><img src=\"/uploadfile/ueditor/20171128/1511867550532518.jpg\" title=\"1511867550532518.jpg\" _src=\"/uploadfile/ueditor/20171128/1511867550532518.jpg\" alt=\"002.jpg\"/></p><p><img src=\"/uploadfile/car/150882867853818.png\"/></p><p>1111</p><p><img src=\"/uploadfile/car/150882867856620.png\"/></p><p>22222</p><p><img src=\"/uploadfile/car/150882881288469.png\"/></p><p>1111</p>							 								 	'),(2,2,1,'奥迪 2013 A6L 1.6L 纪念版2','150578956279606.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','3',0,'15923882847','weixin','qq','这里是测试地址信息的','','150578956279606.png,150578956240119.jpeg',1,24,0,0,1,1505701942,NULL),(3,2,3,'大众 2017 x5 2.0 很好','150596096890834.jpeg',3,'x5',2017,'2',1420041600,2.0,'14','2','2','2.0','很好','20.00','888888','0',1,'','','','','九成新，值得入手','',1,4,1,1,1,1505706388,NULL),(4,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','',1,1,0,0,1,1505706629,NULL),(5,2,3,'奥迪 2017 23 888 很好','150596096890834.jpeg',2,'23',2017,'1',1420041600,5.0,'14','2','1','888','很好','5.00','88888996','0',0,'','','','','很好的啦','',1,10,1,1,1,1505706882,NULL),(6,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580886964585.png,150580886964659.jpeg',1,4,0,0,1,1505808869,NULL),(7,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580908058688.png,150580908096283.jpeg',1,4,0,0,1,1505809080,NULL),(8,2,3,'奥迪 2017 x6 2.0 很好的汽车，九成新','150587084744692.png',2,'x6',2017,'5',1420041600,5.0,'14','1','1','2.0','很好的汽车，九成新','20.00','66666666','0',0,'','','','','很好哦，九成新，值得入手，不要犹豫','150587084744692.png,150587084733090.png',1,12,1,1,1,1505870847,NULL),(9,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','',1,21,0,0,1,1505960899,NULL),(10,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150596096890834.jpeg,150596096837567.jpeg,150596096889744.png',1,8,0,0,1,1505960968,NULL),(11,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150908448373047.jpeg',1,'A6L',2013,' 三厢',1970,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','',0,'','','','','这里是输入商品详情的地方11111','150908448373047.jpeg,150908448396094.jpeg',1,7,0,0,1,1505961155,NULL),(12,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641899599456.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641899599456.png,150641899599165.png,150641899581683.png',1,5,0,0,1,1506418995,NULL),(13,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641904739627.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641904739627.png,150641904789466.png,150641904730885.png',1,9,0,0,1,1506419047,NULL),(14,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641910488810.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641910488810.png,150641910457982.png,150641910411562.png',1,1,0,0,1,1506419104,NULL),(15,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641947515130.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641947515130.png,150641947565011.png,150641947546598.png',1,5,0,0,1,1506419475,NULL),(16,1,2,'奥迪 2017 j6','150641999361907.jpeg',2,'j6',2017,'',1504195200,6.0,'4','','','','','13.00','','0',0,'','','','','','150641999361907.jpeg,150641999321747.jpeg,150641999369548.jpeg',1,11,0,0,1,1506419993,NULL),(17,1,2,'奥迪 2017 l6 6 备注','150642085932332.png',2,'l6',2017,'2',1504195200,6.0,'4','2','1','6','备注','13.00','kdkxjxj','0',0,'','','','','差个明模式我说问一下','150642085932332.png,150642085925946.png,150642085922650.png',2,1,0,0,1,1506420859,NULL),(18,1,2,'奥迪 2017 c6 6 备注啦啦','150647576838026.jpeg',2,'c6',2017,'1',1501516800,5.0,'2','2','1','6','备注啦啦','13.00','646797997','0',0,'','','','','详细备注，让客户更好了解车子','150647576838026.jpeg,150647576843596.jpeg,150647576844041.jpeg',1,3,0,0,1,1506475768,NULL),(19,1,7,'宝马 2017 方法个 1.6','150787632875679.jpeg',25,'方法个',2017,'1',1412092800,1.0,'1','1','1','1.6','','200000.00','地方呵呵','0',0,'','','','','','150787632875679.jpeg,150787632875775.jpeg',2,8,1,1,1,1507876328,NULL),(20,1,12,'奥拓 2016 j\'k jlade','151064777164956.jpeg',2,'j\'k',2016,'轿车',0,5.0,'18','','','','jlade','42696.00','','0',0,'','','','','kleddefenjjkkkl','151064777164956.jpeg',1,9,0,0,1,1510647771,NULL),(21,1,7,'大众 2010 Gg SDgf','151064783460072.jpeg',3,'Gg',2010,'2',1501516800,2.0,'10','','','','SDgf','57888.00','','0',0,'','','','','DffFggggvvbbv','151064783460072.jpeg',1,7,0,0,1,1510647833,NULL),(22,1,7,'奥拓 1995 jk','151071339053179.jpeg',2,'jk',1995,'两厢',0,5.0,'11','','','','','556555.00','','0',0,'','','','','','151071339053179.jpeg',1,7,0,0,1,1510713390,NULL),(23,1,2,'大众 井口 3000-5000','151080029794413.jpeg',3,'井口',0,'',0,0.0,'15','100-20','','3000-5000','','55566.00','','0',0,'','','','','','151080029794413.jpeg',1,8,0,0,1,1510800297,NULL),(24,1,2,'大众 gg','151114603617434.jpeg',3,'gg',0,'',0,0.0,'15','','','','','55.66','','0',0,'','','','','','151114603617434.jpeg',1,1,0,0,1,1511146035,NULL),(25,1,7,'大众 jj','151133554684429.jpeg',3,'jj',0,'',0,0.0,'11','','','','','25456.00','','0',1,'','','','','','151133554684429.jpeg',1,2,0,0,1,1511335545,NULL),(26,1,2,'丰田 jh','151148960645716.jpeg',26,'jh',0,'',0,0.0,'11','','','','','5555.00','','0',0,'','','','','','151148960645716.jpeg',1,2,0,0,1,1511489605,NULL),(27,2,3,'大众 hh','151175145173734.jpeg',3,'hh',0,'',1509465600,0.0,'15','','','','','5556.00','','',0,'','','','','ghh','151175145173734.jpeg',1,1,0,0,1,1511751451,NULL),(28,1,2,'大众 hh','151175175310604.jpeg',3,'hh',0,'',1509465600,0.0,'11','','','','','85655.00','','0',0,'','','','','','151175175310604.jpeg,151175185631744.jpeg',1,1,0,0,1,1511751753,NULL);

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

insert  into `dh_goods_service`(`id`,`uid`,`title`,`thumb`,`type`,`price`,`ablum`,`description`,`status`,`hot`,`orders`,`is_show`,`del_status`,`created`) values (2,1,'免费贴膜','150578927012952.jpeg',5,'9.90','150821383156398.png,150821331844571.jpeg,150821331888741.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1,0,1,0,1505702940),(3,1,'免费贴膜','150578927012952.jpeg',20,'9.90','','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505703219),(4,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570322945362.png,150570322992738.jpeg,150570322914812.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505703229),(5,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570424689878.png,150570424614177.jpeg,150570424697703.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704246),(6,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570433438039.png,150570433448718.jpeg,150570433473341.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704334),(7,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570437049342.png,150570437077162.jpeg,150570437034977.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,3,0,1,0,1505704370),(8,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570449431456.png,150570449497171.jpeg,150570449483501.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,4,1,1,0,1505704494),(10,1,'哇哈哈哈哈','150570605387503.png',20,'面议','150570605387503.png,150570605341278.jpeg,150570605343313.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,16,2,1,0,1505706053),(11,3,'200','150578927012952.jpeg',1,'200.00','150571629162506.jpeg,150571629146095.jpeg','主要针对劳斯莱斯、布加迪等维修保养',1,43,1,1,0,1505716291),(12,3,'500000','',23,'500000.00','150667581778763.jpeg,150821479867131.png','服务详情还能再说什么',2,0,0,1,0,1506675817),(13,8,'Do Che','',22,'25.00','','Asdfsadfsadfwer',1,2,1,1,0,1511148592),(14,3,'看看','',24,'800.00','','涂抹木事啊！',4,0,0,1,0,1511243240);

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='积分详情';

/*Data for the table `dh_integral_log` */

insert  into `dh_integral_log`(`id`,`uid`,`flag`,`value`,`content`,`created`) values (1,1,'user_daily_bonus',30,'每日签到',1508997148),(2,1,'user_daily_bonus',30,'每日签到',1509087244),(3,10,'user_registered',300,'注册赠送',1510108380),(4,11,'user_registered',300,'注册赠送',1510111463),(5,12,'user_daily_bonus',30,'每日签到',1510646672),(6,7,'user_daily_bonus',30,'每日签到',1510646674),(7,7,'user_share',50,'每日分享赠送',1510649128),(8,12,'user_share',50,'每日分享赠送',1510649131),(9,7,'buy_orders_car',1000,'汽车订单交易完成',1510650761),(10,7,'user_get_coupon',-600,'领取汽车贴膜优惠卷',1510650815),(11,7,'buy_orders_service',100,'汽车服务交易完成',1510651077),(12,7,'buy_orders_car',1000,'汽车订单交易完成',1510651600),(13,7,'buy_orders_service',100,'汽车服务交易完成',1510651854),(14,1,'user_daily_bonus',30,'每日签到',1510651924),(15,2,'buy_orders_service',100,'汽车服务交易完成',1510652236),(16,7,'buy_orders_service',100,'汽车服务交易完成',1510652259),(17,7,'buy_orders_car',1000,'汽车订单交易完成',1510652429),(18,13,'user_registered',300,'注册赠送',1510734649),(19,3,'user_share',50,'每日分享赠送',1510802367),(20,2,'user_share',50,'每日分享赠送',1510810372),(21,2,'user_share',50,'每日分享赠送',1510906822),(22,3,'user_share',50,'每日分享赠送',1510908051),(23,7,'user_share',50,'每日分享赠送',1510909015),(24,2,'user_get_coupon',-600,'领取汽车贴膜优惠卷',1511147108),(25,7,'buy_orders_service',100,'汽车服务交易完成',1511148966),(26,14,'user_registered',300,'注册赠送',1511416067),(27,15,'user_registered',300,'注册赠送',1511424260),(28,16,'user_registered',300,'注册赠送',1511428543);

/*Table structure for table `dh_integral_rul` */

DROP TABLE IF EXISTS `dh_integral_rul`;

CREATE TABLE `dh_integral_rul` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `flag` varchar(100) DEFAULT '' COMMENT '标识符',
  `value` int(11) DEFAULT NULL COMMENT '积分数',
  `content` varchar(350) DEFAULT NULL COMMENT '规则内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1开启 0关闭',
  `limit` varchar(500) DEFAULT '' COMMENT '限制参数 json格式',
  PRIMARY KEY (`id`),
  KEY `flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='积分规则';

/*Data for the table `dh_integral_rul` */

insert  into `dh_integral_rul`(`id`,`flag`,`value`,`content`,`status`,`limit`) values (1,'user_registered',300,'注册赠送',1,''),(2,'user_daily_bonus',30,'每日签到',1,''),(3,'user_share',50,'每日分享赠送',1,''),(4,'buy_orders_car',1000,'汽车订单交易完成',1,'[\"23\"]'),(5,'buy_orders_service',100,'汽车服务交易完成',1,'[\"20\",\"21\",\"22\",\"24\",\"70\",\"71\",\"72\",\"73\"]');

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

/*Table structure for table `dh_orders` */

DROP TABLE IF EXISTS `dh_orders`;

CREATE TABLE `dh_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1汽车 2服务 3课程',
  `order_sn` char(18) NOT NULL DEFAULT '' COMMENT '订单编号',
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
  `coupon_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '优惠金额',
  `fare_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '支付状态 1支付 0未支付',
  `is_modify` tinyint(1) unsigned DEFAULT '0' COMMENT '是否修改价格 1修改 0未修改',
  `is_temp` tinyint(1) DEFAULT '0' COMMENT '是否临时订单 1是 0否',
  `is_percentage` tinyint(1) DEFAULT '0' COMMENT '手续费结算 1已收取 0未收取',
  `pass_time` int(10) unsigned DEFAULT '0' COMMENT '订单确认操作时间',
  `status_time` int(10) unsigned DEFAULT '0' COMMENT '订单审核操作时间',
  `close_time` int(11) unsigned DEFAULT '0' COMMENT '订单关闭操作时间',
  `success_time` int(11) unsigned DEFAULT '0' COMMENT '订单完成时间',
  `origin` tinyint(1) unsigned DEFAULT '0' COMMENT '来源 0未知 1安卓 2IOS 3PC 4微信 5WAP',
  `version` varchar(10) DEFAULT '0' COMMENT '版本号',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `dh_orders` */

insert  into `dh_orders`(`id`,`type`,`order_sn`,`uid`,`seller_uid`,`message`,`seller_message`,`order_status`,`status`,`del_status`,`del_uid`,`del_seller`,`acount_original`,`acount`,`coupon_price`,`fare_price`,`is_pay`,`is_modify`,`is_temp`,`is_percentage`,`pass_time`,`status_time`,`close_time`,`success_time`,`origin`,`version`,`created`) values (18,3,'173175139456615895',10,0,'','',1,1,0,0,0,'9.90','9.90','0.00','0.00',1,0,0,0,0,0,0,0,0,'0',1510651394),(19,1,'173175149025196950',7,1,'发过火就你那','',5,1,0,0,0,'18.00','45.00','0.00','0.00',0,0,0,0,1510651585,0,0,1510651600,0,'v1',1510651489),(20,2,'173175150355360857',2,3,'','',4,1,0,0,0,'200.00','300.00','0.00','0.00',0,0,0,0,1510651679,0,0,1510652236,0,'v1',1510651503),(21,2,'173175178358449589',7,1,'的GV吃饭顾u','',5,1,0,0,0,'10.00','43.00','0.00','0.00',0,0,0,0,1510651843,0,0,1510651854,0,'v1',1510651783),(22,2,'173175223026959624',7,1,'','',4,1,0,0,0,'9.90','555.00','0.00','0.00',0,0,0,0,1510652246,0,0,1510652259,2,'v1',1510652230),(23,1,'173175238505612764',7,1,'','',5,1,0,0,0,'18.00','22222.00','0.00','0.00',0,0,0,0,1510652421,0,0,1510652429,2,'v1',1510652384),(24,3,'173200718493192019',10,0,'','',1,1,0,0,0,'9.90','9.90','0.00','0.00',0,0,0,0,0,0,0,0,0,'0',1510907184),(25,2,'173234890291506702',7,8,'111','',4,1,0,0,0,'25.00','25.00','0.00','0.00',0,0,0,0,1511148931,0,0,1511148966,2,'v1',1511148902),(26,3,'173253093980531653',7,0,'','',1,1,0,0,0,'0.00','0.00','0.00','0.00',1,0,0,0,0,0,0,0,0,'0',1511330939),(27,2,'173254170084106089',4,1,'','',1,3,0,0,0,'10.00','10.00','0.00','0.00',0,0,0,0,0,0,0,0,0,'v1',1511341700),(28,2,'173254200159989178',4,1,'','',1,3,0,0,0,'面议','面议','0.00','0.00',0,0,0,0,0,0,0,0,0,'v1',1511342001),(29,2,'173254225276371328',4,1,' ','',1,3,0,0,0,'面议','面议','0.00','0.00',0,0,0,0,0,0,0,0,0,'v1',1511342252),(30,3,'173262342700608941',4,0,'','',1,1,0,0,0,'100.00','100.00','0.00','0.00',1,0,0,0,0,0,0,0,0,'0',1511423426),(31,3,'173262955579563106',4,0,'','',1,1,0,0,0,'9.90','9.90','0.00','0.00',1,0,0,0,0,0,0,0,0,'0',1511429555),(32,3,'173324012403488419',10,0,'','',1,1,0,0,0,'9.90','9.90','0.00','0.00',1,0,0,0,0,0,0,0,0,'0',1511940123);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `dh_orders_car` */

insert  into `dh_orders_car`(`id`,`order_sn`,`ascription`,`start_time`,`end_time`,`goods_id`,`title`,`thumb`,`produce_time`,`mileage`,`price_original`,`price`,`is_modify`,`coupon_id`,`mobile`) values (3,'173175149025196950',2,1510737840,0,10,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg','2013','1.2','18.00','18.00',0,0,'15558'),(4,'173175238505612764',2,1510736440,2017,11,'汽车品牌 2013 A6L 1.6L 纪念版2','150908448373047.jpeg','2013','1.2','18.00','18.00',0,0,'67788');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='课程表';

/*Data for the table `dh_orders_course` */

insert  into `dh_orders_course`(`id`,`teacher_uid`,`order_sn`,`title`,`btitle`,`goods_id`,`sign`,`num`,`class_time`,`class_time_en`,`thumb`,`nickname`,`mobile`) values (17,8,'173262955579563106','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','','1111'),(18,8,'173324012403488419','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','','15923882847'),(13,8,'173175139456615895','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','哈哈哈','11111'),(15,8,'173253093980531653','测试','',59,1,0,'','','','17300289310','17300289310'),(16,8,'173262342700608941','测试','',59,2,0,'','','','','15923882848'),(14,8,'173200718493192019','雅思7.5分精品课程','雅思7.5分精品课程',47,1,6,'上课时间中文','上课时间英文','6109903a4f0399518bc5829b01559ccc.jpeg','哈哈哈','123445');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='订单服务详情';

/*Data for the table `dh_orders_service` */

insert  into `dh_orders_service`(`id`,`type`,`order_sn`,`vin`,`start_time`,`end_time`,`ablum`,`brand`,`style`,`produce_time`,`buy_time`,`mileage`,`goods_id`,`price`,`price_original`,`title`,`thumb`,`model`,`mobile`) values (3,1,'173175150355360857','',1510824360,0,'','大众','j8','2016年',1504195200,'5.0',11,'200.00','200.00','200','150578927012952.jpeg','','4558755885'),(4,20,'173175178358449589','',1510738200,0,'','大众','','',0,'556588.0',8,'10.00','10.00','免费贴膜','150578927012952.jpeg','','556588'),(5,20,'173175223026959624','',1510738680,2017,'','奥拓','','',0,'55667.0',10,'9.90','9.90','免费贴膜','150578927012952.jpeg','','55667'),(6,22,'173234890291506702','',1511321760,2017,'','大众','','',0,'999999999.9',13,'25.00','25.00','Do Che','','','15572695368'),(7,20,'173254170084106089','',1511359740,0,'','丰田','','',0,'999999999.9',7,'10.00','10.00','免费贴膜','150578927012952.jpeg','','1596555255'),(8,20,'173254200159989178','',1511352840,0,'','奥迪','','',0,'159655222.0',10,'0.00','0.00','哇哈哈哈哈','150570605387503.png','','159655222'),(9,20,'173254225276371328','',1511349480,0,'','汽车改装','A8','2017',1000000,'0.0',10,'0.00','0.00','哇哈哈哈哈','150570605387503.png','','15566886');

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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `dh_shop_hot_log` */

insert  into `dh_shop_hot_log`(`id`,`uid`,`num`,`time`) values (20,7,1,'2017-10-18'),(19,1,8,'2017-10-17'),(18,4,1,'2017-10-16'),(17,7,1,'2017-10-13'),(16,1,10,'2017-10-13'),(15,2,5,'2017-10-13'),(14,4,1,'2017-10-13'),(13,3,9,'2017-10-13'),(12,3,1,'2017-10-12'),(11,1,1,'2017-10-11'),(21,3,2,'2017-10-18'),(22,1,3,'2017-10-23'),(23,4,1,'2017-10-27'),(24,1,2,'2017-10-31'),(25,1,81,'2017-11-01'),(26,3,3,'2017-11-01'),(27,1,4,'2017-11-02'),(28,3,9,'2017-11-14'),(29,12,6,'2017-11-14'),(30,7,3,'2017-11-14'),(31,1,7,'2017-11-14'),(32,3,1,'2017-11-15'),(33,7,8,'2017-11-16'),(34,12,2,'2017-11-16'),(35,2,8,'2017-11-16'),(36,3,4,'2017-11-16'),(37,1,5,'2017-11-16'),(38,3,23,'2017-11-20'),(39,1,6,'2017-11-20'),(40,8,2,'2017-11-20'),(41,2,1,'2017-11-20'),(42,1,1,'2017-11-21'),(43,4,1,'2017-11-21'),(44,3,1,'2017-11-21'),(45,3,24,'2017-11-22'),(46,1,19,'2017-11-22'),(47,2,1,'2017-11-22'),(48,7,2,'2017-11-22'),(49,1,3,'2017-11-23'),(50,2,1,'2017-11-24'),(51,1,1,'2017-11-24'),(52,4,3,'2017-11-28'),(53,3,13,'2017-11-28');

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='短信发送记录';

/*Data for the table `dh_sms_log` */

insert  into `dh_sms_log`(`id`,`flag`,`mobile`,`content`,`ip`,`created`) values (1,'verification',NULL,'Code:15445','127.0.0.1',1508384351),(2,'verification','18725796416','Code:38273','127.0.0.1',1508755600),(3,'verification','18725796416','Code:48179','127.0.0.1',1508757424),(4,'verification','15923882847','[POCKET auto.ca] Verif Code:69620','127.0.0.1',1511323222),(5,'verification','18523563220','[POCKET auto.ca] Verif Code:54977','127.0.0.1',1511328888),(6,'verification','18523563220','[POCKET auto.ca] Verif Code:44674','127.0.0.1',1511329947),(7,'verification','18523563220','[POCKET auto.ca] Verif Code:64523','127.0.0.1',1511330652),(8,'verification','18523563220','[POCKET auto.ca] Verif Code:29983','127.0.0.1',1511331783),(9,'verification','18523563220','[POCKET auto.ca] Verif Code:32408','127.0.0.1',1511332482),(10,'verification','18523563220','[POCKET auto.ca] Verif Code:35080','127.0.0.1',1511332919),(11,'verification','13896568031','[POCKET auto.ca] Verif Code:70798','127.0.0.1',1511332952),(12,'verification','13896568031','[POCKET auto.ca] Verif Code:46449','127.0.0.1',1511333748),(13,'verification','17300289310','[POCKET auto.ca] Verif Code:66761','127.0.0.1',1511335827);

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

insert  into `dh_sms_verify`(`id`,`mobile`,`code`,`created`) values (4,'15923882847','69620',1511323222),(2,'18523563220','35080',1511332919),(5,'18725796416','48179',1508757424),(6,'13896568031','46449',1511333748),(7,'17300289310','66761',1511335827);

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='附件上传记录';

/*Data for the table `dh_upload_log` */

insert  into `dh_upload_log`(`id`,`ext`,`name`,`size`,`path`,`url`,`created`) values (19,'mp4','1080P测试视频.mp4',394566,'test','1512008723316_19.mp4',1512008723),(18,'zip','002.zip',13386,'category','1512007690259_18.zip',1512007690),(17,'zip','002.zip',13386,'test','1511948364644_17.zip',1511948364),(16,'zip','002.zip',13386,'test','1511948358134_16.zip',1511948358),(15,'zip','002.zip',13386,'test','1511948337489_1.zip',1511948337);

/*Table structure for table `dh_user` */

DROP TABLE IF EXISTS `dh_user`;

CREATE TABLE `dh_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家',
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `avatar` varchar(60) DEFAULT 'default.png' COMMENT '头像地址',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `mail` varchar(50) DEFAULT '' COMMENT '邮箱',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `address` varchar(300) DEFAULT '' COMMENT '家庭地址',
  `salt` char(5) DEFAULT '' COMMENT '随机码',
  `token` char(32) DEFAULT '',
  `time_out` int(10) unsigned DEFAULT '0' COMMENT 'token到期时间',
  `ip` varchar(18) DEFAULT '' COMMENT '注册ip',
  `integral` int(10) unsigned DEFAULT '0' COMMENT '积分',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 2禁用',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `login_ip` char(18) DEFAULT '' COMMENT '最近一次登录ip',
  `login_time` int(10) unsigned DEFAULT '0' COMMENT '最近一次登录时间',
  `created` int(11) unsigned DEFAULT '0' COMMENT '注册时间',
  `is_message` tinyint(1) DEFAULT '1' COMMENT '锁屏新消息是否开启 1开启 0不开启',
  `version` int(11) DEFAULT '0' COMMENT '版本控制',
  `imei` varchar(300) DEFAULT '' COMMENT '设备编码',
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `imei` (`imei`(255)),
  KEY `username` (`username`),
  KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user` */

insert  into `dh_user`(`id`,`type`,`uid`,`username`,`nickname`,`real_name`,`avatar`,`mobile`,`mail`,`password`,`address`,`salt`,`token`,`time_out`,`ip`,`integral`,`status`,`del_status`,`login_ip`,`login_time`,`created`,`is_message`,`version`,`imei`) values (1,2,185687,'cheng6251','零零距离','四月','151071464170191.jpeg','13425778542','','8716773dd45d75071f72af288df92cbc','','26979','c9a475795f0ecdfd9a9c6d215a10d17a',1511948614,'127.0.0.1',3090,1,0,'127.0.0.1',1511772272,1505292648,1,0,'89b95b112415113e'),(2,1,158566,'weixuelin','魏雪林','','150631954346095.jpeg','18523563220','6497646qw@163.com','8bd0f5ab11bb757fdbefb7d8194f8c55','','21749','015d7b96cc0839090a84c09f0d197a76',1512109675,'127.0.0.1',95190,1,0,'127.0.0.1',1511926612,1505293289,1,0,'ceadcf79f7ed11e1'),(3,2,158563,'kuangxin','kuangxin','四月2','150631954346095.jpeg','13896568031','','01bafc44de12208bb48680dca2ea4c16','','12532','e3de1291e39e5e7330fff7827b1021d7',1511924484,'127.0.0.1',100220,1,0,'127.0.0.1',1511751058,1505368006,1,0,'ceadcf79f7ed11e1'),(4,1,158562,'四月个人用户','四月个人用户','四月学生账户','b68334b285d00235e85ef3950af64902.jpeg','15923882847','','8716773dd45d75071f72af288df92cbc','','26979','821cb8aa53b36f3fb0801359ee95daea',1512032164,'127.0.0.1',92030,1,0,'127.0.0.1',1511853560,1506063155,1,0,'89b95b112415113e'),(5,1,158561,'123456','123456','','','15923882847','','509849f59071c6829ea94459620d9026','','59117','',0,'127.0.0.1',100000,1,0,'',0,1506395554,1,0,''),(6,1,939178,'1234567','1234567','','','15923882847','','de7a8d21b859e33d6fbee46781a4e08d','','50621','',0,'127.0.0.1',100000,1,0,'',0,1506395715,1,0,''),(7,1,939112,'17300289310','17300289310','张妮莎','38f93e0fa73c6611748b77395171054b.jpeg','17300289310','','f06e72440b2e292521da336f02a48ff4','','26979','9de1b66a80b4028d7c113d477063b5d8',1511514047,'127.0.0.1',3060,1,0,'127.0.0.1',1511335892,1507874410,1,0,'1a7afa9face43399'),(8,2,939121,'17300289310','17300289310','sasa','3b20052cc10f3b112c399c5ea37760df.jpeg','17300289310','','737b15b43038cfb42518a58e374d0e48','','41893','3d60fe607b6a44942c811f94cb7a31a4',1512120983,'127.0.0.1',130,1,0,'127.0.0.1',1511940291,1507879382,1,0,'af7edd1981448b5b'),(9,1,939125,'aaaa','aaaa','','','15923882847','','91f0d0a199ecfcfe871da82021a1740c','','71111','',0,'127.0.0.1',100,1,0,'',0,1508130313,1,0,''),(10,1,939110,'cheng6251','四月程序开发','四月学生','74c418dca7b80a5334c8a83cdce0c710.jpeg','15923882847','350375092@qq.com','2ebe69b2efe2b1886817cff244fe23dd','这里是家庭地址显示信息','92683','381bbde7b5c93b316330e4d1cd5e929a',1512200344,'127.0.0.1',300,1,0,'127.0.0.1',1512023508,1510108380,1,0,'1a7afa9face43399'),(11,1,939111,'cheng62511','cheng62511','','','15923882847','12345','def745d7c9e2bd66dc312cd4ca47dd61','','34235','',0,'127.0.0.1',300,1,0,'',0,1510111463,1,0,''),(12,1,939135,'Ce shi@qq.bvc','Ce shi@qq.bvc','','151064961335946.jpeg','18696784295','','37adb45d9a61beca41b3d931c1eb3ec4','','70327','140fb730442712b0fb2d6edb99166848',1510822487,'14.111.53.175',80,1,0,'127.0.0.1',1510646668,1510547361,1,0,'ADAB602A37C145D5976C69E196F03CFD'),(13,1,329513,'aaa','aaa','','','15923882846','350375092@qq.com','155be0fcabfc9117c654fdfb53840368','','51500','',0,'127.0.0.1',300,1,0,'',0,1510734649,1,0,''),(14,1,666214,'abcaaaa','abcaaaa','','','159222222','981622394@qq.com','549ad49ea9bef745a6f68f31b7d1efa4','','61970','',0,'127.0.0.1',300,1,0,'',0,1511416067,1,0,''),(16,1,126515,'测试','测试','','','15215051909','','b1b5fe199cb168e7c74fa4cff227fb32','','51616','',0,'127.0.0.1',300,1,0,'',0,1511428543,1,0,'');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户考试记录';

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
  `type` tinyint(1) DEFAULT '1' COMMENT '类型1站内信 2评论 3聊天',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '发送者uid 0系统消息',
  `to_uid` int(10) unsigned DEFAULT '0' COMMENT '接受信息用户id',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `content` mediumtext COMMENT '消息内容',
  `jump_app` varchar(300) DEFAULT '' COMMENT 'app原生跳转参数',
  `is_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '读取状态 1已读 0未读',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  `uid_important` tinyint(1) DEFAULT '0' COMMENT '发送者标记重要 1标记 0未标记',
  `touid_important` tinyint(1) DEFAULT '0' COMMENT '接收者标记重要 1标记 0未标记',
  `uid_del_status` tinyint(1) DEFAULT '0' COMMENT '发送者删除状态 1删除 0未删除',
  `touid_del_status` tinyint(1) DEFAULT '0' COMMENT '发送者删除状态 1删除 0未删除',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `is_reader` (`is_reader`),
  KEY `del_status` (`del_status`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_message` */

insert  into `dh_user_message`(`id`,`type`,`uid`,`to_uid`,`title`,`content`,`jump_app`,`is_reader`,`del_status`,`created`,`uid_important`,`touid_important`,`uid_del_status`,`touid_del_status`) values (18,1,0,10,'','恭喜你成为会员,祝你购车愉快','',0,0,1510108380,0,0,0,0),(19,1,0,11,'','恭喜你成为会员,祝你购车愉快','',0,0,1510111463,0,0,0,0),(20,2,0,7,'','会员17300289310,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":8}',1,0,1510649789,0,0,0,0),(21,1,0,1,'','你有新的预约订单','{\"type\":2,\"order_sn\":\"173175061290223597\"}',1,0,1510650612,0,0,0,0),(22,1,0,7,'','商家：[四月工作室]修改了预约时间,请及时确认','{\"type\":2,\"order_sn\":\"173175061290223597\"}',1,0,1510650646,0,0,0,0),(23,1,0,1,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173175093173557374\"}',1,0,1510650931,0,0,0,0),(24,1,0,7,'','商家：[四月工作室]已确认你的预约，准时到达，商家电话：13425778542','{\"type\":3,\"order_sn\":\"173175093173557374\"}',1,0,1510651048,0,0,0,0),(25,1,0,3,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173175120387212833\"}',1,0,1510651203,0,0,0,0),(26,1,0,1,'','你有新的预约订单','{\"type\":2,\"order_sn\":\"173175149025196950\"}',1,0,1510651489,0,0,0,0),(27,1,0,3,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173175150355360857\"}',1,0,1510651503,0,0,0,0),(28,1,0,7,'','商家：[四月工作室]已确认你的预约，准时到达，商家电话：13425778542','{\"type\":2,\"order_sn\":\"173175149025196950\"}',1,0,1510651585,0,0,0,0),(29,1,0,2,'','商家：[kuangxin]已确认你的预约，准时到达，商家电话：13896568031','{\"type\":3,\"order_sn\":\"173175150355360857\"}',1,0,1510651679,0,0,0,0),(30,1,0,1,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173175178358449589\"}',1,0,1510651783,0,0,0,0),(31,1,0,7,'','商家：[四月工作室]已确认你的预约，准时到达，商家电话：13425778542','{\"type\":3,\"order_sn\":\"173175178358449589\"}',1,0,1510651843,0,0,0,0),(32,1,0,1,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173175223026959624\"}',1,0,1510652230,0,0,0,0),(33,1,0,7,'','商家：[四月工作室]已确认你的预约，准时到达，商家电话：13425778542','{\"type\":3,\"order_sn\":\"173175223026959624\"}',1,0,1510652246,0,0,0,0),(34,1,0,1,'','你有新的预约订单','{\"type\":2,\"order_sn\":\"173175238505612764\"}',1,0,1510652384,0,0,0,0),(35,1,0,7,'','商家：[四月工作室]已确认你的预约，准时到达，商家电话：13425778542','{\"type\":2,\"order_sn\":\"173175238505612764\"}',1,0,1510652421,0,0,0,0),(36,1,0,13,'','恭喜你成为会员,祝你购车愉快','',0,0,1510734649,0,0,0,0),(37,2,0,12,'','会员魏雪林,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":9}',0,0,1510800327,0,0,0,0),(38,2,0,7,'','会员魏雪林,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":8}',1,0,1510800235,0,0,0,0),(39,2,0,2,'','会员魏雪林,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":4}',1,0,1511159889,0,0,0,0),(40,2,10,1,'','会员四月程序开发,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"49\"}',1,0,1510901252,0,0,0,0),(41,2,2,7,'','会员魏雪林,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"8\"}',1,0,1510907892,0,0,0,0),(42,2,2,2,'','会员魏雪林,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"9\"}',1,0,1510907900,0,0,0,0),(43,2,2,3,'','会员魏雪林,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"3\"}',1,0,1510904787,0,0,0,0),(44,2,2,1,'','会员魏雪林,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"1\"}',1,0,1510906017,0,0,0,0),(45,2,0,2,'','会员17300289310,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":15}',1,0,1510907698,0,0,0,0),(46,2,3,7,'','会员kuangxin,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"15\"}',1,0,1510909068,0,0,0,0),(47,2,3,2,'','会员kuangxin,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"15\"}',1,0,1510908019,0,0,0,0),(48,2,0,3,'','会员17300289310,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":16}',1,0,1510909204,0,0,0,0),(49,2,3,3,'','会员kuangxin,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"16\"}',1,0,1510908343,0,0,0,0),(50,2,0,7,'','会员kuangxin,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":17}',1,0,1510909029,0,0,0,0),(51,2,7,3,'','会员17300289310,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":\"17\"}',1,0,1510909045,0,0,0,0),(52,1,0,8,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173234890291506702\"}',1,0,1511148902,0,0,0,0),(53,1,0,7,'','商家：[17300289310]已确认你的预约，准时到达，商家电话：17300289310','{\"type\":3,\"order_sn\":\"173234890291506702\"}',1,0,1511148931,0,0,0,0),(54,3,7,1,'','你有新的消息','',1,0,1511335707,0,0,0,0),(55,3,7,3,'','你有新的消息','',1,0,1511335933,0,0,0,0),(56,3,2,3,'','你有新的消息','',1,0,1511750972,0,0,0,0),(57,3,3,2,'','你有新的消息','',1,0,1511336025,0,0,0,0),(58,3,2,1,'','你有新的消息','',1,0,1511336198,0,0,0,0),(59,1,0,1,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173254170084106089\"}',1,0,1511341700,0,0,0,0),(60,1,0,1,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173254200159989178\"}',1,0,1511342001,0,0,0,0),(61,1,0,1,'','你有新的预约订单','{\"type\":3,\"order_sn\":\"173254225276371328\"}',1,0,1511342252,0,0,0,0),(62,1,0,14,'','恭喜你成为会员,祝你购车愉快','',0,0,1511416067,0,0,0,0),(63,1,0,15,'','恭喜你成为会员,祝你购车愉快','',0,0,1511424260,0,0,0,0),(64,1,0,16,'','恭喜你成为会员,祝你购车愉快','',0,0,1511428543,0,0,0,0),(65,3,2,7,'','你有新的消息','',0,0,1511751015,0,0,0,0),(66,3,3,7,'','你有新的消息','',0,0,1511751234,0,0,0,0);

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
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `goods_num` int(11) unsigned DEFAULT '0' COMMENT '服务类商品数量',
  `orders` int(11) DEFAULT '0' COMMENT '订单成功总量',
  `name` varchar(50) DEFAULT '' COMMENT '店铺名称',
  `avatar` varchar(60) DEFAULT '' COMMENT '店铺头像',
  `credit_level` tinyint(1) unsigned DEFAULT '0' COMMENT '平均信用等级 共50分 5星',
  `woker_time` varchar(100) DEFAULT '' COMMENT '工作时间',
  `address` varchar(150) DEFAULT '' COMMENT '地址',
  `category` varchar(20) DEFAULT '0' COMMENT '分类id',
  `ablum` varchar(300) DEFAULT '' COMMENT '店铺照片',
  `ide_ablum` varchar(300) DEFAULT '' COMMENT '认证照片',
  `is_ide` tinyint(1) unsigned DEFAULT '0' COMMENT '认证状态 0未认证 1已认证 2认证未通过 3申请认证中',
  `is_message` tinyint(1) unsigned DEFAULT '1' COMMENT '锁屏新消息是否开启 1开启 0不开启',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '店铺状态 1开启 2关闭',
  `is_recommend` tinyint(1) unsigned DEFAULT '0' COMMENT '店铺推荐 1推荐 0未推荐',
  `lng` float unsigned DEFAULT '0' COMMENT '经度',
  `lat` float unsigned DEFAULT '0' COMMENT '维度',
  `orders_service` int(11) DEFAULT '0' COMMENT '服务订单交易数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_shop` */

insert  into `dh_user_shop`(`id`,`uid`,`goods_num`,`orders`,`name`,`avatar`,`credit_level`,`woker_time`,`address`,`category`,`ablum`,`ide_ablum`,`is_ide`,`is_message`,`status`,`is_recommend`,`lng`,`lat`,`orders_service`) values (1,1,8,0,'零零距离','151071464170191.jpeg',46,'9','重庆市南岸区万寿路','72,71,23,20','','150788710993696.png',1,0,1,1,106.559,29.5303,3),(2,3,1,0,'kuangxin','150588957988857.jpeg',49,'09:00-18:00','重庆市南岸区湖滨路172号','70,72,71,23,21,22,73','151081540187934.jpeg,151081540194578.jpeg','150588960214710.png',1,0,1,1,106.563,29.5272,1),(3,8,1,0,'17300289310','151125151788955.jpeg',30,'5～7','重庆市南岸区南坪西路174号','72','','',1,1,1,0,106.563,29.5272,1);

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
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `parent_id` (`parent_id`),
  KEY `is_show` (`is_show`),
  KEY `nickname` (`nickname`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='游客评论';

/*Data for the table `dh_visitor_comment` */

insert  into `dh_visitor_comment`(`id`,`type`,`goods_id`,`parent_id`,`content`,`nickname`,`mail`,`ip`,`is_show`,`created`,`to_id`,`to_nickname`) values (1,1,3,0,'33333','111',NULL,'127.0.0.1',1,1506592498,0,''),(2,1,5,0,'这里是测试留言内容','四月','12353.1@qq.com','127.0.0.1',1,1507707987,0,''),(3,1,5,0,'啊啊啊','四月','12353.1@qq.com','127.0.0.1',1,1507708932,0,''),(4,2,0,0,'这里是我对你的意见','四月','12353.1@qq.com','127.0.0.1',1,1507709776,0,''),(5,2,0,0,'dfsf','hhh','112','127.0.0.1',1,1511407794,0,''),(6,1,58,0,'sdafsdf','ggg','sfasdf','127.0.0.1',1,1511407810,0,'');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='错误日志记录';

/*Data for the table `dh_web_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
