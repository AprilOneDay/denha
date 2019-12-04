<?php
/**
 * 用户规则管理
 */
namespace app\admin\user;

use app\admin\Init;

class IntegralRul extends Init
{

    /**
     * 规则列表
     * @date   2017-10-25T13:33:29+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $lists = table('UserActionRule')->select();

        $others = [
            'typeCopy' => getVar('admin.userAction.type'),
        ];

        $this->show('', ['lists' => $lists, 'others' => $others]);

    }

    /**
     * 积分规则编辑
     * @date   2017-10-25T13:33:22+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function editPost()
    {
        $id = get('id', 'intval', 0);

        $data = post();

        $data['get_value']  = str_replace('，', ',', trim($data['get_value']));
        $data['lose_value'] = str_replace('，', ',', trim($data['lose_value']));

        if (!$data['type']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请选择规则类型']);
        }

        //修改
        if ($id) {
            $result = table('UserActionRule')->where('id', $id)->save($data);
        } else {
            $result = table('UserActionRule')->add($data);
        }

        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '执行失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }

    /**
     * 获取编辑规则雷荣
     * @date   2017-10-25T13:33:38+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function edit()
    {
        $id = get('id', 'intval', 0);
        if ($id) {
            $data = table('UserActionRule')->where('id', $id)->find();
        } else {
            $data = ['integral' => 0, 'status' => 1];
        }

        $others = [
            'typeCopy' => getVar('admin.userAction.type'),
        ];

        $this->show('', ['data' => $data, 'others' => $others]);

    }
}
