/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.53 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `dh_console_menus` (
	`id` int (10),
	`type` tinyint (1),
	`parentid` int (11),
	`name` varchar (60),
	`module` varchar (150),
	`controller` varchar (150),
	`action` varchar (150),
	`icon` varchar (180),
	`parameter` varchar (60),
	`url` varchar (450),
	`status` tinyint (1),
	`is_show` tinyint (1),
	`is_white` tinyint (1),
	`sort` int (10),
	`del_status` tinyint (1),
	`created` int (10)
); 
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('2','1','1','设置','setting','menus','index','glyphicon glyphicon-wrench','','/setting/menus/index','1','1','0','0','0','1502508402');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('3','1','2','配置菜单','setting','menus','index','','','/setting/menus/index','1','1','0','0','0','1502508459');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('4','1','3','添加/编辑菜单','setting','menus','edit','','','','1','0','0','0','0','1502440822');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('5','1','3','树状菜单列表','setting','menus','tree_list','','','','1','0','0','0','0','1502440812');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('6','1','2','管理员','setting','admin','index','','','/setting/admin/index','1','1','0','0','0','1502516144');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('7','1','6','管理员列表','setting','admin','index','','','/setting/admin/index','1','1','0','0','0','1502517276');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('8','1','6','管理员分组','setting','group','index','','','/setting/group/index','1','1','0','0','0','1502517279');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('1','1','0','系统管理','setting','menus','index','glyphicon glyphicon-triangle-right','','','1','1','0','0','0','1502445648');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('10','1','0','网站管理','content','list','index','glyphicon glyphicon-triangle-right','','/content/list/index','1','1','0','0','0','1505529695');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('11','1','17','博客','content','blog','index','glyphicon glyphicon-book','','/content/blog/index','1','1','0','0','0','1505577819');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('12','1','11','文章列表','content','blog','index','','','/content/blog/index','1','1','0','0','0','1505577827');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('13','1','17','分类管理','content','category','lists','glyphicon glyphicon-book','','/content/category/lists','1','1','0','0','0','1505529783');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('14','1','13','分类列表','content','category','lists','','','/content/category/lists','1','1','0','0','0','1505462341');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('15','1','17','会员管理','content','user','lists','','','/content/user/lists','1','1','0','0','0','1505529776');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('16','1','15','会员列表','content','user','lists','','','/content/user/lists','1','1','0','0','0','1505529506');
insert into `dh_console_menus` (`id`, `type`, `parentid`, `name`, `module`, `controller`, `action`, `icon`, `parameter`, `url`, `status`, `is_show`, `is_white`, `sort`, `del_status`, `created`) values('17','1','10','内容管理','content','category','lists','','','/content/category/lists','1','1','0','0','0','1505529767');
