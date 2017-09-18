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
        $isRecommend = post('is_recommend', 'text', '');
        $isUrgency   = post('is_urgency', 'text', '');

        $pageNo   = post('pageNo', 'intval', 1);
        $pageSize = post('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        if ($isRecommend != '') {
            $map['is_recommend'] = $isRecommend;
        }

        if ($isUrgency != '') {
            $ma['is_urgency'] = $isUrgency;
        }

        $order = 'id desc';

        $list = table('GoodsCar')->where($map)->order($order)->limit($offer, $pageSize)->find('array');

        foreach ($list as $key => $value) {
            if ($value['is_lease'] || stripos($value['guarantee'], 3) !== false) {
                $list[$key]['title']   = "【转lease】" . $value['title'];
                $list[$key]['price']   = $value['price'] . '万';
                $list[$key]['mileage'] = $value['mileage'] . '万公里';
                $list[$key]['thumb']   = $this->appImgArray($value['thumb'], 'car');
            }

        }

        $this->appReturn(array('msg' => '获取数据成功', 'data' => (array) $list));
    }
}
