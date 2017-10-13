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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`koudaiche` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `dh_article` */

DROP TABLE IF EXISTS `dh_article`;

CREATE TABLE `dh_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型',
  `tag` varchar(20) DEFAULT NULL COMMENT 'tag标签',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) DEFAULT '' COMMENT '简介',
  `origin` varchar(300) DEFAULT '' COMMENT '来源地址',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态 1显示 0关闭',
  `del_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `hot` int(11) DEFAULT '0' COMMENT '热度',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '推荐排行榜 1推荐 0不推荐',
  `publish_time` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`),
  KEY `is_recommend` (`is_recommend`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `dh_article` */

insert  into `dh_article`(`id`,`type`,`tag`,`title`,`thumb`,`description`,`origin`,`is_show`,`del_status`,`created`,`hot`,`is_recommend`,`publish_time`) values (1,1,'6','Nginx 实现跨域使用字体文件','','Nginx 实现跨域使用字体文件','',1,0,1504970134,19,1,0),(2,1,'6','Nginx 跨域访问php  ','','Access-Control-Allow-Origin 错误','',1,0,1504970371,39,0,0),(3,1,'10','Html 文字内容只显示一行','','css控制文字内容只显示一行','',1,0,1505020972,162,0,0),(4,1,'8','docker 手把手教你基于官网镜像搭建mysql+php+nginx（一）','','使用的是官网镜像mysql:5.7php:5.6nignx:last准备工作你需要先安装dockerdocker-compose并且需要有一个github账户创建本地文件apahcemysqlsrv这里用不到主要需要创建的docker文件夹文件夹下创建对应mysqlnginxphp文件里面文件内容我们需要从容器里面拷贝出来后自己调整修改OK准备工作完成了先从php开始吧抓取php需要的配置文件保存在本地方便自己以后修改创建phpDockerfile在php下创建Docker','',1,0,1507688317,39,1,0),(5,1,'9','linux命令之crontab定时执行任务','','一般情况下，我们在操作和运维VPS、服务器的时候可能会用到crontab定时任务的配置，比如定时的重启服务器、定时备份数据等操作使用的还是比较多的。这里就离不开使用crontab命令的任务配置，在这篇文章中，老左将会整理较为齐全的crontab命令使用的方法以及常用的实例操作。从上图中，我们其实就可以看到crontab具体用法。一共有6个段落，前面5个标示定时的时间设定，后面一个标示文件的路径定时执行。第一、crontab安装一般我们使用的centos或者debian发行版本都自带crontab定时软件支','http://www.laozuo.org/7110.html',1,0,1507694379,108,0,0),(6,1,'3','mysql数据库主从服务器常见问题处理','','Slave_IO_Running Checking master version','http://blog.csdn.net/lvyongyi_2010/article/details/23336249',1,0,1507701439,13,0,0);

/*Table structure for table `dh_article_blog` */

DROP TABLE IF EXISTS `dh_article_blog`;

CREATE TABLE `dh_article_blog` (
  `id` int(10) unsigned NOT NULL,
  `content` mediumtext COMMENT '博客内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dh_article_blog` */

