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
     */
    public function index()
    {
        $this->checkShop(); //必须商户会员登录

        $user = table('UserShop')->where(array('uid' => $this->uid))->field('name,avatar,credit_level,status')->find();

        $user['avatar']         = imgUrl($user['avatar'], 'avatar', 0, getConfig('config.app', 'imgUrl'));
        $user['credit_level']   = dao('User')->getShopCredit($user['credit_level']);
        $data['user']           = $user;
        $data['tot_read_total'] = (int) dao('Comment')->getNotReadTotal($this->uid); //获取未读信息条数
        //昨日订单量
        $beginYesterday                 = mktime(0, 0, 0, date('m'), date('d') - 1, date('Y'));
        $endYesterday                   = mktime(0, 0, 0, date('m'), date('d'), date('Y')) - 1;
        $data['yesterday_orders_total'] = table('Orders')->where(array('seller_uid' => $this->uid, 'status' => 1, 'created' => array('between', $beginYesterday, $endYesterday)))->count();
        //昨日浏览量
        $data['yesterday_hot_total'] = (int) table('ShopHotLog')->where(array('uid' => $this->uid, 'time' => date('Y-m-d', $beginYesterday)))->field('num')->find('one');
        //未完成预约数量
        $data['not_appointment_total'] = table('Orders')->where(array('seller_uid' => $this->uid, 'order_status' => 2, 'status' => 1))->count();
        //今日浏览量
        $data['today_hot_total'] = (int) table('ShopHotLog')->where(array('uid' => $this->uid, 'time' => date('Y-m-d', TIME)))->field('num')->find('one');
        //今日订单
        $todaystart                 = strtotime(date('Y-m-d' . '00:00:00', TIME)); //获取今天00:00
        $todayend                   = strtotime(date('Y-m-d' . '00:00:00', TIME + 3600 * 24)); //获取今天24:00
        $data['today_orders_total'] = table('Orders')->where(array('seller_uid' => $this->uid, 'status' => 1, 'created' => array('between', $todaystart, $todayend)))->count();
        //待付佣金
        $commission            = dao('Param')->getValue(1); //获取佣金比例
        $map                   = array();
        $map['seller_uid']     = $this->uid;
        $map['order_status']   = array('>=', 3);
        $map['status']         = 1;
        $map['is_percentage']  = 0;
        $map['type']           = 1;
        $notPayMoney           = (int) table('Orders')->where($map)->field('SUM(acount) as acount')->find('one');
        $data['not_pay_money'] = max($notPayMoney * $commission / 100, 0);

        $this->appReturn(array('data' => $data));

    }

    /**
     * 编辑店铺信息
     */
    public function edit()
    {
        $this->checkShop(); //必须商户会员登录

        if (IS_POST) {
            $data['name']       = $dataUser['nickname']       = post('name', 'text', '');
            $data['woker_time'] = post('woker_time', 'text', '');
            $data['address']    = post('address', 'text', '');
            $data['category']   = post('category', 'text', '0');

            $data['lng'] = post('lng', 'float', 0);
            $data['lat'] = post('lat', 'float', 0);

            $data['is_message'] = post('is_message', 'intval', 0);
            $data['ablum']      = post('ablum', 'json', '');

            $files['avatar'] = files('avatar');
            $files['ablum']  = files('ablum_files');

            $data['ablum']                       = $this->appUpload($files['ablum'], $data['ablum'], 'shop');
            !$files['avatar'] ?: $data['avatar'] = $dataUser['avatar'] = $this->appUpload($files['avatar'], '', 'avatar');

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
            table('UserShop')->startTrans();
            $result = table('UserShop')->where(array('uid' => $this->uid))->save($data);

            if (!$result) {
                table('UserShop')->rollback();
                $this->appReturn(array('status' => false, 'msg' => '执行失败'));

            }

            $result = table('User')->where('id', $this->uid)->save($dataUser);
            if (!$result) {
                table('UserShop')->rollback();
                $this->appReturn(array('status' => false, 'msg' => '信息修改失败'));

            }

            table('UserShop')->commit();
            $this->appReturn(array('msg' => '保存成功'));
        } else {
            $data                  = table('UserShop')->where(array('uid' => $this->uid))->find();
            $data['avatar']        = $this->appImg($data['avatar'], 'avatar');
            $data['ablum']         = $this->appImgArray($data['ablum'], 'shop');
            $data['ablum_num']     = count($data['ablum_num']);
            $data['category']      = explode(',', $data['category']);
            $data['category_copy'] = !$data['category'] ? '选择分类' : dao('Category')->getName($data['category']);
            $data['ide_ablum']     = $this->appImgArray($data['ide_ablum'], 'ide');
            $this->appReturn(array('data' => $data));
        }
    }

    /**
     * 资质认证
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
            $data['is_ide']    = 0;

            $result = table('UserShop')->where(array('uid' => $this->uid))->save($data);

            if ($result) {
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
     */
    public function changeStatus()
    {
        $this->checkShop(); //必须商户会员登录
        if (IS_POST) {
            $status = post('status', 'intval', 3);
            if (!in_array($status, array(0, 1))) {
                $this->appReturn(array('status' => false, 'msg' => '参数错误'));
            }

            $result = table('UserShop')->where(array('uid' => $this->uid))->save('status', $status);
            //开启店铺商品
            if ($status == 1) {
                table('GoodsCar')->where(array('uid' => $this->uid))->save('is_show', 1);
                table('GoodsService')->where(array('uid' => $this->uid))->save('is_show', 1);
            }
            //屏蔽店铺商品
            else {
                table('GoodsCar')->where(array('uid' => $this->uid))->save('is_show', 0);
                table('GoodsService')->where(array('uid' => $this->uid))->save('is_show', 0);
            }

            if ($result) {
                $this->appReturn(array('msg' => '操作成功'));
            }
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));

        }
    }

    /**
     * 修改用户密码
     * @date   2017-09-25T11:11:42+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function findPassword()
    {
        parent::__construct();
        $this->checkShop();
        $this->checkIde();

        $uid    = $this->uid;
        $mobile = post('mobile', 'text', '');

        $password  = post('password', 'text', '');
        $password2 = post('password2', 'text', '');

        $code = post('code', 'intval', 0);

        $map['id']     = $this->uid;
        $map['mobile'] = $mobile;
        $map['type']   = 1;

        if (!$mobile) {
            $this->appReturn(array('status' => false, 'msg' => '请输入手机号'));
        }

        if (!$code) {
            $this->appReturn(array('status' => false, 'msg' => '请输入验证码'));
        }

        $is = table('User')->where($map)->field('id')->find('one');
        if (!$is) {
            $this->appReturn(array('status' => false, 'msg' => '非绑定手机号'));
        }

        $reslut = dao('User')->findPassword($this->uid, $password, $password2, $code);
        $this->appReturn($reslut);
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

        $weixinId = post('weixin_id', 'text', '');
        $code     = post('code', 'text', '');

        $code != '' ?: $code = post('Code', 'intval', 0);

        $password2 = post('password2', 'text', '');
        $isAgree   = post('is_agree', 'intval', 0);

        if (!$code) {
            $this->appReturn(array('status' => false, 'msg' => '请输入验证码'));
        }

        $thirdParty = array();
        if ($weixinId) {
            $thirdParty['weixin_id'] = $weixinId;
        }

        $result = dao('User')->register($data, $password2, $isAgree, $code, $thirdParty);

        $this->appReturn($result);
    }

    /**
     * 登录
     * @date   2017-10-13T09:58:01+0800
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

        $result = dao('User')->login($account, $password, $this->imei, $type);

        if ($result['status']) {
            if ($result['data']['type'] != $type) {
                $this->appReturn(array('status' => false, 'msg' => '请选择' . $typeCopy[$result['data']['type']] . '登录'));
            }
        }

        if ($result['data']['type'] == 2) {
            $result['data']['is_ide'] = (int) table('UserShop')->where('uid', $result['data']['uid'])->field('is_ide')->find('one');
        }

        $this->appReturn($result);
    }

    /**
     * 第三方登录
     * @date   2017-10-13T09:58:01+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function thirdPartyLogin()
    {
        $account = post('account', 'text', '');
        $type    = post('type', 'intval', 0);

        $typeCopy = array('1' => '个人', '2' => '商家');

        if (!$type) {
            $this->appReturn(array('status' => false, 'msg' => '请选择登录方式'));
        }

        $result = dao('User')->thirdPartyLogin($account, $this->imei);

        if ($result['status']) {
            if ($result['data']['type'] != $type) {
                $this->appReturn(array('status' => false, 'msg' => '请选择' . $typeCopy[$result['data']['type']] . '登录'));
            }
        }

        if ($type == 2) {
            $$result['data']['is_ide'] = table('UserShop')->where('uid', $result['data']['uid'])->field('is_ide')->find('one');
        }

        $this->appReturn($result);
    }

}
