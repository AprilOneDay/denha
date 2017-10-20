<?php
/**
 * 汽车服务信息模块
 */
namespace app\app\controller\v1\index;

use app\app\controller;

class Service extends \app\app\controller\Init
{
    public function lists()
    {
        $param['is_recommend'] = get('is_recommend', 'text', '');
        $param['category']     = get('category', 'intval', 0);
        $param['keyword']      = get('keyword', 'text', '');
        $param['orderby']      = get('orderby', 'intval', 0);
        $param['distanceby']   = get('distanceby', 'intval', 0);
        $lng                   = get('lng', 'text', 0);
        $lat                   = get('lat', 'text', 0);

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $map['status']    = 1;
        $map['is_ide']    = 1;
        $map['goods_num'] = array('>', 0);

        $orderby = 'id desc';
        switch ($param['orderby']) {
            case '1':
                $orderby = 'credit_level desc';
                break;
            case '2':
                $orderby = 'orders desc';
                break;
            case '3':
                # code...
                break;
            default:
                # code...
                break;
        }

        if ($param['distanceby'] == 1) {
            $orderby = 'km asc';
        }

        if ($param['is_recommend'] != '') {
            $map['is_recommend'] = $param['is_recommend'];
        }

        if ($param['category']) {
            $map['category'] = array('instr', $param['category']);
        }

        if ($param['keyword']) {
            $mapGoods['title'] = array('instr', $param['keyword']);
            $idArray           = table('GoodsService')->where($mapGoods)->field('uid')->group('uid')->find('one', true);
            $map['uid']        = array('in', $idArray);
        }

        $field = "name,uid,lng,lat,(2 * 6378.137* ASIN(SQRT(POW(SIN(PI()*($lng-lng)/360),2)+COS(PI()*$lat/180)* COS(lat * PI()/180)*POW(SIN(PI()*($lat)/360),2)))) AS km";
        $list  = table('UserShop')->where($map)->order($orderby)->limit($offer, $pageSize)->field($field)->find('array');
        //echo table('UserShop')->getSql();die;
        foreach ($list as $key => $value) {
            $goods = table('GoodsService')->where(array('uid' => $value['uid'], 'status' => 1))->field('id,price,thumb,title,orders')->order('id desc')->limit(3)->find('array');
            foreach ($goods as $k => $v) {
                $goods[$k]['thumb'] = $this->appImg($v['thumb'], 'car');
            }
            $km                 = dao('Distance')->nearbyDistance($lng, $lat, $value['lng'], $value['lat']);
            $list[$key]['km']   = !$km ? '<1Km' : round($km) . 'Km';
            $list[$key]['list'] = $goods ? $goods : array();
        }

        $data['param'] = $param;
        $data['list']  = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

    public function detail()
    {
        $id = get('id', 'intval', 0);
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $data = table('GoodsService')->where('id', $id)->find();
        if (!$data) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        if ($data['status'] != 1) {
            $this->appReturn(array('status' => false, 'msg' => '服务已下架'));
        }

        $data['thumb']                = $this->appImg($data['thumb'], 'car');
        $data['ablum']                = $this->appImgArray($data['ablum'], 'car');
        $data['shop']                 = table('UserShop')->where('uid', $data['uid'])->field('name,uid,credit_level')->find();
        $data['shop']['credit_level'] = dao('User')->getShopCredit($data['shop']['credit_level']);
        $this->appReturn(array('data' => $data));
    }

    /**
     * 排序文案
     * @date   2017-09-20T15:46:38+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getSeachOrderByTags()
    {
        $list[] = array('id' => 1, 'value' => '信用');
        $list[] = array('id' => 2, 'value' => '综合');
        $list[] = array('id' => 3, 'value' => '销量');

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $list));
    }

    /**
     * 爱车服务首页栏目
     * @date   2017-10-20T14:25:24+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function column()
    {
        $list = table('Category')->where(array('parentid' => 19, 'is_show' => 1))->field('id,name,thumb')->find('array');

        foreach ($list as $key => $value) {
            $list[$key]['thumb']  = $this->appimg($value['thumb'], 'category');
            $list[$key]['value']  = $value['name'];
            $list[$key]['is_use'] = 1;
            $list[$key]['copy']   = '';

            unset($list[$key]['name']);
            if ($value['id'] == 23) {
                unset($list[$key]);
            }
        }

        $list = array_values($list);

        $data = $list ? $list : array();

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }
}
