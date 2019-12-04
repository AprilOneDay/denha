<?php
namespace app\admin\finance;

use app\admin\Init;
use denha\Pages;

class Orders extends Init
{
    public function lists()
    {

        $param    = get('param', 'text');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        // 获取查询参数
        list($map, $search) = $this->getMap();

        $lists = table('FinanceLog')->where($map)->limit($offer, $pageSize)->order('id desc')->select();

        $total = table('FinanceLog')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $search));

        foreach ($lists as $key => $value) {

            $user = dao('User')->getInfo($value['uid'], 'nickname,uid');

            $lists[$key]['user'] = $user;
        }

        $others = [
            'typeCopy'        => getVar('admin.finance.type'),
            'issueStatusCopy' => getVar('admin.finance.issue_status'),
        ];

        $this->show('', [
            'lists'  => $lists,
            'others' => $others,
            'param'  => $param,
            'search' => $search,
            'pages'  => $page->loadConsole(),
        ]);
    }

    /** 导出 */
    public function excel()
    {

        // 获取查询参数
        $map   = $this->getMap()[0];
        $list  = table('FinanceLog')->where($map)->order('id desc')->select();
        $total = table('FinanceLog')->where($map)->count();

        foreach ($list as $key => $value) {
            $user               = dao('User')->getInfo($value['uid'], 'nickname,uid');
            $list[$key]['user'] = $user;
        }

        $other = array(
            'typeCopy'        => getVar('admin.finance.type'),
            'issueStatusCopy' => getVar('admin.finance.issue_status'),
        );

        $filename = 'finance_orders' . time();
        header("Content-type:application/vnd.ms-excel");
        header("Content-Disposition:attachment;filename=$filename.xls");

        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->show();
    }

    /** 获取查询参数 */
    private function getMap()
    {
        $param  = get('param', 'text');
        $search = [];
        $map    = [];

        if (!empty($param['type'])) {
            $search['param[type]'] = $map['type'] = $param['type'];
        }

        if (!empty($param['issue_status'])) {
            $search['param[issue_status]'] = $map['issue_status'] = $param['issue_status'];
        }

        if (!empty($param['field']) && !empty($param['keyword'])) {

            $search['param[field]']   = $param['field'];
            $search['param[keyword]'] = $param['keyword'];

            if ($param['field'] == 'pay_sn' || $param['field'] == 'order_sn') {
                $map[$param['field']] = $param['keyword'];
            }
        }

        if (!empty($param['start_time']) || !empty($param['end_time'])) {
            $search['param[start_time]'] = $startTime = get('param.start_time', 'time', '');
            $search['param[end_time]']   = $endTime   = get('param.end_time', 'time', '');

            if ($param['start_time'] && $param['end_time']) {
                $map['created'] = ['between', [$startTime, $endTime]];
            } elseif ($param['start_time']) {
                $map['created'] = ['>=', $startTime];
            } elseif ($param['end_time']) {
                $map['created'] = ['<=', $endTime];
            }
        }

        $map['is_pay'] = 1;
        //$map['is_lock'] = 1;

        return [$map, $search];
    }
}
