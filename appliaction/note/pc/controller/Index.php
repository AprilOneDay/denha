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

        $data['fliesList'] = table('NoteFiles')->where($map)->field('id,name')->order('sort asc')->find('array');

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

        $this->appReturn(array('msg' => '操作成功'));
    }

    /**
     * 博客详情
     * @date   2017-09-28T17:05:15+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detail()
    {
        $id = get('id', 'intval', 0);

        $this->assign('data', $data);
        $this->show();
    }

    public function detailPost()
    {
        $id = get('id', 'intval', 0);

        $content = post('content', 'text', '');

        $data['uid']     = $this->uid;
        $data['title']   = '新建文档';
        $data['content'] = $content;
        $data['created'] = TIME;

        if ($id) {
            $map        = array();
            $map['uid'] = $this->uid;
            $map['id']  = $id;
            $result     = table('NoteData')->where($map)->save($data);
        } else {
            $result = table('NoteData')->add($data);
        }

        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->appReturn(array('msg' => '操作成功'));
    }

    /**
     * 排行榜
     * @date   2017-09-28T17:05:24+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    private function rank()
    {
        $map['is_show']      = 1;
        $map['is_recommend'] = 1;

        $field = 'id,title';
        $list  = table('Article')->where($map)->field($field)->limit(0, 10)->find('array');

        return $list;
    }
}
