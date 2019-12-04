<?php
namespace app\admin\common;

use app\admin\Init;

class Upload extends Init
{
    // 上传base64图片
    public function upBase64Img()
    {
        max_execution_time();

        $img  = post('data', 'text', '');
        $path = post('path', 'text', '');

        $reslut = dao('Upload')->upBase64Img($img, $path);

        if ($reslut['status']) {
            $reslut['data'] = imgUrl($reslut['data'], $path);
        }

        $this->ajaxReturn($reslut);
    }

    // 上传文件
    public function upFile()
    {
        $files   = files('file');
        $path    = post('path', 'text', '');
        $maxSize = post('max_size', 'intval', 300);
        $type    = post('type', 'text', '');

        $reslut = dao('Upload')->uploadfile($files, $path, ['max_size' => $maxSize, 'type' => $type]);
        // $reslut = dao('UploadOSS')->uploadfile($files, $path, ['max_size' => $maxSize, 'type' => $type]);

        $this->ajaxReturn($reslut);
    }
}
