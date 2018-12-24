<?php
/**
 * 前台用户管理
 */
namespace app\admin\content;

use app\admin\Init;

class Shop extends Init
{
    public function lists()
    {
        $param    = get('param', 'text');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $data = dao('Shop', 'admin')->lists($param, $pageNo, $pageSize);

        $other = array(
            'categoryCopy' => getVar('tags', 'console.article'),
            'isIdeCopy'    => array(0 => '未认证', 1 => '已认证', 2 => '认证未通过', 3 => '认证申请中'),
        );

        $this->assign('list', $data['list']);
        $this->assign('param', $param);
        $this->assign('pages', $data['page']->loadConsole());
        $this->assign('other', $other);

        $this->show();
    }

    public function editPost()
    {
        $id = get('id', 'intval', 0);
        if (!$id) {

            $data['username'] = post('name', 'text', 0);
            $data['password'] = post('password', 'text', '');
            $data['mobile']   = post('mobile', 'intval', 0);
            $data['type']     = 2;
            $data['avatar']   = post('avatar', 'text', '');

            $password2 = post('password2', 'text', '');

            $result = dao('User')->register($data, $password2);
            if (!$result['status']) {
                $this->ajaxReturn($result);
            }

            if (!$result) {
                $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
            }

            $this->ajaxReturn(array('msg' => '操作成功'));

        } else {

            $data['is_ide']       = post('is_ide', 'intval', 0);
            $data['status']       = post('status', 'intval', 0);
            $data['is_recommend'] = post('is_recommend', 'intval', 0);
            $data['avatar']       = post('avatar', 'text', 0);

            $shop = table('UserShop')->where('id', $id)->field('uid,status')->find();

            if ($shop['status'] != $data['status']) {
                //开启店铺商品
                if ($data['status'] == 1) {
                    table('GoodsCar')->where(array('uid' => $shop['uid']))->save('is_show', 1);
                    table('GoodsService')->where(array('uid' => $shop['uid']))->save('is_show', 1);
                }
                //屏蔽店铺商品
                else {
                    table('GoodsCar')->where(array('uid' => $shop['uid']))->save('is_show', 0);
                    table('GoodsService')->where(array('uid' => $shop['uid']))->save('is_show', 0);
                }
            }

            $reslut = table('UserShop')->where(array('id' => $id))->save($data);

            if (!$reslut) {
                $this->ajaxReturn(array('status' => false, 'msg' => '提交失败'));
            }

            $this->ajaxReturn(array('status' => true, 'msg' => '操作成功' . $data['avatar']));

        }

    }

    public function edit()
    {
        $id = get('id', 'intval', 0);

        $data                 = table('UserShop')->where(array('id' => $id))->find();
        $data['ide_ablum']    = (array) imgUrl($data['ide_ablum'], 'ide');
        $data['ablum']        = imgUrl($data['ablum'], 'shop');
        $data['credit_level'] = dao('User')->getShopCredit($data['uid']);

        $other = array(
            'categoryCopy' => getVar('tags', 'console.article'),
            'isIdeCopy'    => array(0 => '未认证', 1 => '已认证', 2 => '认证未通过'),
        );
        $this->assign('data', $data);
        $this->assign('other', $other);

        $this->show();

    }
}
