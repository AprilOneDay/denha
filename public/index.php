<?php
define('APP', 'admin'); //主文件路径
define('APP_CONFIG', 'admin'); //配置文件
require '../vendor/denha/framework/Denha.php';
denha\Start::up('mca');
