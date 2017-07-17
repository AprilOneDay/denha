<?php
namespace Controller\Pc;

class Doctor extends Init
{
    public function index()
    {
        $catid = get('catid', 'intval', 0);
        if (!$catid) {
            die('参数错误');
        }
        $topCatid = table('category')->where(array('catid' => $catid))->field('parentid')->find('one');

        $templateList = $this->checkedCatid();
        $ys           = table('ys')->tableName();
        $yd           = table('ys_data')->tableName();
        $field        = "$ys.id,$ys.title,$ys.thumb,$ys.zc,$yd.keshi,$yd.like";
        $doctorList   = table('ys')->join($yd, "$yd.id = $ys.id", 'left')->where(array($yd . '.hospital' => $topCatid))->field($field)->find('array');

        $keshi = table('ys_data')->where(array('hospital' => $topCatid))->group('keshi')->field('keshi')->find('one', true);

        foreach ($keshi as $key => $value) {
            foreach ($doctorList as $k => $v) {
                if (in_array($value, $v)) {
                    $doctor[$value][$v['id']] = $v;
                }
            }
        }

        $week = date('w');
        for ($i = 0; $i < 7; $i++) {
            $time = $week == 6 ? 7 : $week + 1;

            $weekArray[$i]['zh']   = $this->week($week);
            $weekArray[$i]['data'] = date('m-d', strtotime("+$i day"));
            $weekArray[$i]['unix'] = strtotime(date('Y-m-d', strtotime("+$i day")));
            $weekArray[$i]['time'] = array($time . '1', $time . '2', $time . '3');

            $week == 6 ? $week = 0 : $week++;
        }

        $this->assign('catid', $catid);
        $this->assign('keshi', $keshi);
        $this->assign('doctor', $doctor);
        $this->assign('week', $weekArray);
        switch ($templateList) {
            case 'default':
                $this->show('/pc/doctor/index');
                break;
            default:
                break;
        }
    }

    public function detail()
    {
        $id    = get('id', 'intval', 0);
        $catid = get('catid', 'intval', 0);
        if (!$catid || !$id) {
            die('参数错误');
        }
        $topCatid     = table('category')->where(array('catid' => $catid))->field('parentid')->find('one');
        $templateList = $this->checkedCatid();

        $doctor         = table('ys')->where(array('id' => $id))->field('id,title,thumb,zc')->find();
        $doctor['data'] = table('ys_data')->where(array('id' => $id))->field('content,`like`,keshi')->find();
        $ysTime         = table('ys_time')->where(array('ys_id' => $id))->find('array');
        if ($ysTime) {
            foreach ($ysTime as $key => $value) {
                $doctorTime[$value['time']] = $value;
            }
        }
        $doctor['time'] = (array) $doctorTime;

        $week = date('w');
        for ($i = 0; $i < 7; $i++) {
            $time = $week == 6 ? 7 : $week + 1;

            $weekArray[$i]['zh']   = $this->week($week);
            $weekArray[$i]['data'] = date('m-d', strtotime("+$i day"));
            $weekArray[$i]['unix'] = strtotime(date('Y-m-d', strtotime("+$i day")));
            $weekArray[$i]['time'] = array($time . '1', $time . '2', $time . '3');

            $week == 6 ? $week = 0 : $week++;
        }

        //最新预约信息
        $to        = table('orders')->tableName();
        $td        = table('orders_doctor')->tableName();
        $ordersTop = table('orders')->join($td, "$to.order_sn = $td.order_sn", 'left')->field("$to.name,$td.time_copy")->order("$to.created desc")->limit('0,8')->find('array');
        foreach ($ordersTop as $key => $value) {
            $ordersTop[$key]['name'] = substr($value['name'], 0, 3) . '**';
        }

        $this->assign('catid', $catid);
        $this->assign('doctor', $doctor);
        $this->assign('week', $weekArray);
        $this->assign('ordersTop', $ordersTop);
        switch ($templateList) {
            case 'default':
                $this->show('/pc/doctor/detail');
                break;
            default:
                break;
        }
    }

