<?php
/**
 * 教室相关功能
 */
namespace app\undies\tools\dao;

class Column
{
    public function getList($map, $field = '*')
    {
        $list = table('Column')->where($map)->field($field)->find('array');
        return $list;
    }
}
