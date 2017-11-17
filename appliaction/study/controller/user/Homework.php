<?php
/**
 * 课程作业管理
 */
namespace app\study\controller\user;

class Homework extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /** 课程列表 */
    public function lessons()
    {
        $type = get('type', 'intval', 1);

        if ($type) {
            $map['type'] = $type;
        }

        //获取购买的课程id
        $goodsIdArray    = dao('Orders', 'study')->getPayGoodsId($this->uid);
        $map['goods_id'] = array('in', $goodsIdArray);

        $list = table('UserWork')->where($map)->find('array');

        foreach ($list as $key => $value) {
            $list[$key]['teacher'] = dao('User')->getInfo($value['teacher_uid'], 'real_name,nickname');
            $list[$key]['goods']   = table('article')->where('id', $value['goods_id'])->field('title,btitle')->find();
            $list[$key]['annex']   = $this->annex($value['annex']);

        }

        $map                = array();
        $map['teacher_uid'] = $this->uid;
        $courseList         = dao('Article')->getList($map, 'title,btitle,id', 3);

        $this->assign('list', $list);
        $this->assign('courseList', $courseList['list']);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 我上传的作业 */
    public function myUpClasswork()
    {
        $map['uid']        = $this->uid;
        $map['del_status'] = 0;

        $list = table('UserUpWork')->where($map)->order('id desc')->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['goods'] = table('article')->where('id', $value['goods_id'])->field('title,btitle')->find();
        }

        $this->assign('list', $list);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 删除我上传的作业 */
    public function delUpClasswork()
    {
        $id = post('id', 'intval', 0);
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid'] = $this->uid;
        $map['id']  = $id;

        $result = table('UserUpWork')->where($map)->save('del_status', 1);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '删除失败，请重新尝试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '删除成功'));
    }

    /** 上传我的作业 */
    public function UpClassworkPost()
    {
        $id    = post('work_id', 'intval', 0);
        $annex = post('annex', 'text', '');

        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (!$annex) {
            $this->appReturn(array('status' => false, 'msg' => '请上传作业内容'));
        }

        $userWork = table('UserWork')->where('id', $id)->find();

        $data['work_id']     = $id;
        $data['goods_id']    = $userWork['goods_id'];
        $data['teacher_uid'] = $userWork['teacher_uid'];
        $data['annex']       = $annex;
        $data['uid']         = $this->uid;
        $data['created']     = TIME;

        $result = table('UserUpWork')->add($data);

        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '上传作业失败,请重新尝试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '上传成功'));
    }
}
