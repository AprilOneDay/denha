<?php
/**
 * 商品相关模块
 */
namespace dao\base;

class Goods
{
    public function detail($goodsId = 0, $specId = 0)
    {
        $goods = table('Goods')->where('id', $goodsId)->field('id,price,sell_prce,model_id,hot')->find();
    }

    /**
     * 获取商品库存
     * @date   2018-04-06T23:38:30+0800
     * @author ChenMingjiang
     * @param  integer                  $specId  [description]
     * @param  integer                  $goodsId [description]
     * @return [type]                            [description]
     */
    public function getStock($specId = 0, $goodsId = 0)
    {
        $stock = (int) table('GoodsSpec')->where('id', $specId)->value('stock');
        return $stock;
    }
}
