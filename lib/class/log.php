<?php
class showlog
{
    public $filename;
    public $path;
    public $mk; //文件目录
    public $file; //打开文件

    public function __construct()
    {
        $this->mk = $_SERVER['DOCUMENT_ROOT'] . "/frame/log";
    }

    public function write($msg, $path = '')
    {
        $msg = $msg . "\r\n";
        if ($path != '') {
            $this->open($path);
        }
        fwrite($this->file, $msg);
        $this->close();
    }

    public function open($path)
    {
        $this->path = $this->mk . "/" . $path;
        if (!is_dir($this->mk)) {
            mkdir($this->mk, '0777');
        }
        $this->file = fopen($this->path, 'a+');
    }
    public function close()
    {
        fclose($this->file);
    }
}
