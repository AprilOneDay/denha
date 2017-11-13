<?php
/**
 * 车友圈模块
 */
namespace app\app\controller\h5\index;

use app\app\controller;
use denha;

class Car extends \app\app\controller\Init
{
    private static $tpl;

    public function __construct()
    {
        self::$tpl = '/h5/' . MODULE . '/' . CONTROLLER . '/' . ACTION;
    }

    public function detail()
    {
        $id = get('id', 'intval', 0);
        if (!$id) {
            denha\Log::error('参数错误');
        }

        $map['id']      = $id;
        $map['status']  = 1;
        $map['is_show'] = 1;

        $data = table('GoodsCar')->where($map)->find();
        if (!$data) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        if ($data['is_lease'] || stripos($data['guarantee'], 3) !== false) {
            $data['is_lease'] = 1;
            $data['title']    = "【转lease】" . $data['title'];
        }

        $data['brand_copy']    = dao('Category')->getName($data['brand']);
        $data['price']         = dao('Number')->price($data['price']);
        $data['mileage']       = $data['mileage'] . '公里';
        $data['thumb']         = $this->appImg($data['thumb'], 'car');
        $data['guarantee']     = $data['guarantee'] ? explode(',', $data['guarantee']) : array();
        $data['is_collection'] = (bool) table('Collection')->where(array('uid' => $this->uid, 'value' => $data['id'], 'type' => 1, 'del_status' => 0))->field('id')->find('one');

        $data['banner'] = $this->appImgArray($data['banner'], 'car');

        //获取车龄
        $age['year']                      = (int) date('Y', TIME) - (int) date('Y', $data['buy_time']);
        $age['month']                     = (int) date('m', TIME) - (int) date('m', $data['buy_time']);
        $data['car_age']                  = '';
        !$age['year'] ?: $data['car_age'] = $age['year'] . '年';
        !$age['month'] ?: $data['car_age'] .= $age['month'] . '月';

        $data['user'] = array();
        $data['shop'] = array();

        $data['city_copy'] = (string) dao('Category')->getName($data['city']);

        //获取图片介绍
        $data['content'] = '';
        $ablum           = table('GoodsAblum')->where(array('goods_id' => $data['id']))->find('array');
        foreach ($ablum as $key => $value) {
            $data['content'] .= '<p><img src="' . $this->appImg($value['path'], 'car') . '" style="width:96%;margin-left:2%;display:block;" /></p>';
            if ($value['description']) {
                $data['content'] .= '<p style="line-height:1rem; padding-left:0.2rem">' . $value['description'] . '</p>';
            }

        }

        if ($data['type'] == 1) {
            $user = dao('User')->getInfo($data['uid'], 'nickname,avatar,mobile');

            $data['user']['avatar']   = $this->appImg($user['avatar'], 'avatar');
            $data['user']['nickname'] = $user['nickname'];
            $data['user']['address']  = (string) $data['address'];
            $data['user']['mobile']   = $data['mobile'];
        }

        if ($data['type'] == 2) {
            $shop                         = table('UserShop')->where(array('uid' => $data['uid']))->field('avatar,name,address')->find();
            $data['shop']                 = $shop;
            $data['shop']['avatar']       = $this->appImg($shop['avatar'], 'avatar');
            $data['shop']['mobile']       = (string) dao('User')->getInfo($data['uid'], 'mobile');
            $data['shop']['credit_level'] = dao('User')->getShopCredit($data['uid']);
            $data['coment']               = dao('Comment')->getList(2, $id); //获取评价内容
            foreach ($data['coment'] as $key => $value) {
                $data['coment'][$key]['ablum'] = $this->appImgArray($value['ablum'], 'comment');
            }
        }

        $agent = $_SERVER['HTTP_USER_AGENT'];

        //增加浏览记录
        dao('Footprints')->add($this->uid, 1, $data['id'], $data['uid']);
        //增加数据库访问记录
        dao('Footprints')->addHot($data['uid'], 1, $data['id']);

        $this->assign('data', $data);
        $this->assign('agent', $agent);
        //print_r($data);
        $this->show(self::$tpl);
    }

    public function rule()
    {
        $this->show(self::$tpl);
    }
}
