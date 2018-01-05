<?php
namespace app\note\pc\controller;

use denha\Controller;
use denha\Start;

class Init extends Controller
{
    public $token = '';
    public $uid   = 0;
    public $version;
    public $group;
    public $lg; //返货提示信息语音版本
    public $imei;

    public function __construct()
    {
        $this->token = getCookie('token') ? getCookie('token') : '';

        if ($this->token) {
            $map['token'] = $this->token;
            $user         = table('User')->where($map)->field('id,uid,type,imei,time_out,ip')->find();
            if ($user) {
                //更换ip 需要重新登录
                if ($user['ip'] != getIP()) {
                    $this->loginOut();
                    exit(header('LOCATION:/login'));
                    $this->appReturn(array('status' => false, 'msg' => '请重新登录', 'code' => 501));
                }

                //超过token时间 重新登录
                if ($user['time_out'] < TIME) {
                    $this->loginOut();
                    exit(header('LOCATION:/login'));
                    $this->appReturn(array('status' => false, 'msg' => '登录超时,请重新登录', 'code' => 501));
                }

                $this->uid        = $user['uid'];
                $this->group      = $user['type'];
                $data['time_out'] = TIME + 3600 * 24 * 2;
                $reslut           = table('User')->where(array('id' => $user['id']))->save($data);
            }
        }
    }

    /**
     * 验证用户组权限
     * @date   2017-11-23T16:45:03+0800
     * @author ChenMingjiang
     * @param  integer                  $group [description]
     * @return [type]                          [description]
     */
    public function checkIndividual($group = 1)
    {
        if (!$this->uid) {
            $this->loginOut();
            exit(header('LOCATION:/login'));
            $this->appReturn(array('status' => false, 'msg' => '请登录', 'code' => 501));
        }

        if ($this->group != $group) {
            $this->appReturn(array('status' => false, 'msg' => '权限不足'));
        }
    }

    protected function appReturn($value)
    {
        header("Content-Type:application/json; charset=utf-8");
        $array = array(
            'code'   => 200,
            'status' => true,
            'data'   => array(),
            'msg'    => '获取数据成功',
        );

        $value = array_merge($array, $value);
        if ($this->lg) {
            $value['msg'] = dao('BaiduTrans')->baiduTrans($value['msg'], $this->lg);
        }
        exit(json_encode($value));
    }

    /**
     * 转换一维数组成二维数组
     * @date   2017-09-15T09:31:28+0800
     * @author ChenMingjiang
     * @param  [type]                   $data [description]
     * @return [type]                         [description]
     */
    public function appArray($data)
    {
        foreach ($data as $key => $value) {
            $listTemp[] = array('id' => $key, 'value' => $value);
        }

        $listTemp = isset($listTemp) ? $listTemp : array();

        return $listTemp;
    }

    /**
     * app切割图片
     * @date   2017-09-18T11:21:31+0800
     * @author ChenMingjiang
     * @param  string                   $data [description]
     * @param  [type]                   $path [description]
     * @param  integer                  $size [description]
     * @return [type]                         [description]
     */
    public function appImgArray($data = '', $path = '', $size = 0)
    {
        $data = $data ? (array) imgUrl($data, $path, 0, Start::$config['imgUrl']) : array();
        return (array) $data;
    }

    public function appImg($data = '', $path = '', $size = 0)
    {

        $data = imgUrl($data, $path, 0, Start::$config['imgUrl']);
        return (string) $data;
    }

    /**
     * 退出登录
     * @date   2017-09-19T21:45:21+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function loginOut()
    {
        session_start();
        unset($_SESSION['token']);
        session_write_close();
        header('Location:/login');
    }
}
