<?php
/**
 * 广告图模块
 */
namespace app\undies\web\controller;

use app\undies\web\controller\Init;
use denha\controller;

class Shop extends Init
{
    /**
     * 销售网点
     * @date   2017-12-04T10:55:01+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $param['keyword']   = get('keyword', 'text', '');
        $param['orderType'] = get('order_type', 'intval', 0);
        $lng                = get('lng', 'text', 0);
        $lat                = get('lat', 'text', 0);

        if ($param['keyword']) {
            $map['title'] = array('instr', $param['keyword']);
        }

        $article     = table('article')->tableName();
        $articleData = table('articleShop')->tableName();

        $map[$article . '.is_show']   = 1;
        $map[$article . '.column_id'] = 32;

        $orderBy = 'id asc';
        if ($param['orderType']) {
            $orderType = 'km asc';
        }

        $field = "$article.id,$article.title,$articleData.address,$articleData.lng,$articleData.lat,(2 * 6378.137* ASIN(SQRT(POW(SIN(PI()*($lng-$articleData.lng)/360),2)+COS(PI()*$lat/180)* COS($articleData.lat * PI()/180)*POW(SIN(PI()*($lat)/360),2)))) AS km ";

        $list = table('article')->join($articleData)->where($map)->field($field)->order($orderBy)->find('array');

        if ($list) {
            foreach ($list as $key => $value) {
                if ($value['km'] !== null) {
                    $km               = (int) dao('Distance')->nearbyDistance($lng, $lat, $value['lng'], $value['lat']);
                    $list[$key]['km'] = !$km || $km < 50 ? '<10Km' : round($km) . 'Km';

                } else {
                    $list[$key]['km'] = '距离太过遥远';
                }
            }
        }

        $data['list']  = $list ? $list : array();
        $data['param'] = $param;

        $this->assign('data', $data);

        $this->show();
    }
}
