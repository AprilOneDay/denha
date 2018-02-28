<?php
/**
 * 分类管理
 */
namespace app\admin\controller\content;

use app\admin\controller\Init;
use denha\Pages;

class Category extends Init
{
    public function lists()
    {
        $parentid = get('id', 'intval', 0);

        $keyword = get('keyword', 'text', '');

        $map['parentid'] = $parentid;

        $param = array();

        if ($keyword) {
            $map['name']      = array('like', '%' . $keyword . '%');
            $param['keyword'] = $keyword;
        }

        $list = table('Category')->where($map)->order('sort asc')->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['is_show_copy'] = $value['is_show'] ? '√' : '×';
        }

        $this->assign('parentid', $parentid);
        $this->assign('param', $param);
        $this->assign('list', $list);
        $this->show();
    }

    public function edit()
    {

        $id       = get('id', 'intval', 0);
        $parentid = get('parentid', 'intval', 0);
        $rs       = table('Category')->where(array('id' => $id))->find();

        if ($id == 0 && $parentid != 0) {
            $rs['parentid'] = $parentid;
            $rs['sort']     = 0;
        }

        $this->assign('treeList', $this->treeList());
        $this->assign('data', $rs);
        $this->show();
    }

    public function editPost()
    {
        $id      = post('id', 'intval', 0);
        $add     = post('add', 'intval', 1);
        $content = post('content', 'text', '');

        $data['parentid'] = post('parentid', 'intval', 0);
        $data['sort']     = post('sort', 'intval', 0);
        $data['is_show']  = post('is_show', 'intval', 1);

        $data['name']    = post('name', 'text', '');
        $data['name_en'] = post('name_en', 'text', '');
        $data['name_jp'] = post('name_jp', 'text', '');

        $data['bname']   = post('bname', 'text', '');
        $data['bname_2'] = post('bname_2', 'text', '');
        $data['thumb']   = post('thumb', 'img', '');

        if ($add == 1 && !$data['name']) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请输入分类名称'));
        }

        if ($id) {
            $result = table('Category')->where(array('id' => $id))->save($data);
            if ($result) {
                $this->ajaxReturn(array('status' => true, 'msg' => '修改成功'));
            }
        } else {
            if ($add == 2 && $content) {
                $content = explode(PHP_EOL, $content);
                foreach ($content as $key => $value) {
                    if (stripos($value, '|') !== false) {
                        $value         = explode('|', $value);
                        $data['name']  = trim($value[0]);
                        $data['bname'] = $value[1];
                    } else {
                        $data['name'] = $value;
                    }
                    $result = table('Category')->add($data);
                }

            } else {
                $result = table('Category')->add($data);
            }
            if ($result) {
                $this->ajaxReturn(array('status' => true, 'msg' => '添加成功'));
            }
        }

        $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
    }

    /** 删除分类 */
    public function del()
    {
        $chlid = post('id', 'intval');

        $idArray = $this->getChildIdArray($chlid);

        //执行删除操作
        $map['id'] = array('in', $idArray);
        $result    = table('Category')->where($map)->delete();
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '删除失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '删除成功'));
    }

    /** 快速修改参数 */
    public function changeData()
    {
        $id    = post('id', 'intval', 0);
        $field = post('field', 'text', '');
        $value = post('name', 'text', '');

        if (!$id || !in_array($field, array('name', 'name_en', 'name_jp', 'bname'))) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $result = table('Category')->where('id', $id)->save($field, $value);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '修改失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '修改成功'));
    }

    /** 修改分类显示状态 */
    public function changeShow()
    {
        $id           = post('id', 'intval', 0);
        $childIdArray = $this->getChildIdArray($id);

        $isShow = table('Category')->where('id', $id)->field('is_show')->find('one');

        $map       = array();
        $map['id'] = array('in', $childIdArray);

        $data            = array();
        $data['is_show'] = $isShow == 1 ? 0 : 1;

        $result = table('Category')->where($map)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '修改失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '修改成功'));

    }

    private function getChildIdArray($id)
    {
        //删除所有下级分类 引用 &很重要 不然返回不了完整信息
        $childIdArray = function ($chlid, &$idArray) use (&$childIdArray) {
            $idArray[] = $chlid;
            //获取下级分类
            $chlidList = table('Category')->where('parentid', $chlid)->field('id')->find('one', true);

            //递归条件
            if ($chlidList) {
                foreach ($chlidList as $key => $value) {
                    $i++;
                    $childIdArray((int) $value, $idArray);
                }
            }
            //返回需要删除的id
            return $idArray;
        }; //记得这里必须加``;``分号，不加分号php会报错，闭包函数

        $idArray = $childIdArray($id);

        return $idArray;
    }

    /**
     * 接口自动翻译 /content/category/translation?to=en&parentid=0&id=0
     * @date   2017-12-25T10:44:29+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function translation()
    {
        $param['to']       = get('to', 'text', 'en');
        $param['parentid'] = get('parentid', 'text', '');
        $param['id']       = get('id', 'intval', 0);

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        if ($param['parentid'] != '') {
            $map['parentid'] = array('in', $param['parentid']);
        } elseif ($param['id']) {
            $map['id'] = array('in', $param['id']);
        }

        $list  = table('Category')->where($map)->limit($offer, $pageSize)->find('array');
        $total = table('Category')->where($map)->count();

        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));
        $pages = $page->pages();

        if ($list) {
            foreach ($list as $key => $value) {
                $transValue = dao('BaiduTrans')->baiduTrans($value['name'], $param['to'], 'zh');
                if (isset($value['name_' . $param['to']]) && $transValue) {
                    $result = table('Category')->where('id', $value['id'])->save('name_' . $param['to'], $transValue);
                    if ($result) {
                        echo '翻译 ' . $value['name'] . ' 为 ' . $transValue . ' 更改成功<br/>' . PHP_EOL;
                    }
                }
            }
        }

        if ($pageNo < $pages['allPage']) {
            header("refresh:5;$pages[pageUrl]/pageNo/" . ($pageNo + 1));
            print('已执行' . $pageNo . '/' . $pages['allPage'] . '页,五秒后自动跳转到下一页');
        } else {
            die('执行完毕');
        }

    }

    /**
     * [获取树状菜单列表]
     * @date   2016-09-05T10:21:46+0800
     * @author Sunpeiliang
     */
    private function treeList($id)
    {
        //格式化菜单
        $map['parentid'] = $id;

        $result = table('Category')->field('id,parentid,name')->limit(0, 99999)->find('array');
        if ($result) {
            $tree = new \app\admin\tools\util\MenuTree();
            $tree->setConfig('id', 'parentid');
            $list = $tree->getLevelTreeArray($result);
            if (isset($list) && $list) {
                foreach ($list as $key => $value) {
                    $list[$key]['htmlname'] = $value['delimiter'] . $value['name'];
                }
            }
        }

        return $list;
    }

    public function import()
    {
        $files = files('file');

        /* $result = dao('Upload')->uploadfile($files, 'tmp', 10, 'xls,xlsx');
        if (!$result['status']) {
        $this->ajaxReturn($result);
        }*/

        $path = $result['data']['name'][0];
        $path = '1518077756224_306.xls';
        $path = PUBLIC_PATH . 'uploadfile' . DS . 'tmp' . DS . $path;

        $result = dao('File')->xlsImport($path);

        print_r($result);

    }

}
