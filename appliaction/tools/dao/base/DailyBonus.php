<?php
/**
 * 每日签到模块
 */
namespace dao\base;

class DailyBonus
{

    /**
     * 增加签到记录
     * @date   2019-04-17T11:17:35+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid     [description]
     * @param  array                    $options [description]
     */
    public function add($uid, $options = [])
    {

        if (!$this->check($uid)) {
            return ['status' => false, 'msg' => '您已签到了'];
        }

        // 开启事务
        table('UserDailyBonus')->startTrans();

        $data['uid']     = $uid;
        $data['created'] = TIME;

        $result = table('UserDailyBonus')->add($data);

        if ($result === false) {
            table('UserDailyBonus')->rollback();
            return ['status' => false, 'msg' => '签到失败'];
        }

        // 检查是否连续签到
        if ($this->checkIsContinued($uid)) {
            // 增加连续签到天数
            $data = array('daily_bonus_days' => ['add', 1]);
        } else {
            $data = array('daily_bonus_days' => 1);
        }

        $result = table('User')->where('uid', $uid)->save($data);
        if ($result === false) {
            table('UserDailyBonus')->rollback();
            return ['status' => false, 'msg' => '连续签到存储失败,请联系管理员'];
        }

        table('UserDailyBonus')->commit();

        return ['status' => true, 'msg' => '签到成功'];

    }

    // 清除连续签到天数
    public function checkIsContinued($uid)
    {
        // 连续签到天数
        $days = (int) table('User')->where('uid', $uid)->value('daily_bonus_days');

        /** 连续签到天数为1天 并且是今天签到 不清除天数 */
        // 连续签到天数为1天
        if ($days == 1) {
            // 今天是否有签到记录
            $startTime = strtotime(date('Y-m-d', TIME) . ' 00:00:00');
            $endTime   = strtotime(date('Y-m-d', TIME) . ' 23:59:59');

            $map            = [];
            $map['uid']     = $uid;
            $map['created'] = ['between', [$startTime, $endTime]];

            $count = (int) table('UserDailyBonus')->where($map)->count();
            if ($count == 1) {
                return true;
            }
        }

        /** 昨天存在签到记录 不清除天数 */
        // 昨天是否有签到记录
        $startTime = strtotime(date('Y-m-d', strtotime('-1 day')) . ' 00:00:00');
        $endTime   = strtotime(date('Y-m-d', strtotime('-1 day')) . ' 23:59:59');

        $map            = [];
        $map['uid']     = $uid;
        $map['created'] = ['between', [$startTime, $endTime]];

        $count = (int) table('UserDailyBonus')->where($map)->count();
        if ($count) {
            return true;
        }

        return false;

    }

    /** 检测是否可以签到 */
    public function check($uid)
    {
        $map            = [];
        $map['uid']     = $uid;
        $map['created'] = ['between', [strtotime(date('Y-m-d', TIME) . ' 00:00:00'), strtotime(date('Y-m-d', TIME) . ' 23:59:59')]];

        $count = (int) table('UserDailyBonus')->where($map)->count();

        return $count ? false : true;
    }

    // 获取范围签到天数
    public function count($uid, $type = 'month')
    {

        $map        = [];
        $map['uid'] = $uid;

        switch ($type) {
            // 按月份统计
            case 'month':
                $countDay       = date('t', TIME);
                $startTime      = strtotime(date('Y-m', TIME) . '-01 00:00:00');
                $endTime        = strtotime(date('Y-m', TIME) . '-' . date('t') . ' 23:59:59');
                $map['created'] = ['between', [$startTime, $endTime]];
                break;
            // 获取全部签到天数
            case 'all':
                $countDay = 0;
                break;
            default:
                # code...
                break;
        }

        $count = (int) table('UserDailyBonus')->where($map)->count();

        // 当前范围天数 范围内签到天数
        return [$countDay, $count];

    }
}
