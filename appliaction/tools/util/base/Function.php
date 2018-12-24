<?php
namespace app\tools\util\base;

class Function
{


//百度转（腾讯/高德/谷歌）坐标转换
public function baiduToTenxun($lat, $lng)
{
    $x_pi  = 3.14159265358979324 * 3000.0 / 180.0;
    $x     = $lng - 0.0065;
    $y     = $lat - 0.006;
    $z     = sqrt($x * $x + $y * $y) - 0.00002 * sin($y * $x_pi);
    $theta = atan2($y, $x) - 0.000003 * cos($x * $x_pi);
    $lng   = $z * cos($theta);
    $lat   = $z * sin($theta);
    return array('lng' => $lng, 'lat' => $lat);
}



/**
 * 转换Unicode编码为其他编码
 * @date   2017-10-10T15:24:54+0800
 * @author ChenMingjiang
 * @param  [type]                   $name [需要转换的内容]
 * @param  string                   $code [需要转换成的编码]
 * @return [type]                         [description]
 */
function deUnicode($name, $code = 'UTF-8')
{
    $name = strtolower($name);
    // 转换编码，将Unicode编码转换成可以浏览的utf-8编码
    $pattern = '/([\w]+)|(\\\u([\w]{4}))/i';
    preg_match_all($pattern, $name, $matches);
    if (!empty($matches)) {
        $name = '';
        for ($j = 0; $j < count($matches[0]); $j++) {
            $str = $matches[0][$j];
            if (strpos($str, '\\u') === 0) {
                $code  = base_convert(substr($str, 2, 2), 16, 10);
                $code2 = base_convert(substr($str, 4), 16, 10);
                $c     = chr($code) . chr($code2);
                $c     = iconv('UCS-2', $code, $c);
                $name .= $c;
            } else {
                $name .= $str;
            }
        }
    }
    return $name;
}

	//获取汉字首字母
	public function getFirstCharter($str)
	{
	    header("content-Type: text/html; charset=GB2312");
	    if (empty($str)) {
	        return '';
	    }

	    $fchar = ord($str{0});
	    if ($fchar >= ord('A') && $fchar <= ord('z')) {
	        return strtoupper($str{0});
	    }

	    //$s1 = iconv("UTF-8", "gb2312//IGNORE", $str);
	    //$s2 = iconv("gb2312", "UTF-8//IGNORE", $s1);

	    $s1 = mb_convert_encoding($str, "GBK", "UTF-8");
	    $s2 = mb_convert_encoding($s1, "UTF-8", "GBK");

	    $s = $s2 == $str ? $s1 : $str;

	    $asc = current(unpack('N', "\xff\xff$s"));
	    //$asc = ord($s{0}) * 256 + ord($s{1}) - 65536;

	    if ($asc >= -20319 && $asc <= -20284) {
	        return 'A';
	    }

	    if ($asc >= -20283 && $asc <= -19776) {
	        return 'B';
	    }

	    if ($asc >= -19775 && $asc <= -19219) {
	        return 'C';
	    }

	    if ($asc >= -19218 && $asc <= -18711) {
	        return 'D';
	    }

	    if ($asc >= -18710 && $asc <= -18527) {
	        return 'E';
	    }

	    if ($asc >= -18526 && $asc <= -18240) {
	        return 'F';
	    }

	    if ($asc >= -18239 && $asc <= -17923) {
	        return 'G';
	    }

	    if ($asc >= -17922 && $asc <= -17418) {
	        return 'H';
	    }

	    if ($asc >= -17417 && $asc <= -16475) {
	        return 'J';
	    }

	    if ($asc >= -16474 && $asc <= -16213) {
	        return 'K';
	    }

	    if ($asc >= -16212 && $asc <= -15641) {
	        return 'L';
	    }

	    if ($asc >= -15640 && $asc <= -15166) {
	        return 'M';
	    }

	    if ($asc >= -15165 && $asc <= -14923) {
	        return 'N';
	    }

	    if ($asc >= -14922 && $asc <= -14915) {
	        return 'O';
	    }

	    if ($asc >= -14914 && $asc <= -14631) {
	        return 'P';
	    }

	    if ($asc >= -14630 && $asc <= -14150) {
	        return 'Q';
	    }

	    if ($asc >= -14149 && $asc <= -14091) {
	        return 'R';
	    }

	    if ($asc >= -14090 && $asc <= -13319) {
	        return 'S';
	    }

	    if ($asc >= -13318 && $asc <= -12839) {
	        return 'T';
	    }

	    if ($asc >= -12838 && $asc <= -12557) {
	        return 'W';
	    }

	    if ($asc >= -12556 && $asc <= -11848) {
	        return 'X';
	    }

	    if ($asc >= -11847 && $asc <= -11056) {
	        return 'Y';
	    }

	    if ($asc >= -11055 && $asc <= -10247) {
	        return 'Z';
	    }

	    if ($asc == -9559) {
	        return 'O';
	    }

	    return null;
	}


