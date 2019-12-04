<?php
/**
 * 商家店铺管理
 */
namespace dao\base;

class UserShop
{
    /** 获取店铺名称 */
    public function getName($uid)
    {
        return (string) table('user_shop')->where(['uid' => $uid])->value('name');
    }
}
