<?php
/**
 * 公用模块
 */
namespace app\app\controller\v1\user;

use app\app\controller;

class Car extends \app\app\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '请登录'));
        }
    }

    public function index()
    {
        $user = table('User')->where('id', $this->uid)->field('avatar,nickname,moblie')->find();

        $user['avatar'] = $this->appImg($user['avatar']);

        $this->appReturn(array('data' => $user));

    }

    /**
     * 帮忙购车
     */
    public function help()
    {

        $data['brand']       = post('brand', 'text', '');
        $data['price']       = post('prcie', 'float', 0);
        $data['buy_time']    = post('buy_time', 'text', '');
        $data['mileage']     = post('mileage', 'text', '');
        $data['description'] = post('description', 'text', '');

        $data['created'] = TIME;
        $data['uid']     = $this->uid;

        if (!$data['brand']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入期望品牌'));
        }

        $is = table('HelpCar')->where(array('uid' => $this->uid, 'brand' => $data['brand']))->field('id')->find('one');
        if ($is) {
            $this->appReturn(array('status' => false, 'msg' => '您已申请过该品牌车辆的推荐了'));
        }

        $result = table('HelpCar')->add($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '提交成功'));

    }

    /**
     * 预约看车
     * @date   2017-09-20T16:25:21+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function appointment()
    {
        $data['start_time'] = post('start_time', 'intval', 0);
        $data['end_time']   = post('end_time', 'intval', 0);

        $id     = post('id', 'intval', 0);
        $origin = post('origin', 'intval', 0);

        $message = post('message', 'text', '');

        $version = 'v1';

        if (!$id || !$data['start_time'] || !$data['end_time']) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (date('Y-m-d', $data['start_time']) != date('Y-m-d', $data['end_time'])) {
            $this->appReturn(array('status' => false, 'msg' => '预约超过一天了'));
        }

        $map['id']         = $id;
        $map['start_time'] = $data['start_time'];
        $map['end_time']   = $data['end_time'];

        $is = table('OrdersCar')->where($map)->field('id')->find('one');
        if ($is) {
            $this->appReturn(array('status' => false, 'msg' => '请选择其他时间段，该时间已有预约了'));
        }

        $dataInfo = dao('orders')->getAddAttachedInfo(1, $id, $data);
        $result   = dao('orders')->add($this->uid, 1, $dataInfo, 0, 0, $message, $origin, $version);

        $this->appReturn($result);
    }

    /**
     * 删除收藏
     * @date   2017-09-19T14:39:55+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function collectionDel()
    {
        $id   = post('id', 'intval', 0);
        $type = post('type', 'intval', 0);

        $result = dao('Collection')->del($this->uid, $type, $id);
        $this->appReturn($result);
    }
}
