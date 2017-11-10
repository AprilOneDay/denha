<?php
/**
 * 课程详情
 */
namespace app\study\controller\index;

class Course extends \app\study\controller\Init
{
    public function detail()
    {
        $id = get('id', 'intval');

        $map['id']      = get('id', 'intval', 0);
        $map['is_show'] = 1;

        $data = dao('Article')->getRowContent($map, '', 3);
        if (!$data) {
            \denha\Log::error('信息不存在');
        }

        $this->assign('data', $data);
        $this->show('hight_school' . '/' . ACTION . $this->lg, false, false);
    }
}
