<?php
/**
 * 前台用户管理
 */
namespace app\admin\user;

use app\admin\Init;

class Shop extends Init
{
    public function lists()
    {
        $param    = get('param', 'text');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $data = dao('Admin.Shop')->lists($param, $pageNo, $pageSize);

        $other = array(
            'categoryCopy' => getVar('console.article.tags'),
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

            $name     = post('name', 'text', '');
            $username = post('username', 'text', '');
            $password = post('password', 'text', '');
            $group    = post('group', 'intval', 0);
            $avatar   = post('avatar', 'img', '');
            $mobile   = post('mobile', 'text', '');

            $password2 = post('password2', 'text', '');

            $result = dao('Admin.User')->add($username, $password, $group);
            if (!$result['status']) {
                $this->ajaxReturn($result);
            }

            $data           = [];
            $data['uid']    = $result['id'];
            $data['name']   = $name;
            $data['avatar'] = $avatar;
            $data['mobile'] = $mobile;

            $result = table('userShop')->add($data);

            if (!$result) {
                $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
            }

            $this->ajaxReturn(['msg' => '操作成功']);

        } else {

            $data['is_ide']       = post('is_ide', 'intval', 0);
            $data['status']       = post('status', 'intval', 0);
            $data['is_recommend'] = post('is_recommend', 'intval', 0);
            $data['avatar']       = post('avatar', 'text', '');

            $shop = table('UserShop')->where('id', $id)->field('uid,status')->find();

            $reslut = table('UserShop')->where('id', $id)->save($data);

            if (!$reslut) {
                $this->ajaxReturn(['status' => false, 'msg' => '提交失败']);
            }

            $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

        }

    }

    public function edit()
    {
        $id = get('id', 'intval', 0);

        if ($id) {
            $data                 = table('UserShop')->where('id', $id)->find();
            $data['ide_ablum']    = (array) imgUrl($data['ide_ablum'], 'ide');
            $data['ablum']        = imgUrl($data['ablum'], 'shop');
            // $data['credit_level'] = dao('User')->getShopCredit($data['uid']);
        } else {
            $data = [];
        }

        $groups = table('console_group')->where('parentid', 7)->where('status', 1)->select();

        $other = [
            'categoryCopy' => getVar('console.article.tags'),
            'isIdeCopy'    => array(0 => '未认证', 1 => '已认证', 2 => '认证未通过'),
            'groups'       => $groups,
        ];

        $this->show('', ['data' => $data, 'other' => $other]);

    }
}
