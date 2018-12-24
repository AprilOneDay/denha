<?php
/**
 * 广告管理
 */
namespace dao\base;

class Banner
{
    public function getList($bannerId)
    {
        $list = table('BannerData')->where(array('banner_id' => $bannerId))->select();
        return $list;
    }
}
