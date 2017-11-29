<?php
/**
 * 日历管理
 */
namespace app\study\controller\user;

use app\study\controller\Init;

class Exam extends Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function index()
    {
        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'description,description_en', 1);

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function question()
    {
        $map['type'] = 3;
        //获取购买的课程id
        $goodsIdArray    = dao('Orders', 'study')->getPayGoodsId($this->uid);
        $map['goods_id'] = array('in', $goodsIdArray);

        $userWork = table('UserWork')->where($map)->field('exam_id')->order('start_time desc')->find();

        $data = array();

        if ($userWork) {
            $map               = array();
            $map['id']         = $userWork['exam_id'];
            $map['status']     = 1;
            $map['del_status'] = 0;

            $exam = table('ExamList')->where($map)->find();
            if ($exam) {
                $data         = $exam;
                $data['list'] = table('ExamData')->where('exam_id', $userWork['exam_id'])->find('array');
            }

        }

        $other = array(
            'letter' => array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'),
        );

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
