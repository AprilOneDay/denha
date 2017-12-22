<?php
namespace app\note\pc\controller;

use app\note\pc\controller\Init;

class Index extends Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function index()
    {
        $map['uid'] = $this->uid;

        $data['fliesList'] = table('NoteFiles')->where($map)->field('id,name')->order('sort asc,id asc')->find('array');

        $data['user'] = dao('User')->getInfo($this->uid, 'nickname,uid');

        $this->assign('data', $data);

        $this->show();
    }

    public function content()
    {
        $keyword = get('keyword', 'text', '');
        $filesId = get('files_id', 'text', '');

        $map               = array();
        $map['uid']        = $this->uid;
        $map['del_status'] = 0;

        if ($filesId) {
            $map['files_id'] = $filesId;
        }

        if ($keyword) {
            $map['title'] = array('instr', $keyword);
        }

        $data['contentList'] = table('NoteData')->where($map)->field('id,title,content,modifyd,created')->find('array');

        foreach ($data['contentList'] as $key => $value) {
            $data['contentList'][$key]['listContent'] = explode(PHP_EOL, str_replace(' ', '', $value['content']));
        }

        $data['fiels'] = table('NoteFiles')->where('id', (int) $filesId)->field('id,name')->find();

        $this->assign('filesId', $filesId);
        $this->assign('data', $data);

        $this->show();
    }

    public function editFilePost()
    {
        $id = get('id', 'intval', 0);

        $name = post('name', 'text', '新建文件夹');

        $data['uid']     = $this->uid;
        $data['name']    = $name;
        $data['created'] = TIME;

        if ($id) {
            $map        = array();
            $map['uid'] = $this->uid;
            $map['id']  = $id;
            $result     = table('NoteFiles')->where($map)->save($data);
        } else {
            $result = table('NoteFiles')->add($data);
        }

        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->appReturn(array('msg' => '操作成功', 'data' => $result));
    }

    /**
     * 博客详情
     * @date   2017-09-28T17:05:15+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detail()
    {
        $id      = get('id', 'intval', 0);
        $filesId = get('files_id', 'intval', 0);

        if ($id) {
            $map['uid'] = $this->uid;
            $map['id']  = $id;
            $data       = table('NoteData')->where($map)->find();
        } else {
            $data = array('files_id' => $filesId);
        }

        $this->assign('data', $data);
        $this->show();
    }

    public function detailPost()
    {
        $id = get('id', 'intval', 0);

        $title   = post('title', 'text', '新建文件');
        $content = post('content', 'text', '');

        $data['uid']     = $this->uid;
        $data['title']   = '新建文档';
        $data['content'] = $content;
        $data['title']   = $title;

        if ($id) {

            $data['modifyd'] = TIME;

            $map        = array();
            $map['uid'] = $this->uid;
            $map['id']  = $id;
            $result     = table('NoteData')->where($map)->save($data);
        } else {
            $data['created'] = TIME;
            $data['modifyd'] = TIME;

            $result = table('NoteData')->add($data);
        }

        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->appReturn(array('msg' => '操作成功'));
    }

    public function delFiles()
    {
        $id = post('id', 'text', '');

        $map['uid'] = $this->uid;
        $map['id']  = array('in', $id);

        $result = table('NoteFiles')->where($map)->delete();
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->appReturn(array('msg' => '操作成功'));
    }

    public function delDocument()
    {
        $id = post('id', 'text', '');

        $map['uid'] = $this->uid;
        $map['id']  = array('in', $id);

        $result = table('NoteData')->where($map)->save('del_status', 1);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->appReturn(array('msg' => '操作成功'));

    }
}
