<?php
/**
 * 试卷模块管理
 */
namespace app\admin\exam;

use app\admin\Init;
use denha\Pages;

class Active extends Init
{

    public function lists()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);
        $param    = get('param', 'text', '');

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = [];

        $list  = table('ExamActive')->where($map)->limit($offer, $pageSize)->order('id desc')->select();
        $total = table('ExamActive')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $other = [
            'typeCopy'     => getVar('admin.exam.question_type'),
            'statusCopy'   => [0 => '关闭', 1 => '开启'],
            'categoryCopy' => dao('Category')->getList(1089),
        ];

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('other', $other);

        $this->show();
    }

    /** 列表信息 */
    public function edit()
    {
        $map['id'] = get('id', 'intval', 0);

        $exam          = table('ExamActive')->where($map)->find('id,value,name');
        $exam['value'] = json_decode($exam['value'], true);
        if (!$exam['value']['tm']) {
            $exam['value']['tm'][] = array('type' => 1, 'accuracy_max' => 0, 'accuracy_min' => 0, 'num' => 0);
        }

        if (!$exam['value']['fixedRules']) {
            $exam['value']['fixedRules'][] = array('type' => 1, 'value' => '', 'num' => 0);
        }

        $this->assign('data', $exam);
        $this->show();

    }

    /** 列表保存操作 */
    public function editPost()
    {
        $id = get('id', 'intval', 0);

        $name       = post('name', 'text', '');
        $data       = post('data');
        $tm         = post('tm');
        $fixedRules = post('fixedRules');

        // $tm = array_map(function ($type, $accuracyMax, $accuracyMin, $num) use (&$tm) {
        //     $tm = [
        //         'type'         => (int) $type,
        //         'accuracy_max' => (int) $accuracyMax,
        //         'accuracy_min' => (int) $accuracyMin,
        //         'num'          => (int) $num,
        //     ];
        //     return $tm;
        // }, $data['tm']['type'], $data['tm']['accuracy_max'], $data['tm']['accuracy_min'], $data['tm']['num']);
        // unset($data['tm']);

        // $fixedRules = array_map(function ($type, $value, $num) use (&$fixedRules) {
        //     $fixedRules = array(
        //         'type'  => (int) $type,
        //         'value' => str_replace('，', ',', trim($value)),
        //         'num'   => (int) $num,
        //     );
        //     return $fixedRules;
        // }, $data['fixedRules']['type'], $data['fixedRules']['value'], $data['fixedRules']['num']);
        // unset($data['fixedRules']);

        $data['fixedRules'] = $fixedRules;
        $data['tm']         = $tm;

        $value = json_encode($data);

        if ($id) {
            $result = table('ExamActive')->where('id', $id)->save(['value' => $value, 'name' => $name]);
        } else {
            $result = table('ExamActive')->add(['value' => $value, 'name' => $name]);
        }

        if ($result === false) {
            $this->ajaxReturn(array('status' => false, 'msg' => '保存失败'));
        }

        $this->ajaxReturn(array('status' => true, 'msg' => '保存成功'));
    }

}
