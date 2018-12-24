<?php
/**
 * 用户管理模块
 */
namespace dao\base;

use denha\Smtp;

class User
{

    /**
     * 注册
     * @date   2017-10-13T09:14:10+0800
     * @author ChenMingjiang
     * @param  array                    $data       [主注册信息]
     * @param  string                   $password2  [确认密码]
     * @param  integer                  $isAgree    [授权同意]
     * @param  string                   $code       [验证码]
     * @param  array                    $thirdParty [第三方登录信息]
     * @return [type]                               [description]
     */
    public function register($data = [], $options = [], $thirdParty = [])
    {

        $data['password'] = trim(strtolower($data['password']));

        $userType = dao('Category')->getList('1137');

        // 重复密码
        $passwordRep = isset($options['passwordRep']) ? trim(strtolower($options['passwordRep'])) : $data['password'];
        // 授权同意
        $isAgree = isset($options['isAgree']) ? $options['isAgree'] : 1;
        // 手机验证码
        $mcode = isset($options['mcode']) ? $options['mcode'] : '';
        // 注册淘宝会员
        $isTaobao = isset($options['isTaobao']) ? $options['isTaobao'] : 0;
        // 注册增加积分
        $isIntegral = isset($options['isIntegral']) ? $options['isIntegral'] : 0;
        // 注册分销
        $isDistribution = isset($options['isDistribution']) ? $options['isDistribution'] : 0;
        // 分销Code 分销邀请码
        $distributionCode = isset($options['distributionCode']) ? $options['distributionCode'] : 0;

        if (!array_key_exists($data['type'], $userType)) {
            return ['status' => false, 'msg' => '注册类型不存在'];
        }

        if (empty($data['username'])) {
            return ['status' => false, 'msg' => '请输入用户名'];
        }

        // 检测手机号
        if (isset($data['mobile'])) {

            if (!$data['mobile']) {
                return ['status' => false, 'msg' => '请输入手机号'];
            }

            if (!dao('Regular')->isMobile($data['mobile'])) {
                return ['status' => false, 'msg' => '请输入正确的手机号'];
            }

            $isMobile = table('User')->where(['mobile' => $data['mobile'], 'type' => $data['type']])->field('id')->value();
            if ($isMobile) {
                return ['status' => false, 'msg' => '手机号已注册'];
            }
        }

        // 检测手机验证码
        if ($mcode) {
            $resultCode = dao('Sms')->checkVerification($data['mobile'], $mcode);
            if (!$resultCode['status']) {
                return $resultCode;
            }
        }

        if (empty($data['password'])) {
            return ['status' => false, 'msg' => '请输入密码'];
        }

        if (strlen($data['password']) < 6) {
            return ['status' => false, 'msg' => '密码太过简单了'];
        }

        if (!$passwordRep) {
            return ['status' => false, 'msg' => '请再次输入密码'];
        }

        if ($data['password'] !== $passwordRep) {
            return ['status' => false, 'msg' => '两次密码不一致'];
        }

        if (empty($data['type'])) {
            return ['status' => false, 'msg' => '请选择注册类型'];
        }

        if (!$isAgree) {
            return ['status' => false, 'msg' => '请勾选服务协议'];
        }

        $isUser = table('User')->where(['username' => $data['username'], 'type' => $data['type']])->field('id')->value();
        if ($isUser) {
            return ['status' => false, 'msg' => '用户名已注册请更换用户名'];
        }

        // 检测第三方登录
        if ($thirdParty) {
            $map = [];
            foreach ($thirdParty as $key => $value) {
                $map[$key] = $value;
            }

            $isThirdParty = table('UserThirdParty')->where($map)->field('uid')->value();

            if ($isThirdParty) {
                return ['status' => false, 'msg' => '已存在第三方授权记录,请直接登录'];
            }
        }

        //创建新账户
        $data['nickname'] = !empty($data['nickname']) ? $data['nickname'] : 'sn_' . $this->createUid() . rand(100, 999);
        $data['salt']     = rand(10000, 99999);
        $data['password'] = md5($data['password'] . $data['salt']);
        $data['created']  = TIME;
        $data['ip']       = getIP();
        if (empty($data['uid'])) {
            $data['uid'] = $this->createUid();
        }

        //注册支付宝账户
        if ($isTaobao) {
            $result = dao('TaobaoUser')->index($data['uid']);
            if ($result['status']) {
                $result = dao('TaobaoUser')->update(array('uid' => $data['uid'], 'nickname' => $data['nickname'], 'password' => $data['salt']));
            } else {
                $result = dao('TaobaoUser')->add(array('uid' => $data['uid'], 'nickname' => $data['nickname'], 'password' => $data['salt']));
            }

            if (!$result) {
                return ['status' => false, 'msg' => '通讯组件注册失败,请重试'];
            }
        }

        $result = table('User')->add($data);
        if (!$result) {
            return ['status' => false, 'msg' => '注册失败' . $data['ip']];
        }

        //增加第三方登录信息
        if ($thirdParty) {
            $thirdParty['uid'] = $data['uid'];
            table('UserThirdParty')->add($thirdParty);
        }

        // 注册分销信息
        if ($isDistribution) {
            if ($distributionCode) {
                $dataDistribution['invitation_uid'] = (int) table('DistributionUser')->where('code', $distributionCode)->value('uid');
            }
            $dataDistribution['uid']     = $data['uid'];
            $dataDistribution['created'] = TIME;
            $dataDistribution['code']    = chr(rand(97, 122)) . chr(rand(97, 122)) . chr(rand(97, 122)) . $data['uid'];

            $result = table('DistributionUser')->add($dataDistribution);

        }

        //增加积分明细
        if ($isIntegral) {
            dao('Integral')->add($result, 'user_registered');
        }

        return array('status' => true, 'msg' => '注册成功', 'data' => $data['uid']);
    }

