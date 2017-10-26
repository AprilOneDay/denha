<?php
define('APP', 'console'); //主文件路径
define('APP_CONFIG', 'console'); //配置文件
require '../denha/Denha.php';
denha\Start::up('console', 'mca');
