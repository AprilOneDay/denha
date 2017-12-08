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

        $param['keyword']   = urldecode(get('keyword', 'text', ''));
        $param['orderType'] = get('order_type', 'intval', 0);
        $lng                = session('lng') ? session('lng') : 0;
        $lat                = session('lat') ? session('lat') : 0;

        if ($param['keyword']) {
            $map['title'] = array('instr', $param['keyword']);
        }

        $article     = table('article')->tableName();
        $articleData = table('articleShop')->tableName();

        $map[$article . '.is_show']   = 1;
        $map[$article . '.column_id'] = 32;

        $orderBy = 'km asc';

        $field = "$article.id,$article.title,$articleData.address,$articleData.lng,$articleData.lat,(2 * 6378.137* ASIN(SQRT(POW(SIN(PI()*($lng-$articleData.lng)/360),2)+COS(PI()*$lat/180)* COS($articleData.lat * PI()/180)*POW(SIN(PI()*($lat)/360),2)))) AS km ";

        $list = table('article')->join($articleData)->where($map)->field($field)->order($orderBy)->find('array');

        if ($list) {
            foreach ($list as $key => $value) {
                if ($value['km'] !== null) {
                    $km                     = (int) dao('Distance')->nearbyDistance($lng, $lat, $value['lng'], $value['lat']);
                    $list[$key]['km']       = !$km || $km <= 1 ? '<1Km' : round($km) . 'Km';
                    $list[$key]['distance'] = $km;
                    $distance[]             = $km;

                } else {
                    $list[$key]['km'] = '距离太过遥远';
                }
            }
        }

        array_multisort($distance, SORT_ASC, $list);

        $data['list']  = $list ? $list : array();
        $data['param'] = $param;

        $this->assign('data', $data);

        $this->show();
    }

    public function map()
    {
        $id = get('id', 'intval', 0);

        $map['id'] = $id;
        $data      = dao('Article')->getRowContent($map, 'id,title,address,lng,lat', 5);

        $this->assign('data', $data);
        $this->show();
    }
}
