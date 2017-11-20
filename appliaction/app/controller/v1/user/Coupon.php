<?php
/**
 * 抵扣券模块管理
 */
namespace app\app\controller\v1\user;

use app\app\controller;

class Coupon extends \app\app\controller\Init
{

    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /**
     * 兑换数据
     * @date   2017-09-27T10:00:38+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function index()
    {
        $user = table('User')->where('id', $this->uid)->field('integral')->find();

        $list = table('CouponExchangeRule')->where(array('status' => 1))->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['status'] = 1;
            if ($value['integral'] > $user['integral']) {
                $list[$key]['status'] = 2;
            }
        }

        $data['list'] = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

    /**
     * 领取抵扣券
     * @date   2017-09-27T10:00:02+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function get()
    {
        $id = post('id', 'intval', 0);

        $dayMaxNum = 3; //每日领取次数

        $map['status'] = 1;
        $map['id']     = $id;

        $data = table('CouponExchangeRule')->where($map)->find();

        if (!$data) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        //关闭的店铺
        $map['status']   = 2;
        $map['category'] = array('instr', $date['category']);
        $closeShop       = table('UserShop')->where($map)->field('uid')->find('one', true);

        //可领抵扣券
        $map                  = array();
        $map['category']      = $data['category'];
        $map['remainder_num'] = array('>', 0);
        $map['status']        = 1;
        $map['is_exchange']   = 1;
        $map['del_status']    = 0;
        $map['end_time']      = array('>=', TIME);
        $map['uid']           = array('not in', $closeShop); //剔除关闭店铺

        $coupon = table('Coupon')->where($map)->order('RAND()')->find();

        if (!$coupon) {
            $this->appReturn(array('status' => false, 'msg' => '暂无相关抵扣券', 'sql' => table('Coupon')->getSql()));
        }

        //统计积分明细记录 判断每日领取次数
        $map            = array();
        $map['created'] = array('>=', mktime(0, 0, 0, date('m'), date('d'), date('Y')));
        $map['uid']     = $this->uid;
        $map['flag']    = 'user_get_coupon';
        $daoyNum        = table('IntegralLog')->where($map)->field('count(*) as num')->find('one');
        if ($dayMaxNum <= $daoyNum) {
            $this->appReturn(array('status' => false, 'msg' => '每日只可兑换' . $dayMaxNum . '次,请明天再来'));
        }
        table('User')->startTrans();

        //增加抵扣券领取记录
        $result = dao('Coupon')->send($this->uid, $coupon['id'], 2);
        if (!$result['status']) {
            table('User')->rollback();
            $this->appReturn($result);
        }

        //判断用户积分是否满足
        $user = table('User')->where('id', $this->uid)->field('id,integral')->find();
        if ($user['integral'] < $data['integral']) {
            table('User')->rollback();
            $this->appReturn(array('status' => false, 'msg' => '积分不足'));
        }

        //修改商户抵扣券记录
        $dataCoupon['remainder_num'] = array('less', 1);
        $dataCoupon['version']       = array('add', 1);

        $resultCoupon = table('Coupon')->where(array('id' => $coupon['id'], 'version' => $coupon['version']))->save($dataCoupon);
        if (!$resultCoupon) {
            table('User')->rollback();
            $this->appReturn(array('status' => false, 'msg' => '抵扣券领取失败了,请稍后尝试', 'sql' => table('Coupon')->getSql()));
        }

        //增加积分明细记录
        $resultUser = dao('Integral')->addTemp($this->uid, '领取' . $data['name'], -$data['integral'], 'user_get_coupon');
        if (!$resultUser) {
            table('User')->rollback();
            $this->appReturn(array('status' => false, 'msg' => '积分抵扣异常,请稍后尝试'));
        }

        table('User')->commit();

        $this->appReturn(array('msg' => '抵扣券领取成功'));
    }

    /**
     * 抵扣券列表
     * @date   2017-09-27T13:30:58+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $couponLog = table('CouponLog')->tableName();
        $coupon    = table('Coupon')->tableName();

        $map[$couponLog . '.uid'] = $this->uid;

        $list         = dao('Coupon')->lists($map, $offer, $pageSize);
        $data['list'] = $list ? $list : array();

        foreach ($data['list'] as $key => $value) {
            $data['list'][$key]['category_copy'] = dao('Category')->getName($value['category']);
        }

        $this->appReturn(array('data' => $data));
    }

    /**
     * 使用抵扣券
     * @date   2017-10-25T14:10:56+0800
     * @author ChenMingjiang
     * @return boolean                  [description]
     */
    public function isUse()
    {
        $id = post('id', 'intval', 0);

        $result = dao('Coupon')->userUse($id, $this->uid);

        $this->appReturn($result);
    }
}
