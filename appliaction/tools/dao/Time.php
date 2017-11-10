<?php
/**
 * 时间处理模块
 */
namespace app\tools\dao;

class Time
{
    /**
     * 判断活动时间
     * @date   2017-09-27T12:06:33+0800
     * @author ChenMingjiang
     * @param  [type]                   $startTime [开始时间戳]
     * @param  [type]                   $endTime   [结束时间戳]
     * @return [type]                              [description]
     */
    public function hdStatus($startTime = 0, $endTime = 0)
    {
        //未开始
        $status = 1;
        //进行中
        if ($startTime >= TIME) {
            $status = 0;
        }
        //已结束
        elseif ($endTime <= TIME) {
            $status = 2;
        }

        return $status;
    }

    /**
     * 万年历
     * @date   2017-11-10T16:26:13+0800
     * @author ChenMingjiang
     * @param  [type]                   $year  [description]
     * @param  [type]                   $month [description]
     * @return [type]                          [description]
     */
    public function calendar($year, $month)
    {

        //获取当前月有多少天
        $days = date('t', strtotime("{$year}-{$month}-1"));
        //获取上月天数
        //$perDays = date('t', strtotime("{$year}-{" . ($month - 1) . "}-1"));
        //当前1号是星期几
        $week = date('w', strtotime("{$year}-{$month}-1"));

        $tmpDay = 1;
        for ($i = 0; $i < 7; $i++) {
            if ($i == $week) {
                $weekArray[0][$i] = $tmpDay;
                $week++;
                $tmpDay++;
            } else {
                $weekArray[0][$i] = '';
            }

        }

        $tmpDay = 0;
        $row    = 1;
        $i      = count(array_filter($weekArray[0])) + 1;
        for (; $i <= $days; $i++) {
            $tmpDay = $tmpDay == 7 ? 0 : $tmpDay;

            $weekArray[$row][$tmpDay] = $i;

            $tmpDay++;
            if ($tmpDay == 7) {
                $row++;
            }
        }

        if (count(end($weekArray)) < 7) {
            for ($i = count(end($weekArray)); $i < 7; $i++) {
                $weekArray[count($weekArray) - 1][] = '';
            }
        }

        $data['month'] = $weekArray;
        $data['time']  = array('year' => $year, 'month' => $month);
        if ($month != 1 && $month != 12) {
            $data['up']   = array('year' => $year, 'month' => $month - 1);
            $data['down'] = array('year' => $year, 'month' => $month + 1);
        } else {
            if ($month == 12) {
                $data['up']   = array('year' => $year, 'month' => $month - 1);
                $data['down'] = array('year' => $year + 1, 'month' => $month + 1);
            } elseif ($month == 1) {
                $data['up']   = array('year' => $year - 1, 'month' => 12);
                $data['down'] = array('year' => $year + 1, 'month' => $month + 1);
            }
        }

        return $data;
    }
}
