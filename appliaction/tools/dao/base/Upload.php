<?php
/**
 * 上传模块
 */
namespace dao\base;

/**
 * 通用的树型类，可以生成任何树型结构
 */
class Upload
{
    private $path;

    public function upBase64Img($data, $path)
    {
        if ($path) {
            $path = 'uploadfile' . DS . $path . DS;
        } else {
            $path = 'uploadfile' . DS;
        }

        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $data, $match)) {
            $type = $match[2];
            if (!file_exists($path)) {
                //检查是否有该文件夹，如果没有就创建，并给予最高权限
                mkdir($path, 0755, true);
            }
            $fileName = md5(uniqid('', true)) . ".{$type}";
            $newFile  = $path . $fileName;

            if (file_put_contents($newFile, base64_decode(str_replace($match[1], '', $data)))) {
                return ['status' => true, 'msg' => '保存成功', 'data' => $fileName];
            } else {
                return ['status' => false, 'msg' => '保存失败'];
            }
        }

        return ['status' => false, 'msg' => '请上传正确的图片'];
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
    public function uploadfile($files, $path, $options = [])
    {
        set_time_limit(0);

        if (!$files) {
            return ['status' => false, 'msg' => '上传信息为空'];
        }

        $filePath = PUBLIC_PATH . 'uploadfile' . DS . $path . DS;
        is_dir($filePath) ? '' : mkdir($filePath, 0755, true);

        if (!isWritable($filePath)) {
            return ['status' => false, 'msg' => '文件不可写入'];
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
                $result = move_uploaded_file($value['tmp_name'], $filePath . $value['name']);

                if (!$result) {
                    return ['status' => false, 'msg' => $value['old_name'] . '上传失败', 'debug' => $value];
                }

                // 保存日志记录
                $fileData = dao('UploadBase')->saveLog($value, $path);
            }

            $data['name'][$key]     = $fileData['url'];
            $data['fullName'][$key] = imgUrl($fileData['url'], $path);

        }

        return ['status' => true, 'msg' => '上传成功', 'data' => $data];
    }

    /**
     * 远程文件保存
     * @date   2019-06-26T14:49:27+0800
     * @author ChenMingjiang
     * @param  [type]                   $file    [远程地址]
     * @param  [type]                   $path    [保存路径]
     * @param  array                    $options [description]
     *                                           ext:默认后缀名
     *                                           type:保存类型
     * @return [type]                   [description]
     */
    public function copy($file, $path, $options = [])
    {

        $ext  = isset($options['ext']) ? $options['ext'] : 'jpg';
        $type = isset($options['type']) ? $options['type'] : 'local'; // local:本地 oss:阿里云oss存储

        $filePath = PUBLIC_PATH . 'uploadfile' . DS . $path . DS;

        $fileData = file_get_contents($file);
        $ext      = strtolower(pathinfo($file, PATHINFO_EXTENSION)) ? strtolower(pathinfo($file, PATHINFO_EXTENSION)) : $ext;

        $param['tmp_name'] = $file;
        $param['old_name'] = $file;
        $param['size']     = 0;
        $param['ext']      = $param['type']      = $ext;
        $param['name']     = TIME . rand(100, 999) . '.' . $param['ext'];

        // 保存本地
        if ($type == 'local') {
            $param['size'] = $result = file_put_contents($filePath . $param['name'], $fileData);

            if ($result) {
                // 保存日志记录
                $resData = dao('UploadBase')->saveLog($param, $path);
                $name    = $resData['url'];
            }

        } elseif ($type == 'oss') {
            $result = dao('UploadOSS')->uploadfile($param, 'avatar');
            if ($result['status']) {
                $name = $result['data']['name'][0];
            }
        }

        if ($result === false || (isset($result['status']) && !$result['status'])) {
            return ['status' => false, 'msg' => '复制失败'];
        }

        $data['name']     = $name;
        $data['fullName'] = imgUrl($name, $path);

        return ['status' => true, 'msg' => '上传成功', 'data' => $data];

    }

}