insert  into `dh_article_blog`(`id`,`content`) values (1,'<p>							 	</p><pre class=\"brush:php;toolbar:false\">location&nbsp;~*&nbsp;.(eot|ttf|woff|woff2|svg|otf)$&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Origin&nbsp;http://dist.denha.loc;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#add_header&nbsp;Access-Control-Allow-Headers&nbsp;X-Requested-With;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#add_header&nbsp;Access-Control-Allow-Credentials&nbsp;true;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Methods&nbsp;GET;\r\n}</pre><p><br/></p><p>							 	</p>'),(2,'<pre class=\"brush:php;toolbar:false\">\r\nlocation&nbsp;~&nbsp;.php(.*)$&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Origin&nbsp;http://dist.denha.loc;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Headers&nbsp;X-Requested-With;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Credentials&nbsp;true;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;add_header&nbsp;Access-Control-Allow-Methods&nbsp;GET,POST;\r\n}</pre><p><br/></p>'),(3,'<p>							 	</p><p>							 	</p><pre class=\"brush:html;toolbar:false\">&lt;ul&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;li&gt;&lt;a&nbsp;href=&quot;javascript:;&quot;&gt;餐馆&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;</pre><pre class=\"brush:css;toolbar:false\">css:\r\n\r\nli{\r\n&nbsp;white-space:nowrap;&nbsp;\r\n&nbsp;overflow:hidden;\r\n&nbsp;text-overflow:ellipsis;\r\n}</pre><p><br/></p><p><br/></p><p><br/></p><p>							 	</p><p>							 	</p>'),(4,'<p>							 	</p><p>							 	</p><p>							 	</p><p><strong>使用的是官网镜像 </strong><span style=\"color: rgb(192, 0, 0);\"><strong>mysql:5.7</strong></span><strong> <span style=\"color: rgb(192, 0, 0);\">php:5.6</span> <span style=\"color: rgb(192, 0, 0);\">nignx:last</span></strong></p><p><br/></p><p><strong>准备工作</strong></p><p><strong><br/></strong></p><p><span style=\"color: rgb(192, 0, 0);\">你需要先安装docker docker-compose并且需要有一个github账户</span></p><p><br/></p><p><strong>创建本地文件</strong></p><p><strong><br/></strong></p><p><strong><img src=\"/uploadfile/ueditor/20171011/1507686028368988.png\" title=\"1507686028368988.png\" alt=\"image.png\"/></strong></p><p>apahce mysqlsrv 这里用不到 主要需要创建的docker文件夹 文件夹下创建对应mysql nginx php文件 里面文件内容我们需要从容器里面拷贝出来后自己调整修改</p><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">OK准备工作完成了 先从php开始吧</span></p><p><br/></p><p><strong>抓取php需要的配置文件保存在本地方便自己以后修改</strong></p><p><br/></p><p><br/></p><p><strong>创建phpDockerfile</strong></p><p><strong><br/></strong></p><p>在php 下创建Dockerfile文件<span style=\"color: rgb(192, 0, 0);\">（我已屏蔽了非主要模块 后续需要可以自行添加）</span></p><p>文件内容如下：</p><pre class=\"brush:bash;toolbar:false\">#&nbsp;name:docker_php\r\n#&nbsp;use:store&nbsp;&nbsp;\r\n#&nbsp;date:2017-09-04&nbsp;&nbsp;\r\n&nbsp;&nbsp;\r\nFROM&nbsp;php:5.6-fpm\r\n\r\nMAINTAINER&nbsp;siyue&nbsp;350375092@qq.com&nbsp;&nbsp;\r\n\r\n#&nbsp;You&nbsp;may&nbsp;need&nbsp;proxy\r\n#&nbsp;RUN&nbsp;export&nbsp;http_proxy=192.168.1.10:1080\r\n#&nbsp;RUN&nbsp;export&nbsp;https_proxy=192.168.1.10:1080\r\n\r\n#&nbsp;Update&nbsp;ubuntu\r\n#RUN&nbsp;apt-get&nbsp;update\r\n\r\n#&nbsp;mcrypt\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libmcrypt-dev\r\nRUN&nbsp;docker-php-ext-install&nbsp;mcrypt\r\n\r\n#&nbsp;GD\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libfreetype6-dev&nbsp;libjpeg62-turbo-dev&nbsp;libpng12-dev\r\nRUN&nbsp;docker-php-ext-configure&nbsp;gd&nbsp;--with-freetype-dir=/usr/include/&nbsp;--with-jpeg-dir=/usr/include/\r\nRUN&nbsp;docker-php-ext-install&nbsp;-j$(nproc)&nbsp;gd\r\n\r\n#&nbsp;Intl\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libicu-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;-j$(nproc)&nbsp;intl\r\n\r\n#&nbsp;General\r\nRUN&nbsp;docker-php-ext-install&nbsp;zip&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;pcntl&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;opcache&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;pdo_mysql&nbsp;\r\nRUN&nbsp;docker-php-ext-install&nbsp;mysqli&nbsp;\r\n\r\n#&nbsp;SOAP&nbsp;Client\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libxml2-dev\r\nRUN&nbsp;docker-php-ext-install&nbsp;soap\r\n\r\n#&nbsp;General&nbsp;extensions&nbsp;that&nbsp;may&nbsp;had&nbsp;be&nbsp;installed&nbsp;default\r\n#&nbsp;If&nbsp;not,&nbsp;install&nbsp;them&nbsp;with&nbsp;following&nbsp;command\r\n#RUN&nbsp;docker-php-ext-install&nbsp;ctype\r\n#RUN&nbsp;docker-php-ext-install&nbsp;dom\r\n#RUN&nbsp;docker-php-ext-install&nbsp;fileinfo\r\n#RUN&nbsp;docker-php-ext-install&nbsp;ftp\r\n#RUN&nbsp;docker-php-ext-install&nbsp;hash\r\nRUN&nbsp;docker-php-ext-install&nbsp;iconv\r\nRUN&nbsp;docker-php-ext-install&nbsp;json\r\nRUN&nbsp;docker-php-ext-install&nbsp;mbstring\r\nRUN&nbsp;docker-php-ext-install&nbsp;session\r\nRUN&nbsp;docker-php-ext-install&nbsp;pdo\r\nRUN&nbsp;docker-php-ext-install&nbsp;pdo_sqlite\r\n#RUN&nbsp;docker-php-ext-install&nbsp;posix\r\n#RUN&nbsp;docker-php-ext-install&nbsp;tokenizer\r\n#RUN&nbsp;docker-php-ext-install&nbsp;simplexml\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xml\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xmlreader\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xmlwriter\r\n\r\n#&nbsp;CURL,&nbsp;may&nbsp;had&nbsp;be&nbsp;installed&nbsp;default\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;curl\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libcurl3\r\nRUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libcurl4-openssl-dev\r\nRUN&nbsp;docker-php-ext-install&nbsp;curl\r\n\r\n#&nbsp;More&nbsp;extensions\r\n#RUN&nbsp;docker-php-ext-install&nbsp;exif\r\n#RUN&nbsp;docker-php-ext-install&nbsp;bcmath\r\n#RUN&nbsp;docker-php-ext-install&nbsp;calendar\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sockets\r\n#RUN&nbsp;docker-php-ext-install&nbsp;gettext\r\n#RUN&nbsp;docker-php-ext-install&nbsp;phar\r\n#RUN&nbsp;docker-php-ext-install&nbsp;shmop\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sysvmsg\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sysvsem\r\n#RUN&nbsp;docker-php-ext-install&nbsp;sysvshm\r\n\r\n#&nbsp;More&nbsp;extensions&nbsp;handle&nbsp;database\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_firebird\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_dblib\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_oci\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_odbc\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pdo_pgsql\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pgsql\r\n#RUN&nbsp;docker-php-ext-install&nbsp;oci8\r\n#RUN&nbsp;docker-php-ext-install&nbsp;odbc\r\n#RUN&nbsp;docker-php-ext-install&nbsp;dba\r\n#RUN&nbsp;docker-php-ext-install&nbsp;interbase\r\n\r\n#&nbsp;execute&nbsp;`RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libxml2-dev`&nbsp;before&nbsp;using&nbsp;following&nbsp;command\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libxslt-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xsl\r\n#RUN&nbsp;docker-php-ext-install&nbsp;xmlrpc\r\n#RUN&nbsp;docker-php-ext-install&nbsp;wddx\r\n\r\n#&nbsp;Readline\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libreadline-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;readline\r\n\r\n#&nbsp;SNMP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libsnmp-dev\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;snmp\r\n#RUN&nbsp;docker-php-ext-install&nbsp;snmp\r\n\r\n#&nbsp;pspell\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libpspell-dev\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;aspell-en\r\n#RUN&nbsp;docker-php-ext-install&nbsp;pspell\r\n\r\n#&nbsp;recode\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;librecode0\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;librecode-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;recode\r\n\r\n#&nbsp;Tidy\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libtidy-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;tidy\r\n\r\n#&nbsp;GMP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libgmp-dev\r\n#RUN&nbsp;docker-php-ext-install&nbsp;gmp\r\n\r\n#&nbsp;Client\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;postgresql-client\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;mysql-client\r\n\r\n#&nbsp;IMAP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libc-client-dev\r\n#RUN&nbsp;docker-php-ext-configure&nbsp;imap&nbsp;--with-kerberos&nbsp;--with-imap-ssl\r\n#RUN&nbsp;docker-php-ext-install&nbsp;imap\r\n\r\n#&nbsp;LDAP\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libldb-dev\r\n#RUN&nbsp;apt-get&nbsp;install&nbsp;-y&nbsp;libldap2-dev\r\n#RUN&nbsp;docker-php-ext-configure&nbsp;ldap&nbsp;--with-libdir=lib/x86_64-linux-gnu\r\n#RUN&nbsp;docker-php-ext-install&nbsp;ldap\r\n\r\n#&nbsp;Composer\r\n#RUN&nbsp;curl&nbsp;-sS&nbsp;https://getcomposer.org/installer&nbsp;|&nbsp;php&nbsp;--&nbsp;--install-dir=/usr/bin/&nbsp;--filename=composer\r\n\r\n#&nbsp;XDEBUG\r\n#RUN&nbsp;yes&nbsp;|&nbsp;pecl&nbsp;channel-update&nbsp;pecl.php.net&nbsp;&amp;&amp;&nbsp;pecl&nbsp;install&nbsp;xdebug&nbsp;\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;zend_extension=$(find&nbsp;/usr/local/lib/php/extensions/&nbsp;-name&nbsp;xdebug.so)&quot;&nbsp;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini&nbsp;\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.remote_enable=on&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini&nbsp;\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.remote_handler=dbgp&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.xdebug.remote_host=127.0.0.1&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini\r\n#&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp;&nbsp;echo&nbsp;&quot;xdebug.xdebug.remote_port=9000&quot;&nbsp;&gt;&gt;&nbsp;/usr/local/etc/php/conf.d/xdebug.ini</pre><p><br/></p><p><strong>创建docker-compose.yml</strong></p><p><strong><br/></strong></p><p>在docker文件下创建文件docker-compose.yml</p><pre class=\"brush:bash;toolbar:false\">&nbsp;&nbsp;&nbsp;&nbsp;php:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#depends_on:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;build:&nbsp;./php/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;container_name:&nbsp;php\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart:&nbsp;always\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;privileged:&nbsp;true\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;links:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql:mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;volumes:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/:/var/www/html/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/data:/var/www/html/data:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/php-fpm.d/www.conf:/usr/local/etc/php-fpm.d/www.conf:ro\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/log/:/var/log/php-fpm/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expose:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&quot;9000&quot;</pre><p><span style=\"color: rgb(192, 0, 0);\">docker-compose.yml注意事项</span></p><p><span style=\"color: rgb(192, 0, 0);\">1.格式需要对其 我因为这个问题报错找了N久</span></p><p><span style=\"color: rgb(192, 0, 0);\">2.#是注释</span></p><p><span style=\"color: rgb(192, 0, 0);\">&nbsp;</span></p><p><span style=\"color: rgb(127, 127, 127);\">参数解释：</span><br/></p><p><span style=\"color: rgb(127, 127, 127);\">depends_on：前置需要</span></p><p><span style=\"color: rgb(127, 127, 127);\">build: ./php/ 根据Dockerfile文件创建容器</span></p><p><span style=\"color: rgb(127, 127, 127);\">container_name：创建的容器名称</span></p><p><span style=\"color: rgb(127, 127, 127);\">restart: always&nbsp;&nbsp;意外停止自动重启</span></p><p><span style=\"color: rgb(127, 127, 127);\">volumes&nbsp;挂载数据卷 本地path：容器path ： 权限 | ro不可创建文件 rw可读写</span></p><p><span style=\"color: rgb(127, 127, 127);\">links&nbsp;链接容器</span></p><p><span style=\"color: rgb(127, 127, 127);\">ports&nbsp;端口映射 本地prot ： 容器prot</span></p><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">保存然后上传github</span></p><p><br/></p><p><strong>执行脚本</strong></p><pre class=\"brush:bash;toolbar:false\">git&nbsp;clone&nbsp;https://github.com/xxxx/docker.git&nbsp;&nbsp;xxx替换为你自己的\r\ncd&nbsp;docker\r\ndocker-compose&nbsp;up&nbsp;-d</pre><p>docker ps 查看运行成功了没有如果现实如下表示成功运行<br/></p><p><br/></p><p><img src=\"/uploadfile/ueditor/20171011/1507687796857430.png\" title=\"1507687796857430.png\" alt=\"image.png\"/><br/></p><p><br/></p><p>步抓取容器配置文件到本地<br/></p><pre class=\"brush:bash;toolbar:false\">docker&nbsp;cp&nbsp;php:/usr/local/php&nbsp;~/docker/php</pre><p>这句代码表示抓取php容器的php文件 存放到 自己的docker文件下的php中</p><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">找到www.conf文件&nbsp;然后在php文件夹中创建php-fpm.d文件夹将其文件保存在这里</span></p><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><strong>最后一步修改docker-compose.yml</strong></p><pre class=\"brush:bash;toolbar:false\">php:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#depends_on:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;build:&nbsp;./php/\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;container_name:&nbsp;php\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;restart:&nbsp;always\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;privileged:&nbsp;true\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;links:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;mysql:mysql\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;volumes:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/:/var/www/html/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./src/data:/var/www/html/data:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/php-fpm.d/www.conf:/usr/local/etc/php-fpm.d/www.conf:ro\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;./php/log/:/var/log/php-fpm/:rw\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expose:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&quot;9000&quot;</pre><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(192, 0, 0);\">完成后上传github</span></p><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><strong>最后执行脚本</strong><br/></p><pre class=\"brush:bash;toolbar:false\">cd\r\nrm&nbsp;-rf&nbsp;docker&nbsp;\r\ngit&nbsp;clone&nbsp;https://github.com/xxxx/docker.git\r\ncd&nbsp;docker\r\ndocker-compose&nbsp;up</pre><p><br/></p><p><span style=\"color: rgb(192, 0, 0);\">现在我们完成了php的docker部署 不管你在哪点都可以一个脚本完成php安装</span></p><p><span style=\"color: rgb(192, 0, 0);\"><br/></span></p><p><span style=\"color: rgb(192, 0, 0);\">下一章讲如何创建mysql nginx主体思路和php差不多</span></p><p>							 	</p><p>							 	</p><p>							 	</p>'),(5,'<p>							 	</p><p>							 	</p><p>一般情况下，我们在操作和运维VPS、服务器的时候可能会用到crontab定时任务的配置，比如定时的重启服务器、定时备份数据等操作使用的还是比较多的。这里就离不开使用crontab命令的任务配置，在这篇文章中将会整理较为齐全的crontab命令使用的方法以及常用的实例操作。<br/></p><p><img src=\"/uploadfile/ueditor/20171011/1507694617148181.jpg\" title=\"1507694617148181.jpg\" alt=\"1507694355630383.jpg\"/></p><p>从上图中，我们其实就可以看到crontab具体用法。一共有6个段落，前面5个标示定时的时间设定，后面一个标示文件的路径定时执行。</p><p><strong>第一 crontab安装</strong></p><p>一般我们使用的centos或者debian发行版本都自带crontab定时软件支持的，如果系统不支持，我们只需要通过下面对应的安装就可以。</p><p><strong>1、centos安装crontab</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">#安装Crontab\r\nyum&nbsp;install&nbsp;vixie-cron&nbsp;crontabs\r\n#设置开机启动Crontab\r\nchkconfig&nbsp;crond&nbsp;on\r\n#启动Crontab\r\nservice&nbsp;crond&nbsp;start</pre><p><br/></p></blockquote><p><strong>2、debian安装crontab</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">#安装Crontab\r\napt-get&nbsp;install&nbsp;cron\r\n#重启Crontab\r\n/etc/init.d/cron&nbsp;restart</pre><p><br/></p></blockquote><p>确保系统安装且运行生效之后才可以相关的设置。</p><p><br/></p><p><strong>第二 定时任务案例</strong></p><pre class=\"brush:bash;toolbar:false\">35&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;updatedb</pre><p>每隔一小时35分钟的时候更新一次数据库。</p><pre class=\"brush:bash;toolbar:false\">*/5&nbsp;*&nbsp;*&nbsp;*&nbsp;*&nbsp;/usr/local/bin/diskusage.sh</pre><p>每隔5分钟运行diskusage.sh文件。</p><pre class=\"brush:bash;toolbar:false\">25,50&nbsp;1&nbsp;15&nbsp;*&nbsp;2&nbsp;/usr/local/bin/diskusage.sh</pre><p>每周二1:50AM执行文件</p><pre class=\"brush:bash;toolbar:false\">00&nbsp;14&nbsp;10&nbsp;3,6,9,12&nbsp;*&nbsp;/usr/local/bin/diskusage.sh</pre><p>每年3、6、9、12月份第十天下午2点执行。</p><pre class=\"brush:bash;toolbar:false\">00&nbsp;21&nbsp;*&nbsp;*&nbsp;Mon,Wed,Fri&nbsp;/usr/local/bin/diskusage.sh&nbsp;admin@laozuo.org</pre><p>每周一、三、五下午9点执行脚本</p><pre class=\"brush:bash;toolbar:false\">*/5&nbsp;*&nbsp;*&nbsp;*&nbsp;1-5&nbsp;/usr/local/bin/diskusage.sh</pre><p>周一到周五，每五分钟执行。</p><p><br/></p><p><strong>第三 系统调度</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">/etc/cron.d&nbsp;/etc/cron.daily&nbsp;/etc/cron.hourly&nbsp;/etc/cron.monthly&nbsp;/etc/cron.weekly</pre><p><br/></p></blockquote><p>如果我们根目录在执行backup.sh备份命令，使用上面脚本可以直接替换到/etc/cron.weekly目录。</p><p><br/></p><p><strong>第四 定时计划的级别设定</strong></p><p><strong><br/></strong></p><p>我们在操作的时候，每个用户都可以编辑、查看、删除crontab定时配置文件。如果根用户需要改crontab文件，必须加上&#39;-u&#39;选项来指定用户名。</p><p>1、编辑crontab文件的用户laozuo时候，我们可以使用命令：</p><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-u&nbsp;laozuo&nbsp;-e</pre><p>2、移除laozuo用户的定时设定</p><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-u&nbsp;laozuo&nbsp;-r</pre><p>3、查看laozuo定时任务设置文件</p><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-u&nbsp;laozuo&nbsp;-l</pre><p><strong>第五 从文件中加载crontab</strong></p><p>我们除了可以手工编辑定时文件之外，还可以文件加载到定时文件中。</p><blockquote><pre class=\"brush:bash;toolbar:false\">cat&nbsp;/root/mycronjobs.txt\r\n53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh\r\n01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh</pre><p><br/></p></blockquote><p>我们需要先上传编辑好的mycronjobs.txt定时任务文件到目录中，然后才可以执行。</p><blockquote><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;/root/mycronjobs.txt</pre><p><br/></p></blockquote><p>通过这个命令检查验证。</p><blockquote><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-l\r\n53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh\r\n01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh</pre><p><br/></p></blockquote><p>这里我们可以检查定时文件是否存在。</p><p><strong>第<strong style=\"white-space: normal;\">六</strong> 加入SELinux安全选项</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">crontab&nbsp;-s&nbsp;/root/mycronjobs/my.txt\r\nSELINUX_ROLE_TYPE=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023\r\n53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh\r\n01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh</pre><p><br/></p></blockquote><p><strong>第七 删除定时任务工作</strong></p><blockquote><pre class=\"brush:bash;toolbar:false\">[root@linux&nbsp;~]#&nbsp;crontab&nbsp;-l53&nbsp;00&nbsp;*&nbsp;*&nbsp;7&nbsp;/bin/sh&nbsp;/root/server-backup.sh01&nbsp;00&nbsp;*&nbsp;*&nbsp;*&nbsp;/bin/sh&nbsp;/root/check-user-quota.sh\r\n[root@linux&nbsp;~]#&nbsp;crontab&nbsp;-r\r\n[root@linux&nbsp;~]#&nbsp;crontab&nbsp;-lno&nbsp;crontab&nbsp;for&nbsp;root</pre><p><br/></p></blockquote><p>我们先用-l查看当前的定时任务，然后用-r删除，然后再检查已经没有任务选项。</p><p>总结，以上6个步骤和方法，就是我们常用的crontab定时文件配置常用的，一般我们会用的多的是备份和定时启动等，根据我们实际的需要再进行时间上的调整。</p><p><br/></p><p>							 	</p><p>							 	</p>'),(6,'<p style=\"white-space: normal;\">\r\n    一些错误信息的处理，主从服务器上的命令，及状态信息。<br/>在从服务器上使用show&nbsp;slave&nbsp;status\\G<br/><br/>Slave_IO_Running,为No,<br/>则说明IO_THREAD没有启动，请执行start&nbsp;slave&nbsp;io_thread<br/><br/>Slave_SQL_Running为No<br/>则复制出错,查看Last_error字段排除错误后执行start&nbsp;slave&nbsp;sql_thread&nbsp;<br/><br/>查看Slave_IO_State字段空&nbsp;//复制没有启动<br/>Connecting&nbsp;to&nbsp;master//没有连接上master<br/>Waiting&nbsp;for&nbsp;master&nbsp;to&nbsp;send&nbsp;event//已经连上\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主服务器上的相关命令：&nbsp;<br/>show&nbsp;master&nbsp;status&nbsp;<br/>show&nbsp;slave&nbsp;hosts&nbsp;<br/>show&nbsp;logs&nbsp;<br/>show&nbsp;binlog&nbsp;events&nbsp;<br/>purge&nbsp;logs&nbsp;to&nbsp;&#39;log_name&#39;&nbsp;<br/>purge&nbsp;logs&nbsp;before&nbsp;&#39;date&#39;&nbsp;<br/>reset&nbsp;master(老版本flush&nbsp;master)&nbsp;<br/>set&nbsp;sql_log_bin=\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    从服务器上的相关命令:&nbsp;<br/>slave&nbsp;start&nbsp;<br/>slave&nbsp;stop&nbsp;<br/>SLAVE&nbsp;STOP&nbsp;IO_THREAD&nbsp;//此线程把master段的日志写到本地&nbsp;<br/>SLAVE&nbsp;start&nbsp;IO_THREAD&nbsp;<br/>SLAVE&nbsp;STOP&nbsp;SQL_THREAD&nbsp;//此线程把写到本地的日志应用于数据库&nbsp;<br/>SLAVE&nbsp;start&nbsp;SQL_THREAD&nbsp;<br/>reset&nbsp;slave&nbsp;<br/>SET&nbsp;GLOBAL&nbsp;SQL_SLAVE_SKIP_COUNTER&nbsp;<br/>load&nbsp;data&nbsp;from&nbsp;master&nbsp;<br/>show&nbsp;slave&nbsp;status(SUPER,REPLICATION&nbsp;CLIENT)&nbsp;<br/>CHANGE&nbsp;MASTER&nbsp;TO&nbsp;MASTER_HOST=,&nbsp;MASTER_PORT=,MASTER_USER=,&nbsp;MASTER_PASSWORD=&nbsp;//动态改变master信息<br/>PURGE&nbsp;MASTER&nbsp;[before&nbsp;&#39;date&#39;]&nbsp;删除master端已同步过的日志&nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>6.3.1&nbsp;Master&nbsp;同步线程状态\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    以下列出了master的&nbsp;Binlog&nbsp;Dump&nbsp;线程&nbsp;State&nbsp;字段中最常见的几种状态。如果在master上没有&nbsp;Binlog&nbsp;Dump&nbsp;线程，那么同步就没有在运行。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    也就是说，没有slave连接上来。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Sending&nbsp;binlog&nbsp;event&nbsp;to&nbsp;slave\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    事件是由二进制日志构成，一个事件通常由更新语句加上其他信息。线程读取到一个事件并正发送到slave上。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Finished&nbsp;reading&nbsp;one&nbsp;binlog;&nbsp;switching&nbsp;to&nbsp;next&nbsp;binlog\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    读取完了一个二进制日志，正切换到下一个。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Has&nbsp;sent&nbsp;all&nbsp;binlog&nbsp;to&nbsp;slave;&nbsp;waiting&nbsp;for&nbsp;binlog&nbsp;to&nbsp;be&nbsp;updated\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经读取完全部未完成更新日志，并且全部都发送到slave了。它处于空闲状态，正等待在master上执行新的更新操作以在二进制日志中产生新\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    的事件，然后读取它们。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;to&nbsp;finalize&nbsp;termination\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前线程停止了，这个时间很短。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    6.3.2&nbsp;Slave的I/O线程状态\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    以下列出了slave的I/O线程&nbsp;State&nbsp;字段中最常见的几种状态。从MySQL&nbsp;4.1.1开始，这个状态在执行&nbsp;SHOW&nbsp;SLAVE&nbsp;STATUS&nbsp;语句结果的\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Slave_IO_State&nbsp;字段也会出现。这意味着可以只执行&nbsp;SHOW&nbsp;SLAVE&nbsp;STATUS&nbsp;语句就能了解到更多的信息。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Connecting&nbsp;to&nbsp;master\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    该线程证尝试连接到master上。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Checking&nbsp;master&nbsp;version\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    确定连接到master后出现的一个短暂的状态。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Registering&nbsp;slave&nbsp;on&nbsp;master\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    确定连接到master后出现的一个短暂的状态。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Requesting&nbsp;binlog&nbsp;dump\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    确定连接到master后出现的一个短暂的状态。该线程向master发送一个请求，告诉它要请求的二进制文件以及开始位置。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;to&nbsp;reconnect&nbsp;after&nbsp;a&nbsp;failed&nbsp;binlog&nbsp;dump&nbsp;request\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果二进制日志转储(binary&nbsp;log&nbsp;dump)请求失败了(由于连接断开)，该线程在休眠时进入这个状态，并定期重连。重连的时间间隔由&nbsp;--\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    master-connect-retry&nbsp;选项来指定。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Reconnecting&nbsp;after&nbsp;a&nbsp;failed&nbsp;binlog&nbsp;dump&nbsp;request\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    该线程正尝试重连到master。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;master&nbsp;to&nbsp;send&nbsp;event\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经连接到master，正等待它发送二进制日志。如果master闲置时，这个状态可能会持续较长时间，如果它等待超过&nbsp;slave_read_timeout&nbsp;秒\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ，就会发生超时。这时，它就会考虑断开连接，然后尝试重连。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Queueing&nbsp;master&nbsp;event&nbsp;to&nbsp;the&nbsp;relay&nbsp;log\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经读取到一个事件，正把它拷贝到中继日志中以备SQL线程处理。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;to&nbsp;reconnect&nbsp;after&nbsp;a&nbsp;failed&nbsp;master&nbsp;event&nbsp;read\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    读日志时发生错误(由于连接断开)。该线程在重连之前休眠&nbsp;master-connect-retry&nbsp;秒。<br/>Reconnecting&nbsp;after&nbsp;a&nbsp;failed&nbsp;master&nbsp;event&nbsp;read\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>正尝试重连到master。当连接确定后，状态就变成&nbsp;Waiting&nbsp;for&nbsp;master&nbsp;to&nbsp;send&nbsp;event。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;the&nbsp;slave&nbsp;SQL&nbsp;thread&nbsp;to&nbsp;free&nbsp;enough&nbsp;relay&nbsp;log&nbsp;space\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    relay_log_space_limit&nbsp;的值非零，中继日志的大小总和超过这个值了。I/O线程等待SQL线程先处理中继日志然后删除它们以释放足够的空间\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;slave&nbsp;mutex&nbsp;on&nbsp;exit\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前线程停止了，这个时间很短。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    6.3.3&nbsp;Slave的SQL线程状态\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    以下列出了slave的SQL线程&nbsp;State&nbsp;字段中最常见的几种状态：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Reading&nbsp;event&nbsp;from&nbsp;the&nbsp;relay&nbsp;log\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    从中继日志里读到一个事件以备执行。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Has&nbsp;read&nbsp;all&nbsp;relay&nbsp;log;&nbsp;waiting&nbsp;for&nbsp;the&nbsp;slave&nbsp;I/O&nbsp;thread&nbsp;to&nbsp;update&nbsp;it\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    已经处理完中继日志中的全部事件了，正等待I/O线程写入更新的日志。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>Waiting&nbsp;for&nbsp;slave&nbsp;mutex&nbsp;on&nbsp;exit\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前线程停止了，这个时间很短。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    故障\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    问题：主从复制不止何故停止了，我该怎么办？\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    答案：复制错误多半是因为日志错误引起的，所以首先要搞清楚是主日志错误还是中继日志错误，从错误信息里一般就能判断，如果不能可以使用类似下面的mysqlbinlog命令：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    mysqlbinlog&nbsp;&lt;MASTER_BINLOG_FILE&gt;&nbsp;&gt;&nbsp;/dev/null\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    mysqlbinlog&nbsp;&lt;SLAVE_BINLOG_FILE&gt;&nbsp;&gt;&nbsp;/dev/null\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果没有错误，则不会有任何输出，反之如果有错误，则会显示出来。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果是主日志错误，则需要在从服务器使用SET&nbsp;GLOBAL&nbsp;sql_slave_skip_counter，如下：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SET&nbsp;GLOBAL&nbsp;sql_slave_skip_counter&nbsp;=&nbsp;1;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    START&nbsp;SLAVE;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    注：如果有多个错误，可能需要执行多次（提醒：主从服务器数据可能因此不一致）。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如果是中继日志错误，只要在从服务器使用SHOW&nbsp;SLAVE&nbsp;STATUS结果中的日志信息重新CHANGE&nbsp;MASTER&nbsp;TO即可，系统会抛弃当前的中继日志，重新下载：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    CHANGE&nbsp;MASTER&nbsp;TO\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    MASTER_LOG_FILE=&#39;&lt;Relay_Master_Log_File&gt;&#39;,\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    MASTER_LOG_POS=&lt;Exec_Master_Log_Pos&gt;;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    START&nbsp;SLAVE;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    至于为什么使用的是Relay_Master_Log_File&nbsp;&amp;&nbsp;Exec_Master_Log_Pos，参见概述。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    问题：主服务器宕机了，如何把从服务器提升会主服务器？\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    答案：在一主多从的环境总，需选择数据最新的从服务器做新的主服务器。如下图所示：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    提升从服务器为主服务器\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在一主（Server1）两从（Server2，、Server3）的环境中，Server1宕机后，等到Server1和Server2把宕机前同步到的日志都执行完，比较Master_Log_File和Read_Master_Log_Pos就可以判断出谁快谁慢，因为Server2从&nbsp;Server1同步的数据（1582）比Server3从Server1同步的数据（1493）新，所以应该提升Server2为新的主服务器，那么&nbsp;Server3在CHANGE&nbsp;MASTER&nbsp;TO到Server2的时候应该使用什么样的参数呢？1582-1493=89，而Server2的最后的二进制日志位置是8167，所以答案是&nbsp;8167-89=8078。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    技巧\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主从服务器中的表可以使用不同的表类型。比如主服务器可以使用InnoDB表类型，提供事务，行锁等高级特性，从服务器可以使用MyISAM表类型，内存消耗少，易备份等优点。还有一个例子，一台主服务器如果同时带很多个从服务器的话，势必会影响其性能，此时可以拿出一台服务器作为从服务器代理，使用BLACKHOLE表类型，只记录日志，不写数据，由它带多台从服务器，从而提升性能。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主从服务器中的表可以使用不同的键类型。比如主服务器用InnoDB，键用VARCHAR的话节省空间，从服务器使用MyISAM，键用CHAR提高速度，因为MyISAM有静态表一说。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    主从服务器中的表可以使用不同的索引。主服务器主要用来应付写操作，所以除了主键和唯一索引等保证数据关系的索引一般都可以不加，从服务器一般用来应付读操作，所以可以针对查询特征设置索引，再进一步，不同的从服务器可以针对不同的查询设置不同的索引。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    MySQL同步功能由3个线程(master上1个，slave上2个)来实现。执行&nbsp;DE&gt;START&nbsp;SLAVEDE&gt;&nbsp;语句后，slave就创建一个I/O线程。I/O线程连接到master上，并请求master发送二进制日志中的语句。master创建一个线程来把日志的内容发送到slave上。这个线程在master上执行&nbsp;DE&gt;SHOW&nbsp;PROCESSLISTDE&gt;&nbsp;语句后的结果中的&nbsp;DE&gt;Binlog&nbsp;DumpDE&gt;&nbsp;线程便是。slave上的I/O线程读取master的&nbsp;DE&gt;Binlog&nbsp;DumpDE&gt;&nbsp;线程发送的语句，并且把它们拷贝到其数据目录下的中继日志(relay&nbsp;logs)中。第三个是SQL线程，salve用它来读取中继日志，然后执行它们来更新数据。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    如上所述，每个master/slave上都有3个线程。每个master上有多个线程，它为每个slave连接都创建一个线程，每个slave只有I/O和SQL线程。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    show&nbsp;slave&nbsp;master&nbsp;用于提供有关从属服务器线程的关键参数的信息\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SHOW&nbsp;SLAVE&nbsp;STATUS会返回以下字段：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Slave_IO_State\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SHOW&nbsp;PROCESSLIST输出的State字段的拷贝。SHOW&nbsp;PROCESSLIST用于从属I/O线程。如果线程正在试图连接到主服务器，正在等待来自主服务器的时间或正在连接到主服务器等，本语句会通知您\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_User\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    被用于连接主服务器的当前用户。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_Port\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    当前的主服务器接口。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Connect_Retry\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    –master-connect-retry选项的当前值\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_Log_File\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    I/O线程当前正在读取的主服务器二进制日志文件的名称。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Read_Master_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在当前的主服务器二进制日志中，I/O线程已经读取的位置。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Log_File\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SQL线程当前正在读取和执行的中继日志文件的名称。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在当前的中继日志中，SQL线程已读取和执行的位置。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Master_Log_File\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    由SQL线程执行的包含多数近期事件的主服务器二进制日志文件的名称。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Slave_IO_Running\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    I/O线程是否被启动并成功地连接到主服务器上。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Slave_SQL_Running\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    SQL线程是否被启动。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Replicate_Do_DB,Replicate_Ignore_DB\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    使用–replicate-do-db和–replicate-ignore-db选项指定的数据库清单。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Replicate_Do_Table,Replicate_Ignore_Table,Replicate_Wild_Do_Table,Replicate_Wild_Ignore_Table\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    使用–replicate-do-table,–replicate-ignore-table,–replicate-wild-do-table和–replicate-wild-ignore_table选项指定的表清单。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Last_Errno,Last_Error\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    被多数最近被执行的查询返回的错误数量和错误消息。错误数量为0并且消息为空字符串意味着“没有错误”。如果Last_Error值不是空值，它也会在从属服务器的错误日志中作为消息显示。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    举例说明：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Last_Errno:&nbsp;1051\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Last_Error:&nbsp;error&nbsp;‘Unknown&nbsp;table&nbsp;‘z”&nbsp;on&nbsp;query&nbsp;‘drop&nbsp;table&nbsp;z’\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    该消息指示，表z曾经存在于在主服务器中并已被取消了，但是它没有在从属服务器中存在过，因此对于从属服务器，DROP&nbsp;TABLE失败。（举例说明，在设置复制时，如果您忘记了把此表拷贝到从属服务器中，则这有可能发生。）\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Skip_Counter\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    最近被使用的用于SQL_SLAVE_SKIP_COUNTER的值。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Exec_Master_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    来自主服务器的二进制日志的由SQL线程执行的上一个时间的位置（Relay_Master_Log_File）。在主服务器的二进制日志中的(Relay_Master_Log_File,&nbsp;Exec_Master_Log_Pos)对应于在中继日志中的(Relay_Log_File,Relay_Log_Pos)。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Relay_Log_Space\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    所有原有的中继日志结合起来的总大小。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Until_Condition,Until_Log_File,Until_Log_Pos\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    在START&nbsp;SLAVE语句的UNTIL子句中指定的值。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Until_Condition具有以下值：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果没有指定UNTIL子句，则没有值\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果从属服务器正在读取，直到达到主服务器的二进制日志的给定位置为止，则值为Master\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果从属服务器正在读取，直到达到其中继日志的给定位置为止，则值为Relay\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Until_Log_File和Until_Log_Pos用于指示日志文件名和位置值。日志文件名和位置值定义了SQL线程在哪个点中止执行。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ?&nbsp;Master_SSL_Allowed,Master_SSL_CA_File,Master_SSL_CA_Path,Master_SSL_Cert,Master_SSL_Cipher,Master_SSL_Key\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    这些字段显示了被从属服务器使用的参数。这些参数用于连接主服务器。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Master_SSL_Allowed具有以下值：\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果允许对主服务器进行SSL连接，则值为Yes\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果不允许对主服务器进行SSL连接，则值为No\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    o&nbsp;如果允许SSL连接，但是从属服务器没有让SSL支持被启用，则值为Ignored。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    与SSL有关的字段的值对应于–master-ca,–master-capath,–master-cert,–master-cipher和–master-key选项\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    ########################################################################<br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    <br/>\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    Replication延时的类型\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、固定性的延时\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;——Slave的数据持续性的落后于Master并且一直无法与Master的数据保持一致。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;——Slave的数据经常在白天落后于Master，而在晚上可以赶上并与Master的记录保持一致。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;这种类型的延时通常是由于Slave服务器的负载已经到达了上限或在白天访问量大的时候到达上限造成的。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、非固定性的延时\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;——Slave的数据只是短暂的落后于Master，可在短时间内恢复，这类型的延时通常与批量任务和报表有关，效率差的查询也会导致这类延时。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Mysql&nbsp;Replication的限制\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　Mysql的Replication是单线程的，意味着只能有效的使用一个CPU内核和一个磁盘，一条复杂的查询或者事务都导致进程被阻塞，不过现在针对5.1版本的多线程Replication补丁，<a target=\"_blank\" href=\"http://forge.mysql.com/wiki/ReplicationFeatures/ParallelSlave\">http://forge.mysql.com/wiki/ReplicationFeatures/ParallelSlave</a>，还是pre版，有很多限制，感兴趣的可以去看看。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Replication的容量\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、理解什么是Replication的容量\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　可以将Replication暂停一个小时，重新启动Replication后，观察Slave的数据多久可以与Master一致。从Replication重新启动到和Master数据一致所花费的时间与Replication暂停的时间的比值就是Replication的容量。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、建议保持Replication的容量在3倍以上，即延迟一个小时的数据，Slave只需要20分钟就能与Master的数据一致。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Replication的优化\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、5.0的mysql中避免类似以下的更新语句\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;INSERT&nbsp;…&nbsp;SELECT\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;UPDATE&nbsp;....&nbsp;WHERE\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　复杂的查询会导致Replication线程阻塞。如果是insert或update与select结合的语句，可以讲select单独执行并保存在临时表中，然后再执行insert或者update。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　如果使用的是5.1的mysql，新功能中的行级Replication（RBR）可以解决这个问题。RBR可以将在Master上通过复杂查询后更新的结果直接传给Slave，Slave可以直接将结果更新到数据库中。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、避免大的事务\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;太大的事务会造成Replication长时间阻塞，数据会严重滞后于Master。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Slave服务器的硬件选择\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;更快的CPU内核，对于单线程的Replication多核CPU是没有任何优势的。更高速的硬盘，包括更高的转速和更好的高速缓存命中率，如果有钱的话上SSD吧。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;主从结构的扩展性问题\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;1、如何降低写操作的频率\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　Master的写操作会扩散到所有的Slave上，所以高频率的写操作会降低Slave的读操作效率。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;至少保持一台Slave做全库同步，其他的Slave可以只做部分表的同步。当然，这需要web应用程序的配合来分配哪些查询读哪些Slave。将一些更新操作放到memcached中，例如session和计数器。Slave使用myisam引擎，将一些写入量很大的更新操作直接在slave上执行，而不通过Replication。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;2、如何更有效的利用Slave的硬件资源[&nbsp;变形虫]\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;使用分区\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;有选择的对表进行同步\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;在Slave上对数据进行归档。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;Session的持久化\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;为不同的应用服务器分配不同的Slave进行读操作。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;或者根据查询类型的不同来分配不同的Slave。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;3、如何使你的程序最大化的利用Slave\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　将对数据更新不敏感的查询放到Slave上，而需要实时数据的查询则放到Master。通过session的持久化，让做了修改的用户首先看到修改的内容，其他的用户可以等待Slave更新后再查看新内容。\r\n</p>\r\n<p style=\"white-space: normal;\">\r\n    &nbsp;&nbsp;&nbsp;&nbsp;　　对于某些数据，可以用memcached来存放数据的版本号，读Slave的程序可以先对比Slave的数据和memcached数据的版本，如果不一致则去读master。用户和博客类的信息可以用这种方法。在查询前可以通过SHOW&nbsp;SLAVE&nbsp;STATUS检测Slave的状态，然后根据返回的结果进行服务器的选择。\r\n</p>\r\n<p>\r\n    							 	\r\n</p>');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='分类表\r\n';

