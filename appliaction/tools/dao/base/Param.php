<?php
/**
 * 系统参数
 */
namespace dao\base;

class Param
{
    /**
     * 查看名称
     * @date   2017-10-12T17:23:48+0800
     * @author ChenMingjiang
     * @param  integer                  $id [description]
     * @return [type]                       [description]
     */
    public function getName($id = 0)
    {
        $name = (string) table('ConsoleParameter')->where('id', $id)->field('name')->value();
        return $name;
    }

    /**
     * 查看值
     * @date   2017-10-12T17:23:56+0800
     * @author ChenMingjiang
     * @param  integer                  $id [description]
     * @return [type]                       [description]
     */
    public function getValue($id = 0)
    {
        $value = (string) table('ConsoleParameter')->where('id', $id)->field('value')->value();
        return $value;
    }
}
