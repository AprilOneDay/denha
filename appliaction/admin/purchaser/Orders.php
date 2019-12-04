<?php
/**
 * 采购商品订单列表
 */
namespace app\admin\purchaser;

use app\admin\Init;
use denha\Pages;

class Orders extends Init
{

    public function lists()
    {

        $param = get('param', 'text');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = [];

        $total = table('orders_purchaser')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));
        $lists = table('orders_purchaser')->where($map)->limit($offer, $pageSize)->select();

        foreach ($lists as $key => $value) {
            $lists[$key]['title'] = table('Goods')->where(['id' => $value['goods_id']])->value('title');
        }

        $other = [];

        $this->show('', [
            'lists' => $lists,
            'param' => $param,
            'other' => $other,
            'pages' => $page->loadConsole(),
        ]);
    }

    public function add($buyNum, $payType, $goodsId, $specId)
    {

        if (!$specId || !$goodsId || !$payType || !$buyNum) {
            $this->ajaxReturn(false, '参数错误');
        }

        $goodSpec = table('goods_spec')->where(['id' => $specId])->find();

        if ($buyNum > $goodSpec['stock']) {
            $this->ajaxReturn(false, '商品库存不足');
        }

        $account = $goodSpec['sell_price'] * $buyNum;
        // $account = $goodSpec['exw_price'] * $buyNum;

        $shop = table('user_shop')->where(['uid' => $this->consoleid])->find();
        if ($shop === false) {
            $this->ajaxReturn(false, '店铺信息异常');
        }

        // 检查余额是否充足
        if ($payType == 1) {
            if ($shop['money'] < $account) {
                $this->ajaxReturn(false, '店铺余额:' . $shop['money'] . ' [余额不足，请选择线下支付] ');
            }

            $data['apply_status'] = 1; // 标记已支付
        }

        $data['num']      = $buyNum;
        $data['goods_id'] = $goodsId;
        $data['spec_id']  = $specId;
        $data['account']  = $account;
        $data['price']    = $goodSpec['sell_price'];
        $data['uid']      = $this->consoleid;
        $data['shop_id']  = $shop['id'];
        $data['order_sn'] = dao('Orders')->createOrderSn();
        $data['created']  = TIME;

        table('orders_purchaser')->startTrans();

        // 保存订单
        $result = table('orders_purchaser')->add($data);
        if ($result === false) {
            table('orders_purchaser')->rollback();
            $this->ajaxReturn(false, '操作失败');
        }

        // 更改规格库存
        $result = table('goods_spec')->where(['id' => $goodSpec['id']])->save('stock', 'less', $buyNum);
        if ($result === false) {
            table('orders_purchaser')->rollback();
            $this->ajaxReturn(false, '库存修改失败');
        }

        // 更改店铺余额
        if ($payType == 1) {
            $result = dao('UserActionRule')->add($this->consoleid, 'shop_buy', ['is_change' => false, 'lose_value' => $account]);
            if ($result === false) {
                table('orders_purchaser')->rollback();
                $this->ajaxReturn(false, '金额修改失败');
            }

            $result = table('user_shop')->where(['uid' => $this->consoleid])->save('money', 'less', $account);
            if ($result === false) {
                table('orders_purchaser')->rollback();
                $this->ajaxReturn(false, '金额修改失败了');
            }
        }

        // 增加店铺库存
        $shopStockId = table('shop_stock')->where(['shop_id' => $shop['id'], 'goods_id' => $goodsId, 'spec_id' => $specId])->value('id');
        if ($shopStockId) {
            $result = table('shop_stock')->where(['id' => $shopStockId])->save('stock', 'add', $buyNum);
        } else {
            $result = table('shop_stock')->add([
                'shop_id'  => $shop['id'],
                'goods_id' => $goodsId,
                'spec_id'  => $specId,
                'stock'    => $buyNum,
            ]);
        }

        if ($result === false) {
            table('orders_purchaser')->rollback();
            $this->ajaxReturn(false, '店铺库存增加失败');
        }

        table('orders_purchaser')->commit();

        $this->ajaxReturn(false);
    }
}
