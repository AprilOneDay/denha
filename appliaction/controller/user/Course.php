<?php
//课程管理
class Course extends base
{
    /**
     * 列表展示
     * @date   2017-06-13T22:52:42+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $user = getSession('yh');
        if (!$user) {
            die(header('location:/'));
        }

        $map['uid']    = $user['bh'];
        $map['yeard']  = date('Y');
        $map['type']   = 2;
        $map['status'] = 1;

        $list = table('cqks_course', false)->where($map)->find('array');
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['kj'] = table('kj')->where(array('id' => $value['code']))->field('catid,id')->find();
            }
        }

        $this->assign('list', $list);
        $this->assign('user', $user);
        $this->show('/user/course');
    }

    /**
     * 删除记录
     * @date   2017-06-13T22:52:34+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function delete()
    {
        $id = post('id', 'intval', 0);

        $user = getSession('yh');
        if (!$user) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请登录'));
        }

        $map['id']  = $id;
        $map['uid'] = $user['bh'];

        $isCourse = table('cqks_course', false)->where($map)->find('array');
        if (!$isCourse) {
            $this->ajaxReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        $result = table('cqks_course', false)->where($map)->save(array('status' => 3));
        if ($result) {
            $this->ajaxReturn(array('status' => true, 'msg' => '操作成功'));
        }

        $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
    }
}
