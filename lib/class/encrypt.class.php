<?php
//加密类
class encrypt
{
    public $key       = '5767313157673131'; // 加密密钥
    public $algorithm = MCRYPT_RIJNDAEL_128; // 加密算法
    public $mode      = MCRYPT_MODE_ECB; // 加密或解密的模式
    public $iv; // 初始向量

    public function __construct()
    {
        $this->ivInt();
    }

    //初始化
    public function ivInt()
    {
        $this->iv = mcrypt_create_iv(mcrypt_get_iv_size($this->algorithm, $this->mode), MCRYPT_RAND);
        return $this->iv;
    }

    //加密
    public function base64Encrypt($plaintext, $padding = '')
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

        // 加密数据
        $encryptedData = urlencode(base64_encode(trim(mcrypt_encrypt($this->algorithm, $this->key, $josn, $this->mode, $this->iv))));

        return $encryptedData;
    }

    //解密
    public function base64Decrypt($ciphertext, $padding = '')
    {
        if (!$ciphertext) {
            return false;
        }
        $decryptData = mcrypt_decrypt($this->algorithm, $this->key, base64_decode($ciphertext), $this->mode, $this->iv);
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
        $source = trim($source);
        $block  = mcrypt_get_block_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_ECB);
        $pad    = $block - (strlen($source) % $block);
        if ($pad <= $block) {
            $char = chr($pad);
            $source .= str_repeat($char, $pad);
        }
        return $source;
    }

    /**
     * 移去填充算法
     * @param string $source
     * @return string
     */
    private function stripPKSC7Padding($source)
    {
        $source = trim($source);
        $char   = substr($source, -1);
        $num    = ord($char);
        if ($num > 32) {
            return $source;
        }

        $source = substr($source, 0, -$num);
        return $source;
    }

}
