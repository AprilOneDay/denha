<?php
namespace app\admin;

use denha\Controller;

class Init extends Controller
{
    public $consoleid;
    public $consoleName;
    public $group;
    public $power;
    public $webType = 1; //站点标记
    public $lg      = ['zh']; //后台语言版本 zh:中文 en：英文 jp：日文
    public $version = '1.0.1'; //前端版本号
    public $qrlogin = false; // 是否开启扫码登陆

    public function __construct()
    {

        if (!((CONTROLLER == 'Login' && ACTION == 'index') || (CONTROLLER == 'WechatLogin'))) {
            $console = session('console');

            if ($console) {
                $this->consoleid   = $console['id'];
                $this->consoleName = $console['nickname'];
                $this->group       = $console['group'];
            }

            //获取权限信息
            if ($this->group) {
                $checkArray  = table('ConsoleGroup')->where('id', $this->group)->field('power')->value();
                $this->power = explode(',', $checkArray);
            }

            if (!$console || !$checkArray) {
                header('Location:/admin/index/login/index');
            }
        }

        if (config('debug')) {
            $this->version = rand(100000, 999999);
        }

        $this->assign('version', $this->version);

    }

    public function modelField($id, $model, $field)
    {

        $result = table($model)->where('id', $id)->field($field)->find();

        return $result[$field];

    }

    public function CRSF()
    {
        // if (IS_POST) {

        //     $csrfToken = isset($_SERVER['HTTP_CSRF_TOKEN']) ? $_SERVER['HTTP_CSRF_TOKEN'] : '';
        //     $token     = session('__token__');

        //     if ($csrfToken != $token) {
        //         $this->ajaxReturn(['status' => false, 'msg' => '非法操作哟', 'token' => $token, 'csrfToken' => $csrfToken]);
        //     }
        // }
    }

}
