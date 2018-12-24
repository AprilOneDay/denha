<?php
/**
 * 试卷模块管理
 */
namespace app\admin\exam;

use app\admin\Init;

class Active extends Init
{
    /** 列表信息 */
    public function lists()
    {
        $map['id'] = 1;

        $data = table('ExamActive')->where($map)->value('value');
        $data = json_decode($data, true);
        if (!$data['tm']) {
            $data['tm'][] = array('type' => 1, 'accuracy_max' => 0, 'accuracy_min' => 0, 'num' => 0);
        }

        if (!$data['fixedRules']) {
            $data['fixedRules'][] = array('type' => 1, 'value' => '', 'num' => 0);
        }

        $this->assign('data', $data);
        $this->show();

    }

    /** 列表保存操作 */
    public function listsPost()
    {
        $id = post('id', 'intval', 1);

        $data = post('data');

        $tm = array_map(function ($type, $accuracyMax, $accuracyMin, $num) use (&$tm) {
            $tm = array(
                'type'         => (int) $type,
                'accuracy_max' => (int) $accuracyMax,
                'accuracy_min' => (int) $accuracyMin,
                'num'          => (int) $num,
            );
            return $tm;
        }, $data['tm']['type'], $data['tm']['accuracy_max'], $data['tm']['accuracy_min'], $data['tm']['num']);
        unset($data['tm']);

        $fixedRules = array_map(function ($type, $value, $num) use (&$fixedRules) {
            $fixedRules = array(
                'type'  => (int) $type,
                'value' => str_replace('，', ',', trim($value)),
                'num'   => (int) $num,
            );
            return $fixedRules;
        }, $data['fixedRules']['type'], $data['fixedRules']['value'], $data['fixedRules']['num']);
        unset($data['fixedRules']);

        $data['fixedRules'] = $fixedRules;
        $data['tm']         = $tm;

        $value = json_encode($data);

        $result = table('ExamActive')->where('id', $id)->save('value', $value);

        if (!$result) {
            $this->ajaxReturn(array('status' => false, 'msg' => '保存失败'));
        }

        $this->ajaxReturn(array('status' => true, 'msg' => '保存成功'));
    }

}
