<?php
defined('PATH') or define('PATH', $_SERVER['DOCUMENT_ROOT']); // 系统更目录
defined('FRAME_PATH') or define('FRAME_PATH', PATH . '/frame/'); // 框架根目录
defined('FRAME_LIB_PATH') or define('FRAME_LIB_PATH', FRAME_PATH . '/lib/'); // 框架视核心目录
defined('FRAME_LIB_CONFIG_PATH') or define('FRAME_LIB_CONFIG_PATH', FRAME_LIB_PATH . 'config/'); // 框架视核配置心目录

include_once FRAME_LIB_CONFIG_PATH . 'config.php'; //调用系统配置
include_once FRAME_LIB_CONFIG_PATH . 'path.php'; //调用路径配置文档
include_once FRAME_LIB_CLASS_PATH . 'autoClass.class.php'; //调用自动加载类
spl_autoload_register('LOAD::loadClass');
spl_autoload_register('LOAD::loadDao');
spl_autoload_register('LOAD::loadController');

//弹出消息返回地址
function message($info, $url)
{
    if ($url) {
        echo '<script language="javascript">alert("' . $info . '");window.location.href="' . $url . '";</script>';
    } else {
        echo '<script language="javascript">alert("' . $info . '");</script>';
    }
}

//POST过滤
function post($name, $type = '', $default = '')
{
    if ($name == "all") {
        foreach ($_POST as $key => $val) {
            $val        = trim($val);
            $data[$key] = !get_magic_quotes_gpc() ? htmlspecialchars(addslashes($val), ENT_QUOTES, 'UTF-8') : htmlspecialchars($val, ENT_QUOTES, 'UTF-8');

        }

    } else {
        $data = isset($_POST[$name]) ? $_POST[$name] : '';
    }

    if ($name != 'all' && !is_array($data)) {
        switch ($type) {
            case 'intval':
                $data = $data === '' ? intval($default) : intval($data);
                break;
            case 'float':
                $data = $data === '' ? float($default) : float($data);
                break;
            case 'text':
                $data = $data === '' ? strval($default) : strval($data);
                break;
            case 'trim':
                $data = $data === '' ? trim($default) : trim($data);
                break;
            case 'bool':
                $data = $data === '' ? (bool) $default : (bool) $data;
                break;
            case 'json':
                $data = $data === '' ? $default : json_decode($data, true);
                break;
            default:
                # code...
                break;
        }
    }
    return $data;
}

//GET过滤
function get($name, $type = '', $default = '')
{
    if ($name == "all") {

        foreach ($_GET as $key => $val) {
            $val        = trim($val);
            $data[$key] = !get_magic_quotes_gpc() ? htmlspecialchars(addslashes($val), ENT_QUOTES, 'UTF-8') : htmlspecialchars($val, ENT_QUOTES, 'UTF-8');
        }

    } else {
        $data = isset($_GET[$name]) ? $_GET[$name] : '';
    }

    if ($name != 'all' && !is_array($data)) {
        switch ($type) {
            case 'intval':
                $data = $data === '' ? intval($default) : intval($data);
                break;
            case 'float':
                $data = $data === '' ? float($default) : float($data);
                break;
            case 'text':
                $data = $data === '' ? strval($default) : strval($data);
                break;
            case 'trim':
                $data = $data === '' ? trim($default) : trim($data);
                break;
            case 'bool':
                $data = $data === '' ? (bool) $default : (bool) $data;
                break;
            case 'json':
                $data = $data === '' ? $default : json_decode($data, true);
                break;
            default:
                # code...
                break;
        }
    }
    return $data;
}

//判断文件是否存在
function existsUrl($url)
{

    if ($url == '') {return false;}
    if (stripos($url, 'http') === false) {
        $http = $_SERVER['SERVER_NAME'];
        $url  = 'http://' . $http . '/' . $url;
    }
    $opts = array(
        'http' => array(
            'timeout' => 30,
        ),
    );

    $context = stream_context_create($opts);
    $rest    = @file_data_contents($url, false, $context);

    if ($rest) {
        return true;
    } else {
        return false;
    }
}

function table($name, $isTablepre = true)
{
    $do = dbMysqli::getInstance(); //单例实例化
    if ($name) {
        return $do->table($name, $isTablepre);
    }

    return $do;
}

function dao($name)
{
    $dao = 'Dao\\' . $name;
    if (class_exists($dao)) {
        $dao = new $dao();
        return $dao;
    }

    die('Dao方法：' . $name . '不存在');
}

//包含文件
function comprise($path)
{
    include VIEW_PATH . $path . '.html';
}

//获取config下配置文档
function vars($path = 'urls', $name = '')
{
    $data = include FRAME_LIB_CONFIG_PATH . $path . '.php';
    if ($name === '') {
        return $data;
    }

    return @$data[$name];
}

