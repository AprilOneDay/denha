<?php
/**
 * 上传模块基础处理
 */
namespace dao\base;

class UploadBase
{

    /** 获取最大自增ID */
    public function getMaxAutoId()
    {

        $auto = table('UploadLog')->getTableStatus('Auto_increment');
        return (int) $auto;
    }

    /** 保存附件记录 */
    public function saveLog($param = [], $path = '')
    {
        $imgUrl = imgUrl($param['name'], $path);
        if (strpos($imgUrl, 'http') === false) {
            $imgUrl = PUBLIC_PATH . $imgUrl;
        }

        $hash = sha1(file_get_contents($imgUrl));

        $data['name']    = $param['old_name'];
        $data['size']    = $param['size'];
        $data['path']    = $path;
        $data['ext']     = !empty($param['ext']) ? $param['ext'] : pathinfo($param['old_name'], PATHINFO_EXTENSION);
        $data['url']     = $param['name'];
        $data['hash']    = $hash;
        $data['ip']      = getIp();
        $data['created'] = TIME;

        $result = table('UploadLog')->add($data);

        return $data;
    }

    /** 获取重复信息 */
    public function getRepeatFile($hash, $path = '')
    {
        //判断是否存在图片
        $data = table('UploadLog')->where('hash', $hash)->where('path', $path)->find();

        if (!$data) {
            return false;
        } else {
            return $data;
        }
    }

    /** 获取原文件名 */
    public function getOldName($url)
    {
        $data = table('UploadLog')->where('url', $url)->value('name');

        return $data;
    }

    /**
     * 检测files
     * @date   2018-03-22T11:48:10+0800
     * @author ChenMingjiang
     * @param  [type]                   $files   [file数组]
     * @param  integer                  $maxSize [最大上传]
     * @param  string                   $type    [上传类型]
     * @return [type]                            [array 处理fiels数组]
     */
    public function checkFiles($files, $options = [])
    {
        $maxSize = isset($options['max_size']) ? $options['max_size'] : 10;
        $type    = isset($options['type']) ? $options['type'] : '';
        $zipImg  = isset($options['zipImg']) ? $options['zipImg'] : [];

        //处理files数组
        if (count($files) == count($files, 1)) {
            foreach ($files as $key => $value) {
                unset($files[$key]);
                $files[0][$key] = $value;
            }
        }

        $type ?: $type = 'jpg,png,gif,jpeg';

        $id = dao('UploadBase')->getMaxAutoId(); //获取最大自增ID

        //检测文件
        foreach ($files as $key => $value) {
            if ($value['size'] >= $maxSize * 1024 * 1024) {
                return ['status' => false, 'msg' => '请上传小于' . $maxSize . 'M的文件'];
            }

            if ($value['error']) {
                return ['status' => false, 'msg' => $this->error($value['error']), 'error' => $value['error']];
            }

            $ext = $this->analyzeExt($value['type']);
            if (!$ext) {
                $ext = strtolower(pathinfo($value['name'], PATHINFO_EXTENSION));
            }

            if (stripos($type, $ext) === false) {
                return ['status' => false, 'msg' => $ext . '文件禁止上传'];
            }

            //压缩图片
            if (!empty($zipImg['height']) || !empty($zipImg['width'])) {
                $name = time() . rand(100, 999) . '_' . $id++ . '.' . $ext;

                $result = dao('File')->zipImg($value['tmp_name'], $zipImg['height'], $zipImg['width'], $value['type'], $name);
                if (!$result['status']) {
                    return $result;
                }

                $value['tmp_name'] = $result['url'];
            }

            $move[$key]['hash']     = sha1(file_get_contents($value['tmp_name']));
            $move[$key]['tmp_name'] = $value['tmp_name'];
            $move[$key]['name']     = time() . rand(100, 999) . '_' . $id++ . '.' . $ext;
            $move[$key]['old_name'] = $value['name'];
            $move[$key]['size']     = $value['size'];

        }

        return $move;
    }

    /** 错误提示 */
    private function error($errorNo)
    {
        switch ($errorNo) {
            case 1:
                return '上传的文件超过了 php.ini 中 upload_max_filesize 选项限制的值！';
                break;
            case 2:
                return '上传文件的大小超过了 HTML 表单中 MAX_FILE_SIZE 选项指定的值！';
                break;
            case 3:
                return '文件只有部分被上传！';
                break;
            case 4:
                return '没有文件被上传！';
                break;
            case 6:
                return '找不到临时文件夹！';
                break;
            case 7:
                return '文件写入失败！';
                break;
            default:
                break;
        }

    }

    /** 分析后缀 */
    private function analyzeExt($application)
    {
        switch ($application) {
            case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
                $ext = 'docx';
                break;
            case 'application/msword':
                $ext = 'doc';
                break;
            case 'text/plain':
                $ext = 'txt';
                break;
            case 'application/vnd.openxmlformats-officedocument.presentationml.presentation':
                $ext = 'pptx';
                break;
            case 'application/vnd.ms-powerpoint':
                $ext = 'ppt';
                break;
            case 'application/x-ppt':
                $ext = 'ppt';
                break;
            case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
                $ext = 'xlsx';
                break;
            case 'application/x-xls':
                $ext = 'xls';
                break;
            case 'application/rar':
                $ext = 'rar';
                break;
            case 'application/zip':
                $ext = 'zip';
                break;
            case 'image/jpeg':
                $ext = 'jpeg';
                break;
            case 'image/jpeg':
                $ext = 'jpeg';
                break;
            case 'application/x-png':
                $ext = 'png';
                break;
            case 'image/png':
                $ext = 'png';
                break;
            case 'image/gif':
                $ext = 'gif';
                break;
            case 'application/pdf':
                $ext = 'pdf';
                break;
            default:
                $ext = '';
                break;

        }

        return $ext;
    }
}
