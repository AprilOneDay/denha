<?php
class functions
{

    //调用message信息内容
    public function show($value)
    {
        return $value;
    }

    //弹出消息返回地址
    public function message($info, $url)
    {
        if ($url) {
            echo '<script language="javascript">alert("' . $info . '");window.location.href="' . $url . '";</script>';
        } else {
            echo '<script language="javascript">alert("' . $info . '");</script>';
        }
    }

    //判断文件是否存在
    public function existsUrl($url)
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
        $rest    = @file_get_contents($url, false, $context);

        if ($rest) {
            return true;
        } else {
            return false;
        }
    }

    //生成验证码信息
    public function code($len = 5, $cache = '180')
    {
        $code = $this->authCode($this->randCode($len, 3), '123456');
        setcookie('code', $code, time() + $cache, '/');
        setcookie('codeTime', time() + $cache, time() + $cache, '/');
        return $code;
    }

    //计算验证时间
    public function codeTime($time)
    {
        if ($time > time()) {
            $re = date('s', $time - time());
            return $re;
        } else {
            return -1;
        }
    }

    //随机生成
    public function randCode($len = 8, $format = 'ALL')
    {
        $re = '';
        switch ($format) {
            case '1':
                $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                break;
            case '2':
                $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
                break;
            case '3':
                $chars = '0123456789';
                break;
            default:
                $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                break;
        }
        while (strlen($re) < $len) {
            $re .= $chars[rand(0, strlen($chars) - 1)]; //从$s中随机产生一个字符
        }
        return $re;
    }

    //判断图片是否存在 不存在就显示默认图片
    public function picUrl($value)
    {
        if (stripos($_SERVER['SERVER_NAME'], 'm.lgdsc.net') !== false) {
            $value = 'http://lgdsc.net/' . $value;
        }
        if ($this->existsUrl($value)) {
            return $value;
        } else {
            return 'http://lgdsc.net/' . 'images/nopic.jpg';
        }
    }

    //显示错误信息
    public function errorShow($value)
    {
        die($this->show($value));
    }

    //获取json
    public function json($value)
    {
        return json_decode($value, true);
    }

    //判断是否是微信
    public function isWeixin()
    {
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
            return true;
        }
        return false;
    }

    //缓存当前地址
    public function saveUrl($value)
    {
        setCoook('loactionUrl', $value, time() + 36000, '/');
    }

    //自动加密
    public function authCode($string, $operation = 'DECODE', $key = '', $expiry = 0)
    {
        //获取密码钥匙
        $this->cfg_auth_key = $GLOBALS['cfg_auth_key'];
        // 动态密匙长度，相同的明文会生成不同密文就是依靠动态密匙
        // 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
        // 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
        // 当此值为 0 时，则不产生随机密钥
        $ckey_length = 4;
        // 密匙
        $key = md5($key ? $key : $this->cfg_auth_key);
        // 密匙a会参与加解密
        $keya = md5(substr($key, 0, 16));
        // 密匙b会用来做数据完整性验证
        $keyb = md5(substr($key, 16, 16));
        // 密匙c用于变化生成的密文
        $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length) : substr(md5(microtime()), -$ckey_length)) : '';
        // 参与运算的密匙
        $cryptkey   = $keya . md5($keya . $keyc);
        $key_length = strlen($cryptkey);
        // 明文，前10位用来保存时间戳，解密时验证数据有效性，10到26位用来保存$keyb(密匙b)，解密时会通过这个密匙验证数据完整性
        // 如果是解码的话，会从第$ckey_length位开始，因为密文前$ckey_length位保存 动态密匙，以保证解密正确
        $string        = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0) . substr(md5($string . $keyb), 0, 16) . $string;
        $string_length = strlen($string);
        $result        = '';
        $box           = range(0, 255);
        $rndkey        = array();

        // 产生密匙簿
        for ($i = 0; $i <= 255; $i++) {
            $rndkey[$i] = ord($cryptkey[$i % $key_length]);
        }

        // 用固定的算法，打乱密匙簿，增加随机性，好像很复杂，实际上并不会增加密文的强度
        for ($j = $i = 0; $i < 256; $i++) {
            //$j是三个数相加与256取余
            $j       = ($j + $box[$i] + $rndkey[$i]) % 256;
            $tmp     = $box[$i];
            $box[$i] = $box[$j];
            $box[$j] = $tmp;
        }

        // 核心加解密部分
        for ($a = $j = $i = 0; $i < $string_length; $i++) {
            //在上面基础上再加1 然后和256取余
            $a       = ($a + 1) % 256;
            $j       = ($j + $box[$a]) % 256; //$j加$box[$a]的值 再和256取余
            $tmp     = $box[$a];
            $box[$a] = $box[$j];
            $box[$j] = $tmp;
            // 从密匙簿得出密匙进行异或，再转成字符，加密和解决时($box[($box[$a] + $box[$j]) % 256])的值是不变的。
            $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
        }

        if ($operation == 'DECODE') {
            // substr($result, 0, 10) == 0 验证数据有效性
            // substr($result, 0, 10) - time() > 0 验证数据有效性
            // substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16) 验证数据完整性
            // 验证数据有效性，请看未加密明文的格式
            if ((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26) . $keyb), 0, 16)) {
                //echo substr($result, 26);
                return substr($result, 26);
            } else {
                return '';
            }
        } else {
            // 把动态密匙保存在密文里，这也是为什么同样的明文，生产不同密文后能解密的原因
            // 因为加密后的密文可能是一些特殊字符，复制过程可能会丢失，所以用base64编码
            return $keyc . str_replace('=', '', base64_encode($result));
        }
    }

    //获取IP
    public function getIP()
    {
        static $ip = null;
        if ($ip !== null) {
            return $ip;
        }

        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $pos = array_search('unknown', $arr);
            if (false !== $pos) {
                unset($arr[$pos]);
            }

            $ip = trim($arr[0]);
        } else if (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } else if (isset($_SERVER['REMOTE_ADDR'])) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        //IP地址合法验证
        $ip = (false !== ip2long($ip)) ? $ip : '0.0.0.0';
        return $ip;
    }

    //短信发送
    public function mobileSend($mobile_data)
    {
        //输入参数：CorpID-帐号，Pwd-密码，Mobile-发送手机号，Content-发送内容，Cell-子号(可为空），SendTime-定时发送时间(固定14位长度字符串，比如：20060912152435代表2006年9月12日15时24分35秒，可为空)
        //输出参数：整数，0，发送成功；-1、帐号未注册；-2、其他错误；-3、密码错误；-4、手机号格式不对；-5、余额不足；-6、定时发送时间不是有效的时间格式；-7、禁止2小时以内向同一手机号发送相同短信
        $mobile_url              = 'http://www.ht3g.com/htWS/Send.aspx';
        $mobile_data['CorpID']   = 'HTEK07948';
        $mobile_data['Pwd']      = '778877';
        $mobile_data['Cell']     = '';
        $mobile_data['SendTime'] = '';
        $mobile_data['Content']  = iconv("UTF-8", "GBK//IGNORE", $mobile_data['Content']);
        //print_r($mobile_data);
        $this->curl_post($mobile_url, $mobile_data);
    }

    //email_reg(收件人邮箱，邮件主题，邮件内容)
    public function emailSend($smtpemailto = '', $mailsubject = '', $mailbody = '')
    {
        require_once dirname(__FILE__) . '/email.class.php';

        ##########################################
        $smtpserver     = "smtp.163.com"; //SMTP服务器
        $smtpserverport = 25; //SMTP服务器端口
        $smtpusermail   = "cheng6251@163.com"; //SMTP服务器的用户邮箱
        $smtpuser       = "cheng6251@163.com"; //SMTP服务器的用户帐号
        $smtppass       = "62517138"; //SMTP服务器的用户密码

        //$smtpemailto = "366617187@qq.com";//发送给谁
        //$mailsubject = "主题";//邮件主题
        //$mailbody = "内容";//邮件内容

        $mailtype = "HTML"; //邮件格式（HTML/TXT）,TXT为文本邮件
        ##########################################
        $smtp        = new smtp($smtpserver, $smtpserverport, true, $smtpuser, $smtppass); //这里面的一个true是表示使用身份验证,否则不使用身份验证.
        $smtp->debug = false; //是否显示发送的调试信息
        $smtp->sendmail($smtpemailto, $smtpusermail, $mailsubject, $mailbody, $mailtype);
    }

    // 模拟提交数据函数
    public function curlPost($url, $data)
    {
        // 模拟提交数据函数
        $curl = curl_init(); // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)'); // 模拟用户使用的浏览器
        // curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
        // curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
        curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data); // Post提交的数据包
        curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
        $tmpInfo = curl_exec($curl); // 执行操作
        if (curl_errno($curl)) {
            echo 'Errno' . curl_error($curl); //捕抓异常
        }
        curl_close($curl); // 关闭CURL会话
        return $tmpInfo; // 返回数据
    }
}
