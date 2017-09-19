/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.5.53 : Database - koudaiche
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_article` */

insert  into `dh_article`(`id`,`type`,`tag`,`title`,`thumb`,`description`,`is_show`,`del_status`,`created`,`hot`,`is_recommend`) values (1,1,'6','Nginx 实现跨域使用字体文件','d32b6491067a0e25561eb4d192243d7e.jpeg','Nginx 实现跨域使用字体文件',1,0,1504970134,0,1),(2,1,'6','Nginx 跨域访问php  ','','Access-Control-Allow-Origin 错误',1,0,1504970371,0,0),(3,1,'10','Html 文字内容只显示一行','','&lt;ul&gt;&nbsp;&nbsp&nbsp;&nbsp&nbsp;&lt;li&gt;&lt;a&nbsphref=\"javascript:;\"&gt;餐馆&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;css:li{&nbsp;white-space:nowrap;&nbsp;&nbsp;overflow:hidden;&nbsp;text-overflow:ellipsis;}',1,0,1505020972,0,0);

/*Table structure for table `dh_article_blog` */

DROP TABLE IF EXISTS `dh_article_blog`;

CREATE TABLE `dh_article_blog` (
  `id` int(10) unsigned NOT NULL,
  `content` mediumtext COMMENT '博客内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_blog` */

insert  into `dh_article_blog`(`id`,`content`) values (1,'<div>location ~* .(eot|ttf|woff|woff2|svg|otf)$ {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Origin http://dist.denha.loc;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; #add_header Access-Control-Allow-Headers X-Requested-With;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; #add_header Access-Control-Allow-Credentials true;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Methods GET;</div><div>}</div>'),(2,'<div>location ~ .php(.*)$ {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Origin http://dist.denha.loc;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Headers X-Requested-With;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Credentials true;&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; add_header Access-Control-Allow-Methods GET,POST;</div><div>}</div>'),(3,'<div><div style=\"\"><font face=\"Microsoft YaHei\">&lt;ul&gt;</font></div><div style=\"\"><font face=\"Microsoft YaHei\">&nbsp; &nbsp; &nbsp;&lt;li&gt;&lt;a href=\"javascript:;\"&gt;餐馆&lt;/a&gt;&lt;/li&gt;</font></div><div style=\"\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&lt;/ul&gt;</span><br></div></div><span style=\"font-family: &quot;Microsoft YaHei&quot;;\"><div><span style=\"font-family: &quot;Microsoft YaHei&quot;;\"><br></span></div>css:</span><div>li{<br style=\"font-family: &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&nbsp;white-space:nowrap;&nbsp;</span><br style=\"font-family: &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&nbsp;overflow:hidden;</span><br style=\"font-family: &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">&nbsp;text-overflow:ellipsis;</span></div><div><span style=\"font-family: &quot;Microsoft YaHei&quot;;\">}</span></div>');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_banner_data` */

insert  into `dh_banner_data`(`id`,`banner_id`,`path`,`description`,`sort`) values (1,1,'609b1db7577e074aabc497f297cb0e71.jpeg','这里是简介哦哦哦',0),(2,1,'4eb18891b7bff8e89da7bcda5e3b6741.jpeg','1111',0),(3,1,'43bc6adcffe0be147572626263455e2d.jpeg','2222',0);

/*Table structure for table `dh_category` */

DROP TABLE IF EXISTS `dh_category`;

CREATE TABLE `dh_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) unsigned DEFAULT '0' COMMENT '父级id',
  `thumb` varchar(100) DEFAULT '' COMMENT '缩略图',
  `name` varchar(20) DEFAULT '' COMMENT '分类名称',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned DEFAULT '1' COMMENT '显示状态 1显示 0不显示',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='分类表\r\n';

/*Data for the table `dh_category` */

