<?php
/**
 * 举报模块管理
 */
namespace app\blog\controller\index;

use denha;

class Report extends denha\Controller
{
    public function add()
    {
        $goodsId = post('goods_id', 'intval', 0);
        $result  = dao('Report')->add(0, 1, $goodsId);

        $this->ajaxReturn($result);
    }
}