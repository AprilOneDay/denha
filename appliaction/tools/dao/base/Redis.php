<?php
/**
 * Redis模块
 */
namespace dao\base;

class Redis
{
    public static $redis;

    public function __construct()
    {
        $this->connect();
    }

    public function connect($host = '', $port = '6379', $password = '')
    {

        $config = config('cache');

        $host = $config['host'];
        $port = $config['port'];

        self::$redis = new \redis();
        $result      = self::$redis->connect($host, $port, 10);
        if (!$result) {
            throw new \Exception("Redis server not connect");
        }
    }

    /**
     * 清除全部redis
     * @date   2018-06-12T11:27:09+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function clearAll()
    {

        self::$redis->flushAll();

        return ['status' => true, 'msg' => '清除成功'];
    }

    /**
     * 获取reids key值
     * @date   2018-06-13T10:51:20+0800
     * @author ChenMingjiang
     * @param  string                   $key [description]
     * @return [type]                        [description]
     */
    public function lists($key = '*')
    {
        if ($key == null) {
            return ['list' => [], 'total' => 0];
        } elseif ($key != '*') {
            $key = '*' . $key . '*';
        } else {
            $key = '*';
        }

        $list = self::$redis->keys($key);

        $list = array_map(function ($val) {

            $val = array(
                'key'   => $val,
                'value' => $this->get($val),
            );

            return $val;
        }, $list);

        $data['list']  = $list ? $list : [];
        $data['total'] = count($list);

        return $data;
    }

    /** 保存值 */
    public function set($key, $val = '', $exp = 0)
    {
        return self::$redis->set($key);
    }

    public function get($key)
    {
        return self::$redis->get($key);
    }

    /** 删除redis */
    public function del($key)
    {
        $result = self::$redis->del($key);

        return array('status' => true, 'msg' => '删除成功');
    }
}
