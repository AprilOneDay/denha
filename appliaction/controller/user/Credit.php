<?php
//学分管理
class Credit extends base
{
    /**
     * I类学分
     * @date   2017-06-13T21:36:34+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listOne()
    {
        $type = get('type', 'intval', 1);
        $user = getSession('yh');
        if (!$user) {
            die(header('location:/'));
        }
        $map['uid']   = $user['bh'];
        $map['type']  = 1;
        $map['yeard'] = date('Y');

        if ($type == 1) {
            $map['status'] = 1;
        } elseif ($type == 2) {
            $map['status']   = 1;
            $map['is_apply'] = 1;
        } elseif ($type == 3) {
            $map['yeard'] = array('<', date('Y'));
        }

        $list = table('cqks_credit', false)->where($map)->find('array');
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['ks'] = (int) table('kj')->where(array('kc_sn' => $value['code']))->field('id')->find();
            }
        }

        $this->assign('type', (int) $type);
        $this->assign('list', $list);
        $this->show('/user/credit_1');
    }

    /**
     * II类学分
     * @date   2017-06-13T21:37:15+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listTwo()
    {
        $type = get('type', 'intval', 1);
        $user = getSession('yh');
        if (!$user) {
            die(header('location:/'));
        }

        $map['uid']   = $user['bh'];
        $map['type']  = 2;
        $map['yeard'] = date('Y');

        if ($type == 1) {
            $map['status'] = 1;
        } elseif ($type == 2) {
            $map['status']   = 1;
            $map['is_apply'] = 1;
        } elseif ($type == 3) {
            $map['yeard'] = array('<', date('Y'));
        }

        $list = table('cqks_credit', false)->where($map)->find('array');

        $this->assign('type', (int) $type);
        $this->assign('list', $list);
        $this->show('/user/credit_2');
    }
}
