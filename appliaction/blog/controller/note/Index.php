<?php
namespace app\blog\controller\note;

use denha\Controller;
use denha\Pages;

class Index extends Controller
{
    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 0);
        $tag      = get('tag', 'intval', 0);
        $keyword  = get('keyword', 'text', '');
        $pageSize = 10;

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['is_show'] = 1;

        if ($tag) {
            $map['tag'] = $tag;
        }

        if ($keyword) {
            $map['title'] = array('like', '%' . $keyword . '%');
            //增加搜索记录
            dao('Search')->addLog(0, 1, $keyword);
        }

        $total = table('Article')->where($map)->count();
        $pages = new Pages($total, $pageNo, $pageSize, url('index'));

        $field = 'id,tag,title,thumb,description,created,hot';
        $list  = table('Article')->where($map)->field($field)->limit($offer, $pageSize)->order('id desc')->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['comment'] = (int) table('VisitorComment')->where(array('goods_id' => $value['id']))->count();
        }

        $class = table('Article')->where(array('is_show' => 1))->field('count(*) as num,tag')->group('tag')->find('array');
        foreach ($class as $key => $value) {
            $listClass[$value['tag']] = $value;
        }

        $this->assign('keyword', $keyword);
        $this->assign('listClass', $listClass);
        $this->assign('tagCopy', getVar('tags', 'admin.article'));
        $this->assign('randList', $this->rank());
        $this->assign('page', $pages->loadPc());
        $this->assign('list', $list);
        $this->show();
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

        var_dump($content);
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
