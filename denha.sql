/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.19 : Database - koudaiche
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`koudaiche` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `koudaiche`;

/*Table structure for table `dh_article` */

DROP TABLE IF EXISTS `dh_article`;

CREATE TABLE `dh_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型',
  `tag` varchar(20) DEFAULT NULL COMMENT 'tag标签',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) DEFAULT '' COMMENT '简介',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态 1显示 0关闭',
  `del_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `hot` int(11) DEFAULT '0' COMMENT '热度',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '推荐排行榜 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_article` */

insert  into `dh_article`(`id`,`type`,`tag`,`title`,`thumb`,`description`,`is_show`,`del_status`,`created`,`hot`,`is_recommend`) values (1,1,'6','Nginx 实现跨域使用字体文件','d32b6491067a0e25561eb4d192243d7e.jpeg','Nginx 实现跨域使用字体文件',1,0,1504970134,0,1),(2,1,'6','Nginx 跨域访问php  ','','Access-Control-Allow-Origin 错误',1,0,1504970371,0,0),(3,1,'10','Html 文字内容只显示一行','','&lt;ul&gt;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&lt;li&gt;&lt;a&nbsphref=\"javascript:;\"&gt;餐馆&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;css:li{&nbsp;white-space:nowrap;&nbsp;&nbsp;overflow:hidden;&nbsp;text-overflow:ellipsis;}',1,0,1505020972,0,0);

/*Table structure for table `dh_article_blog` */

DROP TABLE IF EXISTS `dh_article_blog`;

