<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\teacher;

class Reservation extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $goodsid  = get('goodsid', 'intval', 0);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['teacher_uid'] = $this->uid;
        $map['sign']        = 1;

        if ($goodsid) {
            $map['goods_id'] = $goodsid;
        }

        $list = table('UserCourseLog')->where($map)->limit($offer, $pageSize)->order('id desc')->find('array');

        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['goods'] = table('Article')->where('id', $value['goods_id'])->field('title,btitle')->find();
                $list[$key]['user']  = dao('User')->getInfo($value['uid'], 'real_name,mobile');
            }
        }

        $total = table('UserCourseLog')->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url(''));

        //获取老师课程
        $courseList = dao('Teacher', 'study')->getTeacherCourseList($this->uid);

        $this->assign('courseList', $courseList['list']);
        $this->assign('list', $list);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 同意预约 */
    public function agree()
    {
        $id = post('id', 'intval', 0);

        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['teacher_uid'] = $this->uid;
        $map['id']          = $id;
        $userCourseLog      = table('UserCourseLog')->where($map)->find();
        if (!$userCourseLog) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['status'] = 1;

        $result = table('UserCourseLog')->where('id', $id)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败，请稍后重试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

    /** 老师修改时间 */
    public function changeTime()
    {
        $id        = post('id', 'intval', 0);
        $startTime = post('start_time', 'time', 0);
        $endTime   = post('end_time', 'time', 0);

        if (!$id || !$startTime || !$endTime) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['teacher_uid'] = $this->uid;
        $map['id']          = $id;
        $userCourseLog      = table('UserCourseLog')->where($map)->find();
        if (!$userCourseLog) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['start_time'] = $startTime;
        $data['end_time']   = $endTime;
        $data['status']     = 2;

        $result = table('UserCourseLog')->where('id', $id)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败，请稍后重试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

    /** 老师拒绝预约 */
    public function close()
    {
        $id = post('id', 'intval', 0);

        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['teacher_uid'] = $this->uid;
        $map['id']          = $id;
        $map['status']      = array('!=', 1);

        $userCourseLog = table('UserCourseLog')->where($map)->find();
        if (!$userCourseLog) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['status'] = 3;

        $result = table('UserCourseLog')->where('id', $id)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败，请稍后重试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

    /** 老师回复 */
    public function reply()
    {
        $id      = post('id', 'intval', 0);
        $content = post('content', 'text', '');

        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (!$content) {
            $this->appReturn(array('status' => false, 'msg' => '请输入回复内容'));
        }

        $map['teacher_uid'] = $this->uid;
        $map['id']          = $id;
        $map['status']      = array('!=', 1);

        $userCourseLog = table('UserCourseLog')->where($map)->find();
        if (!$userCourseLog) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['content'] = $content;

        $result = table('UserCourseLog')->where('id', $id)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败，请稍后重试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

}
