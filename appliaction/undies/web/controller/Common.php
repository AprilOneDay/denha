<?php
namespace app\undies\web\controller;

use denha\controller;

class Common extends controller
{
    //上传base64图片
    public function upBase64Img()
    {
        $img  = post('data', 'text', '');
        $path = post('path', 'text', '');

        $reslut = dao('Upload')->upBase64Img($img, $path);

        if ($reslut['status']) {
            $reslut['data'] = imgUrl($reslut['data'], $path);
        }
        $this->ajaxReturn($reslut);
    }

    //上传文件
    public function upFile()
    {
        $files = files('file');
        $path  = post('path', 'text', '');

        $reslut = dao('Upload')->uploadfile($files, $path, 10, $type = 'apk,mp4,mp3,doc,docx,flv,zip,rar');
        if ($reslut['status']) {

            //保持完整路径 可以让用户自行修改下载资源
            $reslut['data']['name'][0] = '/uploadfile/' . $path . '/' . $reslut['data']['name'][0];
        }

        $this->ajaxReturn($reslut);
    }
}