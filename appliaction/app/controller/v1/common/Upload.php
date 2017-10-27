<?php
/**
 * 上传模块
 */
namespace app\app\controller\v1\common;

use app\app\controller;

class Upload extends \app\app\controller\Init
{
    public function upImg()
    {
        if (!$this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '请登录', 'code' => 501));
        }

        $files = files('ablum');
        $path  = post('path', 'images');

        if (!$path) {
            $this->appReturn(array('status' => false, 'msg' => '请选择上传地址'));
        }

        $reslut = dao('Upload')->uploadfile($files, $path);
        if (!$reslut['status']) {
            $this->appReturn($reslut);
        }

        $data['path'] = $this->appImgArray($reslut['data']['name'], $path);

        $this->appReturn(array('msg' => '上传成功', 'data' => $data));
    }
}
