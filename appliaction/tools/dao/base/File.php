<?php
/**
 * 文件操作
 */
namespace dao\base;

class File
{
    public function __construct()
    {
        //set_time_limit(0);
    }

    /**
     * 将多个文件压缩成一个zip文件的函数
     * @date   2017-11-15T10:12:02+0800
     * @author ChenMingjiang
     * @param  array                    $files       [description]
     * @param  string                   $path        [目标文件的路径 如""]
     * @param  string                   $zipName     [压缩后生成的名称]
     * @param  boolean                  $overwrite   [是否为覆盖与目标文件相同的文件]
     * @return [type]                                [description]
     */
    public function zip($files = array(), $path = '', $zipName = '', $overwrite = false)
    {

        //创建文件夹
        $dirPath = PUBLIC_PATH . 'uploadfile' . DS . $path . DS;
        is_dir($dirPath) ? '' : mkdir($dirPath, 0755, true);

        $data        = DS . 'uploadfile' . DS . $path . DS . $zipName . '.zip';
        $destination = PUBLIC_PATH . 'uploadfile' . DS . $path . DS . $zipName . '.zip';

        //window转gbk 防止中文乱码
        if (strripos($_SERVER['HTTP_USER_AGENT'], 'Win') !== false) {
            $destination = iconv('UTF-8', 'GBK', $destination);
        }

        //如果zip文件已经存在并且设置为不重写返回false
        if (file_exists($destination) && !$overwrite) {
            return array('status' => true, 'msg' => '文件已存在', 'data' => $data);
        }
        //vars
        $validFiles = array();
        //获取到真实有效的文件名
        $files = is_array($files) ? $files : (array) $files;
        foreach ($files as $file) {
            $file = PUBLIC_PATH . str_replace('/', DS, $file);
            if (file_exists($file)) {
                $validFiles[] = $file;
            }
        }

        if (!count($validFiles)) {
            return array('status' => false, 'msg' => '需要压缩文件不存在');
        }

        $zip = new \ZipArchive();
        //打开文件       如果文件已经存在则覆盖，如果没有则创建
        if ($zip->open($destination, $overwrite ? \ZipArchive::OVERWRITE : \ZipArchive::CREATE) !== true) {
            return array('status' => false, 'msg' => 'zip创建失败');
        }
        //向压缩文件中添加文件
        foreach ($validFiles as $file) {
            $fileInfoArr = pathinfo($file);
            $filename    = $fileInfoArr['basename'];
            $zip->addFile($file, $filename);
        }

        //debug
        //echo 'The zip archive contains ',$zip->numFiles,' files with a status of ',$zip->status;
        //close the zip -- done!

        //关闭文件
        $zip->close();

        //检测文件是否存在
        return array('status' => file_exists($destination), 'msg' => '操作完成', 'data' => $data);

    }

    /**
     * 解压文件到指定目录
     *
     * @param  string  zip压缩文件的路径
     * @param  string  解压文件的目的路径
     * @param  boolean 是否以压缩文件的名字创建目标文件夹
     * @param  boolean 是否重写已经存在的文件
     *
     * @return boolean 返回成功 或失败
     */
    public function unzip($srcFile, $destDir = false, $createZipNameDir = true, $overwrite = true)
    {
        $log = [];

        if ($zip = zip_open($srcFile)) {
            if ($zip) {
                $splitter = ($createZipNameDir === true) ? '.' : DS;
                if ($destDir === false) {
                    $destDir = substr($srcFile, 0, strrpos($srcFile, $splitter)) . DS;
                }

                // 如果不存在 创建目标解压目录
                $this->createDirs($destDir);
                // 对每个文件进行解压
                while ($zipEntry = zip_read($zip)) {
                    // 文件不在根目录
                    $posLastSlash = strrpos(zip_entry_name($zipEntry), DS);
                    if ($posLastSlash !== false) {
                        // 创建目录 在末尾带 /
                        $this->createDirs($destDir . substr(zip_entry_name($zipEntry), 0, $posLastSlash + 1));
                    }
                    // 打开包
                    if (zip_entry_open($zip, $zipEntry, 'r')) {
                        // 文件名保存在磁盘上
                        $fileName = $destDir . zip_entry_name($zipEntry);

                        if (!is_dir($fileName)) {
                            // 检查文件是否需要重写
                            if ($overwrite === true || $overwrite === false && !is_file($fileName)) {
                                // 读取压缩文件的内容
                                $fstream = zip_entry_read($zipEntry, zip_entry_filesize($zipEntry));
                                file_put_contents($fileName, $fstream);

                                // 设置权限
                                try {
                                    chmod($fileName, 0777);
                                } catch (\Exception $e) {
                                    $log['error'][] = '0777 : ' . $fileName;
                                }

                            }
                        }

                        // 关闭入口
                        zip_entry_close($zipEntry);
                    }
                }
                // 关闭压缩包
                zip_close($zip);
            }
        } else {
            return array('status' => false, 'data' => $log);
        }
        return array('status' => true, 'data' => $log);
    }

    /**
     * 创建目录
     */
    public function createDirs($path)
    {
        if (!is_dir($path)) {
            $directoryPath = '';
            $directories   = explode('/', $path);
            array_pop($directories);
            foreach ($directories as $directory) {
                $directoryPath .= $directory . '/';
                if (!is_dir($directoryPath)) {
                    mkdir($directoryPath);
                    chmod($directoryPath, 0777);
                }
            }
        }
    }

