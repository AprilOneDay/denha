<?php
/**
 * 分销提成模块
 */
namespace app\admin\finance;

use app\admin\Init;
use denha\Pages;

class DistributionCommission extends Init
{
    public function lists()
    {

        $param    = get('param', 'text');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $lists = table('DistributionCommission')->where($map)->limit($offer, $pageSize)->order('id desc')->select();

        $total = table('DistributionCommission')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $search));

        foreach ($lists as $key => $value) {

            $user = dao('User')->getInfo($value['uid'], 'nickname,uid');

            $lists[$key]['user'] = $user;
        }

        $others = [
            'statusCopy' => ['0' => '待审核', '1' => '通过审核', '2' => '驳回'],
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

        $param = get('param', 'text');

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
}
