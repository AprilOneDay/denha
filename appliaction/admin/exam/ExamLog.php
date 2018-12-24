<?php
/**
 * 试卷模块管理
 */
namespace app\admin\exam;

use app\admin\Init;
use denha\Pages;

class ExamLog extends Init
{
    public function lists()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map   = [];
        $param = [];

        $list  = table('ExamLog')->where($map)->limit($offer, $pageSize)->order('score desc')->select();
        $total = table('ExamLog')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $list = array_map(function ($value) {
            $value['exam']        = $value['exam_name'] ? $value['exam_name'] : '考试活动';
            $value['user']        = dao('User')->getInfo($value['uid'], 'nickname,real_name,mobile,address');
            $value['use_time']    = dao('Time')->diffDate($value['start_time'], $value['end_time']);
            $value['total_score'] = 120;
            return $value;
        }, $list);

        $other = array(
            'statusCopy' => [0 => '关闭', 1 => '开启'],
            'timeCopy'   => getVar('time', 'admin.sys'),
        );

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('other', $other);

        $this->show();
    }

    /** 导出 */
    public function expect()
    {
        $title    = get('title', 'text', '');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 50);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        if ($pageNo == 1) {
            session('exam_log_list', null);
        }

        $data = session('exam_log_list') ? session('exam_log_list') : [];

        $map = array();
        if ($title) {
            $map['exam_name'] = $title;
        }

        $field = 'id,uid,score,start_time,end_time,answer_log';

        $list  = table('ExamLog')->where($map)->field($field)->limit($offer, $pageSize)->order('score desc')->select();
        $total = table('ExamLog')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
            $value['user']        = dao('User')->getInfo($value['uid'], 'nickname,real_name,mobile,address,username');
            $value['use_time']    = dao('Time')->diffDate($value['start_time'], $value['end_time'], 1);
            $value['total_score'] = 120;
            $answerLog            = json_decode($value['answer_log'], true);

            $answeList = [];
            foreach ($answerLog as $v) {
                if ($v['origin'] == 1) {
                    if (!in_array($v['id'], $answeList)) {
                        array_push($answeList, $v['id']);
                    }

                    // 获取题目答案
                    $answer                       = dao('Exam')->getExamDataAnswer($v['id']);
                    $answerTitle                  = table('ExamData')->where('id', $v['id'])->value('title');
                    $value['answerLog'][$v['id']] = [
                        'answer'    => $answer == $v['answer'] ? '答对' : '答错',
                        'title'     => $answerTitle,
                        'answerKey' => $v['answer'],
                    ];
                    $value['count'] = max(count($value['answerLog']) + 1, 1);
                }
            }

            unset($value['answer_log']);
            $data[] = $value;
        }

        // $this->assign('list', $data);
        // $this->show();
        // die;
        // print_r($data);die;

        session('exam_log_list', $data);

        //if ($pageNo == 3) {
        if ($pageSize * $pageNo >= $total) {

            $filename = 'finance_orders' . time();
            header("Content-type:application/vnd.ms-excel");
            header("Content-Disposition:attachment;filename=$filename.xls");

            $this->assign('list', $data);
            $this->show();
        } else {

            header("Content-type:text/html;charset=utf-8");
            echo '进度 ' . ($pageSize * $pageNo) . '/' . $total . ' 3秒后更新下一批数据';
            header("Refresh:3;url=" . url('expect', array('pageNo' => $pageNo + 1, 'title' => urlencode($title))));
        }

    }
}