    /**
     * xls文件导入数据库
     * @date   2018-02-07T17:12:53+0800
     * @author ChenMingjiang
     * @param  [type]                   $file      [文件]
     * @param  string                   $tableName [数据库名称]
     * @return [type]                              [description]
     */
    public function xlsImport($path)
    {
        ini_set('memory_limit', '2044M');
        //包含类文件
        require_once APP_PATH . 'tools' . DS . 'vendor' . DS . 'PHPExcel' . DS . 'Classes' . DS . 'PHPExcel' . DS . 'IOFactory.php';

        if (!is_file($path)) {
            return array('status' => false, 'msg' => '文件不存在');
        }

        $reader        = \PHPExcel_IOFactory::createReader('Excel5');
        $PHPExcel      = $reader->load($path); // 载入excel文件
        $sheet         = $PHPExcel->getSheet(0); // 读取第一個工作表
        $highestRow    = $sheet->getHighestRow(); // 取得总行数
        $highestColumm = $sheet->getHighestColumn(); // 取得总列数

        //var_dump($PHPExcel);
        //var_dump($highestRow);
        //var_dump($highestColumm);

        //行数是以第1行开始
        for ($row = 1; $row <= 1000; $row++) {
            $dataColumn = array();
            for ($column = 'A'; $column <= $highestColumm; $column++) {
                $dataColumn[] = $sheet->getCell($column . $row)->getValue();
            }

            $data[] = $dataColumn;
        }

        return $data;
    }

    /**
     * 图片压缩
     * @date   2018-06-14T16:48:57+0800
     * @author ChenMingjiang
     * @param  [type]                   $filePath  [description]
     * @param  [type]                   $maxWidth  [description]
     * @param  [type]                   $maxHeight [description]
     * @param  [type]                   $type      [description]
     * @param  string                   $savePath  [description]
     * @return [type]                              [description]
     */
    public function zipImg($filePath, $maxWidth, $maxHeight, $type, $savePath = 'abc.jpg')
    {

        $tmpSavePath = PUBLIC_PATH . 'uploadfile' . DS . 'tmp' . DS;
        is_dir($tmpSavePath) ? '' : mkdir($tmpSavePath, 0755, true);
        $savePath = $tmpSavePath . $savePath;

        try {
            switch ($type) {
                case 'image/pjpeg':
                case 'image/jpeg':
                    $im = imagecreatefromjpeg($filePath); //PHP图片处理系统函数
                    break;
                case 'image/gif':
                    $im = imagecreatefromgif($filePath);
                    break;
                case 'image/png':
                    $im = imagecreatefrompng($filePath);
                    break;
                case 'image/wbmp':
                    $im = imagecreatefromwbmp($filePath);
                    break;
            }
        } catch (\Exception $e) {
            return ['status' => false, 'msg' => '图片格式异常，请选择其他图片上传'];
        }

        $resizewidthTag = $resizeheightTag = false;
        $picWidth       = imagesx($im);
        $picHeight      = imagesy($im);

        if (($maxWidth && $picWidth > $maxWidth) || ($maxHeight && $picHeight > $maxHeight)) {
            $resizewidthTag = $resizeheightTag = false;

            if ($maxWidth && $picWidth > $maxWidth) {
                $widthratio     = $maxWidth / $picWidth;
                $resizewidthTag = true;
            }

            if ($maxHeight && $picHeight > $maxHeight) {
                $heightratio     = $maxHeight / $picHeight;
                $resizeheightTag = true;
            }

            if ($resizewidthTag && $resizeheightTag) {
                if ($widthratio < $heightratio) {
                    $ratio = $widthratio;
                } else {
                    $ratio = $heightratio;
                }

            }

            if ($resizewidthTag && !$resizeheightTag) {
                $ratio = $widthratio;
            }

            if ($resizeheightTag && !$resizewidthTag) {
                $ratio = $heightratio;
            }

            $newwidth  = $picWidth * $ratio;
            $newheight = $picHeight * $ratio;

            if (function_exists("imagecopyresampled")) {
                $newim = imagecreatetruecolor($newwidth, $newheight); //PHP图片处理系统函数
                imagecopyresampled($newim, $im, 0, 0, 0, 0, $newwidth, $newheight, $picWidth, $picHeight); //PHP图片处理系统函数
            } else {
                $newim = imagecreate($newwidth, $newheight);
                imagecopyresized($newim, $im, 0, 0, 0, 0, $newwidth, $newheight, $picWidth, $picHeight);
            }

            switch ($type) {
                case 'image/pjpeg':
                case 'image/jpeg':
                    $result = imagejpeg($newim, $savePath);
                    break;
                case 'image/gif':
                    $result = imagegif($newim, $savePath);
                    break;
                case 'image/png':
                    $result = imagepng($newim, $savePath);
                    break;
                case 'image/wbmp':
                    $result = imagewbmp($newim, $savePath);
                    break;
            }
            imagedestroy($newim);
        } else {
            switch ($type) {
                case 'image/pjpeg':
                case 'image/jpeg':
                    $result = imagejpeg($im, $savePath);
                    break;
                case 'image/gif':
                    $result = imagegif($im, $savePath);
                    break;
                case 'image/png':
                    $result = imagepng($im, $savePath);
                    break;
                case 'image/wbmp':
                    $result = imagewbmp($im, $savePath);
                    break;
            }
        }

        if (!$result) {
            return ['status' => true, 'msg' => '压缩成功', 'url' => $filePath];
        }

        return ['status' => true, 'msg' => '未压缩', 'url' => $filePath];
    }
}
