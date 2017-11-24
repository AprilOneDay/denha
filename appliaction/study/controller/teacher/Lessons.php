<?php
/**
 * 课程管理
 */
namespace app\study\controller\teacher;

class Lessons extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 5);
        $type     = get('type', 'intval', 0);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $tucl = table('UserClassroomLog')->tableName();
        $ta   = table('Article')->tableName();
        $tac  = table('ArticleCourse')->tableName();

        $map[$tucl . '.uid'] = $this->uid;

        if ($type) {
            $map[$tac . '.teacher_hour_type'] = $type;
        }

        $field = "$ta.id,$ta.title,$ta.title,$ta.btitle,$ta.thumb,$tac.class_type,$tucl.course_id";

        $list = table('UserClassroomLog')->join($tac, "$tucl.goods_id = $tac.id")->join($ta, "$ta.id = $tac.id")->where($map)->field($field)->find('array');

        foreach ($list as $key => $value) {
            $list[$key]['thumb']     = $this->appImg($value['thumb'], 'article');
            $list[$key]['courseLog'] = table('UserCourseLog')->where('id', $id)->find();

        }

        $total = table('UserClassroomLog')->join($tac, "$tucl.goods_id = $tac.id")->join($ta, "$ta.id = $tac.id")->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url(''));

        //获取课时类型
        //$typeList = table('UserClassroomLog')->join($tac, "$tucl.goods_id = $tac.id")->field("distinct $tac.teacher_hour_type")->find('array');

        $other = array(
            'classTypeCopy' => array(
                '1' => '一对一',
                '2' => '一对多',
            ),
            'lessonType'    => dao('Category')->getList(74),
        );

        $this->assign('other', $other);
        $this->assign('list', $list);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
