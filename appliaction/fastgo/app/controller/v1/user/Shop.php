<?php
/**
 * 会员模块
 */
namespace app\fastgo\app\controller\v1\user;

use app\app\controller;
use app\fastgo\app\controller\v1\Init;

class Shop extends Init
{
    public function __construct()
    {
        parent::__construct();
        //检测用户登录权限
        $this->checkIndividual('1,2');
    }

    public function lists()
    {

        $param['keyword'] = get('keyword', 'text', '');
        $param['city_id'] = get('city_id', 'text', '');

        $lng = get('lng', 'text', 0);
        $lat = get('lat', 'text', 0);

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $map['status'] = 1;

        if ($param['city_id']) {
            $map['city_id'] = $param['city_id'];
        }

        if ($param['keyword']) {
            $mapShop['name']   = array('instr', $param['keyword']);
            $mapShop['status'] = 1;
            $shopArray         = table('UserShop')->where($mapShop)->field('uid')->find('one', true);
            $shopArray         = $shopArray ? $shopArray : array();

            $map['uid'] = array('in', $shopArray);
        }

        $orderby = 'if(isnull(km),1,0),km asc';

        $field = "name,uid,lng,lat,ablum,address,woker_time,real_name,mobile,(2 * 6378.137* ASIN(SQRT(POW(SIN(PI()*($lng-lng)/360),2)+COS(PI()*$lat/180)* COS(lat * PI()/180)*POW(SIN(PI()*($lat)/360),2)))) AS km ";
        $list  = table('UserShop')->where($map)->order($orderby)->limit($offer, $pageSize)->field($field)->find('array');

        $user = dao('User')->getInfo($this->uid, 'nickname,mobile');

        foreach ($list as $key => $value) {

            $list[$key]['ablum'] = $this->appImgArray($value['ablum'], 'shop');

            //显示用户发货包裹信息
            $map               = array();
            $map['type']       = 4;
            $map['seller_uid'] = $value['uid'];
            $map['uid']        = $this->uid;
            $map['status']     = 1;

            $ordersNum = (int) table('Orders')->where($map)->count();

            $ordersList = array();
            if ($ordersNum > 0) {
                $ordersList = array_merge($user, array('num' => $ordersNum, '2wm' => ''));
            }

            if ($value['km'] !== null) {
                $km               = (int) dao('Distance')->nearbyDistance($lng, $lat, $value['lng'], $value['lat']);
                $list[$key]['km'] = !$km || $km < 50 ? '<10Km' : round($km) . 'Km';

            } else {
                $list[$key]['km'] = '距离太过遥远';
            }

            $list[$key]['news'] = array(array('title' => '测试通知信息'));

            $list[$key]['ordersList'] = $ordersList;

        }

        $data['param'] = $param;
        $data['list']  = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }
}