//创建getUrl
function url($location = '', $params = array())
{
    $locationUrl = $location;
    if (stripos($location, '/') === false && $location != '') {
        $locationUrl = '/frame/index.php?m=' . MODEL . '&c=' . CONTROLLER . '&a=' . $location;
    }
    $param = '';
    if (!empty($params)) {
        foreach ($params as $key => $value) {
            if ($key == 0 && stripos($locationUrl, '?') === false) {
                $param = '?' . $key . '=' . $value;
            } else {
                $param .= '&' . $key . '=' . $value;
            }
        }
    }

    return $locationUrl . $param;
}

//保存Cookie
function cookie($name = '', $value = '', $expire = '86400', $encode = false)
{
    if (!$name) {
        return false;
    }

    //加密
    $value = $encode ? auth($value) : $value;

    setcookie($name, $value, time() + $expire, '/');

}

//获取Cookie
function getCookie($name, $encode = false)
{
    $data = '';
    if (isset($_COOKIE[$name])) {
        $data = $_COOKIE[$name];
        if (is_array($data)) {
            foreach ($data as $key => $value) {
                $data[$key] = $encode ? auth($value, 'DECODE') : $value;
            }
        } else {
            $data = $encode ? auth($data, 'DECODE') : $data;
        }
    }

    return $data;
}

//保存Session
function session($name = '', $value = '')
{
    !isset($_SESSION) ? session_start() : '';
    // 数组
    if (is_array($name)) {
        foreach ($name as $k => $v) {
            $_SESSION[$k] = $v;
        }
    }
    //二维数组
    elseif (is_array($value)) {
        foreach ($value as $k => $v) {
            $_SESSION[$name][$k] = $v;
        }
    } else {
        $_SESSION[$name] = $value;
    }

}

//读取Session
function getSession($name)
{
    !isset($_SESSION) ? session_start() : '';
    $data = isset($_SESSION[$name]) ? $_SESSION[$name] : '';
    if (is_object($data)) {
        $data = (array) $data;
    }
    return $data;
}

//下划线转驼峰
function convertUnderline($string)
{
    $string = preg_replace_callback('/([-_]+([a-z]{1}))/i', function ($matches) {
        return strtoupper($matches[2]);
    }, $string);
    return $string;
}

//驼峰转下划线
function humpToLine($string)
{
    $string = preg_replace_callback('/([A-Z]{1})/', function ($matches) {
        return '_' . strtolower($matches[0]);
    }, $string);
    return $string;
}

/**
 * 字符串加密、解密函数
 *
 *
 * @param    string    $txt        字符串
 * @param    string    $operation    ENCODE为加密，DECODE为解密，可选参数，默认为ENCODE，
 * @param    string    $key        密钥：数字、字母、下划线
 * @param    string    $expiry        过期时间
 * @return    string
 */
function auth($string, $operation = 'ENCODE', $key = '', $expiry = 0)
{
    $ckey_length = 4;
    $key         = md5($key != '' ? $key : vars('config', 'authKey'));
    $keya        = md5(substr($key, 0, 16));
    $keyb        = md5(substr($key, 16, 16));
    $keyc        = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length) : substr(md5(microtime()), -$ckey_length)) : '';

    $cryptkey   = $keya . md5($keya . $keyc);
    $key_length = strlen($cryptkey);

    $string        = $operation == 'DECODE' ? base64_decode(strtr(substr($string, $ckey_length), '-_', '+/')) : sprintf('%010d', $expiry ? $expiry + time() : 0) . substr(md5($string . $keyb), 0, 16) . $string;
    $string_length = strlen($string);

    $result = '';
    $box    = range(0, 255);

    $rndkey = array();
    for ($i = 0; $i <= 255; $i++) {
        $rndkey[$i] = ord($cryptkey[$i % $key_length]);
    }

    for ($j = $i = 0; $i < 256; $i++) {
        $j       = ($j + $box[$i] + $rndkey[$i]) % 256;
        $tmp     = $box[$i];
        $box[$i] = $box[$j];
        $box[$j] = $tmp;
    }

    for ($a = $j = $i = 0; $i < $string_length; $i++) {
        $a       = ($a + 1) % 256;
        $j       = ($j + $box[$a]) % 256;
        $tmp     = $box[$a];
        $box[$a] = $box[$j];
        $box[$j] = $tmp;
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
    }

    if ($operation == 'DECODE') {
        if ((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26) . $keyb), 0, 16)) {
            return substr($result, 26);
        } else {
            return '';
        }
    } else {
        return $keyc . rtrim(strtr(base64_encode($result), '+/', '-_'), '=');
    }
}
