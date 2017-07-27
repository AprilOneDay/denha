<?php
//------------------------
// 调试信息函数
//-------------------------
namespace denha;

class Trace
{
    private static $tracePageTabs  = ['BASE' => '基本', 'FILE' => '文件', 'ERR|NOTIC' => '错误', 'SQL' => 'SQL', 'DEBUG' => '调试'];
    private static $traceErrorType = [0 => '', 1 => 'ERROR', 2 => 'WARNING', 4 => 'PARSE', 8 => 'NOTICE'];

    public static $errorInfo = [];

    //执行
    public static function run()
    {
        echo self::showTrace();
    }

    //捕获Notice错误信息
    public static function catchNotice($level, $message, $file, $line)
    {
        if ($level) {
            $info = self::$traceErrorType[$level] . ' : ' . $message . ' from ' . $file . ' in ' . $line;
            if (!self::$errorInfo) {
                self::$errorInfo[] = $info;
            } else {
                self::$errorInfo = array_merge(self::$errorInfo, (array) $info);
            }
        }
    }

    //捕获Error错误信息 并显示
    public static function catchError()
    {
        $e = error_get_last();
        if ($e) {
            return include FARM_PATH . DS . 'trace' . DS . 'error.html';
        }
    }

    //捕获Error错误信息
    public static function catchApp($error)
    {
        $e['type']    = 0;
        $e['message'] = $error->getMessage();
        $e['file']    = $error->getFile();
        $e['line']    = $error->getLine();
        return include FARM_PATH . DS . 'trace' . DS . 'error.html';

    }

    //展示调试信息
    private static function showTrace()
    {
        $trace = array();
        $tabs  = self::$tracePageTabs;
        foreach ($tabs as $name => $title) {
            switch (strtoupper($name)) {
                case 'BASE':
                    $trace[$title] = self::baseInfo();
                    break;
                case 'FILE':
                    $trace[$title] = self::fileInfo();
                    break;
                case 'ERR|NOTIC':
                    $trace[$title] = self::$errorInfo;
                    break;
                default:
                    $trace[$title] = $name;
                    break;
            }
        }

        /*$debug = trace();
        $tabs  = self::$tracePageTabs;

        foreach ($tabs as $name => $title) {
        switch (strtoupper($name)) {
        case 'BASE':
        $trace[$title] = $base;
        break;

        case 'FILE':
        $trace[$title] = $info;
        break;

        default:
        $name = strtoupper($name);

        if (strpos($name, '|')) {
        $array  = explode('|', $name);
        $result = array();

        foreach ($array as $name) {
        $result += (isset($debug[$name]) ? $debug[$name] : array());
        }

        $trace[$title] = $result;
        } else {
        $trace[$title] = (isset($debug[$name]) ? $debug[$name] : '');
        }
        }
        }

        if ($save = C('PAGE_TRACE_SAVE')) {
        if (is_array($save)) {
        $tabs  = $this->tracePageTabs;
        $array = array();

        foreach ($save as $tab) {
        $array[] = $tabs[$tab];
        }
        }

        $content = date('[ c ]') . ' ' . getip() . ' ' . $_SERVER['REQUEST_URI'] . PHP_EOL;

        foreach ($trace as $key => $val) {
        if (!isset($array) || in_array($key, $array)) {
        $content .= '[ ' . $key . ' ]' . PHP_EOL;

        if (is_array($val)) {
        foreach ($val as $k => $v) {
        $content .= (!is_numeric($k) ? $k . ':' : ')' . print_r($v, true) . PHP_EOL);
        }
        } else {
        $content .= print_r($val, true) . PHP_EOL;
        }

        $content .= PHP_EOL;
        }
        }

        error_log(str_replace('<br/>', PHP_EOL, $content), 3, DATA_PATH . 'logs' . DS . date('y_m_d') . '_trace.log');
        }*/

        ob_start();
        include FARM_PATH . DS . 'trace' . DS . 'debug.html';
        return ob_get_clean();
    }

    //获取基本信息
    private static function baseInfo()
    {
        $base = array(
            '请求信息' => date('Y-m-d H:i:s', $_SERVER['REQUEST_TIME']) . ' ' . $_SERVER['SERVER_PROTOCOL'] . ' ' . $_SERVER['REQUEST_METHOD'] . ' : ' . strip_tags($_SERVER['REQUEST_URI']),
            '运行时间' => self::showTime(),
            '吞吐率'    => number_format(1 / $GLOBALS['_beginTime'], 2) . 'req/s',
            '内存开销' => MEMORY_LIMIT_ON ? number_format((memory_get_usage() - $GLOBALS['_startUseMems']) / 1024, 2) . ' kb' : '不支持',
            //'查询信息' => n('db_query') . ' queries ' . n('db_write') . ' writes ',
            '文件加载' => count(get_included_files()),
            //'缓存信息' => n('cache_read') . ' gets ' . n('cache_write') . ' writes ',
            //'配置加载' => count(c()),
            '会话信息' => 'SESSION_ID=' . session_id(),
        );

        return $base;
    }

    //获取加载文件
    private static function fileInfo()
    {
        $files = get_included_files();
        $info  = array();

        foreach ($files as $key => $file) {
            $info[] = $file . ' ( ' . number_format(filesize($file) / 1024, 2) . ' KB )';
        }
        return $info;
    }

    //获取执行时间
    private static function showTime()
    {
        /* useup('beginTime', $GLOBALS['_beginTime']);
    useup('viewEndTime');
    return useup('beginTime', 'viewEndTime') . 's ( Load:' . useup('beginTime', 'loadTime') . 's Init:' . useup('loadTime', 'initTime') . 's Exec:' . useup('initTime', 'viewStartTime') . 's Template:' . useup('viewStartTime', 'viewEndTime') . 's )';*/
    }
}