    /**
     * 修改密码
     * @date   2017-09-25T10:47:02+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid       [用户uid]
     * @param  [type]                   $password  [用户新密码]
     * @param  [type]                   $password2 [再次确认密码]
     * @param  [type]                   $code      [description]
     * @return [type]                              [description]
     */
    public function findPassword($uid, $password, $password2, $options)
    {
        $code   = isset($options['code']) ? $options['code'] : null;
        $mobile = isset($options['mobile']) ? $options['mobile'] : null;

        if (!$uid) {
            return array('status' => false, 'msg' => '参数错误');
        }

        if (!$password) {
            return array('status' => false, 'msg' => '请输入修改密码');
        }

        if (!$password2) {
            return array('status' => false, 'msg' => '请再次输入密码');
        }

        $password = trim(strtolower($password));

        if ($password !== $password2) {
            return array('status' => false, 'msg' => '两次密码不一致');
        }

        //检测验证码
        if ($code) {
            $resultCode = dao('Sms')->checkVerification($mobile, $code);
            if (!$resultCode['status']) {
                return $resultCode;
            }
        }

        $salt = table('User')->where('id', $uid)->field('salt')->value();
        if (!$salt) {
            return array('status' => false, 'msg' => '信息有误');
        }

        $data['password'] = md5($password . $salt);
        $data['token']    = '';
        $result           = table('User')->where('id', $uid)->save($data);

        if (!$result) {
            return array('status' => false, 'msg' => '修改密码失败');
        }

        return array('status' => true, 'msg' => '修改密码成功');

    }

    /**
     * 检测用户密码是否正确
     * @date   2017-11-16T10:43:55+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid [description]
     * @return [type]                        [description]
     */
    public function checkUserPassword($uid = 0, $password = '')
    {
        if (!$uid || !$password) {
            return false;
        }

        $user = dao('User')->getInfo($uid, 'salt,password');

        if (md5(trim(strtolower($password)) . $user['salt']) !== $user['password']) {
            return false;
        }

        return ture;
    }

    //创建uid
    public function createUid()
    {
        $userAuto = table('User')->getTableStatus('Auto_increment');
        $uid      = rand(1000, 9999) . $userAuto;
        return $uid;
    }

