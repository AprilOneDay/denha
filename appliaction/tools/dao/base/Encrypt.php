<?php
/**
 * AES-256-ECB 加密类
 */
namespace dao\base;

class Encrypt
{
    public $key       = '5767313157673131'; // 加密密钥
    public $algorithm = MCRYPT_RIJNDAEL_128; // 加密算法
    public $mode      = MCRYPT_MODE_ECB; // 加密或解密的模式
    public $iv; // 初始向量

    public function __construct()
    {
        $this->iv = mcrypt_create_iv(mcrypt_get_iv_size($this->algorithm, $this->mode), MCRYPT_RAND);
    }

    /** 覆盖配置参数 */
    public function setInit($options = array())
    {
        $this->key        = isset($options['key']) ? $options['key'] : $this->key;
        $this->$algorithm = isset($options['algorithm']) ? $options['algorithm'] : $this->$algorithm;
        $this->$mode      = isset($options['mode']) ? $options['mode'] : $this->$mode;
        $this->iv         = mcrypt_create_iv(mcrypt_get_iv_size($this->algorithm, $this->mode), MCRYPT_RAND);

        return $this;
    }

    /**
     * 加密
     * @date   2018-06-05T22:00:31+0800
     * @author ChenMingjiang
     * @param  [type]                   $plaintext [加密内容]
     * @param  string                   $padding   [填充符]
     * @return [type]                              [description]
     */
    public function base64Encrypt($plaintext, $padding = 'PKCS7')
    {
        if (!$plaintext) {
            return false;
        }

        $josn = json_encode($plaintext);
        switch ($padding) {
            case 'PKCS7':
                $josn = $this->addPKCS7Padding($josn);
                break;
            default:
                break;
        }

        //return  mcrypt_encrypt($this->algorithm, $this->key, $josn, $this->mode, $this->iv);
        // 加密数据
        $encryptedData = urlencode(base64_encode(mcrypt_encrypt($this->algorithm, $this->key, $josn, $this->mode, $this->iv)));

        return $encryptedData;
    }

    /**
     * 解密
     * @date   2018-06-05T22:01:05+0800
     * @author ChenMingjiang
     * @param  [type]                   $ciphertext [description]
     * @param  string                   $padding    [description]
     * @return [type]                               [description]
     */
    public function base64Decrypt($ciphertext, $padding = 'PKCS7')
    {
        if (!$ciphertext) {
            return false;
        }

        $ciphertext  = base64_decode($ciphertext);
        $decryptData = mcrypt_decrypt($this->algorithm, $this->key, $ciphertext, $this->mode, $this->iv);
        switch ($padding) {
            case 'PKCS7':
                $decryptData = $this->stripPKSC7Padding($decryptData);
                break;
            default:
                $decryptData = trim($decryptData);
                break;
        }

        return $decryptData;
    }

    /**
     * 填充算法
     * @param string $source
     * @return string
     */
    private function addPKCS7Padding($source)
    {
        $len   = strlen($source); //取得字符串长度
        $block = mcrypt_get_block_size($this->algorithm, $this->mode);
        $pad   = $block - ($len % $block); //取得补码的长度
        $source .= str_repeat(chr($pad), $pad); //用ASCII码为补码长度的字符， 补足最后一段
        return $source;
        //------------------------------
        // $source = trim($source);
        // $block  = mcrypt_get_block_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_ECB);
        // $block  = 128;
        // $pad    = $block - (strlen($source) % $block);
        // if ($pad <= $block) {
        // $char = chr($pad);
        // $source .= str_repeat($char, $pad);
        // }
        // return $source;
    }

    /**
     * 移去填充算法
     * @param string $source
     * @return string
     */
    private function stripPKSC7Padding($source)
    {
        // $slast = ord(substr($source, -1));
        // $slastc = chr($slast);
        // $pcheck = substr($source, -$slast);

        // if(preg_match("/$slastc{".$slast."}/", $source)){
        // $source = substr($source, 0, strlen($source)-$slast);
        // return $source;
        // } else {
        // return false;
        // }
        //------------------------------
        $source = trim($source);
        $char   = substr($source, -1);
        $num    = ord($char);
        if ($num > 32) {
            return $source;
        }

        $len = strlen($source);
        for ($i = $len - 1; $i >= $len - $num; $i--) {
            if (ord(substr($source, $i, 1)) != $num) {
                return $source;
            }
        }

        $source = substr($source, 0, -$num);
        return $source;
    }

}
