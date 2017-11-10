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
            $value['is_comment'] = ($value['end_time'] < TIME) ? ture : false;
            $value['teacher']    = dao('User')->getInfo($value['teacher_uid'], 'nickname,real_name');
            $value['day']        = date('d', $value['start_time']);

            $list[date('d', $value['start_time'])][] = $value;
        }

        $other = array(
            'signCopy'   => array('1' => '一对一', '2' => '一对多', '3' => '视频课程'),
            'background' => array('gray' => '1', 'yellow' => '2', 'blue' => '3'),
        );

        $this->assign('week', dao('Time')->calendar($year, $month));
        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
