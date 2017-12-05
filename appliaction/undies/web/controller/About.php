<?php
/**
 * 广告图模块
 */
namespace app\undies\web\controller;

use app\undies\web\controller\Init;
use denha\controller;

class About extends Init
{
    public function detail()
    {
        $columnId = get('cid', 'intval', 0);
        $id       = get('id', 'intval', 0);

        if ($columnId) {
            $map['column_id'] = $columnId;
        }

        if ($id) {
            $map['id'] = $id;
        }

        $data = dao('Article')->getRowContent($map, 'id,title,btitle,created,thumb,description,description_en,content,content_en', 1);

        $menus = array();

        if ($this->thisColumn['parentid']) {
            $map             = array();
            $map['web_type'] = 2;
            $map['parentid'] = $this->thisColumn['parentid'];
            $menus           = dao('Column', 'undies')->getList($map, 'id,thumb,name,bname,parentid,jump_url');
        }

        //var_dump($this->thisColumn);

        $this->assign('menus', $menus);
        $this->assign('data', $data);

        $this->show();
    }
}
