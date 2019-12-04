<?php

/**
 * 内容模型
 * ------------------------------------
 *
 * tplID => 所属模型id 对应控制器/方法_tpl[根据 key值 追踪到最后action
 * name  => 模型名称
 * db    => 模型附表数据名称
 * url   => 后台请求URL
 *
 * ------------------------------------
 */
return [
    '1' => ['tpl' => 1, 'name' => '文章模型', 'db' => 'Data', 'model' => 'article', 'url' => '/admin/content/article_list/lists'],
    '2' => ['tpl' => 2, 'name' => '老师模型', 'db' => 'Teachers', 'model' => 'article', 'url' => '/admin/content/article_list/lists'],
    '3' => ['tpl' => 5, 'name' => '店铺模型', 'db' => 'Shop', 'model' => 'article', 'url' => '/admin/content/article_list/lists'],
    '4' => ['tpl' => 1, 'name' => '普通商品模型', 'db' => 'Data', 'model' => 'goods', 'url' => '/admin/content/goods_list/lists'],
    '5' => ['tpl' => 2, 'name' => '团购商品模型', 'db' => 'DataTeams', 'model' => 'goods', 'url' => '/admin/content/goods_list/lists'],
    '6' => ['tpl' => 3, 'name' => '积分商品模型', 'db' => 'Data', 'model' => 'goods', 'url' => '/admin/content/goods_list/lists'],
    '7' => ['tpl' => 4, 'name' => '课件模型', 'db' => 'Courses', 'model' => 'goods', 'url' => '/admin/content/goods_list/lists'],
    '8' => ['tpl' => 2, 'name' => '免费直播模型', 'db' => 'Data', 'model' => 'article', 'url' => '/admin/content/article_list/lists'],
];
