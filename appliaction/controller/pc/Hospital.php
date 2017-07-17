<?php
class Hospital extends Init
{

    public function index()
    {
        $catid  = get('catid', 'intval', 0);
        $pageNo = get('pageNo', 'intval', 1);

        $wifiCopy = array('1' => '免费', '2' => '收费', '3' => '无');
        $topCatid = table('category')->where(array('catid' => $catid))->field('parentid')->find('one');

        //获取所选模板
        $templateList = $this->checkedCatid();
        $room         = table('room')->tableName();
        $roomData     = table('room_data')->tableName();

        $field = "$room.id as id,$room.thumb,$room.description,$room.stock,$room.num,$room.room_type,$room.wifi,$room.floor,$room.bed,$room.price,$room.area,$room.title,$roomData.album";
        $list  = table('room')->join($roomData, "$room.id = $roomData.id", 'left')->where(array($roomData . '.hospital' => $topCatid))->field($field)->find('array');

        foreach ($list as $key => $value) {
            $list[$key]['album'] = json_decode($value['album'], true);
        }

        $this->assign('catid', $catid);
        $this->assign('list', $list);
        $this->assign('wifiCopy', $wifiCopy);

        switch ($templateList) {
            case 'default':
                $this->show('/pc/hospital/index');
                break;
            default:
                break;
        }
    }

    public function orderIndex()
    {
        $catid = get('catid', 'intval', 0);
        $id    = get('id', 'intval', 0);
        $time  = get('time', 'text', '');

        if (!$time) {
            die('时间错误');
        }

        if (!$id) {
            die('参数错误');
        }

        $data = table('room')->where(array('id' => $id))->find();
        //获取所选模板
        $templateList = $this->checkedCatid();
        $this->assign('catid', $catid);
        $this->assign('time', $time);
        $this->assign('data', $data);
        switch ($templateList) {
            case 'default':
                $this->show('/pc/hospital/order_index');
                break;
            default:
                break;
        }
    }

    public function saveOrder()
    {
        $catid        = get('catid', 'intval', 0);
        $id           = get('id', 'intval', 0);
        $time         = get('time', 'trim');
        $name         = get('name', 'text');
        $mobile       = get('mobile', 'text');
        $code         = get('code', 'text');
        $verification = get('verification', 'text');

        $timeArr = explode('to', $time);
        if (!$id || !$time) {
            die('参数错误');
        }

        if (!$name) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请填写姓名'));
        }

        if (!$mobile) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请填写手机号'));
        }

        if (!$verification) {
            $this->ajaxReturn(array('status' => false, 'msg' => '验证码错误'));
        }

        $room = table('room')->field('title,area,price,bed,wifi,num,floor')->where(array('id' => $id))->find();
        if (!$room) {
            $this->ajaxReturn(array('status' => false, 'msg' => '未查询到相关病房,请刷新重试'));
        }

        $roomData = table('room_data')->where(array('id' => $id))->field('keshi,hospital')->find();
        if (!$roomData) {
            $this->ajaxReturn(array('status' => false, 'msg' => '未查询到相关医院信息,请刷新重试'));
        }

        //医院名称
        $hospital = table('category')->where(array('catid' => $roomData['hospital']))->field('catname')->find('one');
        if (!$room) {
            $this->ajaxReturn(array('status' => false, 'msg' => '预约失败,请刷新重试'));
        }
        //取微秒
        $orderSn = date('Ymd') . substr(implode(null, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);

        $data['order_sn'] = $orderSn;
        $data['title']    = $room['title'];
        $data['amount']   = $room['price'];
        $data['mobile']   = $mobile;
        $data['name']     = $name;
        $data['code']     = $code;
        $data['created']  = time();
        $data['type']     = 1;

        $dataInfo['order_sn']   = $orderSn;
        $dataInfo['start_time'] = strtotime(trim($timeArr[0]));
        $dataInfo['end_time']   = strtotime(trim($timeArr[1]));
        $dataInfo['room_id']    = $id;
        $dataInfo['hospital']   = $hospital;
        $dataInfo['name']       = $room['title'];
        $dataInfo['area']       = $room['area'];
        $dataInfo['bed']        = $room['bed'];
        $dataInfo['wifi']       = $room['wifi'];
        $dataInfo['floor']      = $room['floor'];
        $dataInfo['day']        = round(($data['end_time'] - $data['start_time']) / 3600 / 24);

        $reslut = table('orders')->add($data);
        if ($reslut) {
            table('orders_room')->add($dataInfo);
        }

        $this->ajaxReturn(array('status' => true, 'msg' => '提交成功', 'data' => array('order_sn' => $orderSn, 'catid' => $catid)));
    }
}
