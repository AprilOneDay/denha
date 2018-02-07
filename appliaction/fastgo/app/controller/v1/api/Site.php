<?php
/**
 * 账户相关模块
 */
namespace app\fastgo\app\controller\v1\api;

use app\app\controller;
use app\fastgo\app\controller\v1\ApiInit;

class Site extends ApiInit
{
    public function update()
    {
        $name     = post('name', 'text', '');
        $alias    = post('alias', 'text', '');
        $siteno   = post('siteno', 'text', '');
        $parentNo = post('parent_no', 'text', '');
        $country  = post('country', 'text', '');
        $type     = post('type', 'text', '');
        $tel      = post('tel', 'text', '');
        $address  = post('address', 'text', '');
        $leader   = post('leader', 'text', '');

        if (!$name || !$siteno || !$parentNo) {
            $this->apiReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $id       = table('Category')->where('bname_2', $siteno)->field('id')->find('one');
        $parentid = table('Category')->where('bname_2', $parentNo)->field('id')->find('one');
        $topId    = table('Category')->where('parentid', $parentid)->field('id')->find('one');

        $data['name']     = $data['name_en']     = $data['name_jp']     = $name;
        $data['bname']    = $alias;
        $data['bname_2']  = $siteno;
        $data['alias']    = $country;
        $data['alias_2']  = $type;
        $data['parentid'] = $parentid;

        table('Category')->startTrans();
        if ($id) {
            $result = table('Category')->where('id', $id)->save($data);
        } else {
            $result = table('Category')->add($data);
        }

        if (!$result) {
            table('Category')->rollback();
            $this->apiReturn(array('status' => false, 'msg' => '同步失败'));
        }

        if ($topId == 743) {
            //更新仓库信息
            $fastgoAddress       = dao('Orders', 'fastgo')->fastgoAddress();
            $data                = array();
            $data['mobile']      = $tel != '' ? $tel : $fastgoAddress['mobile'];
            $data['address']     = $address != '' ? $address : $fastgoAddress['address'];
            $data['name']        = $leader != '' ? $leader : $fastgoAddress['name'];
            $data['category_id'] = $siteno;

            $depotId = table('WarehouseInfo')->where('category_id', $siteno)->field('id')->find('one');
            if ($depotId) {
                table('WarehouseInfo')->where('id', $depotId)->save($data);
            } else {
                table('WarehouseInfo')->add($data);
            }

            if (!$result) {
                table('Category')->rollback();
                $this->apiReturn(array('status' => false, 'msg' => '仓库信息更新失败'));
            }

            //更新广告图分类
            $map          = array();
            $map['title'] = $name;

            $bannerId = table('Banner')->where($map)->field('id')->find('one');
            if (!$bannerId) {
                $result = table('Banner')->add(array('title' => $name));
                if (!$result) {
                    table('Category')->rollback();
                    return array('status' => false, 'msg' => '广告图更新失败');
                }
            }
        }

        table('Category')->commit();
        $this->apiReturn(array('msg' => '同步成功'));

    }

}