	//唯一id
public function guid()
{
    if (function_exists('com_create_guid')) {
        return com_create_guid();
    } else {
        mt_srand((double) microtime() * 10000); //optional for php 4.2.0 and up.
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45); // "-"
        $uuid   = chr(123) // "{"
         . substr($charid, 0, 8) . $hyphen
        . substr($charid, 8, 4) . $hyphen
        . substr($charid, 12, 4) . $hyphen
        . substr($charid, 16, 4) . $hyphen
        . substr($charid, 20, 12)
        . chr(125); // "}"
        return $uuid;
    }
}

//获取用户浏览器版本信息
function getBrowser($agent = '')
{
    $agent ?: $agent = $_SERVER['HTTP_USER_AGENT'];
    $browseragent    = ''; //浏览器
    $browserversion  = ''; //浏览器的版本
    if (ereg('MSIE ([0-9].[0-9]{1,2})', $agent, $version)) {
        $browserversion = $version[1];
        $browseragent   = "Internet Explorer";
    } else if (ereg('Opera/([0-9]{1,2}.[0-9]{1,2})', $agent, $version)) {
        $browserversion = $version[1];
        $browseragent   = "Opera";
    } else if (ereg('Firefox/([0-9.]{1,5})', $agent, $version)) {
        $browserversion = $version[1];
        $browseragent   = "Firefox";
    } else if (ereg('Chrome/([0-9.]{1,3})', $agent, $version)) {
        $browserversion = $version[1];
        $browseragent   = "Chrome";
    } else if (ereg('Safari/([0-9.]{1,3})', $agent, $version)) {
        $browseragent   = "Safari";
        $browserversion = "";
    } else {
        $browserversion = "";
        $browseragent   = "Unknown";
    }
    return $browseragent . " " . $browserversion . ' ';
}