    public function orderIndex()
    {
        $catid = get('catid', 'intval', 0);
        $id    = get('id', 'intval', 0); //ys_time主键
        $time  = get('time', 'trim'); //时间戳
        if (!$id || !$time) {
            die('参数错误');
        }

        $weekCopy = array(
            '11' => '星期一 上午', '12' => '星期一 下午', '13' => '星期一 晚上',
            '21' => '星期二 上午', '22' => '星期二 下午', '23' => '星期二 晚上',
            '31' => '星期三 上午', '32' => '星期三 下午', '33' => '星期三 晚上',
            '41' => '星期四 上午', '42' => '星期四 下午', '43' => '星期四 晚上',
            '51' => '星期五 上午', '52' => '星期五 下午', '53' => '星期五 晚上',
            '61' => '星期六 上午', '62' => '星期六 下午', '63' => '星期六 晚上',
            '71' => '星期日 上午', '72' => '星期日 下午', '73' => '星期日 晚上',
        );

        $data                    = table('ys_time')->where(array('id' => $id))->field('id,ys_id,time,stock')->find();
        $data['time']            = date('Y-m-d', $time) . ' ' . $weekCopy[$data['time']];
        $data['unix']            = $time;
        $data['doctor']          = table('ys')->where(array('id' => $data['ys_id']))->field('title,price')->find();
        $data['doctor']['keshi'] = table('ys_data')->where(array('id' => $data['ys_id']))->field('keshi')->find('one');

        //获取所选模板
        $templateList = $this->checkedCatid();
        $this->assign('catid', $catid);
        $this->assign('data', $data);
        switch ($templateList) {
            case 'default':
                $this->show('/pc/doctor/order_index');
                break;
            default:
                break;
        }
    }

    public function saveOrder()
    {
        $catid        = get('catid', 'intval', 0);
        $ysTimeId     = get('ys_time_id', 'intval', 0);
        $timeCopy     = get('time_copy', 'trim');
        $guahaoTime   = get('guahao_time', 'trim');
        $address      = get('address', 'text');
        $name         = get('name', 'text');
        $mobile       = get('mobile', 'text');
        $code         = substr(get('code', 'text'), 0, 18);
        $verification = get('verification', 'text');

        if (!$ysTimeId || !$guahaoTime || !$timeCopy) {
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

        $ysTime = table('ys_time')->where(array('id' => $ysTimeId))->field('id,ys_id,time,stock')->find();
        if (!$ysTime) {
            $this->ajaxReturn(array('status' => false, 'msg' => '预约失败,请刷新重试'));
        }

        //判断是否超出库存
        $to = table('orders')->tableName();
        $td = table('orders_doctor')->tableName();

        $map[$to . '.status']      = 1;
        $map[$td . '.guahao_time'] = $guahaoTime;
        $map[$td . '.guahao_type'] = $ysTime['time'];

        $stock = table('orders')->join($td, "$to.order_sn = $td.order_sn", 'left')->where($map)->count();
        if ($stock >= $ysTime['stock']) {
            $this->ajaxReturn(array('status' => false, 'msg' => '预约已满,请选择其他时段'));
        }

        //防止重复预约
        $map[$to . '.code'] = $code;
        $isOrders           = table('orders')->join($td, "$to.order_sn = $td.order_sn", 'left')->where($map)->field("$to.id")->find('one');
        if ($isOrders) {
            $this->ajaxReturn(array('status' => false, 'msg' => '该时间段您已预约,请勿重复预约'));
        }

        $doctor = table('ys')->where(array('id' => $ysTime['ys_id']))->field('title,price')->find();
        if (!$doctor) {
            $this->ajaxReturn(array('status' => false, 'msg' => '未查询到相关医生信息,请刷新重试'));
        }

        $doctorData = table('ys_data')->where(array('id' => $ysTime['ys_id']))->field('keshi,hospital')->find();
        if (!$doctorData) {
            $this->ajaxReturn(array('status' => false, 'msg' => '未查询到相关医院信息,请刷新重试'));
        }
        //医院名称
        $hospital = table('category')->where(array('catid' => $doctorData['hospital']))->field('catname')->find('one');

        //取微秒
        $orderSn = date('Ymd') . substr(implode(null, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);

        $data['order_sn'] = $orderSn;
        $data['title']    = $doctor['title'];
        $data['amount']   = $doctor['price'];
        $data['mobile']   = $mobile;
        $data['name']     = $name;
        $data['code']     = $code;
        $data['created']  = time();
        $data['type']     = 2;

        $dataInfo['order_sn']    = $orderSn;
        $dataInfo['ys_time_id']  = $ysTimeId;
        $dataInfo['address']     = $address;
        $dataInfo['guahao_time'] = $guahaoTime;
        $dataInfo['time_copy']   = $timeCopy;
        $dataInfo['hospital']    = $hospital;
        $dataInfo['doctor']      = $doctor['title'];
        $dataInfo['keshi']       = $doctorData['keshi'];
        $dataInfo['guahao_type'] = $ysTime['time'];

        $reslut = table('orders')->add($data);
        if ($reslut) {
            table('orders_doctor')->add($dataInfo);
        }

        $this->ajaxReturn(array('status' => true, 'msg' => '提交成功', 'data' => array('order_sn' => $orderSn, 'catid' => $catid)));
    }

    public function week($week)
    {
        switch ($week) {
            case 1:
                return '星期一';
                break;
            case 2:
                return '星期二';
                break;
            case 3:
                return '星期三';
                break;
            case 4:
                return '星期四';
                break;
            case 5:
                return '星期五';
                break;
            case 6:
                return '星期六';
                break;
            case 0:
                return '星期日';
                break;
            default:;
        };
    }
}
