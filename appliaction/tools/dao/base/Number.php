<?php
/**
 * 数字处理模块
 */
namespace dao\base;

class Number
{

    /**
     * 货币格式 如果是数字则保留 两位小数
     * @date   2018-12-14T10:41:45+0800
     * @author ChenMingjiang
     * @param  [type]                   $price [description]
     * @return [type]                   [description]
     */
    public function currency($price)
    {
        if (is_numeric($price)) {
            $price = sprintf('%.2f', $price);
        }

        return $price;
    }

    /**
     * 转换价格
     * @date   2017-09-27T15:14:00+0800
     * @author ChenMingjiang
     * @param  integer                  $price [description]
     * @param  string                   $lg    [description]
     * @return [type]                          [description]
     */
    public function price($price = 0, $lg = 'zh')
    {
        if (is_numeric($price)) {
            $price = sprintf('%.2f', $price);
            if ($price > 10000) {
                $price = sprintf('%.2f', ($price / 10000)) . '万';
            }
        }

        return $price;
    }

    /**
     * 数字转换为万计数 如果超过万
     * @date   2017-11-17T11:34:55+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function million($value)
    {
        if ($value > 10000 && is_numeric($price)) {
            $value = sprintf('%.2f', ($value / 10000)) . '万';
        }

        return (float) $value;
    }

    /**
     * 根据关键变量 返回范围数组
     * @date   2018-12-10T11:53:43+0800
     * @author ChenMingjiang
     * @param  [type]                   $str    [规则字符串 1-100]
     * @param  string                   $filter [分割关键 -]
     * @return [type]                   [返回 1-100的数组]
     */
    public function range($str, $filter = '-')
    {

        if (stripos($str, $filter) !== false) {
            list($start, $end) = explode($filter, $str);

            $str = range($start, $end);
        }

        return $str;
    }
}
