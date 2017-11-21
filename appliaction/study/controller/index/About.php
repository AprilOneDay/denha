<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\index;

class About extends \app\study\controller\Init
{

    public function index()
    {

        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'thumb,description,description_en,content,content_en', 1);

        $map['column_id'] = 11;
        $contact          = dao('Article')->getRowContent($map, 'description,description_en,content,content_en', 1);

        $columnList = table('Column')->where('parentid', 5)->field('name,bname')->find('array');

        $this->assign('about', $about);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function inquiry()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function news()
    {
        $list = table('Article')->where('column_id', 21)->field('title,btitle,thumb,id,description,description_en,publish_time')->find('array');
        $this->assign('list', $list);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);

    }

    public function detail()
    {
        $id        = get('id', 'intval', 0);
        $map['id'] = $id;

        $data = dao('Article')->getRowContent($map, 'id,hot,publish_time,title,btitle,content,content_en', 1);

        //推荐列表
        $data['remmondList'] = dao('RecommendList', 'study')->recommendList();
        //热门话题
        $data['hotList'] = dao('RecommendList', 'study')->hotList();

        //增加浏览记录
        table('Article')->where('id', $id)->save(array('hot' => array('add', 1)));

        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
