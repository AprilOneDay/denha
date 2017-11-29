<?php
/**
 * 教室管理
 */
namespace app\study\controller\teacher;

use app\study\controller\Init;

class Classroom extends Init
{

    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    /** 一对一 */
    public function vip()
    {
        //获取进行中的课程
        $map['teacher_uid'] = $this->uid;
        $map['status']      = 1;
        $map['sign']        = 2;
        $map['start_time']  = array('<=', TIME);
        $map['end_time']    = array('>=', TIME);
        $course             = table('UserCourseLog')->where($map)->order('id desc')->find();

        if (!$course) {
            //获取最近开始的课程
            $map                = array();
            $map['teacher_uid'] = $this->uid;
            $map['status']      = 1;
            $map['sign']        = 2;

            $course = table('UserCourseLog')->where($map)->order('id desc')->find();
        }

        if ($course) {
            $course['hd_status'] = dao('Time')->hdStatus($course['start_time'], $course['end_time']);
        }

        $goods = table('Article')->where('id', $course['goods_id'])->field('title')->find();

        if ($goods) {
            $live = dao('YunwuRoom')->getList($goods['title']);
        }

        $user = dao('User')->getInfo($this->uid, 'avatar,real_name');

        $this->assign('course', $course);
        $this->assign('live', $live[0]);
        $this->assign('user', $user);

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 大厅 */
    public function hall()
    {

        //获取进行中的课程
        $map['teacher_uid'] = $this->uid;
        $map['status']      = 1;
        $map['sign']        = 2;
        $map['start_time']  = array('<=', TIME);
        $map['end_time']    = array('>=', TIME);
        $course             = table('UserCourseLog')->where($map)->order('id desc')->find();

        if (!$course) {
            //获取最近开始的课程
            $map                = array();
            $map['teacher_uid'] = $this->uid;
            $map['status']      = 1;
            $map['sign']        = 2;

            $course = table('UserCourseLog')->where($map)->order('id desc')->find();
        }

        if ($course) {
            $course['hd_status'] = dao('Time')->hdStatus($course['start_time'], $course['end_time']);
        }

        $goods = table('Article')->where('id', $course['goods_id'])->field('title')->find();

        if ($goods) {
            $live = dao('YunwuRoom')->getList($goods['title']);
        }

        $user = dao('User')->getInfo($this->uid, 'avatar,real_name');

        $this->assign('course', $course);
        $this->assign('live', $live[0]);
        $this->assign('user', $user);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 增加进入记录 */
    public function addLog()
    {
        $id = post('id', 'intval');

        $map['id']          = $id;
        $map['teacher_uid'] = $this->uid;

        $courseLog = table('UserCourseLog')->where($map)->field('id,goods_id')->find();

        if (!$is) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $result = dao('Classroom')->centerLog($this->uid, 1, array(), $courseLog['goods_id'], $courseLog['id']);

        $this->appReturn($result);

    }

}
