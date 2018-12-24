<?php
/**
 * 二维码生成模块
 */
namespace dao\base;

use app\tools\vendor\phpqrcode\QRcode;

class QRCodeImg
{
    public $object;

    public function __construct()
    {
        $this->object = new QRcode();
    }

    public function doImg($url, $level = 'H', $size = '5')
    {
        ob_clean();
        return $this->object->png($url, false, $level, $size, 2);
    }
}
