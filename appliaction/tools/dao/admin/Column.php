<?php
namespace dao\admin;

use app\tools\util\base\MenuTree;

class Column
{

    public function columnList($columnId = 0, $webType = 1)
    {
        if ($columnId) {
            $map            = array();
            $map['id']      = $columnId;
            $parentid       = (int) table('Column')->where($map)->value('parentid');
            $map['_string'] = "parentid = $parentid or parentid = $columnId or id = $columnId or id = $parentid";
        } else {
            $map = array();
        }

        $map['web_type'] = $webType;

        $tree = new MenuTree();
        $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        $result = table('Column')->where($map)->order('sort asc,id asc')->select();

        $treeList = $tree->getLevelTreeArray($result);

        foreach ($treeList as $key => $value) {
            $list[$value['id']] = isset($value['delimiter']) ? $value['delimiter'] . $value['name'] : $value['name'];
        }

        return isset($list) ? $list : array();
    }

    /** 面包屑导航 */
    public function navs($id)
    {

        if (!$id) {
            return [];
        }

        $navs = function ($id, &$list = []) use (&$navs) {

            $tmplists = table('Column')->where('id', $id)->field('id,parentid,name')->find();
            $list[]   = $tmplists;
            if (!empty($tmplists['parentid'])) {
                $navs($tmplists['parentid'], $list);
            }

            return $list;
        };

        $list = $navs($id);

        return array_reverse(array_filter($list));
    }

}