    /**
     * 第三方登录
     * @date   2017-10-13T09:47:47+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function thirdPartyLogin($value, $imei = '')
    {
        $map['wx_id'] = $value;

        $uid = table('UserThirdParty')->where($map)->field('uid')->value();
        if (!$uid) {
            return array('status' => false, 'msg' => '尚未注册');
        }

        $user = table('User')->where('id', $uid)->field('type,password,salt,id')->find();

        $data['token']      = md5(TIME . $user['salt']);
        $data['time_out']   = TIME + 3600 * 24 * 2;
        $data['type']       = $user['type'];
        $data['login_ip']   = getIP();
        $data['login_time'] = TIME;
        $data['imei']       = $imei;

        $result = table('User')->where(array('uid' => $uid))->save($data);

        if (!$result) {
            return array('status' => false, 'msg' => '登录失败');
        }

        return array('status' => true, 'msg' => '登录成功', 'data' => $data);
    }

    /**
     * 登录
     * @date   2017-09-18T13:52:44+0800
     * @author ChenMingjiang
     * @param  [type]                   $account  [description]
     * @param  [type]                   $password [description]
     * @return [type]                             [description]
     */
    public function login($account, $password, $type = 1, $imei = '')
    {
        $password = trim(strtolower($password));
        if (!$account) {
            return array('status' => false, 'msg' => '请输入手机号/用户名');
        }

        if (!$password) {
            return array('status' => false, 'msg' => '请输入密码');
        }
        $map['type']    = $type;
        $map['_string'] = "(mobile = '$account' or username = '$account')";
        $user           = table('User')->where($map)->field('id,uid,type,password,salt,id')->find();

        if (!$user) {
            return array('status' => false, 'msg' => '该用户不存在');
        }

        if (md5($password . $user['salt']) != $user['password']) {
            return array('status' => false, 'msg' => '密码有误');
        }

        $data['token']      = md5(TIME . $user['salt']);
        $data['time_out']   = TIME + 3600 * 24 * 2;
        $data['type']       = $user['type'];
        $data['login_ip']   = getIP();
        $data['login_time'] = TIME;

        !$imei ?: $data['imei'] = (string) $imei;

        $result = table('User')->where(array('id' => $user['id']))->save($data);

        //增加返回字段
        $data['uid']  = $user['uid'];
        $data['salt'] = $user['salt'];

        if (!$result) {
            return array('status' => false, 'msg' => '登录失败');
        }

        //登录成功保存token
        cookie('token', $data['token'], $data['time_out']);
        return array('status' => true, 'msg' => '登录成功', 'data' => $data);
    }

    /**
     * 发送邮箱验证码
     * @date   2017-12-25T11:38:46+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid [description]
     * @return [type]                        [description]
     */
    public function sendMailCode($mail, $title = '您的验证码信息', $group = 1)
    {

        if (!$mail) {
            return array('status' => false, 'msg' => '请填写邮箱');
        }

        $code    = rand('10000', '99999');
        $content = '您的邮箱验证：' . $code;

        $smtp   = new Smtp($group);
        $result = $smtp->sendmail($mail, $title, $content);

        if (!$result) {
            return array('status' => false, 'msg' => '验证码发送失败，请联系管理员', 'debug' => $result);
        }

        //保存验证码
        $map['mail'] = $mail;
        $mailVerify  = table('MailVerify')->where($map)->field('id,created')->find();
        if ($mailVerify) {

            $data['code']    = $code;
            $data['created'] = TIME;
            table('MailVerify')->where('id', $mailVerify['id'])->save($data);

        } else {
            $data['code']    = $code;
            $data['created'] = TIME;
            $data['mail']    = $mail;
            table('MailVerify')->add($data);
        }

        return array('status' => true, 'msg' => '验证码发送成功');
    }

    /**
     * 验证码匹配
     * @date   2017-12-25T14:57:44+0800
     * @author ChenMingjiang
     * @param  [type]                   $mail [邮箱号]
     * @param  [type]                   $code [验证码]
     * @return [type]                         [description]
     */
    public function checkMailCode($mail, $code)
    {
        if (!$mail) {
            return array('status' => false, 'msg' => '请填写邮箱');
        }

        if (!$code) {
            return array('status' => false, 'msg' => '请填写验证码');
        }

        $mailVerify = table('MailVerify')->where('mail', $mail)->field('code,created')->find();
        if (!$mailVerify) {
            return array('status' => false, 'msg' => '验证码不存在');
        }

        if (TIME - $mailVerify['created'] > $time) {
            return array('status' => false, 'msg' => '验证码时间已过期');
        }

        if ($mailVerify['code'] != $code) {
            return array('status' => false, 'msg' => '验证码错误');
        }

        return array('status' => true, 'msg' => '匹配成功');
    }

