<?php
/**
 * 在线考试管理
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
        $userWork        = table('UserWork')->where($map)->field('exam_id')->order('start_time desc')->find();

        $data = array();

        if ($userWork) {
            $map               = array();
            $map['id']         = $userWork['exam_id'];
            $map['status']     = 1;
            $map['del_status'] = 0;

            $exam = table('ExamList')->where($map)->find();
            if ($exam) {
                $data         = $exam;
                $data['list'] = table('ExamData')->where('exam_id', $userWork['exam_id'])->order('sort asc,id asc')->find('array');
            }

        }

        $other = array(
            'letter'   => array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'),
            'typeCopy' => array('1' => '单选', '2' => '多选', '3' => '问答'),
        );

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 记录考试结果 */
    public function questionPost()
    {
        $examId = post('exam_id', 'intval', 0);
        $answer = post('answer');

        $result = dao('Exam')->userExamEnd($this->uid, $examId, $answer);

        $this->appReturn($result);
    }

    /** 记录考试记录 */
    public function examStart()
    {
        $examId = post('exam_id', 'intval', 0);
        if (!$examId) {
            $this->appReturn(array('status' => false, 'msg' => '未获取到考试信息,请联系管理员'));
        }

        dao('Exam')->userExamStart($this->uid, $examId);
        $this->appReturn(array('status' => true, 'msg' => '记录成功'));
    }

}
