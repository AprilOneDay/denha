<?php
/**
 * 会员等级模块
 */
namespace app\admin\user;

use app\admin\Init;
use denha\Pages;

class LevelRule extends Init
{
    public function index()
    {
        $map               = [];
        $map['del_status'] = 0;

        $list = table('UserLevelRule')->where($map)->select();
        $this->show('', ['list' => $list]);
    }

    /** 保存操作 */
    public function indexPost($name, $value)
    {

        foreach ($name as $key => $value) {
            $data          = [];
            $data['name']  = $value;
            $data['value'] = $postValue[$key];
            $result        = table('UserLevelRule')->where('id', $key)->save($data);
            if (!$result) {
                $this->ajaxReturn(['status' => false, 'msg' => '保存失败']);
            }
        }

        $this->ajaxReturn(['status' => true, 'msg' => '保存成功']);
    }

    public function edit()
    {
        $this->show();
    }

    /** 添加操作 */
    public function editPost()
    {
        $data = post('info');

        if (!$data) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数请填写完成']);
        }

        $result = table('UserLevelRule')->add($data);
        if (!$result) {
            $this->ajaxReturn(['status' => false, 'msg' => '添加失败']);
        }

        $this->ajaxReturn(['msg' => '添加成功']);
    }

    /** 删除 */
    public function del(int $id)
    {

        $result = table('UserLevelRule')->where('id', $id)->save('del_status', 1);
        if (!$result) {
            $this->ajaxReturn(['status' => false, 'msg' => '删除失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);
    }

    /** 赠送礼品 */
    public function sendGift(int $id, $param = [], $pageNo = 1, $pageSize = 25)
    {

        $param['field'] ?: $param['field'] = 'title';

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['del_status'] = 0;

        if ($param['status']) {
            $map['status'] = $param['status'];
        }

        if ($param['type'] != '') {
            $map['type'] = $param['type'];
        }

        if ($param['status'] != '') {
            $map['status'] = $param['status'];
        }

        if ($param['category']) {
            $map['category'] = $param['category'];
        }

        if ($param['field'] && $param['keyword']) {
            if ($param['field'] == 'title') {
                $map['title'] = array('instr', $param['keyword']);
            }
        }

        $list  = table('Coupon')->where($map)->limit($offer, $pageSize)->order('id desc')->select();
        $total = table('Coupon')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
            $seller = dao('User')->getInfo($value['uid'], 'nickname,mobile');
            $seller = $seller ? $seller : ['nickname' => '系统配送', 'mobile' => 15923882847];

            $list[$key]['seller'] = $seller;
        }

        $checkValue = table('UserLevelRule')->where('id', $id)->value('coupon_gift');

        $other = [
            'categoryCopy' => dao('Category')->getList(19),
            'typeCopy'     => [1 => '满减', 2 => '折扣'],
            'statusCopy'   => [0 => '关闭', 1 => '开启'],
        ];

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('checkValue', $checkValue);
        $this->assign('other', $other);

        $this->show();
    }

    /** 增加抵扣卷礼物赠送 */
    public function sendGiftPost(int $id, int $coupon_id, int $type)
    {

        $map       = [];
        $map['id'] = $id;

        $couponGift = table('UserLevelRule')->where($map)->value('coupon_gift');

        if ($couponGift === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '信息不存在']);
        }

        $couponGift = (array) explode(',', $couponGift);
        $couponGift = array_filter($couponGift);

        //添加
        if ($type == 1) {
            $couponGift[] = $couponId;
        }
        //删除
        else {
            $couponGift = array_flip($couponGift);
            unset($couponGift[$couponId]);
            $couponGift = array_flip($couponGift);
        }

        $couponGift = array_unique($couponGift);

        $data                = [];
        $data['coupon_gift'] = implode(',', $couponGift);

        $result = table('UserLevelRule')->where('id', $id)->save($data);
        if (!$result) {
            $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }
}
