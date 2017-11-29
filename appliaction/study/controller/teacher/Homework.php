<?php
/**
 * 课程作业管理
 */
namespace app\study\controller\teacher;

class Homework extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    /** 课程列表 */
    public function lessons()
    {
        $type = get('type', 'intval', 0);

        if ($type) {
            $map['type'] = $type;
        }
        $map['teacher_uid'] = $this->uid;

        $list = table('UserWork')->where($map)->find('array');

        foreach ($list as $key => $value) {
            $list[$key]['teacher'] = dao('User')->getInfo($value['teacher_uid'], 'real_name,nickname');
            $list[$key]['goods']   = table('article')->where('id', $value['goods_id'])->field('title,btitle')->find();
            $list[$key]['annex']   = $this->annex($value['annex']);
        }

        $courseList = dao('Teacher', 'study')->getTeacherCourseList($this->uid);

        $this->assign('list', $list);
        $this->assign('courseList', $courseList['list']);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /**
     * 获取试卷安排列表
     * @date   2017-11-27T16:57:15+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function exam()
    {
        $type = get('type', 'intval', 0);

        $map['type']        = 3;
        $map['teacher_uid'] = $this->uid;

        $list = table('UserWork')->where($map)->find('array');

        foreach ($list as $key => $value) {
            $list[$key]['teacher'] = dao('User')->getInfo($value['teacher_uid'], 'real_name,nickname');
            $list[$key]['goods']   = table('article')->where('id', $value['goods_id'])->field('title,btitle')->find();
            $list[$key]['exam']    = table('ExamList')->where('id', $value['exam_id'])->field('name,exam_time')->find();
            $list[$key]['annex']   = $this->annex($value['annex']);
        }

        $map               = array();
        $map['del_status'] = 0;
        $map['status']     = 1;

        $courseList = dao('Teacher', 'study')->getTeacherCourseList($this->uid);
        $examList   = table('ExamList')->where($map)->field('name,id')->order('created desc')->find('array');

        $this->assign('list', $list);
        $this->assign('examList', $examList);
        $this->assign('courseList', $courseList['list']);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 获取课程对于的时间安排 */
    public function getCourseTime()
    {
        $map['id']         = post('id', 'intval', 0);
        $map['start_time'] = array('>=', TIME);

        $list = table('ArticleCourseSchedule')->where($map)->field('start_time')->find('one', true);

        $this->appReturn(array('data' => $list));
    }

    /** 增加课程安排 */
    public function lessonsPost()
    {
        $type = max(get('type', 'intval', 0), 1);

        $data['start_time'] = post('start_time', 'time');
        $data['content']    = post('content', 'text', '');
        $data['goods_id']   = post('goods_id', 'intval', 0);
        $data['annex']      = post('annex', 'text', '');
        $data['exam_id']    = post('exam_id', 'intval', 0);

        $data['teacher_uid'] = $this->uid;
        $data['type']        = $type;
        $data['created']     = TIME;
        if (!$data['goods_id']) {
            $this->appReturn(array('status' => false, 'msg' => '请选择课程'));
        }

        if (!$data['content']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入描述内容'));
        }

        $reslut = table('UserWork')->add($data);
        if (!$reslut) {
            $this->appReturn(array('status' => false, 'msg' => '发布失败, 请刷新重试'));
        }

        $this->appReturn(array('msg' => '发布成功了'));
    }

    /** 下载学生作业 */
    public function downUserClasswork()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $courseId = get('course_id', 'intval', 0);

        $offer = max(($pageNo - 1), 0) * $pageSize;
        if ($courseId) {
            $map['goods_id'] = $courseId;
        }

        $list = table('UserUpWork')->where($map)->order('id desc')->limit($offer, $pageSize)->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['goods'] = table('article')->where('id', $value['goods_id'])->field('title,btitle')->find();
            $list[$key]['user']  = dao('User')->getInfo($value['uid'], 'nickname,real_name');
        }

        $total = table('UserUpWork')->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url('', array('course_id' => $courseId)));

        $courseList = dao('Teacher', 'study')->getTeacherCourseList($this->uid);

        $this->assign('list', $list);
        $this->assign('courseList', $courseList['list']);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 下载附件 */
    public function downAnnex()
    {
        $id = post('id', 'intval', 0);
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['id']          = $id;
        $map['teacher_uid'] = $this->uid;

        $data = table('UserUpWork')->where($map)->find();
        if (!$data) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        $data['annex'] = $this->annex($data['annex']);

        foreach ($data['annex'] as $key => $value) {
            $files[] = $value['url'];
        }

        $zipName = dao('User')->getInfo($data['uid'], 'real_name') . '_' . date('Y_m_d', $data['created']) . '_' . $data['id'];

        $reslut = dao('File')->zip($files, 'tmp', $zipName);

        if ($reslut['status'] && !$data['is_reader']) {
            table('UserUpWork')->where($map)->save('is_reader', 1);
        }

        $this->appReturn($reslut);

    }
}
