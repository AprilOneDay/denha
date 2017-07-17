<?php
class template
{
    public $stampLeft  = '{';
    public $stampRight = '}';
    public $viewPath;
    public $content;
    public $loadPath;

    public function __construct($viewPath)
    {
        $this->viewPath = $viewPath;
    }

    public function getContent()
    {
        $file          = fopen($this->viewPath, 'r');
        $this->content = fread($file, filesize($this->viewPath));
        $this->stampInclude();
        $this->stampIf();
        $this->stampForeach();
        $this->stampVar();
        $this->saveFile();
    }

    public function saveFile()
    {
        $cacheMd5       = md5($this->viewPath);
        $this->loadPath = DATA_PATH . $cacheMd5 . '.php';
        $file           = fopen($this->loadPath, 'w');
        fwrite($file, $this->content);
        fclose($file);
        //同步修改时间
        touch($this->loadPath, filemtime($this->viewPath), filemtime($this->viewPath));
    }

    public function stampInclude()
    {
        $regular = '#' . $this->stampLeft . 'include\s[\'"](.*?)[\'"](.*?)' . $this->stampRight . '#is';
        preg_match_all($regular, $this->content, $matches);
        if ($matches) {
            foreach ($matches[1] as $key => $value) {
                if (!$value) {
                    $path = VIEW_PATH . CONTROLLER . '/index.html';
                }
                //绝对路径
                elseif (stripos($value, '/') === 0) {
                    $path = VIEW_PATH . substr($value, 1) . '.html';
                }
                //相对路径
                else {
                    $path = VIEW_PATH . CONTROLLER . '/' . $value . '.html';
                }
                if (is_file($path)) {
                    $file    = fopen($path, 'r');
                    $content = fread($file, filesize($path));
                    //替换模板变量
                    $this->content = str_replace($matches[0][$key], $content, $this->content);
                }
            }
        }

    }

    public function stampIf()
    {
        $regular = '#' . $this->stampLeft . 'if\s(.*?)' . $this->stampRight . '#is';
        preg_match_all($regular, $this->content, $matches);
        if ($matches) {
            foreach ($matches[0] as $key => $value) {
                //替换模板变量
                $this->content = str_replace($matches[0][$key], '<?php if(' . $matches[1][$key] . '){ ?>', $this->content);
            }
            $this->content = str_replace($this->stampLeft . '/if' . $this->stampRight, '<?php } ?>', $this->content);
        }
        //替换elseif
        $regular2 = '#' . $this->stampLeft . 'elseif\s(.*?)' . $this->stampRight . '#is';
        preg_match_all($regular2, $this->content, $matches2);
        if ($matches2) {
            foreach ($matches2[0] as $key => $value) {
                //替换模板变量
                $this->content = str_replace($matches2[0][$key], '<?php }elseif(' . $matches[1][$key] . '){ ?>', $this->content);
            }
        }
        //替换else
        $regular3 = '/' . $this->stampLeft . 'else' . $this->stampRight . '/is';
        preg_match_all($regular3, $this->content, $matches3);
        if ($matches3) {
            foreach ($matches3[0] as $key => $value) {
                //替换模板变量
                $this->content = str_replace($matches3[0][$key], '<?php }else{ ?>', $this->content);
            }
        }
    }

    public function stampVar()
    {
        //{$xxx}
        $regular = '/' . $this->stampLeft . '\$(.*?)' . $this->stampRight . '/is';
        preg_match_all($regular, $this->content, $matches);
        if ($matches) {
            foreach ($matches[0] as $key => $value) {
                //替换模板变量
                $this->content = str_replace($matches[0][$key], '<?php echo $' . $matches[1][$key] . '; ?>', $this->content);
            }
        }

        //{??$xx}
        $regular2 = '#' . $this->stampLeft . '\?\?(.*?)' . $this->stampRight . '#is';
        preg_match_all($regular2, $this->content, $matches2);
        if ($matches2) {
            foreach ($matches2[0] as $key => $value) {
                //替换模板变量
                $this->content = str_replace($matches2[0][$key], '<?php echo isset(' . $matches2[1][$key] . ') ? ' . $matches2[1][$key] . ' : \'\'; ?>', $this->content);
            }
        }

    }

    public function stampForeach()
    {
        $regular = '#' . $this->stampLeft . 'loop\s(.*?)\s(.*?)' . $this->stampRight . '#is';
        preg_match_all($regular, $this->content, $matches);
        if ($matches) {
            foreach ($matches[0] as $key => $value) {
                if (stripos($matches[2][$key], ' ') !== false) {
                    $rowTmp        = explode(' ', $matches[2][$key]);
                    $this->content = str_replace($matches[0][$key], '<?php if(' . $matches[1][$key] . '){ foreach(' . $matches[1][$key] . ' as ' . trim($rowTmp[0]) . ' => ' . trim($rowTmp[1]) . '){ ?>', $this->content);
                } else {
                    $this->content = str_replace($matches[0][$key], '<?php if(' . $matches[1][$key] . '){ foreach(' . $matches[1][$key] . ' as ' . $matches[2][$key] . '){ ?>', $this->content);
                }
            }
            $this->content = str_replace($this->stampLeft . '/loop' . $this->stampRight, '<?php }} ?>', $this->content);
        }
    }
}
