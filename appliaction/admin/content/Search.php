<?php
/**
 * 前台用户管理
 */
namespace app\admin\content;

use app\admin\Init;
use denha;

class Search extends Init
{
    /**
     * 搜索记录列表
     * @date   2017-09-20T10:28:47+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $param['field']   = get('field', 'text', 'value');
        $param['keyword'] = get('keyword', 'text', '');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = [];

        if ($param['field'] && $param['keyword']) {
            if ($param['field'] == 'value') {
                $map['value'] = array('like', '%' . $param['keyword'] . '%');
            }
        }

        $field = "CONCAT(type,value) AS g,value,type,id,SUM(hot) AS hot";

        $list = table('SearchLog')->where($map)->limit($offer, $pageSize)->field($field)->group('g')->select();
        //echo table('SearchLog')->getSql();die;
        $total = table('SearchLog')->where($map)->group('value')->count();
        $page  = new denha\Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {

            $list[$key]['is_recommend'] = (bool) table('SearchRemmond')->where(array('type' => $value['type'], 'value' => $value['value']))->field('id')->value();
            $list[$key]['is_disable']   = (bool) table('SearchDisable')->where(array('type' => $value['type'], 'value' => $value['value']))->field('id')->value();
        }

        $other = array(
            'typeCopy'        => getVar('base.search.type'),
            'isDisableCopy'   => array(1 => '禁用', 1 => '未禁用'),
            'isRecommendCopy' => array(1 => '推荐', 0 => '未推荐'),
        );

        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->assign('param', $param);
        $this->show();
    }

    /**
     * 搜索推荐列表
     * @date   2017-09-20T10:28:55+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function recommendLists()
    {
        $param['field']   = get('field', 'text', 'value');
        $param['keyword'] = get('keyword', 'text', '');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = [];

        if ($param['field'] && $param['keyword']) {
            if ($param['field'] == 'value') {
                $map['value'] = array('like', '%' . $param['keyword'] . '%');
            }
        }

        $list  = table('SearchRemmond')->where($map)->limit($offer, $pageSize)->field('id,value,type,status')->select();
        $total = table('SearchRemmond')->where($map)->group('value')->count();
        $page  = new denha\Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
        }

        $other = array(
            'typeCopy'        => getVar('base.search.type'),
            'isDisableCopy'   => array(1 => '禁用', 1 => '未禁用'),
            'isRecommendCopy' => array(1 => '推荐', 0 => '未推荐'),
        );

        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->assign('param', $param);
        $this->show();
    }

    /**
     * 增加搜索推荐
     * @date   2017-09-20T10:29:50+0800
     * @author ChenMingjiang
     */
    public function addRecommend()
    {
        if (IS_POST) {
            $type  = post('type', 'intval', 0);
            $value = post('value', 'text', '');

            $reslut = dao('Search')->addRecommend($type, $value);
            $this->ajaxReturn($reslut);
        } else {
            $other = array(
                'typeCopy' => getVar('base.search.type'),
            );

            $this->assign('other', $other);
            $this->show();
        }

    }

    /**
     * 搜索禁用列表
     * @date   2017-09-20T10:29:03+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function disableLists()
    {
        $param['field']   = get('field', 'text', 'value');
        $param['keyword'] = get('keyword', 'text', '');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = [];

        if ($param['field'] && $param['keyword']) {
            if ($param['field'] == 'value') {
                $map['value'] = array('like', '%' . $param['keyword'] . '%');
            }
        }

        $list  = table('SearchDisable')->where($map)->limit($offer, $pageSize)->field('id,value,type,status')->select();
        $total = table('SearchDisable')->where($map)->group('value')->count();
        $page  = new denha\Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
        }

        $other = array(
            'typeCopy'        => getVar('base.search.type'),
            'isDisableCopy'   => array(1 => '禁用', 1 => '未禁用'),
            'isRecommendCopy' => array(1 => '推荐', 0 => '未推荐'),
        );

        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->assign('param', $param);
        $this->show();
    }

    /**
     * 增加搜索禁用
     * @date   2017-09-20T10:30:01+0800
     * @author ChenMingjiang
     */
    public function addDisable()
    {
        if (IS_POST) {
            $type  = post('type', 'intval', 0);
            $value = post('value', 'text', '');

            $reslut = dao('Search')->addDisable($type, $value);
            $this->ajaxReturn($reslut);
        } else {
            $other = array(
                'typeCopy' => getVar('base.search.type'),
            );

            $this->assign('other', $other);
            $this->show();
        }
    }

    public function changeStatus()
    {
        $table  = post('type', 'text', '');
        $id     = post('id', 'intval', 0);
        $status = post('status', 'intval', 0);

        $reslut = dao('ChangeTable')->changeStatus($table, $id, $status);

        $this->ajaxReturn($reslut);
    }

    public function del()
    {

        $type  = post('type', 'intval', 0);
        $value = post('value', 'text', '');
        $table = post('table', 'text', '');

        $reslut = dao('Search')->del($table, $type, $value);

        $this->ajaxReturn($reslut);

    }
}
