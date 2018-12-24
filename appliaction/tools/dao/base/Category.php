<?php
/**
 * 分类模块管理
 */
namespace dao\base;

use app\tools\util\base\MenuTree;

class Category
{
    private static $category;

    /**
     * 获取分类数组
     * @date   2017-09-18T10:17:39+0800
     * @author ChenMingjiang
     * @param  integer                  $id [description]
     * @return [type]                       [description]
     */
    public function getList($id = 0, $lg = '')
    {

        if (!isset(self::$category[$id])) {
            $map['parentid'] = $id;
            $map['is_show']  = 1;

            $list = table('Category')->where($map)->order('sort asc')->select();

            self::$category[$id] = null;

            foreach ($list as $key => $value) {
                if ($lg != 'zh' && $lg) {
                    self::$category[$id][$value['id']] = $value['name_' . $lg];
                } else {
                    self::$category[$id][$value['id']] = $value['name'];
                }
            }

        }

        return self::$category[$id];
    }

    /**
     * 获取name bname 其他参数
     * @date   2017-12-29T10:30:34+0800
     * @author ChenMingjiang
     * @param  [type]                   $field [description]
     * @param  string                   $lg    [description]
     * @return [type]                          [description]
     */
    public function getListAllInfo($id = 0, $fieldValue = '', $lg = '')
    {

        $map['parentid'] = $id;
        $map['is_show']  = 1;

        $field = 'id,thumb,name,bname,bname_2';
        if ($lg && $lg != 'zh') {
            $field .= ',name_' . $lg;
        }

        $field .= $fieldValue ? $fieldValue : '';

        $list = table('Category')->where($map)->field($field)->order('sort asc,bname asc')->select();

        foreach ($list as $key => $value) {
            if ($lg != 'zh' && $lg) {
                $list[$key]['value'] = $value['name_' . $lg];
            } else {
                $list[$key]['value'] = $value['name'];
            }
        }

        return $list ? $list : [];
    }

    /** 树状分类获取 */
    public function getListTree($parentid = 0, $fieldValue = '', $lg = '')
    {
        $childIdArray = function ($chlid, &$idArray = []) use (&$childIdArray, &$parentid) {

            if ($chlid && $parentid != $chlid) {
                $idArray[] = $chlid;
            }

            //获取下级分类
            $chlidList = table('Category')->where('parentid', $chlid)->field('id')->column();

            //递归条件
            if ($chlidList) {
                foreach ($chlidList as $key => $value) {
                    $childIdArray($value, $idArray);
                }
            }

            //返回需要删除的id
            return $idArray;
        }; //记得这里必须加``;``分号，不加分号php会报错，闭包函数

        $idArray = $childIdArray($parentid);

        $map['id']      = ['in', $idArray];
        $map['is_show'] = 1;

        $field = 'id,thumb,name,bname,parentid';
        if ($lg && $lg != 'zh') {
            $field .= ',name_' . $lg;
        }

        $field .= $fieldValue ? $fieldValue : '';

        $result = table('Category')->where($map)->field($field)->order('sort asc,id asc')->select();

        if ($result) {
            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid', '&nbsp;');
            $list = $tree->getTreeArray($result);
        }

        return isset($list) ? $list : [];

    }

    /**
     * 模糊搜索
     * @date   2017-12-29T11:38:21+0800
     * @author ChenMingjiang
     * @param  [type]                   $id      [description]
     * @param  string                   $keyword [description]
     * @param  string                   $lg      [description]
     * @return [type]                            [description]
     */
    public function searchListAllInfo($id = 0, $keyword = '', $lg = '')
    {
        $map['parentid'] = $id;

        $keyword = (string) $keyword;

        $field = 'id,name,bname,bname_2';
        if ($lg && $lg != 'zh') {
            $field .= ',name_' . $lg;
            if ($keyword) {
                $map['name_' . $lg] = array('instr', $keyword);
            }
        } else {
            $map['name'] = array('instr', $keyword);
        }

        $field .= $fieldValue ? $fieldValue : '';
        $list = table('Category')->where($map)->field($field)->order('bname asc,sort asc')->select();

        foreach ($list as $key => $value) {
            if ($lg != 'zh' && $lg) {
                $list[$key]['value'] = $value['name_' . $lg];
            } else {
                $list[$key]['value'] = $value['name'];
            }
        }

        return $list ? $list : [];
    }

    /**
     * 通过id获取分类名称
     * @date   2017-09-18T10:17:21+0800
     * @author ChenMingjiang
     * @param  [type]                   $id [description]
     * @return [type]                       [description]
     */
    public function getBname($id)
    {

        $map['id'] = array('in', $id);

        $name = table('Category')->where($map)->field('bname')->column();

        if (!$name) {
            return null;
        }

        if (count($name) == 1) {
            return (string) $name[0];
        }

        return (array) $name;
    }

    /**
     * 通过id获取分类名称
     * @date   2017-09-18T10:17:21+0800
     * @author ChenMingjiang
     * @param  [type]                   $id [description]
     * @return [type]                       [description]
     */
    public function getName($id, $lg = '')
    {

        $map['id'] = array('in', $id);
        if ($lg && $lg != 'zh') {
            $name = table('Category')->where($map)->field('name_' . $lg)->column();
        } else {
            $name = table('Category')->where($map)->field('name')->column();
        }

        if (!$name) {
            return null;
        }

        if (count($name) == 1) {
            return (string) $name[0];
        }

        return (array) $name;
    }

}