insert  into `dh_category`(`id`,`parentid`,`thumb`,`name`,`sort`,`is_show`,`created`) values (1,0,'','汽车品牌',0,1,0),(2,1,'','奥迪',1,1,0),(3,1,'3e4daf03cb497d10e0267b0f7b7de7df.png','大众',0,1,0),(4,0,'','服务类型',0,1,0),(5,4,'','汽车贴膜',0,1,0),(6,4,'','汽车维修',0,1,0),(7,4,'','汽车保养',0,1,0),(8,0,'','城市',0,1,0),(9,8,'','Toronto',0,1,0),(10,8,'','North-York',0,1,0),(11,8,'','Downtown',0,1,0),(12,8,'','Markham',0,1,0),(13,8,'','Vaughan',0,1,0),(14,8,'','Scarborough',0,1,0),(15,8,'','Brampton',0,1,0),(16,8,'','Mississauga',0,1,0),(17,8,'','Richmond-hill',0,1,0),(18,8,'','Newmarket',0,1,0);

/*Table structure for table `dh_collection` */

DROP TABLE IF EXISTS `dh_collection`;

CREATE TABLE `dh_collection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户名',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型 1汽车 2服务',
  `value` varchar(100) DEFAULT '0' COMMENT '对应值',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收藏列表';

/*Data for the table `dh_collection` */

insert  into `dh_collection`(`id`,`uid`,`type`,`value`,`del_status`,`created`) values (1,1,1,'1',1,1505803330);

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

insert  into `dh_console_admin`(`id`,`consoleid`,`nickname`,`username`,`password`,`salt`,`mobile`,`status`,`group`,`create_ip`,`login_ip`,`created`,`login_time`) values (1,0,'四月','admin','8895c4947031a4019843c0d00fa303b1','50907','15923882847',1,1,'127.0.0.1','127.0.0.1',1502522576,1505792335),(4,0,'陈明江','cmj','96c76c67a66e92c1e90bce05ebec4b5d','34366','15923882847',1,1,'127.0.0.1','0',1502531990,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `dh_console_menus` */

insert  into `dh_console_menus`(`id`,`type`,`parentid`,`name`,`module`,`controller`,`action`,`icon`,`parameter`,`url`,`status`,`is_show`,`is_white`,`sort`,`del_status`,`created`) values (1,1,0,'系统管理','setting','menus','index','glyphicon glyphicon-triangle-right','','',1,1,0,0,0,1502445648),(2,1,1,'设置','setting','menus','index','glyphicon glyphicon-wrench','','/setting/menus/index',1,1,0,0,0,1502508402),(3,1,2,'配置菜单','setting','menus','index','','','/setting/menus/index',1,1,0,0,0,1502508459),(4,1,3,'添加/编辑菜单','setting','menus','edit','','','',1,0,0,0,0,1502440822),(5,1,3,'树状菜单列表','setting','menus','tree_list','','','',1,0,0,0,0,1502440812),(6,1,2,'管理员','setting','admin','index','','','/setting/admin/index',1,1,0,0,0,1502516144),(7,1,6,'管理员列表','setting','admin','index','','','/setting/admin/index',1,1,0,0,0,1502517276),(8,1,6,'管理员分组','setting','group','index','','','/setting/group/index',1,1,0,0,0,1502517279),(10,1,0,'网站管理','content','list','index','glyphicon glyphicon-triangle-right','','/content/list/index',1,1,0,0,0,1505529695),(11,1,17,'博客','content','blog','index','glyphicon glyphicon-book','','/content/blog/index',1,1,0,0,0,1505577819),(12,1,11,'文章列表','content','blog','index','','','/content/blog/index',1,1,0,0,0,1505577827),(13,1,17,'分类管理','content','category','lists','glyphicon glyphicon-book','','/content/category/lists',1,1,0,0,0,1505529783),(14,1,13,'分类列表','content','category','lists','','','/content/category/lists',1,1,0,0,0,1505462341),(15,1,17,'会员管理','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529776),(16,1,15,'会员列表','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529506),(17,1,10,'内容管理','content','category','lists','','','/content/category/lists',1,1,0,0,0,1505529767),(18,1,15,'积分规则','content','integral_rul','lists','','','/content/integral_rul/lists',1,1,0,0,0,1505783604),(19,1,17,'商品管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784921),(20,1,19,'汽车管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784943),(21,1,19,'服务管理','content','service','lists','','','/content/service/lists',1,1,0,0,0,1505784962),(22,1,17,'广告图片管理','content','banner','lists','','','/content/banner/lists',1,1,0,0,0,1505809594),(23,1,22,'广告分类','content','banner','lists','','','/content/banner/lists',1,1,0,0,0,1505810230);

/*Table structure for table `dh_goods_ablum` */

DROP TABLE IF EXISTS `dh_goods_ablum`;

CREATE TABLE `dh_goods_ablum` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `path` varchar(100) NOT NULL DEFAULT '' COMMENT '图片地址',
  `description` varchar(500) DEFAULT '' COMMENT '图片描述',
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `dh_goods_ablum` */

insert  into `dh_goods_ablum`(`goods_id`,`path`,`description`) values (7,'150580908094311.png','第一张图的介绍'),(7,'150580908088887.png','第二张图的介绍'),(7,'150580908030846.png','第三张图的介绍');

/*Table structure for table `dh_goods_car` */

DROP TABLE IF EXISTS `dh_goods_car`;

CREATE TABLE `dh_goods_car` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家',
  `uid` int(11) unsigned DEFAULT NULL COMMENT 'uid',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `thumb` varchar(100) DEFAULT '' COMMENT '封面图片',
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
  `created` int(11) unsigned DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='新车信息';

/*Data for the table `dh_goods_car` */

insert  into `dh_goods_car`(`id`,`type`,`uid`,`title`,`thumb`,`brand`,`style`,`produce_time`,`model`,`buy_time`,`mileage`,`city`,`gearbox`,`gases`,`displacement`,`model_remark`,`price`,`vin`,`guarantee`,`is_lease`,`mobile`,`weixin`,`qq`,`address`,`description`,`banner`,`status`,`hot`,`is_recommend`,`is_urgency`,`created`) values (1,2,1,'奥迪 2013 A6L 1.6L 纪念版2','',2,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','',1,1,0,0,1505701881),(2,2,1,'奥迪 2013 A6L 1.6L 纪念版2','150578956279606.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150578956279606.png,150578956240119.jpeg',1,1,0,0,1505701942),(3,2,3,'大众 2017 x5 2.0 很好','',3,'x5',2017,'2',2017,2.0,'4','2','2','2.0','很好','20.00','888888','0',1,'','','','','九成新，值得入手','',1,1,0,0,1505706388),(4,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','',1,1,0,0,1505706629),(5,2,3,'奥迪 2017 23 888 很好','',2,'23',2017,'1',2017,5.0,'4','2','1','888','很好','5.00','88888996','0',0,'','','','','很好的啦','',1,1,0,0,1505706882),(6,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580886964585.png,150580886964659.jpeg',1,1,0,0,1505808869),(7,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580908058688.png,150580908096283.jpeg',1,1,0,0,1505809080);

/*Table structure for table `dh_goods_service` */

DROP TABLE IF EXISTS `dh_goods_service`;

CREATE TABLE `dh_goods_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'uid',
  `title` varchar(60) DEFAULT '' COMMENT '标题',
  `type` tinyint(1) DEFAULT '0' COMMENT '服务类型',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `ablum` varchar(500) DEFAULT '' COMMENT '相册',
  `description` mediumtext COMMENT '详情',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1上架 2下架 3后台删除 4用户删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  `hot` int(11) DEFAULT '0' COMMENT '浏览次数',
  `orders` int(11) DEFAULT '0' COMMENT '订单总量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='服务信息';

