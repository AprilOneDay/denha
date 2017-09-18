<?php
namespace app\tools\dao;

class Category
{
    /**
     * 获取分类数组
     * @date   2017-09-18T10:17:39+0800
     * @author ChenMingjiang
     * @param  integer                  $id [description]
     * @return [type]                       [description]
     */
    public function getList($id = 0)
    {

        static $_category = array();

        if (!isset($_category[$id])) {
            $map['parentid'] = $id;
            $list            = table('Category')->where($map)->field('id,name')->find('array');

            $_category[$id] = null;

            foreach ($list as $key => $value) {
                $_category[$id][$value['id']] = $value['name'];
            }

        }

        return $_category[$id];
    }

    /**
     * 通过id获取分类名称
     * @date   2017-09-18T10:17:21+0800
     * @author ChenMingjiang
     * @param  [type]                   $id [description]
     * @return [type]                       [description]
     */
    public function getName($id)
    {
        $name = (string) table('Category')->where(array('id' => $id))->field('name')->find('one');
        return $name;
    }

}
