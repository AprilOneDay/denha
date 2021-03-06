<?php
/**
 * 用户积分规则管理
 */
namespace app\admin\content;

use app\admin\Init;
use denha;

class Service extends Init
{
    public function lists()
    {

        $param = get('param', 'text');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = array();
        if ($param['type']) {
            $map['type'] = $param['type'];
        }

        if ($param['brand']) {
            $map['brand'] = $param['brand'];
        }

        if ($param['is_recommend'] != '') {
            $map['is_recommend'] = $param['is_recommend'];
        }

        if ($param['is_urgency'] != '') {
            $map['is_urgency'] = $param['is_urgency'];
        }

        if ($param['field'] && $param['keyword']) {
            if ($param['field'] == 'id') {
                $map['id'] = $param['keyword'];
            } elseif ($param['field'] == 'title') {
                $map['title'] = array('like', '%' . $param['keyword'] . '%');
            }
        }

        $field = 'id,type,title,uid,is_recommend,is_urgency,created,status';
        $list  = table('GoodsService')->where($map)->limit($offer, $pageSize)->order('id desc')->select();
        $total = table('GoodsService')->where($map)->count();
        $page  = new denha\Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
            $list[$key]['nickname'] = dao('User')->getNickname($value['uid']);
        }

        $other = array(
            'typeCopy'      => dao('Category')->getList(19),
            'recommendCopy' => array('1' => '推荐', '0' => '未推荐'),
            'urgencyCopy'   => array('1' => '是', '0' => '否'),
            'statusCopy'    => array('1' => '上架', '0' => '下架'),
        );

        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->show();
    }

    public function editPost()
    {
        $id = get('id', 'intval');
        if (!$id) {
            abort('参数错误');
        }

        $data['status'] = post('status', 'intval', 0);

        $result = table('GoodsService')->where('id', $id)->save($data);
        if (!$result) {
            $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->ajaxReturn(array('msg' => '操作成功'));
    }

    public function edit()
    {
        $id = get('id', 'intval', 0);
        if (!$id) {
            abort('参数错误');
        }

        $data = table('GoodsService')->where('id', $id)->find();

        $data['ablum'] = imgUrl($data['ablum'], 'car');

        $other = array(
            'typeCopy'      => dao('Category')->getList(19),
            'recommendCopy' => array('1' => '推荐', '0' => '未推荐'),
            'urgencyCopy'   => array('1' => '是', '0' => '否'),
            'statusCopy'    => array('1' => '上架', '0' => '下架'),
        );

        $this->assign('other', $other);
        $this->assign('data', $data);

        $this->show();
    }
}
