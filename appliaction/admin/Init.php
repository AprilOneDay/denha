<?php
namespace app\admin;

use denha\Controller;

class Init extends Controller
{
    public $consoleid;
    public $consoleName;
    public $group;
    public $power;
    public $webType    = 1; //站点标记
    public $lg         = ['zh']; //后台语言版本 zh:中文 en：英文 jp：日文
    public $version    = '2.0.0'; //前端版本号
    public $qrlogin    = false; // 是否开启扫码登陆
    public $liveReload = false; // 开启实时刷新页面 需要liveReload插件配合

    public function __construct()
    {

        // 检查并保存会员信息
        if (!((CONTROLLER == 'Login' && ACTION == 'index') || (CONTROLLER == 'WechatLogin'))) {
            $this->checkConsole();
        }

        // js css 版本控制
        if (config('debug')) {
            $this->version = rand(100000, 999999);
        }

        $this->assign('consoleVersion', 'v2');
        $this->assign('version', $this->version);

    }

    /** 检查并保存会员信息 */
    public function checkConsole()
    {
        $console = session('console');

        if ($console) {
            $this->consoleid   = $console['id'];
            $this->consoleName = $console['nickname'];
            $this->group       = explode(',', $console['group']);

            // 登录ip 不一致 重新登录
            if (empty($console['login_ip']) || $console['login_ip'] != getIP()) {
                $this->headerTopLoaction('/admin/index/login/index?code=501');
            }

            // 保证两小时存活时间
            if (!isset($console['expire_time']) || $console['expire_time'] + 60 > TIME) {
                $console['expire_time'] = TIME + 60 * 60 * 2;
                session('console', $console);
            } else {
                $this->headerTopLoaction('/admin/index/login/index?code=501');
            }

        }

        //获取权限信息
        if ($this->group) {

            $checkArray = table('ConsoleGroup')->where('id', 'in', $this->group)->column('power');

            $this->power = implode(',', $checkArray);
            $this->power = array_values(array_unique(explode(',', $this->power)));

        }

        if (!$console || !$checkArray) {
            $this->headerTopLoaction('/admin/index/login/index?code=501');
        }

    }

    public function headerTopLoaction($url)
    {
        die('<script>top.location.href="' . $url . '"</script>');
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
