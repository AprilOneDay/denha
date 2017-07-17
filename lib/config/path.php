<?php
defined('ChenMingJiang') or define('ChenMingJiang', '20170514'); //框架锁

defined('PATH') or define('PATH', $_SERVER['DOCUMENT_ROOT']); // 系统更目录
defined('FRAME_PATH') or define('FRAME_PATH', PATH . '/frame/'); // 框架根目录
defined('FRAME_LIB_PATH') or define('FRAME_LIB_PATH', FRAME_PATH . 'lib/'); // 框架视核心目录
defined('FRAME_LIB_CONFIG_PATH') or define('FRAME_LIB_CONFIG_PATH', FRAME_LIB_PATH . 'config/'); // 框架视核配置心目录

defined('FRAME_LIB_CLASS_PATH') or define('FRAME_LIB_CLASS_PATH', FRAME_LIB_PATH . 'class/'); // 框架视核函数心目录
defined('FRAME_LIB_BASE_PATH') or define('FRAME_LIB_BASE_PATH', FRAME_LIB_PATH . 'base/'); // 框架视核心公共方法目录
defined('FRAME_LIB_LOG_PATH') or define('FRAME_LIB_LOG_PATH', FRAME_LIB_PATH . 'log/'); // 框架视核心日志目录
defined('FRAME_LIB_PULS_PATH') or define('FRAME_LIB_PULS_PATH', FRAME_LIB_PATH . 'puls/'); // 框架视核心扩展插件目录

defined('CONTROLLER_PATH') or define('CONTROLLER_PATH', FRAME_PATH . 'controller/'); // 框架控制器目录
defined('VIEW_PATH') or define('VIEW_PATH', FRAME_PATH . 'view/'); // 框架视图目录
defined('DAO_PATH') or define('DAO_PATH', FRAME_PATH . 'dao/'); // 框架Dao方法目录
defined('DATA_PATH') or define('DATA_PATH', FRAME_PATH . 'data/'); // DATA缓存文件目录