/*Data for the table `dh_goods_service` */

insert  into `dh_goods_service`(`id`,`uid`,`title`,`type`,`price`,`ablum`,`description`,`status`,`created`,`hot`,`orders`) values (2,1,'免费贴膜',5,'9.90','150578927012952.jpeg,150578927046872.png,150578927019459.png','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',2,1505702940,0,0),(3,1,'免费贴膜',5,'9.90','','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',2,1505703219,0,0),(4,1,'免费贴膜',5,'10.00','150570322945362.png,150570322992738.jpeg,150570322914812.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1505703229,0,0),(5,1,'免费贴膜',5,'10.00','150570424689878.png,150570424614177.jpeg,150570424697703.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1505704246,0,0),(6,1,'免费贴膜',5,'10.00','150570433438039.png,150570433448718.jpeg,150570433473341.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1505704334,0,0),(7,1,'免费贴膜',5,'10.00','150570437049342.png,150570437077162.jpeg,150570437034977.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1505704370,0,0),(8,1,'免费贴膜',5,'10.00','150570449431456.png,150570449497171.jpeg,150570449483501.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1505704494,0,0),(10,1,'免费贴膜',5,'9.90','150570605387503.png,150570605341278.jpeg,150570605343313.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,1505706053,0,0),(11,3,'200',1,'200.00','150571629162506.jpeg,150571629146095.jpeg','主要针对劳斯莱斯、布加迪等维修保养',2,1505716291,0,0);

