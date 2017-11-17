<?php
/**
 * 下载管理
 */
namespace app\study\controller\teacher;

class Student extends \app\study\controller\Init
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

        $ot = table('Orders')->tableName();
        $ct = table('OrdersCourse')->tableName();

        $map[$ct . '.teacher_uid'] = $this->uid;
        $map[$ot . '.type']        = 3;
        $map[$ot . '.is_pay']      = 1;

        if ($goodsid) {
            $map[$ct . '.goods_id'] = $goodsid;
        }

        $field = "distinct $ot.uid,$ct.goods_id";

        $list  = table('Orders')->join($ct, "$ct.order_sn = $ot.order_sn")->where($map)->field($field)->limit($offer, $pageSize)->find('array');
        $total = table('Orders')->join($ct, "$ct.order_sn = $ot.order_sn")->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url('', array('goodsid' => $goodsid)));

        foreach ($list as $key => $value) {
            $userList[$key]             = dao('User')->getInfo($value['uid'], 'id,real_name,uid,mail');
            $userList[$key]['goods_id'] = $value['goods_id'];
        }

        $map                = array();
        $map['teacher_uid'] = $this->uid;
        $courseList         = dao('Article')->getList($map, 'title,btitle,id', 3);

        $this->assign('list', $userList);
        $this->assign('courseList', $courseList['list']);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function detail()
    {
        $goodsid = get('goodsid', 'intval', 0);
        $uid     = get('uid', 'intval', 0);

        //用户信息
        $user          = dao('User')->getInfo($uid, 'real_name,uid');
        $user['goods'] = table('Article')->where('id', $goodsid)->field('title,btitle')->find();

        //老师可选课程
        $map                = array();
        $map['teacher_uid'] = $this->uid;
        $courseList         = dao('Article')->getList($map, 'title,btitle,id', 3);

        //学生详情情况
        $map             = array();
        $map['uid']      = $uid;
        $map['goods_id'] = $goodsid;

        $list = table('UserWorkRemak')->where($map)->order('id desc')->find('array');

        $this->assign('user', $user);
        $this->assign('list', $list);
        $this->assign('courseList', $courseList['list']);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 增加学生课程备注 */
    public function add()
    {
        $data['uid']      = post('uid', 'intval', 0);
        $data['goods_id'] = post('goods_id', 'intval', 0);
        $data['time']     = post('time', 'time', 0);
        $data['content']  = post('content', 'text', 0);

        if (!$data['uid'] || !$data['goods_id']) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (!$data['time']) {
            $this->appReturn(array('status' => false, 'msg' => '请选择时间'));
        }

        if (!$data['content']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入内容'));
        }

        $reslut = table('UserWorkRemak')->add($data);
        if (!$reslut) {
            $this->appReturn(array('status' => false, 'msg' => '添加失败,请稍后重试'));
        }

        $this->appReturn(array('msg' => '添加成功'));
    }

}
