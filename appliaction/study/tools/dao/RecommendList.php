<?php
/**
 * 提示消息管理
 */
namespace app\study\tools\dao;

use app\study\controller\Init;

class RecommendList extends Init
{
    //热门评论
    public function hotList()
    {
        $map                 = array();
        $map['column_id']    = array('in', '23,24,25');
        $map['is_recommend'] = 1;
        $map['is_review']    = 1;
        $data                = dao('Article')->getList($map, 'title,id,column_id', 1, 5);

        return $data;
    }

    //推荐列表
    public function recommendList()
    {
        //推荐列表
        $data = dao('Article')->getList(array('is_recommend' => 1, 'is_show' => 1), '', 3);
        if ($data['list']) {
            foreach ($data['list'] as $key => $value) {
                $data['list'][$key]['thumb']                = $this->appImg($value['thumb'], 'article');
                $data['list'][$key]['characteristics_copy'] = (array) dao('Category')->getName($value['characteristics'], $this->lg);
            }
        }

        return $data;
    }
}
