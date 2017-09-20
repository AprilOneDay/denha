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

    /**
     * 帮忙购车
     * @date   2017-09-20T15:50:39+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
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

        $this->appReturn(array('status' => true, 'msg' => '已提交成功'));

    }

    /**
     * 预约看车
     * @date   2017-09-20T16:25:21+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function appointment()
    {
    	$id = $
    }

     /**
     * 删除收藏
     * @date   2017-09-19T14:39:55+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function collectionDel()
    {
        $id = post('id', 'intval', 0);
        $result = dao('Collection')->del($this->uid, $id);
        $this->appReturn($result);
    }
}
