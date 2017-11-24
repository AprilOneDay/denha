<?php
/**
 * 车友圈模块
 */
namespace app\admin\controller\content;

use app\admin\controller\Init;
use denha\Pages;

class Exam extends Init
{
    public function lists()
    {

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $param['field'] ?: $param['field'] = 'title';

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map               = array();
        $map['del_status'] = 0;

        $list  = table('ExamList')->where($map)->limit($offer, $pageSize)->order('id desc')->find('array');
        $total = table('ExamList')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
            $list[$key]['thumb'] = 'http://qr.liantu.com/api.php?text=' . URL . $value['apk_url'] . '&w=200&h=200';
        }

        $other = array(
            'tag'             => getVar('tags', 'admin.article'),
            'isShowCopy'      => array(0 => '隐藏', 1 => '显示'),
            'isRecommendCopy' => array(1 => '推荐', 0 => '不推荐'),
        );

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('other', $other);

        $this->show();
    }
    public function editPost()
    {
        $id = get('id', 'intval', 0);

        $data = post('all');

        if (!$id) {
            $result = table('ExamList')->add($data);
            if (!$result) {
                $this->appReturn(array('status' => false, 'msg' => '添加失败'));
            }
        } else {
            $result = table('ExamList')->where('id', $id)->save($data);
            if (!$result) {
                $this->appReturn(array('status' => false, 'msg' => '修改失败'));
            }
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

    /** 编辑考卷 */
    public function edit()
    {
        $id = get('id', 'intval', 0);
        if ($id) {
            $data = table('ExamList')->where('id', $id)->find();
        } else {
            $data = array('sort' => 0, 'status' => 1);
        }

        $this->assign('data', $data);
        $this->show();
    }

    /** 题目列表 */
    public function QuestionList()
    {
        $id       = get('id', 'intval', 0);
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $param['field'] ?: $param['field'] = 'title';

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = array();

        $list  = table('AppVersion')->where($map)->limit($offer, $pageSize)->order('id desc')->find('array');
        $total = table('AppVersion')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
            $list[$key]['thumb'] = 'http://qr.liantu.com/api.php?text=' . URL . $value['apk_url'] . '&w=200&h=200';
        }

        $other = array(
            'tag'             => getVar('tags', 'admin.article'),
            'isShowCopy'      => array(0 => '隐藏', 1 => '显示'),
            'isRecommendCopy' => array(1 => '推荐', 0 => '不推荐'),
        );

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('other', $other);

        $this->show();
    }

    /** 编辑考题 */
    public function editQuestion()
    {
        $id = get('id', 'intval', 0);
        if ($id) {
            $data = table('ExamList')->where('id', $id)->find();
        } else {
            $data = array('sort' => 0, 'status' => 1);
        }

        $this->assign('data', $data);
        $this->show();
    }
}