/*Data for the table `dh_category` */

insert  into `dh_category`(`id`,`parentid`,`thumb`,`name`,`sort`,`is_show`,`created`) values (1,0,'','汽车品牌',0,1,0),(2,1,'','奥拓',1,1,0),(3,1,'3e4daf03cb497d10e0267b0f7b7de7df.png','大众',0,1,0),(4,0,'','服务类型',0,1,0),(5,4,'','汽车贴膜',0,1,0),(6,4,'','汽车维修',0,1,0),(7,4,'','汽车保养',0,1,0),(8,0,'','城市',0,1,0),(9,8,'','Toronto',0,1,0),(10,8,'','North-York',0,1,0),(11,8,'','Downtown',0,1,0),(12,8,'','Markham',0,1,0),(13,8,'','Vaughan',0,1,0),(14,8,'','Scarborough',0,1,0),(15,8,'','Brampton',0,1,0),(16,8,'','Mississauga',0,1,0),(17,8,'','Richmond-hill',0,1,0),(18,8,'','Newmarket',0,1,0),(19,0,'','店铺分类',0,1,0),(20,19,'','汽车贴膜',0,1,0),(21,19,'','汽车改装',0,1,0),(22,19,'','汽车清洗',0,1,0),(23,19,'','汽车售卖',0,1,0),(24,19,'','汽车保养',0,1,0),(25,1,'','宝马',0,1,0),(26,1,'','丰田',0,1,0),(27,1,'','本田',0,1,0),(28,1,'','雪佛兰',0,1,0),(29,1,'','福克斯',0,1,0),(30,1,'','雷洛',0,1,0),(31,1,'','奥迪',0,1,0),(32,1,'','阿尔法·罗密欧',0,1,0),(33,1,'','讴歌',0,1,0);

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
  KEY `is_reader` (`is_reader`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='聊天记录';

/*Data for the table `dh_chat_log` */

insert  into `dh_chat_log`(`id`,`uid`,`to_uid`,`content`,`is_reader`,`created`) values (1,2,3,'这是我的回复信息',1,1506585491),(2,2,3,'这是我的回复信息',1,1506585529),(3,2,3,'啦咯啦咯来咯啦咯啦咯啦咯',1,1507520456),(4,2,4,'你明明',1,1507533768),(5,2,3,'hhhvvgg',1,1507780095),(6,1,2,'在么？',1,1507786921),(7,1,2,'在么？',1,1507786932),(8,2,1,'在的亲',1,1507787075),(9,2,3,'咨询一下',1,1507861793),(10,7,2,'方法公积金',1,1507877057),(11,2,7,'过敏明敏',1,1507877141),(12,7,1,'凤凰',1,1507877330);

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `dh_circle` */

insert  into `dh_circle`(`id`,`type`,`title`,`thumb`,`uid`,`description`,`ablum`,`created`,`del_status`,`status`) values (1,1,'','150632458755821.png',4,'','150632458755821.png,150632458712977.png',1506324587,0,1),(2,1,'','',4,'','',1506390246,0,1),(3,1,'','',4,'来点文字介绍了了了 ','',1506390269,0,1),(4,1,'','150639074685682.png',2,'我和你一样','150639074685682.png,150639074689516.png,150639074681938.png',1506390746,0,1),(5,1,'','150658772943247.jpeg',2,'不要说话','150658772943247.jpeg,150658772976354.jpeg,150658772972256.jpeg,150658772927363.jpeg',1506587729,0,1),(6,1,'','150761826747622.png',3,'我的分享','150761826747622.png',1507618267,0,1),(7,1,'','150787675668636.jpeg',7,'带个好飓风','150787675668636.jpeg',1507876756,0,1);

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

/*Table structure for table `dh_comment` */

DROP TABLE IF EXISTS `dh_comment`;

CREATE TABLE `dh_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1车友圈 2汽车 3服务 4聊天来信',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '发布者uid',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '父级id',
  `to_uid` int(11) unsigned DEFAULT '0' COMMENT '回复者uid',
  `content` varchar(300) DEFAULT '' COMMENT '评论内容',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `order_sn` varchar(18) DEFAULT '' COMMENT '订单编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品id',
  `ablum` varchar(500) DEFAULT '' COMMENT '评价相册',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1开启 2关闭',
  `is_uid_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '发布者阅读状态 1已读 0未读',
  `is_to_uid_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '接受者阅读状态 1已读 0未读',
  `created` int(11) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `parent_id` (`parent_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `dh_comment` */

insert  into `dh_comment`(`id`,`type`,`uid`,`parent_id`,`to_uid`,`content`,`del_status`,`order_sn`,`goods_id`,`ablum`,`status`,`is_uid_reader`,`is_to_uid_reader`,`created`) values (1,1,3,0,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506327966),(2,1,3,0,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506327999),(3,1,4,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046),(4,1,3,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046),(5,1,3,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046),(6,1,3,2,4,'这是我发布的第一天评论',0,'',1,'',1,0,0,1506328046),(8,2,4,0,1,'啊啊啊啊啊',0,'172646797722115621',2,'',1,0,0,1506503620),(10,2,4,0,1,'啊啊啊啊啊',0,'172646797722115621',2,'',1,0,0,1506504617),(11,1,2,0,4,'这是我的评论',0,'',1,'',1,0,0,1506566061),(12,1,3,0,2,'这是第一条评论',0,'',4,'',1,0,0,1506580025),(13,1,2,12,3,'这是我的回复信息',0,'',4,'',1,0,1,1506583717),(14,1,2,4,3,'哈哈哈',0,'',1,'',1,0,1,1506584079),(15,1,2,0,2,'明年',0,'',4,'',1,0,0,1506584114),(16,1,2,4,3,'回复一次',0,'',1,'',1,0,1,1506584137),(17,1,3,4,2,'多试一下',0,'',1,'',1,0,0,1506586051),(18,1,3,4,2,'我要成功',0,'',1,'',1,0,0,1506586384),(19,1,2,12,3,'再试一次',0,'',4,'',1,0,1,1506586970),(20,1,2,12,3,'最后一个',0,'',4,'',1,0,1,1506587332),(21,1,2,0,2,'回复所有人',0,'',4,'',1,0,0,1506588087),(22,2,2,0,3,'好吃吗，还不错',0,'172670845735945735',5,'150667774515869.jpeg,150667774532563.jpeg',1,0,1,1506677745),(23,2,2,0,3,'评价回复',0,'172717592252214453',1,'150667794196918.jpeg',1,0,1,1506677941),(24,1,3,0,4,'评论',0,'',3,'',1,0,0,1507623260),(25,1,7,0,4,'发个呵呵',0,'',1,'',1,0,0,1507876462),(26,1,2,0,4,'萍聚',0,'',1,'',1,0,0,1507876527),(27,1,1,0,4,'测试评论内容',0,'',1,'',1,0,0,1507876682),(28,1,1,0,4,'测试评论内容',0,'',1,'',1,0,0,1507876763),(29,1,7,0,2,'4一个小很可靠',0,'',5,'',1,0,0,1507876981);

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

insert  into `dh_console_admin`(`id`,`consoleid`,`nickname`,`username`,`password`,`salt`,`mobile`,`status`,`group`,`create_ip`,`login_ip`,`created`,`login_time`) values (1,0,'四月','admin','8895c4947031a4019843c0d00fa303b1','50907','15923882847',1,1,'127.0.0.1','127.0.0.1',1502522576,1507862365),(4,0,'四月','lingsi','96c76c67a66e92c1e90bce05ebec4b5d','34366','15923882847',1,2,'127.0.0.1','127.0.0.1',1502531990,1507788756);

/*Table structure for table `dh_console_group` */

DROP TABLE IF EXISTS `dh_console_group`;

CREATE TABLE `dh_console_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '管理员分组名称',
  `power` mediumtext COMMENT '权限列表',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台管理分组';

/*Data for the table `dh_console_group` */

insert  into `dh_console_group`(`id`,`name`,`power`,`status`) values (1,'超级管理员','1,2,3,4,5,6,7,8,35,10,17,11,12,13,14,15,16,18,28,19,20,21,22,23,24,25,26,27,29,30,31,33,34,32',1),(2,'运营组','1,2,35,10,17,13,14,15,16,18,28,19,20,21,22,23,24,25,26,27,29,30,31,33,34,32',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `dh_console_menus` */

insert  into `dh_console_menus`(`id`,`type`,`parentid`,`name`,`module`,`controller`,`action`,`icon`,`parameter`,`url`,`status`,`is_show`,`is_white`,`sort`,`del_status`,`created`) values (1,1,0,'系统管理','setting','menus','index','glyphicon glyphicon-triangle-right','','',1,1,0,0,0,1502445648),(2,1,1,'设置','setting','parameter','lists','glyphicon glyphicon-wrench','','/setting/parameter/lists',1,1,0,0,0,1507788908),(3,1,2,'配置菜单','setting','menus','index','','','/setting/menus/index',1,1,0,1,0,1502508459),(4,1,3,'添加/编辑菜单','setting','menus','edit','','','',1,0,0,0,0,1502440822),(5,1,3,'树状菜单列表','setting','menus','tree_list','','','',1,0,0,0,0,1502440812),(6,1,2,'管理员','setting','admin','index','','','/setting/admin/index',1,1,0,3,0,1502516144),(7,1,6,'管理员列表','setting','admin','index','','','/setting/admin/index',1,1,0,0,0,1502517276),(8,1,6,'管理员分组','setting','group','index','','','/setting/group/index',1,1,0,0,0,1502517279),(10,1,0,'网站管理','content','list','index','glyphicon glyphicon-triangle-right','','/content/list/index',1,1,0,0,0,1505529695),(11,1,17,'博客','content','blog','index','glyphicon glyphicon-book','','/content/blog/index',1,1,0,0,0,1505577819),(12,1,11,'文章列表','content','blog','index','','','/content/blog/index',1,1,0,0,0,1505577827),(13,1,17,'分类管理','content','category','lists','glyphicon glyphicon-book','','/content/category/lists',1,1,0,0,0,1505529783),(14,1,13,'分类列表','content','category','lists','','','/content/category/lists',1,1,0,0,0,1505462341),(15,1,17,'会员管理','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529776),(16,1,15,'会员列表','content','user','lists','','','/content/user/lists',1,1,0,0,0,1505529506),(17,1,10,'内容管理','content','category','lists','','','/content/category/lists',1,1,0,0,0,1505529767),(18,1,15,'积分规则','content','integral_rul','lists','','','/content/integral_rul/lists',1,1,0,0,0,1505783604),(19,1,17,'商品管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784921),(20,1,19,'汽车管理','content','car','lists','','','/content/car/lists',1,1,0,0,0,1505784943),(21,1,19,'服务管理','content','service','lists','','','/content/service/lists',1,1,0,0,0,1505784962),(22,1,17,'广告图片管理','content','banner','lists','','','/content/banner/lists',1,1,0,0,0,1505809594),(23,1,22,'广告分类','content','banner','lists','','','/content/banner/lists',1,1,0,0,0,1505810230),(24,1,17,'搜索管理','content','search','lists','','','/content/search/lists',1,1,0,0,0,1505873873),(25,1,24,'搜索记录','content','search','lists','','','/content/search/lists',1,1,0,0,0,1505873843),(26,1,24,'推荐列表','content','search','recommend_lists','','','/content/search/recommend_lists',1,1,0,0,0,1505873952),(27,1,24,'禁用列表','content','search','disable_lists','','','/content/search/disable_lists',1,1,0,0,0,1505874438),(28,1,15,'店铺管理','content','shop','lists','','','/content/shop/lists',1,1,0,0,0,1505958027),(29,1,17,'服务管理','content','orders','lists','','','/content/orders/lists',1,1,0,0,0,1506414050),(30,1,29,'订单列表','content','orders','lists','','','/content/orders/lists',1,1,0,0,0,1506413737),(31,1,17,'推荐管理','content','recommend','car','','','/content/recommend/car',1,1,0,0,0,1506670836),(32,1,17,'抵扣卷管理','content','coupon','lists','','','/content/coupon/lists',1,1,0,0,0,1506477699),(33,1,31,'汽车列表','content','recommend','car','','','/content/recommend/car',1,1,0,0,0,1506670803),(34,1,31,'服务列表','content','recommend','service','','','/content/recommend/service',1,1,0,0,0,1506670828),(35,1,2,'参数配置','setting','parameter','lists','','','/setting/parameter/lists',1,1,0,2,0,1507778297);

/*Table structure for table `dh_console_parameter` */

DROP TABLE IF EXISTS `dh_console_parameter`;

CREATE TABLE `dh_console_parameter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1单行文本 2多行文本 3下拉 4单选 5多选',
  `name` varchar(50) DEFAULT '' COMMENT '参数名称',
  `value` varchar(300) DEFAULT '' COMMENT '参数值',
  `option` varchar(500) DEFAULT '' COMMENT '参数选项',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台参数配置';

/*Data for the table `dh_console_parameter` */

insert  into `dh_console_parameter`(`id`,`type`,`name`,`value`,`option`) values (1,1,'车行汽车交易佣金(百分比)','2','');

/*Table structure for table `dh_coupon` */

DROP TABLE IF EXISTS `dh_coupon`;

CREATE TABLE `dh_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1满减 2折扣',
  `category` tinyint(1) unsigned NOT NULL COMMENT '所属分类',
  `uid` int(11) DEFAULT NULL COMMENT '发放者uid',
  `title` varchar(50) DEFAULT NULL COMMENT '抵扣卷名称',
  `full` decimal(10,2) DEFAULT '0.00' COMMENT '满多少钱',
  `less` decimal(10,2) DEFAULT '0.00' COMMENT '减少多少钱',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='抵扣卷模板';

/*Data for the table `dh_coupon` */

insert  into `dh_coupon`(`id`,`type`,`category`,`uid`,`title`,`full`,`less`,`discount`,`num`,`start_time`,`end_time`,`status`,`remainder_num`,`del_status`,`created`,`is_exchange`,`version`) values (2,1,23,1,'5折优惠卷','10.00','5.00',0,100,1505701881,1507564800,1,92,0,1506411977,1,14),(3,1,21,1,'5折优惠卷','1000.00','100.00',0,100,1505701881,1507564800,1,98,0,1506411977,1,9),(4,1,20,3,'满100减10','200.00','5.00',0,400,1509465600,1512057600,1,399,0,1506483325,1,2),(5,2,20,3,'这个是名称','0.00','0.00',8,55,1506787200,1509465600,1,300,0,1506483455,1,1),(6,1,21,1,'5折优惠卷','1000.00','100.00',0,100,1505701881,1507564800,1,100,0,1506491073,1,1),(7,1,21,1,'5折优惠卷','1000.00','100.00',0,100,1505701881,1507564800,1,100,0,1506491125,1,1),(8,1,23,3,'满100减5','100.00','5.00',0,200,1506528000,1506700800,1,199,0,1506562539,1,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='抵扣卷列表';

/*Data for the table `dh_coupon_log` */

insert  into `dh_coupon_log`(`id`,`uid`,`coupon_id`,`order_sn`,`use_time`,`created`,`origin`) values (14,4,2,'0',0,1506483306,1),(18,4,2,'0',0,1506483429,1),(22,4,2,'0',0,1506483621,1),(23,4,3,'0',0,1506483637,1),(24,4,2,'0',0,1506483638,1),(25,4,2,'172646797722115621',1506500098,1506483638,1),(26,4,2,'172646797722115621',1506499772,1506483639,1),(27,4,2,'172646797722115621',1506500328,1506483674,1),(28,4,2,'0',0,1506483675,1),(29,4,3,'0',0,1506483676,1),(30,4,3,'0',0,1506483677,1),(31,4,3,'0',0,1506483678,1),(33,4,3,'0',0,1506484219,1),(36,4,3,'0',0,1506503423,1),(37,4,8,'0',0,1506655062,1),(38,2,2,'0',0,1506655519,1),(39,2,2,'0',0,1506655523,1),(40,2,8,'0',0,1506677606,2),(41,2,8,'0',0,1506677703,2),(42,2,4,'0',0,1507878186,1);

/*Table structure for table `dh_enjoy` */

DROP TABLE IF EXISTS `dh_enjoy`;

CREATE TABLE `dh_enjoy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1车友圈',
  `value` varchar(10) DEFAULT '' COMMENT '对于值',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户uid',
  `created` int(11) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `dh_enjoy` */

insert  into `dh_enjoy`(`id`,`type`,`value`,`uid`,`created`) values (3,1,'2',2,1506577947),(4,1,'3',2,1506577953),(7,1,'4',2,1506587887),(8,1,'1',3,1507689475),(9,1,'4',3,1507689478),(10,1,'5',7,1507876874),(11,1,'6',7,1507876886);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='财务记录';

/*Data for the table `dh_finance_log` */

insert  into `dh_finance_log`(`id`,`type`,`money`,`content`,`is_pay`,`created`) values (1,1,'2000.00','172725122012655001',0,0),(2,1,'400.00','172670845735945735',0,1507864856),(3,1,'400.00','172670367752827418',0,1507864874),(4,1,'0.28','172646797722115621',0,1507864879);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='用户浏览记录';

/*Data for the table `dh_footprints` */

insert  into `dh_footprints`(`id`,`uid`,`type`,`value`,`value2`,`del_status`,`ip`,`created`) values (3,1,1,1,'1',0,'127.0.0.1',1507692707),(4,2,1,8,'3',0,'127.0.0.1',1507534075),(5,4,1,2,'1',0,'127.0.0.1',1506065062),(6,2,1,5,'3',0,'127.0.0.1',1506737017),(7,2,1,3,'3',0,'127.0.0.1',1506582976),(8,4,1,1,'1',0,'127.0.0.1',1506303637),(9,2,1,18,'2',0,'127.0.0.1',1507877617),(10,2,1,15,'4',0,'127.0.0.1',1507534150),(11,2,1,17,'2',0,'127.0.0.1',1507877223),(12,2,1,11,'1',0,'127.0.0.1',1507533749),(13,2,1,13,'4',0,'127.0.0.1',1507533764),(14,2,1,16,'2',0,'127.0.0.1',1507534978),(15,1,1,5,'3',0,'127.0.0.1',1507622804),(16,3,1,8,'3',0,'127.0.0.1',1507874991),(17,4,1,15,'4',0,'127.0.0.1',1507875418),(18,1,1,11,'1',0,'127.0.0.1',1507877804),(19,7,1,19,'7',0,'127.0.0.1',1507877563),(20,3,1,3,'3',0,'127.0.0.1',1507879191),(21,3,1,5,'3',0,'127.0.0.1',1507883185);

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

insert  into `dh_goods_ablum`(`goods_id`,`type`,`path`,`description`) values (8,1,'150587084778216.png','车辆左侧图片'),(7,1,'150580908094311.png','第一张图的介绍'),(7,1,'150580908088887.png','第二张图的介绍'),(7,1,'150580908030846.png','第三张图的介绍'),(8,1,'150587084722911.png','车辆右侧图片'),(8,1,'150587084720442.png','车辆全方位图片'),(9,1,'150596089940011.png',''),(9,1,'150596089953019.jpeg',''),(10,1,'150596096882383.png',''),(10,1,'150596096843093.jpeg',''),(11,1,'150596115599401.png',''),(11,1,'150596115513883.jpeg',''),(12,1,'150641899559070.png',''),(12,1,'150641899567442.png',''),(13,1,'150641904798483.png',''),(13,1,'150641904741132.png',''),(14,1,'150641910419409.png',''),(14,1,'150641910499508.png',''),(15,1,'150641947518717.png',''),(15,1,'150641947595036.png',''),(16,1,'',''),(17,1,'150642085914589.jpeg','第一张'),(17,1,'150642085933505.jpeg','第二张'),(17,1,'150642085934886.jpeg','第三张'),(18,1,'150647576846741.jpeg','第一张'),(18,1,'150647576885042.jpeg','第二张'),(18,1,'150647576860457.jpeg','第三张'),(19,1,'150787632893180.jpeg','富太太'),(19,1,'150787632814051.jpeg','地方'),(19,1,'150787632828731.jpeg',''),(19,1,'150787632878128.jpeg','');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='新车信息';

/*Data for the table `dh_goods_car` */

insert  into `dh_goods_car`(`id`,`type`,`uid`,`title`,`thumb`,`brand`,`style`,`produce_time`,`model`,`buy_time`,`mileage`,`city`,`gearbox`,`gases`,`displacement`,`model_remark`,`price`,`vin`,`guarantee`,`is_lease`,`mobile`,`weixin`,`qq`,`address`,`description`,`banner`,`status`,`hot`,`is_recommend`,`is_urgency`,`is_show`,`created`) values (1,2,1,'奥迪 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',2,'A6L',2013,' 三厢',1420041600,1.2,'9','自动','国V','1.6L','纪念版2','18000.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','',1,13,0,0,1,1505701881),(2,2,1,'奥迪 2013 A6L 1.6L 纪念版2','150578956279606.png',1,'A6L',2013,' 三厢',1420041600,1.2,'17','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150578956279606.png,150578956240119.jpeg',1,24,0,0,1,1505701942),(3,2,3,'大众 2017 x5 2.0 很好','150596096890834.jpeg',3,'x5',2017,'2',1420041600,2.0,'14','2','2','2.0','很好','20.00','888888','0',1,'','','','','九成新，值得入手','',1,2,1,1,1,1505706388),(4,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方','',1,1,0,0,1,1505706629),(5,2,3,'奥迪 2017 23 888 很好','150596096890834.jpeg',2,'23',2017,'1',1420041600,5.0,'14','2','1','888','很好','5.00','88888996','0',0,'','','','','很好的啦','',1,4,1,1,1,1505706882),(6,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580886964585.png,150580886964659.jpeg',1,3,0,0,1,1505808869),(7,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',1420041600,1.2,'14','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150580908058688.png,150580908096283.jpeg',1,2,0,0,1,1505809080),(8,2,3,'奥迪 2017 x6 2.0 很好的汽车，九成新','150587084744692.png',2,'x6',2017,'5',1420041600,5.0,'14','1','1','2.0','很好的汽车，九成新','20.00','66666666','0',0,'','','','','很好哦，九成新，值得入手，不要犹豫','150587084744692.png,150587084733090.png',1,1,1,1,1,1505870847),(9,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','',1,21,0,0,1,1505960899),(10,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596096890834.jpeg',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150596096890834.jpeg,150596096837567.jpeg,150596096889744.png',1,5,0,0,1,1505960968),(11,2,1,'汽车品牌 2013 A6L 1.6L 纪念版2','150596115541618.jpeg',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150596115541618.jpeg,150596115599406.jpeg,150596115594979.png',1,1,0,0,1,1505961155),(12,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641899599456.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641899599456.png,150641899599165.png,150641899581683.png',1,1,0,0,1,1506418995),(13,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641904739627.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641904739627.png,150641904789466.png,150641904730885.png',1,5,0,0,1,1506419047),(14,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641910488810.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641910488810.png,150641910457982.png,150641910411562.png',1,1,0,0,1,1506419104),(15,1,4,'汽车品牌 2013 A6L 1.6L 纪念版2','150641947515130.png',1,'A6L',2013,' 三厢',2017,1.2,'5','自动','国V','1.6L','纪念版2','18.00','111111','0',0,'15923882847','weixin','qq','这里是测试地址信息的','这里是输入商品详情的地方11111','150641947515130.png,150641947565011.png,150641947546598.png',1,5,0,0,1,1506419475),(16,1,2,'奥迪 2017 j6','150641999361907.jpeg',2,'j6',2017,'',1504195200,6.0,'4','','','','','13.00','','0',0,'','','','','','150641999361907.jpeg,150641999321747.jpeg,150641999369548.jpeg',1,10,0,0,1,1506419993),(17,1,2,'奥迪 2017 l6 6 备注','150642085932332.png',2,'l6',2017,'2',1504195200,6.0,'4','2','1','6','备注','13.00','kdkxjxj','0',0,'','','','','差个明模式我说问一下','150642085932332.png,150642085925946.png,150642085922650.png',1,1,0,0,1,1506420859),(18,1,2,'奥迪 2017 c6 6 备注啦啦','150647576838026.jpeg',2,'c6',2017,'1',1501516800,5.0,'2','2','1','6','备注啦啦','13.00','646797997','0',0,'','','','','详细备注，让客户更好了解车子','150647576838026.jpeg,150647576843596.jpeg,150647576844041.jpeg',1,1,0,0,1,1506475768),(19,1,7,'宝马 2017 方法个 1.6','150787632875679.jpeg',25,'方法个',2017,'1',1412092800,1.0,'1','1','1','1.6','','200000.00','地方呵呵','0',0,'','','','','','150787632875679.jpeg,150787632875775.jpeg',1,1,0,0,1,1507876328);

/*Table structure for table `dh_goods_service` */

DROP TABLE IF EXISTS `dh_goods_service`;

CREATE TABLE `dh_goods_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned DEFAULT '0' COMMENT 'uid',
  `title` varchar(60) DEFAULT '' COMMENT '标题',
  `thumb` varchar(150) DEFAULT '' COMMENT '封面图',
  `type` tinyint(1) DEFAULT '0' COMMENT '服务类型',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `ablum` varchar(500) DEFAULT '' COMMENT '相册',
  `description` mediumtext COMMENT '详情',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1上架 2下架 3后台删除 4用户删除',
  `hot` int(11) DEFAULT '0' COMMENT '浏览次数',
  `orders` int(11) DEFAULT '0' COMMENT '订单总量',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '显示状态 1显示 0不显示',
  `del_status` tinyint(1) DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='服务信息';

/*Data for the table `dh_goods_service` */

insert  into `dh_goods_service`(`id`,`uid`,`title`,`thumb`,`type`,`price`,`ablum`,`description`,`status`,`hot`,`orders`,`is_show`,`del_status`,`created`) values (2,1,'免费贴膜','150578927012952.jpeg',20,'9.90','150578927012952.jpeg,150578927046872.png,150578927019459.png','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505702940),(3,1,'免费贴膜','150578927012952.jpeg',20,'9.90','','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505703219),(4,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570322945362.png,150570322992738.jpeg,150570322914812.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505703229),(5,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570424689878.png,150570424614177.jpeg,150570424697703.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704246),(6,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570433438039.png,150570433448718.jpeg,150570433473341.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704334),(7,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570437049342.png,150570437077162.jpeg,150570437034977.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704370),(8,1,'免费贴膜','150578927012952.jpeg',20,'10.00','150570449431456.png,150570449497171.jpeg,150570449483501.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505704494),(10,1,'免费贴膜','150578927012952.jpeg',20,'9.90','150570605387503.png,150570605341278.jpeg,150570605343313.jpeg','这里是文字内容介绍的地方哦哦哦哦哦哦哦哦哦',1,0,0,1,0,1505706053),(11,3,'200','150578927012952.jpeg',1,'200.00','150571629162506.jpeg,150571629146095.jpeg','主要针对劳斯莱斯、布加迪等维修保养',1,0,0,1,0,1505716291),(12,3,'500000','',23,'500000.00','150667581778763.jpeg','服务详情还能再说什么',1,0,0,1,0,1506675817);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='帮我买车';

/*Data for the table `dh_help_car` */

insert  into `dh_help_car`(`id`,`uid`,`brand`,`price`,`buy_time`,`mileage`,`description`,`created`,`status`,`recommend_id`,`del_status`) values (2,1,'大众','10万以内','今年','23万公里内的','这里是简介信息',1505957035,3,'18,17,16,15,14,13,2,1',0),(3,2,'奥迪','20万以上','一年两个月','','',1505964715,3,'18,17,16,15,14,13,12,11,10,9,6,5',0),(4,7,'风格','50000','1','5000','大概好纠结',1507878092,3,'19,18',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `dh_help_service` */

insert  into `dh_help_service`(`id`,`uid`,`sign`,`price`,`description`,`created`,`status`,`del_status`,`recommend_id`) values (1,4,1,'0-500元','这里是输入简介测试的地方',1506407793,3,0,'1');

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='积分详情';

/*Data for the table `dh_integral_log` */

insert  into `dh_integral_log`(`id`,`uid`,`value`,`content`,`created`) values (26,1,30,'每日签到',1505724836),(27,3,30,'每日签到',1505786396),(28,2,30,'每日签到',1505874198),(29,2,30,'每日签到',1506063422),(30,3,30,'每日签到',1506305320),(31,2,30,'每日签到',1506320372),(32,6,100,'注册赠送',1506395715),(33,4,-500,'领取汽车贴膜优惠卷',1506482204),(34,4,-500,'领取汽车贴膜优惠卷',1506482274),(35,4,-500,'领取汽车贴膜优惠卷',1506482397),(36,4,-500,'领取汽车贴膜优惠卷',1506482445),(37,4,-500,'领取汽车贴膜优惠卷',1506482927),(38,4,-500,'领取汽车贴膜优惠卷',1506483107),(39,4,-500,'领取汽车贴膜优惠卷',1506483145),(40,4,-500,'领取汽车贴膜优惠卷',1506483146),(41,4,-500,'领取汽车贴膜优惠卷',1506483164),(42,4,-500,'领取汽车贴膜优惠卷',1506483230),(43,4,-500,'领取汽车贴膜优惠卷',1506483306),(44,4,-500,'领取汽车贴膜优惠卷',1506483621),(45,4,-500,'领取汽车贴膜优惠卷',1506483637),(46,4,-500,'领取汽车贴膜优惠卷',1506483638),(47,4,-500,'领取汽车贴膜优惠卷',1506483638),(48,4,-500,'领取汽车贴膜优惠卷',1506483639),(49,4,-500,'领取汽车贴膜优惠卷',1506483674),(50,4,-500,'领取汽车贴膜优惠卷',1506483675),(51,4,-500,'领取汽车贴膜优惠卷',1506483676),(52,4,-500,'领取汽车贴膜优惠卷',1506483677),(53,4,-500,'领取汽车贴膜优惠卷',1506483678),(54,4,-500,'领取汽车贴膜优惠卷',1506483740),(55,4,-500,'领取汽车贴膜优惠卷',1506483972),(56,4,-500,'领取汽车贴膜优惠卷',1506484028),(57,4,-500,'领取汽车贴膜优惠卷',1506484043),(58,4,-500,'领取汽车贴膜优惠卷',1506484097),(59,4,-500,'领取汽车贴膜优惠卷',1506484219),(60,2,30,'每日签到',1506498598),(61,2,30,'每日签到',1506582983),(62,2,30,'每日签到',1506653483),(63,4,-2000,'领取汽车购买优惠卷',1506655062),(64,2,-2000,'领取汽车购买优惠卷',1506655519),(65,2,-2000,'领取汽车购买优惠卷',1506655523),(66,3,30,'每日签到',1507618484),(67,3,30,'每日签到',1507861730),(68,7,100,'注册赠送',1507874410),(69,7,30,'每日签到',1507875336),(70,2,30,'每日签到',1507877894),(71,2,-500,'领取汽车贴膜优惠卷',1507878186),(72,8,100,'注册赠送',1507879382),(73,8,30,'每日签到',1507880191);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='我的车库';

/*Data for the table `dh_my_car` */

insert  into `dh_my_car`(`id`,`uid`,`ablum`,`brand`,`style`,`produce_time`,`buy_time`,`mileage`,`vin`,`del_status`,`model`,`created`) values (2,4,'150630642578788.png',21,'A9','2017',1000000,'0.0','100',0,'',1506306425),(3,4,'150630652116685.png',21,'A8','2017',1000000,'0.0','100',0,'',1506306521),(4,2,'150632597311131.jpeg',2,'j8','2016年09月',1504195200,'5.0','568856889',0,'',1506325973),(5,2,'150632771442590.jpeg',3,'j8','2016年',1504195200,'5.0','568856889',0,'三厢',1506327119);

/*Table structure for table `dh_orders` */

DROP TABLE IF EXISTS `dh_orders`;

CREATE TABLE `dh_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1汽车 2服务',
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
  `acount_original` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '订单金额',
  `acount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '实付金额(订单金额 - 优惠金额 + 运费）',
  `coupon_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '优惠金额',
  `fare_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `dh_orders` */

insert  into `dh_orders`(`id`,`type`,`order_sn`,`uid`,`seller_uid`,`message`,`seller_message`,`order_status`,`status`,`del_status`,`del_uid`,`del_seller`,`acount_original`,`acount`,`coupon_price`,`fare_price`,`is_modify`,`is_temp`,`is_percentage`,`pass_time`,`status_time`,`close_time`,`success_time`,`origin`,`version`,`created`) values (2,1,'172646797722115621',4,1,'','',5,1,0,0,0,'18.00','14.00','5.00','0.00',0,0,0,0,0,0,1506500328,0,'v1',1504195200),(3,1,'172670367752827418',2,3,'希望可以准时','',4,1,0,0,0,'20.00','20000.00','0.00','0.00',0,0,1,1506307870,0,0,1506563853,0,'v1',1504195200),(4,1,'172670845735945735',2,3,'','',5,1,0,0,0,'5.00','20000.00','0.00','0.00',0,0,1,1506328741,0,1506561709,1506562670,0,'v1',1504195200),(7,2,'172672149529245387',4,1,'','',1,1,0,0,0,'9.90','9.90','0.00','0.00',0,0,0,0,0,0,0,0,'v1',1504195200),(8,2,'172672149660368763',4,1,'','',1,1,0,0,0,'9.90','9.90','0.00','0.00',0,0,0,0,0,0,0,0,'v1',1504195200),(9,1,'172672782593092734',2,3,'','没得原因',1,3,0,1,1,'20.00','20.00','0.00','0.00',0,0,0,0,0,0,0,0,'v1',1504195200),(10,2,'172681425284278516',2,3,'','',2,1,0,0,0,'200.00','200.00','0.00','0.00',0,0,0,1506417063,0,0,0,0,'v1',1504195200),(11,1,'172706472674515321',0,1,'','',1,3,0,0,0,'18.00','19.00','0.00','0.00',0,1,0,0,0,0,1506564726,0,'v1',1506564726),(12,2,'172717592252214453',2,3,'备注一下','',5,1,0,0,0,'500000.00','55555.00','0.00','0.00',0,0,0,1506675955,0,0,1506677084,0,'v1',1506675922),(13,1,'172725122012655001',0,3,'','',3,1,0,0,0,'20.00','100000.00','0.00','0.00',0,1,1,1506751220,0,0,1506751220,0,'v1',1506751220);

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
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `dh_orders_car` */

insert  into `dh_orders_car`(`id`,`order_sn`,`ascription`,`start_time`,`end_time`,`goods_id`,`title`,`thumb`,`produce_time`,`mileage`,`price_original`,`price`,`is_modify`,`coupon_id`) values (2,'172646797722115621',2,1506056400,1506074400,2,'奥迪 2013 A6L 1.6L 纪念版2','150578956279606.png','2013','1.2','18.00','18.00',0,0),(3,'172670367752827418',2,2017,2017,8,'奥迪 2017 x6 2.0 很好的汽车，九成新','150587084744692.png','2017','5.0','20.00','20.00',0,0),(4,'172670845735945735',2,2017,2017,5,'奥迪 2017 23 888 很好','150596096890834.jpeg','2017','5.0','5.00','5.00',0,0),(5,'172672782593092734',2,1504195200,1504195200,3,'大众 2017 x5 2.0 很好','150596096890834.jpeg','2017','2.0','20.00','20.00',0,0),(6,'172706472674515321',2,1505701881,1505701881,11,'汽车品牌 2013 A6L 1.6L 纪念版2','150596115541618.jpeg','2013','1.2','18.00','18.00',0,0),(7,'172725122012655001',2,1506751260,1506754860,3,'大众 2017 x5 2.0 很好','150596096890834.jpeg','2017','2.0','20.00','20.00',0,0);

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
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `price_original` decimal(10,2) DEFAULT NULL COMMENT '商品原价',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `thumb` varchar(100) DEFAULT NULL COMMENT '封面图片',
  `model` varchar(10) DEFAULT NULL COMMENT '车型',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='订单服务详情';

/*Data for the table `dh_orders_service` */

insert  into `dh_orders_service`(`id`,`type`,`order_sn`,`vin`,`start_time`,`end_time`,`ablum`,`brand`,`style`,`produce_time`,`buy_time`,`mileage`,`goods_id`,`price`,`price_original`,`title`,`thumb`,`model`) values (1,20,'172672149529245387','',1506056400,1506074400,'150632149595531.png,150632149598385.png','汽车改装','A8','2017',1000000,'0.0',3,'9.90','9.90','免费贴膜','150578927012952.jpeg',NULL),(2,20,'172672149660368763','',1506056400,1506074400,'150632149622104.png,150632149619352.png','汽车改装','A8','2017',1000000,'0.0',3,'9.90','9.90','免费贴膜','150578927012952.jpeg',NULL),(3,20,'172681425284278516','',1506417900,1506421500,'150641425244255.jpeg,150641425271548.jpeg','大众','j8','2016年',1504195200,'5.0',11,'200.00','200.00','200','150578927012952.jpeg',NULL),(4,0,'172717592252214453','',1506675960,1506679560,'150667592252810.jpeg','奥迪','j8','2016年09月',1504195200,'5.0',12,'500000.00','500000.00','500000','',NULL);

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
  `value` varchar(10) DEFAULT NULL COMMENT '保存值',
  `score` int(10) unsigned DEFAULT NULL COMMENT '打分',
  `created` int(10) unsigned DEFAULT NULL COMMENT '打分时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='打分';

/*Data for the table `dh_score` */

insert  into `dh_score`(`id`,`type`,`uid`,`value`,`score`,`created`) values (1,1,4,'1',0,1506504617),(2,1,2,'3',0,1506677745),(3,1,2,'3',0,1506677941);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='搜索禁用';

/*Data for the table `dh_search_disable` */

insert  into `dh_search_disable`(`id`,`type`,`value`,`status`) values (1,1,'日',1),(2,1,'你妈',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='搜索记录';

/*Data for the table `dh_search_log` */

insert  into `dh_search_log`(`id`,`type`,`value`,`uid`,`created`,`hot`) values (2,1,'奥迪',0,1505875793,2),(3,1,'大众',0,1505876306,5),(4,1,'大众',1,1505876338,2),(5,1,'html',0,1506590163,1),(6,1,'111',0,1506739702,3),(7,1,'四月工作室',0,1506740474,3),(8,1,'大众',2,1507529997,7),(9,1,'奥迪',2,1507530054,11),(10,1,'奥迪',7,1507874912,2),(11,1,'我去',2,1507882189,6),(12,1,'奔驰',2,1507882352,5),(13,1,'我说',2,1507882584,4);

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `dh_shop_hot_log` */

insert  into `dh_shop_hot_log`(`id`,`uid`,`num`,`time`) values (17,7,1,'2017-10-13'),(16,1,10,'2017-10-13'),(15,2,5,'2017-10-13'),(14,4,1,'2017-10-13'),(13,3,5,'2017-10-13'),(12,3,1,'2017-10-12'),(11,1,1,'2017-10-11');

/*Table structure for table `dh_user` */

DROP TABLE IF EXISTS `dh_user`;

CREATE TABLE `dh_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '类型 1个人 2商家',
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(20) DEFAULT '' COMMENT '昵称',
  `avatar` varchar(60) DEFAULT '' COMMENT '头像地址',
  `mobile` char(11) DEFAULT '' COMMENT '手机号',
  `mail` varchar(50) DEFAULT '' COMMENT '邮箱',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user` */

insert  into `dh_user`(`id`,`type`,`username`,`nickname`,`avatar`,`mobile`,`mail`,`password`,`salt`,`token`,`time_out`,`ip`,`integral`,`status`,`del_status`,`login_ip`,`login_time`,`created`,`is_message`,`version`,`imei`) values (1,2,'cheng6251','四月工作室','150768888516204.png','13425778542','','7df8faa9a5f71811689662131b7f9fe5','45452','11b141ff4386fb2b8062cad3df260a6d',1508055269,'127.0.0.1',100000,1,0,'127.0.0.1',1506304319,1505292648,1,0,''),(2,1,'weixuelin','魏雪林','150631954346095.jpeg','18523563220','6497646qw@163.com','f6b81aa9bcdeb6e01455a3d61e16f4d7','21749','ff41bc32e0b3627d1e380f4cecc8e8b1',1508056037,'127.0.0.1',95590,1,0,'127.0.0.1',1507876513,1505293289,1,0,'ceadcf79f7ed11e1'),(3,2,'kuangxin','kuangxin','150631954346095.jpeg','13896568031','','01bafc44de12208bb48680dca2ea4c16','12532','361f044190624ee2c1da2456af61ea0e',1508038256,'127.0.0.1',100060,1,0,'127.0.0.1',1507861810,1505368006,1,0,'ceadcf79f7ed11e1'),(4,1,'四月个人用户','四月个人用户','150631954346095.jpeg','15923882847','','ffbb0d9f227b1d1df90513144b3b73ad','14526','70c7fe7fc8626d165bacfe627a33d348',1508051641,'127.0.0.1',98000,1,0,'127.0.0.1',1506671722,1506063155,1,0,''),(5,1,'123456','123456','','15923882847','','509849f59071c6829ea94459620d9026','59117','',0,'127.0.0.1',100000,1,0,'',0,1506395554,1,0,''),(6,1,'1234567','1234567','','15923882847','','de7a8d21b859e33d6fbee46781a4e08d','50621','',0,'127.0.0.1',100000,1,0,'',0,1506395715,1,0,''),(7,1,'17300289310','17300289310','','17300289310','','8716773dd45d75071f72af288df92cbc','26979','3cb5671c525c838bd4671d49678d89ae',1508052519,'127.0.0.1',130,1,0,'127.0.0.1',1507879719,1507874410,1,0,''),(8,2,'17300289310','17300289310','','17300289310','','737b15b43038cfb42518a58e374d0e48','41893','110fcf64bf37d413505bb236870a405f',1508054469,'127.0.0.1',130,1,0,'127.0.0.1',1507880153,1507879382,1,0,'1a7afa9face43399');

/*Table structure for table `dh_user_message` */

DROP TABLE IF EXISTS `dh_user_message`;

CREATE TABLE `dh_user_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '类型1站内信 2评论 3聊天',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '发送者uid 0系统消息',
  `to_uid` int(10) unsigned DEFAULT '0' COMMENT '接受信息用户id',
  `content` varchar(300) DEFAULT '' COMMENT '消息内容',
  `jump_app` varchar(300) DEFAULT '' COMMENT 'app原生跳转参数',
  `is_reader` tinyint(1) unsigned DEFAULT '0' COMMENT '读取状态 1已读 0未读',
  `del_status` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态 1删除 0未删除',
  `created` int(10) unsigned DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid,to_uid` (`uid`,`to_uid`,`content`),
  KEY `type` (`type`),
  KEY `is_reader` (`is_reader`),
  KEY `del_status` (`del_status`),
  KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_message` */

insert  into `dh_user_message`(`id`,`type`,`uid`,`to_uid`,`content`,`jump_app`,`is_reader`,`del_status`,`created`) values (1,1,0,3,'恭喜你成为会员,祝你购车愉快','',0,0,1506395554),(2,1,0,4,'恭喜你成为会员,祝你购车愉快','',0,0,1506395715),(3,3,1,2,'你有新的消息','',0,0,1507786932),(4,3,2,1,'你有新的消息','',0,0,1507787075),(5,3,2,3,'你有新的消息','',0,0,1507861793),(6,1,0,7,'恭喜你成为会员,祝你购车愉快','',0,0,1507874410),(7,2,0,4,'会员四月工作室,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":1}',0,0,1507876763),(8,2,0,2,'会员17300289310,给你留言了,请尽快查看哦！','{\"type\":1,\"goods_id\":5}',0,0,1507876981),(9,3,7,2,'你有新的消息','',0,0,1507877057),(10,3,2,7,'你有新的消息','',0,0,1507877141),(11,3,7,1,'你有新的消息','',0,0,1507877330);

/*Table structure for table `dh_user_shop` */

DROP TABLE IF EXISTS `dh_user_shop`;

CREATE TABLE `dh_user_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `goods_num` int(11) unsigned DEFAULT '0' COMMENT '服务类商品数量',
  `orders` int(11) DEFAULT '0' COMMENT '订单成功总量',
  `name` varchar(15) DEFAULT '' COMMENT '店铺名称',
  `avatar` varchar(20) DEFAULT '' COMMENT '店铺头像',
  `credit_level` tinyint(1) unsigned DEFAULT '0' COMMENT '平均信用等级 共50分 5星',
  `woker_time` varchar(100) DEFAULT '' COMMENT '工作时间',
  `address` varchar(150) DEFAULT '' COMMENT '地址',
  `category` varchar(20) DEFAULT '0' COMMENT '分类id',
  `ablum` varchar(300) DEFAULT '' COMMENT '店铺照片',
  `ide_ablum` varchar(300) DEFAULT '' COMMENT '认证照片',
  `is_ide` tinyint(1) unsigned DEFAULT '0' COMMENT '认证状态 0未认证 1已认证 2认证未通过',
  `is_message` tinyint(1) unsigned DEFAULT '1' COMMENT '锁屏新消息是否开启 1开启 0不开启',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '店铺状态 1开启 2关闭',
  `is_recommend` tinyint(1) unsigned DEFAULT '0' COMMENT '店铺推荐 1推荐 0未推荐',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dh_user_shop` */

insert  into `dh_user_shop`(`id`,`uid`,`goods_num`,`orders`,`name`,`avatar`,`credit_level`,`woker_time`,`address`,`category`,`ablum`,`ide_ablum`,`is_ide`,`is_message`,`status`,`is_recommend`) values (1,1,8,0,'四月工作室','150768888516204.png',46,'9点-10点','这里是店铺地址信息','20','150768888586577.png,150768888536894.jpeg,150768888521889.png','150536187327122.jpeg,150536187343181.png',1,0,1,1),(2,3,1,0,'kuangxin','150588957988857.jpeg',49,'09:00-18:00','重庆市南岸区','20,22','150536187327122.jpeg,150536187343181.png','150588960214710.png',1,1,1,1),(3,8,0,0,'17300289310','',0,'','','0','','',0,1,1,0);

/*Table structure for table `dh_user_third_party` */

DROP TABLE IF EXISTS `dh_user_third_party`;

CREATE TABLE `dh_user_third_party` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `weixin_id` varchar(300) DEFAULT NULL COMMENT '微信openid',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录信息';

/*Data for the table `dh_user_third_party` */

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='游客评论';

/*Data for the table `dh_visitor_comment` */

insert  into `dh_visitor_comment`(`id`,`type`,`goods_id`,`parent_id`,`content`,`nickname`,`mail`,`ip`,`is_show`,`created`,`to_id`,`to_nickname`) values (1,1,3,0,'33333','111',NULL,'127.0.0.1',1,1506592498,0,''),(2,1,5,0,'这里是测试留言内容','四月','12353.1@qq.com','127.0.0.1',1,1507707987,0,''),(3,1,5,0,'啊啊啊','四月','12353.1@qq.com','127.0.0.1',1,1507708932,0,''),(4,2,0,0,'这里是我对你的意见','四月','12353.1@qq.com','127.0.0.1',1,1507709776,0,'');

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
