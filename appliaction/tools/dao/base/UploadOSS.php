<?php
/**
 * 上传模块
 */
namespace dao\base;

use OSS\Core\OssException;
use OSS\OssClient;

class UploadOSS
{

    public static $client;
    public static $accessKeyId;
    public static $accessKeySecret;
    public static $endpoint;
    public static $bucket;
    public static $ossUrl;

    public function __construct()
    {

        require_once APP_PATH . 'tools' . DS . 'vendor' . DS . 'aliyuncs' . DS . 'oss-sdk-php' . DS . 'autoload.php';

        self::$accessKeyId     = config('OSS_ACCESS_KEY');
        self::$accessKeySecret = config('OSS_ACCESS_SECRET');
        self::$endpoint        = config('OSS_ENDPOINT');
        self::$bucket          = config('OSS_BUCKET');
        self::$ossUrl          = rtrim(config('OSS_URL'), '/') . '/';

        try {
            self::$client = new OssClient(self::$accessKeyId, self::$accessKeySecret, self::$endpoint, false);
        } catch (OssException $e) {
            return ['status' => false, 'msg' => 'OSS初始化失败:' . $e->getMessage()];
        }

    }

    /**
     * File批量上传图片
     * @date   2018-06-14T17:41:50+0800
     * @author ChenMingjiang
     * @param  [type]                   $files   [description]
     * @param  [type]                   $path    [保存地址]
     * @param  array                    $options [max_size:最大上传值 type：后缀显示 zipImg:压缩参数]
     * @return [type]                            [description]
     */
    public function uploadfile($files, $path = 'default', $options = [])
    {

        set_time_limit(0);

        if (!$files) {
            return ['status' => false, 'msg' => '上传信息为空'];
        }

        $move = dao('UploadBase')->checkFiles($files, $options);
        if (isset($move['status'])) {
            return $move;
        }

        //上传文件
        foreach ($move as $key => $value) {

            // 检查是否存在原文件 减少重复文件
            $fileData = dao('UploadBase')->getRepeatFile($value['hash'], $path);
            if (!$fileData) {
                $content = file_get_contents($value['tmp_name']);

                try {
                    self::$client->putObject(self::$bucket, rtrim($path, '/') . '/' . $value['name'], $content);
                } catch (OssException $e) {
                    return ['status' => false, 'msg' => '文件OSS上传失败:' . $e->getMessage()];
                }

                // 保存日志记录
                $fileData = dao('UploadBase')->saveLog($value, $path);

            }

            $data['name'][$key]     = $fileData['url'];
            $data['fullName'][$key] = imgUrl($fileData['url'], $path);

            return ['status' => true, 'msg' => '上传成功', 'data' => $data];

        }

    }
}