//获取用户操作系统
function getSystem($agent = '')
{
    $agent ?: $agent = $_SERVER['HTTP_USER_AGENT'];
    $browserplatform == '';
    if (eregi('win', $agent) && strpos($agent, '95')) {
        $browserplatform = "Windows 95";
    } elseif (eregi('win 9x', $agent) && strpos($agent, '4.90')) {
        $browserplatform = "Windows ME";
    } elseif (eregi('win', $agent) && ereg('98', $agent)) {
        $browserplatform = "Windows 98";
    } elseif (eregi('win', $agent) && eregi('nt 5.0', $agent)) {
        $browserplatform = "Windows 2000";
    } elseif (eregi('win', $agent) && eregi('nt 5.1', $agent)) {
        $browserplatform = "Windows XP";
    } elseif (eregi('win', $agent) && eregi('nt 6.0', $agent)) {
        $browserplatform = "Windows Vista";
    } elseif (eregi('win', $agent) && eregi('nt 6.1', $agent)) {
        $browserplatform = "Windows 7";
    } elseif (eregi('win', $agent) && ereg('32', $agent)) {
        $browserplatform = "Windows 32";
    } elseif (eregi('win', $agent) && eregi('nt', $agent)) {
        $browserplatform = "Windows NT";
    } elseif (eregi('Mac OS', $agent)) {
        $browserplatform = "Mac OS";
    } elseif (eregi('linux', $agent)) {
        $browserplatform = "Linux";
    } elseif (eregi('unix', $agent)) {
        $browserplatform = "Unix";
    } elseif (eregi('sun', $agent) && eregi('os', $agent)) {
        $browserplatform = "SunOS";
    } elseif (eregi('ibm', $agent) && eregi('os', $agent)) {
        $browserplatform = "IBM OS/2";
    } elseif (eregi('Mac', $agent) && eregi('PC', $agent)) {
        $browserplatform = "Macintosh";
    } elseif (eregi('PowerPC', $agent)) {
        $browserplatform = "PowerPC";
    } elseif (eregi('AIX', $agent)) {
        $browserplatform = "AIX";
    } elseif (eregi('HPUX', $agent)) {
        $browserplatform = "HPUX";
    } elseif (eregi('NetBSD', $agent)) {
        $browserplatform = "NetBSD";
    } elseif (eregi('BSD', $agent)) {
        $browserplatform = "BSD";
    } elseif (ereg('OSF1', $agent)) {
        $browserplatform = "OSF1";
    } elseif (ereg('IRIX', $agent)) {
        $browserplatform = "IRIX";
    } elseif (eregi('FreeBSD', $agent)) {
        $browserplatform = "FreeBSD";
    } elseif (stripos($agent, 'iphone') || stripos($agent, 'ipad')) {
        $browserplatform = 'ios';
    } elseif (stripos($agent, 'android')) {
        $browserplatform = 'android';
    } elseif (stripos($agent, 'MicroMessenger')) {
        $browserplatform = 'MicroMessenger';
    }

    if ($browserplatform == '') {$browserplatform = "Unknown";}
    return $browserplatform . ' ';
}


/**
 * 编码转换
 * @date   2017-08-27T16:07:41+0800
 * @author ChenMingjiang
 * @param  string                   $content  [需要转码的内容]
 * @param  string                   $mbEncode [需要转换成的编码]
 * @return [type]                             [description]
 */
function mbDetectEncoding($content = '', $mbEncode = "UTF-8")
{
    $encode = mb_detect_encoding($content, array("ASCII", "UTF-8", "GB2312", "GBK", "BIG5", "EUC-CN", "UCS2"));
    if ($encode != $mbEncode) {
        $encode  = $encode == "EUC-CN" ? "GB2312" : $encode;
        $content = mb_convert_encoding($content, $mbEncode, $encode);
    }

    return $content;
}




//（腾讯/高德/谷歌）转百度坐标转换
public function tenxunToBaidu($lat, $lng)
{
    $x_pi  = 3.14159265358979324 * 3000.0 / 180.0;
    $x     = $lng;
    $y     = $lat;
    $z     = sqrt($x * $x + $y * $y) + 0.00002 * sin($y * $x_pi);
    $theta = atan2($y, $x) + 0.000003 * cos($x * $x_pi);
    $lng   = $z * cos($theta) + 0.0065;
    $lat   = $z * sin($theta) + 0.006;
    return array('lng' => $lng, 'lat' => $lat);

}
 /**
 * 根据PHP各种类型变量生成唯一标识号
 * @param mixed $mix 变量
 * @return string
 */
public function toGuidString($mix)
{
    if (is_object($mix)) {
        return spl_object_hash($mix);
    } elseif (is_resource($mix)) {
        $mix = get_resource_type($mix) . strval($mix);
    } else {
        $mix = serialize($mix);
    }
    return md5($mix);
}
}