CREATE TABLE `dh_article_blog` (
  `id` int(10) unsigned NOT NULL,
  `content` mediumtext COMMENT '博客内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_blog` */

insert  into `dh_article_blog`(`id`,`content`) values (1,'<div>location ~* .(eot|ttf|woff|woff2|svg|otf)$ {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Origin http://dist.denha.loc;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; #add_header Access-Control-Allow-Headers X-Requested-With;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; #add_header Access-Control-Allow-Credentials true;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Methods GET;</div><div>}</div>'),(2,'<div>location ~ .php(.*)$ {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Origin http://dist.denha.loc;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Headers X-Requested-With;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Credentials true;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Methods GET,POST;</div><div>}</div>'),(3,'<div><div style=\"\"><font face=\"Microsoft YaHei\">&lt;ul&gt;</font></div><div style=\"\"><font face=\"Microsoft YaHei\">&nbsp; &nbsp; &nbsp;&lt;li&gt;&lt;a href=\"javascript:;\"&gt;餐馆&lt;/a&gt;&lt;/li&gt;</font></div><div style=\"\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&lt;/ul&gt;</span><br></div></div><span style=\"font-family: &quot;Microsoft YaHei&quot;;\"><div><span style=\"font-family: &quot;Microsoft YaHei&quot;;\"><br></span></div>css:</span><div>li{<br style=\"font-family: &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&nbsp;white-space:nowrap;&nbsp;</span><br style=\"font-family: &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&nbsp;overflow:hidden;</span><br style=\"font-family: &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&nbsp;text-overflow:ellipsis;</span></div><div><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">}</span></div>');

/*Table structure for table `dh_category` */

DROP TABLE IF EXISTS `dh_category`;

CREATE TABLE `dh_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) unsigned DEFAULT '0' COMMENT '父级id',
  `name` varchar(20) DEFAULT '' COMMENT '分类名称',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '显示状态 1显示 0不显示',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='分类表\r\n';

/*Data for the table `dh_category` */

insert  into `dh_category`(`id`,`parentid`,`name`,`sort`,`is_show`,`created`) values (1,0,'汽车品牌',0,1,0),(2,1,'奥迪',1,1,0),(3,1,'大众',0,1,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

/*Data for the table `dh_console_admin` */

insert  into `dh_console_admin`(`id`,`consoleid`,`nickname`,`username`,`password`,`salt`,`mobile`,`status`,`group`,`create_ip`,`login_ip`,`created`,`login_time`) values (1,0,'四月','admin','8895c4947031a4019843c0d00fa303b1','50907','15923882847',1,1,'127.0.0.1','127.0.0.1',1502522576,1505493004),(4,0,'陈明江','cmj','96c76c67a66e92c1e90bce05ebec4b5d','34366','15923882847',0,1,'127.0.0.1','0',1502531990,0);

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `dh_console_menus` */

insert  into `dh_console_menus`(`id`,`type`,`parentid`,`name`,`module`,`controller`,`action`,`icon`,`parameter`,`url`,`status`,`is_show`,`is_white`,`sort`,`del_status`,`created`) values (2,1,1,'设置','setting','menus','index','glyphicon glyphicon-wrench','','/setting/menus/index',1,1,0,0,0,1502508402),(3,1,2,'配置菜单','setting','menus','index','','','/setting/menus/index',1,1,0,0,0,1502508459),(4,1,3,'添加/编辑菜单','setting','menus','edit','','','',1,0,0,0,0,1502440822),(5,1,3,'树状菜单列表','setting','menus','tree_list','','','',1,0,0,0,0,1502440812),(6,1,2,'管理员','setting','admin','index','','','/setting/admin/index',1,1,0,0,0,1502516144),(7,1,6,'管理员列表','setting','admin','index','','','/setting/admin/index',1,1,0,0,0,1502517276),(8,1,6,'管理员分组','setting','group','index','','','/setting/group/index',1,1,0,0,0,1502517279),(1,1,0,'系统管理','setting','menus','index','glyphicon glyphicon-triangle-right','','',1,1,0,0,0,1502445648),(10,1,0,'内容管理','content','list','index','glyphicon glyphicon-triangle-right','','/content/list/index',1,1,0,0,0,1502702794),(11,1,10,'博客','content','list','index','glyphicon glyphicon-book','','/content/list/index',1,0,0,0,0,1505464940),(12,1,11,'文章列表','content','list','index','','','/content/list/index',1,1,0,0,0,1502702814),(13,1,10,'分类管理','content','category','lists','glyphicon glyphicon-book','','/content/category/lists',1,1,0,0,0,1505465043),(14,1,13,'分类列表','content','category','lists','','','/content/category/lists',1,1,0,0,0,1505462341);

/*Table structure for table `dh_goods_car` */

DROP TABLE IF EXISTS `dh_goods_car`;

CREATE TABLE `dh_goods_car` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家',
  `uid` int(11) DEFAULT NULL COMMENT 'uid',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `brand` int(11) DEFAULT '0' COMMENT '品牌',
  `style` varchar(10) DEFAULT '' COMMENT '款号',
  `produce_time` int(5) DEFAULT '0' COMMENT '生产日期',
  `model` varchar(10) DEFAULT '' COMMENT '车型',
  `buy_time` char(5) DEFAULT '' COMMENT '购买时间',
  `mileage` float unsigned DEFAULT '0' COMMENT '里程 万公里',
  `city` varchar(5) DEFAULT '' COMMENT '车牌城市',
  `gearbox` varchar(6) DEFAULT '' COMMENT '变数箱',
  `gases` varchar(5) DEFAULT '' COMMENT '排放标准',
  `displacement` varchar(10) DEFAULT '' COMMENT '排量',
  `model_remark` varchar(10) DEFAULT '' COMMENT '车型备注',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '报价',
  `vin` varchar(20) DEFAULT '' COMMENT 'vin',
  `guarantee` varchar(10) DEFAULT '0' COMMENT '保障状态 1一年保修 2三次保养 3LEASE',
  `is_lease` tinyint(1) unsigned DEFAULT '1' COMMENT '是否转手',
  `mobile` char(11) DEFAULT '' COMMENT '联系电话',
  `weixin` varchar(20) DEFAULT '' COMMENT '微信号',
  `qq` varchar(20) DEFAULT '' COMMENT 'qq',
  `address` varchar(150) DEFAULT '' COMMENT '地址',
  `description` mediumtext COMMENT '简介',
  `ablum` varchar(500) DEFAULT '' COMMENT '相册',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1上架 2下架',
  `created` int(11) unsigned DEFAULT '0' COMMENT '发布时间',
  `hot` int(11) unsigned DEFAULT '1' COMMENT '浏览次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='新车信息';

/*Data for the table `dh_goods_car` */

insert  into `dh_goods_car`(`id`,`type`,`uid`,`title`,`brand`,`style`,`produce_time`,`model`,`buy_time`,`mileage`,`city`,`gearbox`,`gases`,`displacement`,`model_remark`,`price`,`vin`,`guarantee`,`is_lease`,`mobile`,`weixin`,`qq`,`address`,`description`,`ablum`,`status`,`created`,`hot`) values (1,2,1,'',1,'A6L',2013,' 三厢','2017',1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','150537221176107.png,150537221167551.jpeg',1,1505372211,1),(2,2,1,'',1,'A6L',2013,' 三厢','2017',1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','150538150454318.png,150538150479194.jpeg',1,1505381504,1),(3,2,3,'',2,'幻影',2017,'3','2017年',2,'4','1','2','2.8','很好','20.00','669566856','0',1,'','','','','很好哦，走过路过千万不要错过','',1,1505456152,1);

/*Table structure for table `dh_goods_service` */

DROP TABLE IF EXISTS `dh_goods_service`;

CREATE TABLE `dh_goods_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned DEFAULT NULL COMMENT 'uid',
  `title` varchar(60) DEFAULT NULL COMMENT '标题',
  `type` tinyint(1) DEFAULT NULL COMMENT '服务类型',
  `price` mediumint(10) unsigned DEFAULT '0' COMMENT '价格',
  `ablum` varchar(500) DEFAULT NULL COMMENT '相册',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  `description` mediumblob COMMENT '详情',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='服务信息';

/*Data for the table `dh_goods_service` */

/*Table structure for table `dh_user` */

DROP TABLE IF EXISTS `dh_user`;

CREATE TABLE `dh_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(20) DEFAULT '' COMMENT '昵称',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` char(5) DEFAULT '' COMMENT '随机码',
  `token` char(32) DEFAULT '',
  `time_out` int(10) unsigned DEFAULT '0' COMMENT 'token到期时间',
  `ip` varchar(18) DEFAULT '' COMMENT '注册ip',
  `integral` int(10) unsigned DEFAULT '0' COMMENT '积分',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1开启 2禁用',
  `created` int(11) unsigned DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user` */

insert  into `dh_user`(`id`,`type`,`mobile`,`username`,`nickname`,`mail`,`password`,`salt`,`token`,`time_out`,`ip`,`integral`,`status`,`created`) values (1,2,'13425778542','cheng6251','',NULL,'7df8faa9a5f71811689662131b7f9fe5','45452','6e94129e448898f95001427c772dce7e',1505613684,'127.0.0.1',0,1,1505292648),(2,1,'18523563220','weixuelin','',NULL,'f6b81aa9bcdeb6e01455a3d61e16f4d7','21749','b1e75f10ad27cc678d6a65d924a65a17',1505629357,'127.0.0.1',0,1,1505293289),(3,2,'13896568031','kuangxin','',NULL,'01bafc44de12208bb48680dca2ea4c16','12532','6fd0b15a65f59b67628df587bfcc4843',1505632283,'127.0.0.1',0,1,1505368006);

/*Table structure for table `dh_user_shop` */

DROP TABLE IF EXISTS `dh_user_shop`;

CREATE TABLE `dh_user_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `name` varchar(15) DEFAULT '' COMMENT '店铺名称',
  `avatar` varchar(20) DEFAULT '' COMMENT '店铺头像',
  `credit_level` tinyint(1) unsigned DEFAULT '0' COMMENT '信用等级',
  `woker_time` varchar(100) DEFAULT '' COMMENT '工作时间',
  `address` varchar(150) DEFAULT '' COMMENT '地址',
  `category` tinyint(1) unsigned DEFAULT '0' COMMENT '分类id',
  `ablum` varchar(300) DEFAULT '' COMMENT '店铺照片',
  `ide_ablum` varchar(300) DEFAULT '' COMMENT '认证照片',
  `is_ide` tinyint(1) unsigned DEFAULT '0' COMMENT '认证状态 0未认证 1已认证 2认证未通过',
  `is_message` tinyint(1) unsigned DEFAULT '1' COMMENT '锁屏新消息是否开启 1开启 0不开启',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '店铺状态 1开启 2关闭',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_shop` */

insert  into `dh_user_shop`(`id`,`uid`,`name`,`avatar`,`credit_level`,`woker_time`,`address`,`category`,`ablum`,`ide_ablum`,`is_ide`,`is_message`,`status`) values (1,1,'四月工作室','150537200968318.png',0,'9点-10点','这里是店铺地址信息',1,'150537200931950.png,150537200995896.jpeg,150537200992966.jpeg','150536187327122.jpeg,150536187343181.png',0,0,1),(2,3,'kuangxin','',0,'09:00-18:00','重庆市南岸区',1,'','',0,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
