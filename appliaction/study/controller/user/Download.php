<?php
/**
 * 下载管理
 */
namespace app\study\controller\user;

use \app\study\controller\Init;

class Download extends Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function index()
    {
        $pageNo   = max(get('pageNo', 'intval', 0), 1);
        $pageSize = 10;

        $map['column_id'] = 28;
        $map['is_show']   = 1;

        $list = dao('Article')->getList($map, 'id,title,btitle,description,description_en,down_url', 4, $pageSize, $pageNo);
        $page = new \denha\Pages($list['total'], $pageNo, $pageSize, url(''));

        if ($list['list']) {
            foreach ($list['list'] as $key => $value) {
                $list['list'][$key]['url'] = explode(',', $value['down_url']);
            }
        }

        $this->assign('list', $list['list']);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
