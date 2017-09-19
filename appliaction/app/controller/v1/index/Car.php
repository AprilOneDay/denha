<?php
/**
 * 汽车信息模块
 */
namespace app\app\controller\v1\index;

use app\app\controller;

class Car extends \app\app\controller\Init
{
    public function lists()
    {
        $param['is_recommend'] = get('is_recommend', 'text', '');
        $param['is_urgency']   = get('is_urgency', 'text', '');
        $param['order_type']   = get('order_type', 'intval', 0);
        $param['brand']        = get('brand', 'intval', 0);
        $param['field']        = get('field', 'text', 'title');
        $param['keyword']      = get('keyword', 'text', '');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        if ($param['is_recommend'] != '') {
            $map['is_recommend'] = $param['is_recommend'];
        }

        if ($param['is_urgency'] != '') {
            $map['is_urgency'] = $param['is_urgency'];
        }

        $param['brand_copy'] = '';
        if ($param['brand']) {
            $map['brand']        = $param['brand'];
            $param['brand_copy'] = dao('Category')->getName($param['brand']);
        }

        if ($param['field'] && $param['keyword']) {
            if ($param['field'] == 'title') {
                $map['title'] = array('like', '%' . $param['keyword'] . '%');
            }
        }

        $order = 'id desc';
        switch ($param['order_type']) {
            //最新发布
            case '2':
                $order = 'created desc';
                break;
            //价格最低
            case '3':
                $order = 'price asc';
                break;
            //价格最高
            case '4':
                $order = 'price desc';
                break;
            //车龄最小
            case '5':
                $order = 'buy_time desc';
                break;
            //里程最短
            case '6':
                $order = 'mileage asc';
                break;
            default:
                # code...
                break;
        }

        $list = table('GoodsCar')->where($map)->order($order)->limit($offer, $pageSize)->find('array');

        foreach ($list as $key => $value) {
            if ($value['is_lease'] || stripos($value['guarantee'], 3) !== false) {
                $list[$key]['title'] = "【转lease】" . $value['title'];
            }

            $list[$key]['price']   = $value['price'] . '万';
            $list[$key]['mileage'] = $value['mileage'] . '万公里';
            $list[$key]['thumb']   = $this->appImgArray($value['thumb'], 'car');

        }

        $data['param'] = $param;
        $data['list']  = (array) $list;

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

    /**
     * 字母区分带图标的品牌
     * @date   2017-09-19T13:51:29+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function brandList()
    {
        $list = table('Category')->where(array('parentid' => 1))->field('id,name,thumb')->find('array');
        $data = array();
        foreach ($list as $key => $value) {
            $chart          = getFirstCharter($value['name']);
            $value['thumb'] = $this->appimg($value['thumb'], 'category');
            if (!isset($data[$chart])) {
                $data[$chart] = $value;
            } else {
                $data[$chart] = $value;
            }
        }

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

    /**
     * 汽车详情
     * @date   2017-09-19T14:49:54+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detail()
    {
        $id = get('id', 'intval', 0);
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['id']     = $id;
        $map['status'] = 1;

        $data = table('GoodsCar')->where($map)->find();
        if (!$data) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        $data['price']   = $data['price'] . '万';
        $data['mileage'] = $data['mileage'] . '万公里';
        $data['thumb']   = $this->appImg($data['thumb'], 'car');
        $data['ablum']   = $this->appImgArray($data['ablum'], 'car');

        $data['user'] = array();
        $data['shop'] = array();

        if ($data['type'] == 1) {
            $user = dao('User')->getInfo($uid, 'nickname,avatar');

            $data['user']['avatar']   = $this->appImg($user['avatar'], 'avatar');
            $data['user']['nickname'] = $user['nickname'];
            $data['user']['address']  = $data['address'];
        }

        if ($data['type'] == 2) {
            $shop                   = table('UserShop')->where(array('uid' => $data['uid']))->field('avatar,name,address')->find();
            $data['shop']           = $shop;
            $data['shop']['avatar'] = $this->appImg($shop['avatar'], 'avatar');
        }
        print_r($data);
    }
}