    /**
     * 检测用户今日可用行为 每日签到/每日分享
     * @date   2017-09-18T13:58:32+0800
     * @author ChenMingjiang
     * @param  integer                  $uid [description]
     * @return boolean                       [true 可用 false 不可用]
     */
    public function todayAvailableBehavior($uid = 0, $content = '')
    {
        if (!$uid || !$content) {
            return array('status' => false, 'msg' => '参数错误', 'data' => false);
        }
        //今日时间戳
        $map['created'] = array('>=', mktime(0, 0, 0, date('m'), date('d'), date('Y')));
        $map['uid']     = $uid;
        $map['flag']    = $content;

        $is = table('IntegralLog')->where($map)->field('id')->find();
        //echo table('IntegralLog')->getSql();die;
        if ($is) {
            return array('status' => true, 'msg' => '已操作', 'data' => array('bool' => false));
        }

        return array('status' => true, 'msg' => '可用', 'data' => array('bool' => true));
    }

    /**
     * 获取我的积分
     * @date   2017-09-18T15:34:26+0800
     * @author ChenMingjiang
     * @param  integer                  $uid [description]
     * @return [type]                        [description]
     */
    public function getIntegral($uid = 0)
    {
        if (!$uid) {
            return false;
        }

        $data = (int) table('User')->where(array('uid' => $uid))->field('integral')->value();

        return $data;
    }

    public function updateLevel($uid)
    {
        //获取历史积分
        $map          = [];
        $map['uid']   = $uid;
        $map['value'] = array('>', 0);

        $integral = table('integralLog')->where($map)->field('SUM(value) as value')->value();

        //获取可达等级
        $map          = [];
        $map['value'] = array('>=', (int) $value);

        $rule = table('UserLevelRule')->where($map)->order('value desc')->find();
        if (!$rule) {
            return false;
        }
        //判断是否为当前等级
        $level = $this->getInfo($uid, 'level');
        if ($level == $rule['id']) {
            return false;
        }

        //更新等级
        $result = table('User')->where('uid', $uid)->save('level', $rule['id']);
        if (!$result) {
            return false;
        }

        //赠送抵扣卷
        if ($rule['coupon_gift']) {
            $couponGift = explode(',', $rule['coupon_gift']);

            foreach ($couponGift as $key => $value) {
                $result = dao('Coupon')->send($uid, $value, 1, 0);
            }
        }

        return true;
    }

    /**
     * [更新用户信息]
     * @date   2018-07-03T10:26:28+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid  [description]
     * @param  [type]                   $data [description]
     * @return [type]                         [description]
     */
    public function update($uid = 0, $data)
    {
        $result = table('User')->where('uid', $uid)->save($data);
        if ($result === false) {
            return ['status' => false, 'msg' => '更新失败'];
        }

        return ['status' => true, 'msg' => '更新成功'];
    }

    /**
     * 根据uid获取用户信息
     * @date   2017-10-25T16:28:32+0800
     * @author ChenMingjiang
     * @param  integer                  $uid   [description]
     * @param  string                   $field [description]
     * @return [type]                          [description]
     */
    public function getInfo($uid = 0, $field = '*')
    {
        $data = table('User')->where(array('uid' => $uid))->field($field)->find();

        if (!$data) {
            return [];
        }

        if (count($data) == 1) {
            return isset($data[$field]) ? $data[$field] : '';
        }

        return (array) $data;
    }

    /**
     * 获取用户名称
     * @date   2017-09-19T09:52:14+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid [description]
     * @return [type]                        [description]
     */
    public function getNickname($uid)
    {
        $data = (string) table('User')->where(array('uid' => $uid))->field('nickname')->value();

        return $data;
    }

    /**
     * 获取商品店铺名称
     * @date   2017-09-19T09:55:58+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid [description]
     * @return [type]                        [description]
     */
    public function getShopName($uid)
    {
        $data = table('UserShop')->where(array('uid' => $uid))->field('name')->value();

        return $data;
    }

    /**
     * 转换星星数量 于评价值 满分50 一个星星10分
     * @date   2017-09-20T15:33:18+0800
     * @author ChenMingjiang
     * @param  [type]                   $value [description]
     * @return [type]                          [description]
     */
    public function getShopCredit($uid = 0)
    {
        if (!$uid) {
            return '';
        }

        $map['type']     = 1;
        $map['shop_uid'] = $uid;
        $value           = table('Score')->where($map)->field('AVG(score) as score')->value();

        if ($value) {
            $value         = max($value, 0);
            $data['star']  = $value * 2;
            $data['value'] = sprintf('%.1f', $value / 10);
        } else {
            $data['star']  = 100;
            $data['value'] = 5;
        }

        return $data;
    }

}
