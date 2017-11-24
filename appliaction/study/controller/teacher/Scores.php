<?php
/**
 * 老师发布成绩管理
 */
namespace app\study\controller\teacher;

class Scores extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    public function index()
    {
        $goodsid = get('goodsid', 'intval', 0);

        $map['teacher_uid'] = $this->uid;
        $map['del_status']  = 0;

        if ($goodsid) {
            $map['goods_id'] = $goodsid;
        }

        $list = table('UserScores')->where($map)->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['user'] = dao('User')->getInfo($value['uid'], 'nickname,real_name');
        }

        $courseList = dao('Teacher', 'study')->getTeacherCourseList($this->uid);

        //获取购买课程的学生
        foreach ($courseList['list'] as $key => $value) {
            $courseList['list'][$key]['userList'] = dao('Orders', 'study')->getPayGoodsUser($value['id']);
        }

        $this->assign('list', $list);
        $this->assign('courseList', $courseList['list']);
        //$this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 增加学生成绩 */
    public function addPost()
    {
        $data['uid']      = post('uid', 'intval', 0);
        $data['goods_id'] = post('goods_id', 'intval', 0);
        $data['title']    = post('title', 'text', '');
        $data['time']     = post('time', 'time');
        $data['score']    = post('score', 'intval', 0);
        $data['total']    = post('total', 'intval', 0);

        if (!$data['uid'] || !$data['goods_id']) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (!$data['title']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入成绩项目标题'));
        }

        if (!$data['time']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入审批时间'));
        }

        if (!$data['score']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入成绩得分'));
        }

        if (!$data['total']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入成绩总分'));
        }

        $data['created']     = TIME;
        $data['teacher_uid'] = $this->uid;

        $result = table('UserScores')->add($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '发布成绩失败,请重新尝试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '发布成功'));
    }

}
