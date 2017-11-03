<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\common;

class Version extends \app\study\controller\Init
{
    /**
     * 中英文切换
     * @date   2017-11-02T16:55:49+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function switchlg()
    {
        if (!$this->lg) {
            cookie('lg', 'en');
        } else {
            cookie('lg', '');
        }

        $this->ajaxReturn(array('status' => true, 'msg' => ''));
    }
}
