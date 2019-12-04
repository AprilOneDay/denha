<?php
/**
 * 权限管理模块
 */
namespace app\admin\setting;

use app\admin\Init;
use app\tools\util\base\MenuTree;

class Power extends Init
{
    public function lists()
    {
        $id = get('id', 'intval', 0);

        if (!$id) {
            abort('参数错误');
        }

        $checkArray = table('ConsoleGroup')->where('id', $id)->value('power');
        $checkArray = explode(',', $checkArray);

        $map['del_status'] = 0;
        $map['is_white']   = 0;

        $list = table('ConsoleMenus')->where($map)->field('id,name,parentid')->order('sort asc,id asc')->select();

        $tree = new MenuTree();
        $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        $list = $tree->getLevelTreeArray($list);

        $this->show('', ['id' => $id, 'checkArray' => $checkArray, 'list' => $list]);
    }

    public function edit()
    {
        $id      = get('id', 'intval', 0);
        $idArray = post('id');
        if (!$id) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        if (!$idArray) {
            $this->ajaxReturn(['status' => false, 'msg' => '请选择权限']);
        }
        $data['power'] = implode(',', $idArray);

        $reslut = table('ConsoleGroup')->where('id', $id)->save($data);
        if ($reslut === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '保存失败']);
        }

        $this->ajaxReturn(['msg' => '保存成功']);
    }

    // 获取多维数组最大维度
    private function getMaxDArray($arrayValue, $childValue = 'child')
    {
        if (is_array($arrayValue)) {
            $max = 0;
            foreach ($arrayValue as $key => $value) {
                if ($childValue && isset($arrayValue[$key][$childValue])) {
                    $dArray = $this->getMaxDArray($arrayValue[$key][$childValue]);
                } else {
                    $dArray = $this->getMaxDArray($arrayValue[$key]);
                }

                if ($dArray > $max) {
                    $max = $dArray;
                }

                return $max + 1;
            }
        }

    }
}
