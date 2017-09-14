<?php
namespace app\app\controller;

use denha;

class Init extends denha\Controller
{
    public $token;
    public $uid;
    public $version;
    public $group;

    public function __construct()
    {
        !isset($_SERVER['HTTP_TOKEN']) ?: $this->token     = (string) $_SERVER['HTTP_TOKEN'];
        !isset($_SERVER['HTTP_VERSION']) ?: $this->version = (string) $_SERVER['HTTP_VERSION'];

        $user = table('User')->where(array('token' => $this->token))->field('id,type')->find();
        if ($user) {
            $this->uid        = $user['id'];
            $this->group      = $user['type'];
            $data['time_out'] = TIME + 3600 * 24 * 2;
            $reslut           = table('User')->where(array('id' => $user['id']))->save($data);
        }
    }

    public function checkShop()
    {
        if (!$this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '请登录'));
        }

        if ($this->group != 2) {
            $this->appReturn(array('status' => false, 'msg' => '权限不足'));
        }
    }

    /**
     * 上传图片并替换对于旧图片
     * @date   2017-09-14T11:54:39+0800
     * @author ChenMingjiang
     * @param  [type]                   $files [description]
     * @param  string                   $merge [description]
     * @param  string                   $path  [description]
     * @return [type]                          [description]
     */
    public function appUpload($files, $merge = '', $path = '')
    {
        $data = '';
        if ($files) {
            $reslut = dao('Upload')->uploadfile($files, $path);
            if (!$reslut) {
                $this->appReturn($rreslut);
            }

            if (is_array($merge)) {
                foreach ($merge as $key => $value) {
                    $url         = pathinfo($value);
                    $merge[$key] = current($url);
                }
                $data = implode(',', array_replace($merge, $reslut['data']['name']));
                /*var_dump($merge);var_dump($reslut['data']['name']);var_dump($data);die;*/
            } else {
                $data = implode(',', $reslut['data']['name']);
            }

        }

        return $data;
    }

    public function appArray($data)
    {
        foreach ($data as $key => $value) {
            $listTemp[] = array('id' => $key, 'value' => $value);
        }

        $listTemp = isset($listTemp) ? $listTemp : array();

        return $listTemp;
    }
}
