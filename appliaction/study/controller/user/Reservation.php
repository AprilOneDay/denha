<?php
/**
 * 学生预约管理
 */
namespace app\study\controller\user;

class Reservation extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /** 我的预约列表 */
    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['uid']  = $this->uid;
        $map['sign'] = 1;

        $list = table('UserCourseLog')->where($map)->limit($offer, $pageSize)->order('id desc')->find('array');

        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['goods']   = table('Article')->where('id', $value['goods_id'])->field('title,btitle')->find();
                $list[$key]['teacher'] = dao('User')->getInfo($value['teacher_uid'], 'real_name,mobile');
            }
        }

        $total = table('UserCourseLog')->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url(''));

        $this->assign('list', $list);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 发起预约 */
    public function initiated()
    {
        //学生购买的一对一课程
        $ot = table('Orders')->tableName();
        $ct = table('OrdersCourse')->tableName();

        $map[$ot . '.uid']    = $this->uid;
        $map[$ot . '.type']   = 3;
        $map[$ot . '.is_pay'] = 1;
        $map[$ct . '.sign']   = 1;

        $field = "$ot.order_sn,$ct.title";

        $courseList = table('Orders')->join($ct, "$ct.order_sn = $ot.order_sn")->where($map)->field($field)->find('array');

        $this->assign('courseList', $courseList);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function add()
    {
        $data['order_sn']   = post('order_sn', 'text', '');
        $data['user_msg']   = post('user_msg', 'text', '');
        $data['mobile']     = post('mobile', 'text', '');
        $data['start_time'] = post('start_time', 'time', '');
        $data['end_time']   = post('end_time', 'time', '');
        $data['uid']        = $this->uid;
        $data['status']     = 0;

        if (!$data['order_sn']) {
            $this->appReturn(array('status' => false, 'msg' => '请选择课程'));
        }

        //学生购买的一对一课程
        $ot = table('Orders')->tableName();
        $ct = table('OrdersCourse')->tableName();

        $map[$ot . '.order_sn'] = $data['order_sn'];
        $map[$ot . '.uid']      = $this->uid;
        $map[$ot . '.type']     = 3;
        $map[$ot . '.is_pay']   = 1;
        $map[$ct . '.sign']     = 1;

        $field = "$ct.goods_id,$ct.teacher_uid";

        $orders = table('Orders')->join($ct, "$ct.order_sn = $ot.order_sn")->where($map)->field($field)->find();
        if (!$orders) {
            $this->appReturn(array('status' => false, 'msg' => '该课程尚未购买'));
        }

        $data['teacher_uid'] = $orders['teacher_uid'];
        $data['goods_id']    = $orders['goods_id'];

        $map               = array();
        $map['start_time'] = $data['start_time'];
        $map['end_time']   = $data['end_time'];
        $map['sign']       = 1;
        $map['goods_id']   = $data['goods_id'];
        $map['status']     = array('in', '1,0');

        $userCourseLog = table('UserCourseLog')->where($map)->field('id')->find();
        if ($userCourseLog) {
            $this->appReturn(array('status' => false, 'msg' => '当前时间段已存在预约'));
        }

        $result = table('UserCourseLog')->add($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '预约失败,请稍后重试'));
        }

        $this->appReturn(array('msg' => '预约成功,请耐心等待老师同意'));
    }
}
