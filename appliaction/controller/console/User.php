<?php
namespace Controller;

class User extends base
{
    public function index()
    {
        $page = new page();

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);
        $keyword  = get('keyword', 'text', '');
        $field    = get('field', 'text', '');

        $offer = ($pageNo - 1) * $pageSize;

        $map['js'] = 0;
        if ($keyword && $field) {
            if ($field == 'sfz') {
                $map['sfz'] = $keyword;
            } elseif ($field == 'xm') {
                $map['xm'] = array('like', "%$keyword%");
            }
        }

        $list = table('cqks_yh', false)->where($map)->limit($offer, $pageSize)->find('array');

        $total = table('cqks_yh', false)->where($map)->count();
        $page->pages($total, $pageNo, $pageSize, '/frame/index.php?m=console&c=user&pageNo', 5);
        $loadPage = $page->loadConsole();

        $this->assign('field', $field);
        $this->assign('keyword', $keyword);
        $this->assign('list', $list);
        $this->assign('pages', $loadPage);
        $this->show('/console/user/index');
    }

    public function detail()
    {

    }
}
