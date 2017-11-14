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

            $value['annex']       = $value['annex'] ? explode(',', $value['annex']) : array();
            $value['annex_total'] = count($value['annex']);
            $list[$key]['annex']  = array();
            foreach ($value['annex'] as $k => $v) {
                $pathinfo                        = explode(':::', $v);
                $list[$key]['annex'][$k]['url']  = $pathinfo[0];
                $list[$key]['annex'][$k]['name'] = $pathinfo[1];
            }
        }

        $map                = array();
        $map['teacher_uid'] = $this->uid;
        $courseList         = dao('Article')->getList($map, 'title,btitle,id', 3);

        $this->assign('list', $list);
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

    /** 作业列表 */
    public function classwork()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 我上传的作业 */
    public function myUpClasswork()
    {

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
