<?php
/**
 * 日历管理
 */
namespace app\study\controller\user;

class Calendar extends \app\study\controller\Init
{

    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /** 获取学生课程表 */
    public function index()
    {

        $year  = get('year', 'intval', 0) ? get('year', 'intval', 0) : date('Y');
        $month = get('month', 'intval', 0) ? get('month', 'intval', 0) : date('m');

        $beginThismonth = mktime(0, 0, 0, $month, 1, $year);
        $endThismonth   = mktime(23, 59, 59, $month, date('t', strtotime("{$year}-{$month}-1")), $year);

        $map['start_time'] = array('between', $beginThismonth, $endThismonth);
        $map['uid']        = $this->uid;

        $listTmp = table('UserCourseLog')->where($map)->find('array');
        foreach ($listTmp as $key => $value) {

            $value['goods']      = table('OrdersCourse')->where('order_sn', $value['order_sn'])->field('title,btitle,class_time,class_time_en,sign')->find();
            $value['is_comment'] = $this->isComment($value['uid'], $value['start_time'], $value['order_sn'], $value['id']);
            $value['teacher']    = dao('User')->getInfo($value['teacher_uid'], 'nickname,real_name');
            $value['day']        = date('d', $value['start_time']);

            $list[date('d', $value['start_time'])][] = $value;
        }

        //print_r($list);

        $other = array(
            'signCopy'   => array('1' => '一对一', '2' => '一对多', '3' => '视频课程'),
            'background' => array('gray' => '1', 'yellow' => '2', 'blue' => '3'),
        );

        $this->assign('week', dao('Time')->calendar($year, $month));
        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /**
     * 评价课程
     * @date   2017-11-21T10:54:43+0800
     * @author ChenMingjiang
     */
    public function addComment()
    {
        $data['course_id']      = post('course_id', 'intval', 0);
        $data['order_sn']       = post('order_sn', 'text', '');
        $data['content']        = post('content', 'text', '');
        $data['shipping_score'] = post('shipping_score', 'intval', 50);
        $data['teacher_score']  = post('teacher_score', 'intval', 50);

        if (!$data['order_sn'] || !$data['course_id']) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (!$data['content']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入内容'));
        }

        $map['uid']       = $this->uid;
        $map['order_sn']  = $data['order_sn'];
        $map['course_id'] = $data['course_id'];
        $course           = table('CourseComment')->where($map)->field('id')->find();
        if ($course) {
            $this->appReturn(array('status' => false, 'msg' => '请勿重复评价'));
        }

        $map             = array();
        $map['order_sn'] = $data['order_sn'];
        $map['uid']      = $this->uid;
        $map['is_pay']   = 1;

        $orders = table('Orders')->where($map)->field('id')->find();

        if (!$orders) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        $ordersData = table('OrdersCourse')->where('order_sn', $data['order_sn'])->field('goods_id,teacher_uid')->find();

        $data['goods_id']    = $ordersData['goods_id'];
        $data['teacher_uid'] = $ordersData['teacher_uid'];
        $data['uid']         = $this->uid;
        $data['created']     = TIME;

        $result = table('CourseComment')->add($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '评论失败,请稍后尝试'));
        }

        if ($data['teacher_score'] <= 20) {
            $this->appReturn(array('status' => false, 'msg' => '感谢你的建议，我们将会与老师沟通'));
        }

        $this->appReturn(array('status' => true, 'msg' => '评价成功'));
    }

    /**
     * 判断课程是否评价
     * @date   2017-11-21T12:12:12+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid       [description]
     * @param  [type]                   $startTime [description]
     * @param  [type]                   $orderSn   [description]
     * @param  [type]                   $courseId  [description]
     * @return boolean                             [description]
     */
    private function isComment($uid, $startTime, $orderSn, $courseId)
    {
        $data = ($value['end_time'] < TIME) ? ture : false;
        if (!$data) {
            return false;
        }

        $map['uid']       = $uid;
        $map['order_sn']  = $orderSn;
        $map['course_id'] = $courseId;
        $course           = table('CourseComment')->where($map)->field('id')->find();
        if ($course) {
            return false;
        }

        return true;
    }

}
