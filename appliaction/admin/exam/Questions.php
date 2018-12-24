<?php
/**
 * 考试题目模块管理
 */
namespace app\admin\exam;

use app\admin\Init;
use denha\Pages;

class Questions extends Init
{
    public function lists()
    {

        $id       = get('id', 'intval', 0);
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);
        $param    = get('param', 'text', '');

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = array();

        if (!empty($param['type'])) {
            $map['type'] = $param['type'];
        }

        if (!empty($param['category'])) {
            $map['category'] = $param['category'];
        }

        if (!empty($param['field']) && !empty($param['keyword'])) {
            if ($param['field'] == 'title') {
                $map['title'] = ['instr', $param['keyword']];
            }

        }

        $list  = table('ExamData')->where($map)->limit($offer, $pageSize)->order('id desc')->select();
        $total = table('ExamData')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $other = [
            'typeCopy'     => getVar('question_type', 'admin.exam'),
            'statusCopy'   => [0 => '关闭', 1 => '开启'],
            'categoryCopy' => dao('Category')->getList(1089),
        ];

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('other', $other);

        $this->show();
    }

    /** 编辑考题 */
    public function edit()
    {
        $id = get('id', 'intval', 0);
        if ($id) {
            $data            = table('ExamData')->where('id', $id)->find();
            $data['content'] = json_decode($data['content'], true);
        } else {
            $data = ['sort' => 0, 'status' => 1, 'score' => 0];
        }

        $other = array(
            'typeCopy'     => getVar('question_type', 'admin.exam'),
            'statusCopy'   => [0 => '关闭', 1 => '开启'],
            'categoryCopy' => dao('Category')->getList(1089),
        );

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show();
    }

    /** 编辑考题操作 */
    public function editPost()
    {
        $id              = get('id', 'intval', 0);
        $data['exam_id'] = get('exam_id', 'intval', 0);

        $data['title']    = post('title', 'text', '');
        $data['type']     = post('type', 'intval', 0);
        $data['score']    = post('score', 'intval', 0);
        $data['sort']     = post('sort', 'intval', 0);
        $data['category'] = post('category', 'intval', 0);
        $data['ablum']    = post('ablum', 'img', '');

        $other = post('other');

        if (!$data['title']) {
            $this->appReturn(['status' => false, 'msg' => '请输入考题']);
        }

        if (!$data['type']) {
            $this->appReturn(['status' => false, 'msg' => '请选择答案类型']);
        }

        $tmpContent  = null;
        $isAnswerNum = 0;
        foreach ($other['answer'] as $key => $value) {
            if ($value) {
                $isAnswerNum  = $other['is_answer'][$key] ? $isAnswerNum + 1 : $isAnswerNum;
                $tmpContent[] = ['answer' => $value, 'is_answer' => $other['is_answer'][$key]];
            }
        }

        if (version_compare(PHP_VERSION, '5.4.0', '<')) {
            $str = json_encode($tmpContent);
            $str = preg_replace_callback(
                "#\\\u([0-9a-f]{4})#i",
                function ($matchs) {
                    return iconv('UCS-2BE', 'UTF-8', pack('H4', $matchs[1]));
                },
                $str
            );
            $data['content'] = $str;
        } else {
            $data['content'] = json_encode($tmpContent, JSON_UNESCAPED_UNICODE);
        }

        if (!$data['content']) {
            $this->appReturn(['status' => false, 'msg' => '请填写答案']);
        }

        if (($data['type'] == 1 || $data['type'] == 2)) {
            if (!$tmpContent) {
                $this->appReturn(['status' => false, 'msg' => '请输入答案']);
            }

            if (!$isAnswerNum) {
                $this->appReturn(['status' => false, 'msg' => '请勾选题目的正确答案']);
            }

            if ($data['type'] == 1 && $isAnswerNum > 1) {
                $this->appReturn(['status' => false, 'msg' => '【单选模式】只能选择一个正确答案']);
            }
        }

        if (!$id) {
            $result = table('ExamData')->add($data);
            if (!$result) {
                $this->appReturn(['status' => false, 'msg' => '添加失败']);
            }
        } else {
            $result = table('ExamData')->where('id', $id)->save($data);
            if (!$result) {
                $this->appReturn(['status' => false, 'msg' => '修改失败']);
            }
        }

        $this->appReturn(['status' => true, 'msg' => '操作成功']);

    }
}