/*Table structure for table `dh_help_car` */

DROP TABLE IF EXISTS `dh_help_car`;

CREATE TABLE `dh_help_car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `brand` int(10) unsigned DEFAULT '0' COMMENT '品牌',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '期望价格',
  `buy_time` varchar(10) DEFAULT '0' COMMENT '期望车龄',
  `mileage` varchar(10) DEFAULT '0' COMMENT '期望里程',
  `description` mediumtext COMMENT '详情',
  `created` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1申请 2失败 3完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮我买车';

/*Data for the table `dh_help_car` */

/*Table structure for table `dh_integral_log` */

DROP TABLE IF EXISTS `dh_integral_log`;

CREATE TABLE `dh_integral_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户uid',
  `value` int(11) DEFAULT NULL COMMENT '积分',
  `content` varchar(250) DEFAULT NULL COMMENT '操作内容',
  `created` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `content` (`content`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='积分详情';

/*Data for the table `dh_integral_log` */

insert  into `dh_integral_log`(`id`,`uid`,`value`,`content`,`created`) values (26,1,30,'每日签到',1505724836),(27,3,30,'每日签到',1505786396);

/*Table structure for table `dh_integral_rul` */

DROP TABLE IF EXISTS `dh_integral_rul`;

CREATE TABLE `dh_integral_rul` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `value` int(11) DEFAULT NULL COMMENT '积分数',
  `content` varchar(350) DEFAULT NULL COMMENT '规则内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1开启 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='积分规则';

/*Data for the table `dh_integral_rul` */

insert  into `dh_integral_rul`(`id`,`value`,`content`,`status`) values (1,100,'注册赠送',1),(2,30,'每日签到',1),(3,100,'分享赠送',1);

/*Table structure for table `dh_search_log` */

DROP TABLE IF EXISTS `dh_search_log`;

CREATE TABLE `dh_search_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT '' COMMENT '搜索内容',
  `uid` int(10) DEFAULT '0' COMMENT '用户uid',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索记录';

/*Data for the table `dh_search_log` */

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
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(11) unsigned DEFAULT '0' COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user` */

insert  into `dh_user`(`id`,`type`,`mobile`,`username`,`nickname`,`mail`,`password`,`salt`,`token`,`time_out`,`ip`,`integral`,`status`,`del_status`,`created`) values (1,2,'13425778542','cheng6251','cheng6251',NULL,'7df8faa9a5f71811689662131b7f9fe5','45452','6e94129e448898f95001427c772dce7e',1505986816,'127.0.0.1',30,1,0,1505292648),(2,1,'18523563220','weixuelin','weixuelin',NULL,'f6b81aa9bcdeb6e01455a3d61e16f4d7','21749','fab0fce9f1aa71e072ac37ef232fcb2b',1505986099,'127.0.0.1',0,1,0,1505293289),(3,2,'13896568031','kuangxin','kuangxin',NULL,'01bafc44de12208bb48680dca2ea4c16','12532','8ef9f6a11844248b0ed16f32d1315fc1',1505986121,'127.0.0.1',30,1,0,1505368006);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_shop` */

insert  into `dh_user_shop`(`id`,`uid`,`name`,`avatar`,`credit_level`,`woker_time`,`address`,`category`,`ablum`,`ide_ablum`,`is_ide`,`is_message`,`status`) values (1,1,'四月工作室','150537200968318.png',0,'9点-10点','这里是店铺地址信息',1,'150537200931950.png,150537200995896.jpeg,150537200992966.jpeg','150536187327122.jpeg,150536187343181.png',0,0,1),(2,3,'kuangxin','',0,'09:00-18:00','重庆市南岸区',1,'','',0,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
