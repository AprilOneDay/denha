<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\user;

class Scores extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function index()
    {
        $goodsid = get('goodsid', 'intval', 0);

        $map['uid']        = $this->uid;
        $map['del_status'] = 0;

        if ($goodsid) {
            $map['goods_id'] = $goodsid;
        }

        $list = table('UserScores')->where($map)->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['user'] = dao('User')->getInfo($value['uid'], 'nickname,real_name');
        }

        //学生购买的课程
        $courseArray   = dao('Orders', 'study')->getPayGoodsId($this->uid);
        $map           = array();
        $map['id']     = array('in', $courseArray);
        $courseTmpList = dao('Article')->getList($map, 'title,btitle,id', 3);
        foreach ($courseTmpList['list'] as $key => $value) {
            $courseList[$value['id']] = $value;
        }

        //用户信息
        $user = dao('User')->getInfo($this->uid, 'real_name,uid');

        $this->assign('list', $list);
        $this->assign('courseList', $courseList);
        $this->assign('user', $user);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
