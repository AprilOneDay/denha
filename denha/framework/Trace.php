<?php
namespace denha;

class Trace
{
    protected static $tracePageTabs = array('BASE' => '基本', 'FILE' => '文件', 'ERR|NOTIC' => '错误', 'SQL' => 'SQL', 'DEBUG' => '调试');

    public static function run()
    {
        echo self::showTrace();
    }

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

        unset($files);
        unset($info);
        unset($base);
        ob_start();
        include FARM_PATH . DS . 'trace' . DS . 'templete.html';
        return ob_get_clean();
    }

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

    private static function fileInfo()
    {
        $files = get_included_files();
        $info  = array();

        foreach ($files as $key => $file) {
            $info[] = $file . ' ( ' . number_format(filesize($file) / 1024, 2) . ' KB )';
        }
        return $info;
    }

    private static function showTime()
    {
        /* useup('beginTime', $GLOBALS['_beginTime']);
    useup('viewEndTime');
    return useup('beginTime', 'viewEndTime') . 's ( Load:' . useup('beginTime', 'loadTime') . 's Init:' . useup('loadTime', 'initTime') . 's Exec:' . useup('initTime', 'viewStartTime') . 's Template:' . useup('viewStartTime', 'viewEndTime') . 's )';*/
    }
}
