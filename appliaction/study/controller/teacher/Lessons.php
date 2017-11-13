<?php
/**
 * 课程管理
 */
namespace app\study\controller\user;

class Lessons extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 5);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $map['uid']    = $this->uid;
        $map['is_pay'] = 1;
        $list          = table('Orders')->where($map)->field('order_sn')->limit($offer, $pageSize)->find('array');
        foreach ($list as $key => $value) {
            $ordersData          = table('OrdersCourse')->where('order_sn', $value['order_sn'])->field('thumb,title,btitle,goods_id')->find();
            $goods               = table('ArticleCourse')->where('id', $ordersData['goods_id'])->field('recruit,recruit_en')->find();
            $list[$key]['goods'] = array_merge($ordersData, $goods);
        }

        $total = table('Orders')->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url(''));

        $this->assign('list', $list);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
