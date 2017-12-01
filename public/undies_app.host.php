<?php
define('APP', 'undies\app'); //主文件路径
define('APP_CONFIG', 'config'); //配置文件
require '../denha/Denha.php';
denha\Start::up('app');
