<?php
/**
 * 表单提交模块
 */
namespace app\admin\user;

use app\admin\Init;

class From extends Init
{
    public function lists()
    {
        $list = table('FromData')->order('created desc')->select();

        foreach ($list as $key => $value) {

            if ($value['uid']) {
                $list[$key]['nickname'] = dao('User')->getNickname($value['uid']);
            } else {
                $list[$key]['nickname'] = $value['nickname'] ? $value['nickname'] : '游客';
            }

        }

        $this->assign('list', $list);

        $this->show();
        //select COLUMN_NAME,column_comment from INFORMATION_SCHEMA.Columns where table_name='表名' and table_schema='数据库名'
    }

    public function detail()
    {
        $id = get('id', 'intval', 0);

        $fromData = table('FromData')->getField('column_name,column_comment');

        $data = table('FromData')->find();
        if ($data['uid']) {
            $data['nickname'] = dao('User')->getNickname($data['uid']);
        }

        $data['created'] = date('Y-m-d', $data['created']);

        $this->assign('data', $data);
        $this->assign('fromData', $fromData);
        $this->show();

    }

    public function change()
    {
        $id     = post('id', 'intval', 0);
        $status = post('status', 'intval', 0);

        $reslut = table('FromData')->where('id', $id)->save('status', $status);
        if ($reslut === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }

}
