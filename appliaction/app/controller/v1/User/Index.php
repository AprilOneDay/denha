<?php
/**
 * 公用模块
 */
namespace app\app\controller\v1\user;

use app\app\controller;

class Index extends \app\app\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function index()
    {
        $user = table('User')->where('id', $this->uid)->field('avatar,nickname,mobile')->find();

        $user['avatar'] = $this->appImg($user['avatar'], 'avatar');

        $this->appReturn(array('data' => $user));

    }

    /**
     * 我的收藏
     */
    public function collection()
    {
        $map['type']       = 1;
        $map['uid']        = $this->uid;
        $map['del_status'] = 0;

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $idArray = table('Collection')->where($map)->field('value')->find('one', true);

        $mapCar['status']  = 1;
        $mapCar['is_show'] = 1;
        $mapCar['id']      = array('in', implode(',', $idArray));
        $list              = table('GoodsCar')->where($mapCar)->field('title,type,id,thumb,price,mileage,produce_time,is_lease')->limit($offer, $pageSize)->order('id desc')->find('array');
        foreach ($list as $key => $value) {
            if ($value['is_lease'] || stripos($value['guarantee'], 3) !== false) {
                $list[$key]['title'] = "【转lease】" . $value['title'];
            }

            $list[$key]['price']   = $value['price'] . '万';
            $list[$key]['mileage'] = $value['mileage'] . '万公里';
            $list[$key]['thumb']   = $this->appImg($value['thumb'], 'car');
        }

        $data = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

    /**
     *  我的足迹
     */
    public function footprints()
    {
        $day = 3600 * 60 * 24;

        $map['uid']        = $this->uid;
        $map['type']       = 1;
        $map['del_status'] = 0;

        $pageNo     = get('pageNo', 'intval', 1);
        $startOffer = $pageNo == 1 ? 0 : $pageNo - 1;
        $endOffer   = $pageNo == 1 ? -1 : $pageNo - 1;

        $beginToday     = mktime(0, 0, 0, date('m'), date('d') - $startOffer, date('Y'));
        $endToday       = mktime(0, 0, 0, date('m'), date('d') - $endOffer, date('Y')) - 1;
        $map['created'] = array('between', $beginToday, $endToday);

        $idArray = table('Footprints')->where($map)->field('value')->find('one', true);

        $mapCar['status']  = 1;
        $mapCar['is_show'] = 1;
        $mapCar['id']      = array('in', implode(',', $idArray));
        $list              = table('GoodsCar')->where($mapCar)->field('title,type,id,thumb,price,mileage,produce_time,is_lease')->order('created desc')->find('array');
        foreach ($list as $key => $value) {
            if ($value['is_lease'] || stripos($value['guarantee'], 3) !== false) {
                $list[$key]['title'] = "【转lease】" . $value['title'];
            }

            $list[$key]['price']   = $value['price'] . '万';
            $list[$key]['mileage'] = $value['mileage'] . '万公里';
            $list[$key]['thumb']   = $this->appImg($value['thumb'], 'car');
        }

        $data['time'] = date('Y/m/d', $beginToday);
        $data['list'] = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }
}
