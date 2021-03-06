<?php
/**
 * 通知模板管理
 */
namespace app\admin\notice;

use app\admin\Init;

class SysNoticeRule extends Init
{
    public function index()
    {
        $list = table('SysNoticeRule')->field('id,title,flag,content,status')->select();

        $this->assign('list', $list);

        $this->show();
    }

    public function detail()
    {
        $id = get('id', 'intval', 0);

        if ($id) {
            $data = table('SysNoticeRule')->where('id', $id)->find();
        } else {
            $data = ['status' => 1, 'id' => 0];
        }

        $this->assign('data', $data);
        $this->show();
    }

    public function edit()
    {
        $id   = get('id', 'intval', 0);
        $data = post('info');

        if (!$data['title']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请输入标题']);
        }

        if (!$data['content']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请输入内容']);
        }

        if (!$id) {
            if (!$data['flag']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请上传标识符']);
            }

            $result = table('SysNoticeRule')->add($data);
        } else {
            $result = table('SysNoticeRule')->where('id', $id)->save($data);
        }

        if (!$result) {
            $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }
}
