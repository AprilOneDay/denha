<?php
namespace Denha;

class Start
{
    public static $client;
    public static $config = array();

    private static $map      = array(); //记录文件
    private static $instance = array();

    /**
     * [start description]
     * @date   2017-07-14T16:12:51+0800
     * @author ChenMingjiang
     * @param  string                   $client [配置文件名称]
     * @param  string                   $route  [路由模式 mca smca ca]
     * @return [type]                           [description]
     */
    public static function start($client = 'pc', $route = 'mca')
    {
        self::$client = $client;
        //获取配置文档信息
        self::$config['config'] = include CONFIG_PATH . 'config.php';
        if (is_file(CONFIG_PATH . $client . '.' . APP . '.php')) {
            self::$config['config'] = array_merge(
                include (CONFIG_PATH . 'config.php'),
                include (CONFIG_PATH . $client . '.' . APP . '.php')
            );
        }

        spl_autoload_register('Denha\Start::autoload');

        include ROOT_PATH . 'denha' . DS . 'Route.php';
/*        include ROOT_PATH . 'denha' . DS . 'Controller.php';
include ROOT_PATH . 'denha' . DS . 'View.php';*/

        $urlArr  = array('xss' => '\=\+\/v(?:8|9|\+|\/)|\%0acontent\-(?:id|location|type|transfer\-encoding)');
        $argsArr = array('xss' => '[\'\\\'\;\*\<\>].*\bon[a-zA-Z]{3,15}[\s\\r\\n\\v\\f]*\=|\b(?:expression)\(|\<script[\s\\\\\/]|\<\!\[cdata\[|\b(?:eval|alert|prompt|msgbox)\s*\(|url\((?:\#|data|javascript)', 'sql' => '[^\{\s]{1}(\s|\b)+(?:select\b|update\b|insert(?:(\/\*.*?\*\/)|(\s)|(\+))+into\b).+?(?:from\b|set\b)|[^\{\s]{1}(\s|\b)+(?:create|delete|drop|truncate|rename|desc)(?:(\/\*.*?\*\/)|(\s)|(\+))+(?:table\b|from\b|database\b)|into(?:(\/\*.*?\*\/)|\s|\+)+(?:dump|out)file\b|\bsleep\([\s]*[\d]+[\s]*\)|benchmark\(([^\,]*)\,([^\,]*)\)|(?:declare|set|select)\b.*@|union\b.*(?:select|all)\b|(?:select|update|insert|create|delete|drop|grant|truncate|rename|exec|desc|from|table|database|set|where)\b.*(charset|ascii|bin|char|uncompress|concat|concat_ws|conv|export_set|hex|instr|left|load_file|locate|mid|sub|substring|oct|reverse|right|unhex)\(|(?:master\.\.sysdatabases|msysaccessobjects|msysqueries|sysmodules|mysql\.db|sys\.database_name|information_schema\.|sysobjects|sp_makewebtask|xp_cmdshell|sp_oamethod|sp_addextendedproc|sp_oacreate|xp_regread|sys\.dbms_export_extension)', 'other' => '\.\.[\\\\\/].*\%00([^0-9a-fA-F]|$)|%00[\'\\\'\.]');

        $httpReferer = empty($_SERVER['HTTP_REFERER']) ? array() : array($_SERVER['HTTP_REFERER']);
        $queryString = empty($_SERVER['QUERY_STRING']) ? array() : array($_SERVER['QUERY_STRING']);
        GSF($queryString, $urlArr);
        GSF($httpReferer, $argsArr);
        GSF($_GET, $argsArr);
        GSF($_POST, $argsArr);
        GSF($_COOKIE, $argsArr);

        if (MAGIC_QUOTES_GPC) {
            $_GET     = array_map('GSS', $_GET);
            $_POST    = array_map('GSS', $_POST);
            $_COOKIE  = array_map('GSS', $_COOKIE);
            $_REQUEST = array_map('GSS', $_REQUEST);
        }

        Route::$route(); //解析路由

        if (preg_match("/^[A-Za-z](\/|\w)*$/", CONTROLLER)) {
            //var_dump(Route::$class);
            $class = Route::$class;

            if (class_exists($class)) {
                $object = new $class();
            } else {
                $object = false;
            }
        } else {
            $object = false;
        }

        if (!$object) {
            die(CONTROLLER . ' 控制器不存在');
        }

        $action = lcfirst(parsename(ACTION, 1));

        if (!method_exists($object, $action)) {
            die(CONTROLLER . '控制器中' . ACTION . '方法不存在');
        }

        $action = $object->$action();
    }

    public static function autoload($class)
    {
        //截取文件名称
        $name  = ltrim(strrchr($class, '\\'), '\\') . '.php';
        $class = strtolower($class);

        if (isset(self::$map[$class])) {
            include self::$map[$class];
        } else {
            $space = strstr($class, '\\', true);

            if ($space == 'sys') {
                return true;
            } elseif ($space == 'denha') {
                $dir = ROOT_PATH;
            } elseif ($space == 'dao') {
                $dir = APP_PATH . 'dao' . DS;
            } else if (in_array($space, array('controller', 'model'))) {
                $dir = APP_PATH . Route::$path;
            } else {
                $dir = APP_PATH . 'public' . DS;
            }

            $file = $dir . str_replace(array('\\', strtolower($name)), array(DS, $name), $class . '.php');

            if (is_file($file)) {
                self::$map[$class] = $file;
                include $file;
            } else {
                var_dump($file);
            }
        }
    }

}
