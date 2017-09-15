<?php
/**
 * 商家会员相关
 */
namespace app\app\controller\v1\shop;

use app\app\controller;

class User extends \app\app\controller\Init
{
    /**
     * 会员中心首页
     * @date   2017-09-14T10:47:40+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function index()
    {
        $this->checkShop(); //必须商户会员登录

        $user = table('UserShop')->where(array('uid' => $this->uid))->field('name,avatar,credit_level,status')->find();

        $user['avatar'] = imgUrl($user['avatar'], 'avatar', 0, getConfig('config.app', 'imgUrl'));

        $data['user'] = $user;
        $this->appReturn(array('data' => $data));
    }

    /**
     * 编辑店铺信息
     * @date   2017-09-14T10:47:32+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function edit()
    {
        $this->checkShop(); //必须商户会员登录

        if (IS_POST) {
            $data['name']       = post('name', 'text', '');
            $data['woker_time'] = post('woker_time', 'text', '');
            $data['address']    = post('address', 'text', '');
            $data['category']   = post('category', 'intval', 0);

            $data['is_message'] = post('is_message', 'intval', 0);
            $data['ablum']      = post('ablum', 'json', '');

            $files['avatar'] = files('avatar');
            $files['ablum']  = files('ablum_files');

            $data['ablum']  = $this->appUpload($files['ablum'], $data['ablum'], 'shop');
            $data['avatar'] = $this->appUpload($files['avatar'], '', 'avatar');

            if (!$data['name']) {
                $this->appReturn(array('status' => false, 'msg' => '请输入店铺名称'));
            }

            if (!$data['woker_time']) {
                $this->appReturn(array('status' => false, 'msg' => '请输入营业时间'));
            }

            if (!$data['category']) {
                $this->appReturn(array('status' => false, 'msg' => '请选择分类'));
            }

            if (!$data['address']) {
                $this->appReturn(array('status' => false, 'msg' => '请输入店铺地址'));
            }

            $reslut = table('UserShop')->where(array('uid' => $this->uid))->save($data);

            if ($reslut) {
                $this->appReturn(array('msg' => '保存成功'));
            }

            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        } else {
            $data                  = table('UserShop')->where(array('uid' => $this->uid))->field()->find();
            $data['ablum']         = $data['ablum'] ? imgUrl(explode(',', $data['ablum']), 'shop', 0, getConfig('config.app', 'imgUrl')) : array();
            $data['ablum_num']     = count($data['ablum_num']);
            $data['category_copy'] = '选择分类';
            $data['ide_ablum']     = $data['ide_ablum'] ? imgUrl(explode(',', $data['ide_ablum']), 'ide', 0, getConfig('config.app', 'imgUrl')) : array();
            $this->appReturn(array('data' => $data));
        }
    }

    /**
     * 资质认证
     * @date   2017-09-14T12:06:12+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function upide()
    {
        $this->checkShop(); //必须商户会员登录

        $shop = table('UserShop')->where(array('uid' => $this->uid))->field('is_ide,ide_ablum')->find();
        if (IS_POST) {
            if ($shop['is_ide'] == 1) {
                $this->appReturn(array('status' => false, 'msg' => '已认证不可修改'));
            }
            $data['ide_ablum']  = post('ide_ablum', 'json', '');
            $files['ide_ablum'] = files('ide_ablum_files');

            $data['ide_ablum'] = $this->appUpload($files['ide_ablum'], $data['ide_ablum'], 'ide');
            $data['is_ide']    = $data['is_ide'] == 2 ? 0 : $data['is_ide'];

            $reslut = table('UserShop')->where(array('uid' => $this->uid))->save($data);

            if ($reslut) {
                $this->appReturn(array('msg' => '申请成功'));
            }

            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        } else {
            $data['ide_ablum'] = $shop['ide_ablum'] ? imgUrl(explode(',', $shop['ide_ablum']), 'ide', 0, getConfig('config.app', 'imgUrl')) : array();
            $data['is_ide']    = $shop['is_ide'];
            $this->appReturn(array('data' => $data));
        }

    }

    /**
     * 店铺开启/关闭
     * @date   2017-09-14T15:17:39+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function changeStatus()
    {
        $this->checkShop(); //必须商户会员登录
        if (IS_POST) {
            $status = post('status', 'intval', 3);
            if (!in_array($status, array(0, 1))) {
                $this->appReturn(array('status' => false, 'msg' => '参数错误'));
            }

            $reslut = table('UserShop')->where(array('uid' => $this->uid))->save(array('status' => $status));

            if ($reslut) {
                $this->appReturn(array('msg' => '操作成功'));
            }
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));

        }
    }

    /**
     * @method 注册
     * @url    email/send?token=xxx
     * @http   POST
     * @param  type                string [必填] 类型 1个人 2商家
     * @param  username            string [必填] 用户名
     * @param  password            string [必填] 密码
     * @param  password2           string [必填] 确认密码
     * @param  mobile              string [必填] 手机号
     * @param  code                string [必填] 验证码
     * @param  is_agree            string [非必填] 是否同意 1同意 0不同意(默认0)
     * @author Chen Mingjiang
     * @return
     * {"status":false,"msg":'失败原因',"code":200,data:[]}
     */
    public function register()
    {
        $data['username'] = post('username', 'text', '');
        $data['password'] = post('password', 'trim', '');
        $data['mobile']   = post('mobile', 'text', '');
        $data['type']     = post('type', 'intval', 0);

        $code      = post('code', 'text', '');
        $password2 = post('password2', 'text', '');
        $isAgree   = post('is_agree', 'intval', 0);

        $reslut = dao('User')->register($data, $password2, $isAgree);

        $this->appReturn($reslut);
    }

    /**
     * 注册
     * @date   2017-09-14T15:14:27+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function login()
    {
        $account  = post('account', 'text', '');
        $password = post('password', 'text', '');
        $type     = post('type', 'intval', 0);

        $typeCopy = array('1' => '个人', '2' => '商家');

        if (!$type) {
            $this->appReturn(array('status' => false, 'msg' => '请选择登录方式'));
        }

        $reslut = dao('User')->login($account, $password);

        if ($reslut['status']) {
            if ($reslut['data']['type'] != $type) {
                $this->appReturn(array('status' => false, 'msg' => '请选择' . $typeCopy[$reslut['data']['type']] . '登录'));
            }
        }

        $this->appReturn($reslut);
    }
}
