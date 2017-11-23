<?php
/**
 * 教室管理
 */
namespace app\study\controller\user;

class Classroom extends \app\study\controller\Init
{

    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /** 一对一 */
    public function vip()
    {
        //获取最近的课程
        $map['uid']        = $this->uid;
        $map['status']     = 1;
        $map['sign']       = 1;
        $map['start_time'] = array('>=', TIME);

        $course = table('UserCourseLog')->where($map)->find();
        $goods  = table('Article')->where('id', $course['goods_id'])->field('title')->find();

        $live = dao('YunwuRoom')->getList($goods['title']);

        $user = dao('User')->getInfo($this->uid, 'avatar,real_name');

        $this->assign('course', $course);
        $this->assign('live', $live[0]);
        $this->assign('user', $user);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 大厅 */
    public function hall()
    {
        //获取最近的课程
        $map['uid']        = $this->uid;
        $map['status']     = 1;
        $map['sign']       = 2;
        $map['start_time'] = array('>=', TIME);

        $course = table('UserCourseLog')->where($map)->find();
        $goods  = table('Article')->where('id', $course['goods_id'])->field('title')->find();

        $live = dao('YunwuRoom')->getList($goods['title']);

        $user = dao('User')->getInfo($this->uid, 'avatar,real_name');

        $this->assign('course', $course);
        $this->assign('live', $live[0]);
        $this->assign('user', $user);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
