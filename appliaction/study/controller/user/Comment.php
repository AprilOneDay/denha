<?php
/**
 * 评论管理
 */
namespace app\study\controller\user;

class Comment extends \app\study\controller\Init
{

    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /** 课程评论 */
    public function lessons()
    {
        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'description,description_en', 1);

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 论坛评论 */
    public function bbs()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 我的帖子 */
    public function myArticle()
    {

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
