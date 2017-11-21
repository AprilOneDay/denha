<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\index;

class Index extends \app\study\controller\Init
{

    public function index()
    {

        //最新资讯
        $map['column_id'] = 21;
        $data['news']     = dao('Article')->getList($map, 'id,title,btitle,publish_time,thumb', 1, 5);

        //交流社区
        $map              = array();
        $map['column_id'] = 25;
        $map['is_review'] = 1;
        $data['bbs_1']    = dao('Article')->getList($map, 'uid,publish_time,comment_num,comment_time,comment_uid,title,btitle,created,thumb,column_id,id', 1, 3);
        if ($data['bbs_1']['list']) {
            foreach ($data['bbs_1']['list'] as $key => $value) {
                $data['bbs_1']['list'][$key]['user']              = dao('User')->getInfo($value['uid'], 'avatar,nickname');
                $data['bbs_1']['list'][$key]['publish_time_copy'] = dao('Time')->diffDate($value['publish_time'], TIME);
                $data['bbs_1']['list'][$key]['comment_time_copy'] = dao('Time')->diffDate($value['comment_time'], TIME);
                $data['bbs_1']['list'][$key]['comment_num']       = dao('Number')->million($value['comment_num']);
                $data['bbs_1']['list'][$key]['commentUser']       = dao('User')->getInfo($value['comment_uid'], 'avatar,nickname');
            }
        }

        //学习讨论
        $map              = array();
        $map['column_id'] = 23;
        $map['is_review'] = 1;
        $data['bbs_2']    = dao('Article')->getList($map, 'uid,publish_time,comment_num,comment_time,comment_uid,title,btitle,created,thumb,column_id,id', 1, 3);
        if ($data['bbs_2']['list']) {
            foreach ($data['bbs_2']['list'] as $key => $value) {
                $data['bbs_2']['list'][$key]['user']              = dao('User')->getInfo($value['uid'], 'avatar,nickname');
                $data['bbs_2']['list'][$key]['publish_time_copy'] = dao('Time')->diffDate($value['publish_time'], TIME);
                $data['bbs_2']['list'][$key]['comment_time_copy'] = dao('Time')->diffDate($value['comment_time'], TIME);
                $data['bbs_2']['list'][$key]['comment_num']       = dao('Number')->million($value['comment_num']);
                $data['bbs_2']['list'][$key]['commentUser']       = dao('User')->getInfo($value['comment_uid'], 'avatar,nickname');
            }
        }

        //国际专区
        $map              = array();
        $map['column_id'] = 24;
        $map['is_review'] = 1;
        $data['bbs_3']    = dao('Article')->getList($map, 'uid,publish_time,comment_num,comment_time,comment_uid,title,btitle,created,thumb,column_id,id', 1, 3);
        if ($data['bbs_3']['list']) {
            foreach ($data['bbs_3']['list'] as $key => $value) {
                $data['bbs_3']['list'][$key]['user']              = dao('User')->getInfo($value['uid'], 'avatar,nickname');
                $data['bbs_3']['list'][$key]['publish_time_copy'] = dao('Time')->diffDate($value['publish_time'], TIME);
                $data['bbs_3']['list'][$key]['comment_time_copy'] = dao('Time')->diffDate($value['comment_time'], TIME);
                $data['bbs_3']['list'][$key]['comment_num']       = dao('Number')->million($value['comment_num']);
                $data['bbs_3']['list'][$key]['commentUser']       = dao('User')->getInfo($value['comment_uid'], 'avatar,nickname');
            }
        }

        //商学院课程
        $map              = array();
        $map['column_id'] = array('in', '6,7,8,9');
        $data['course_1'] = dao('Article')->getList($map, 'id,title,btitle,publish_time,thumb,base_orders,hot', 3, 6);
        if ($data['course_1']['list']) {
            foreach ($data['course_1']['list'] as $key => $value) {
                $data['course_1']['list'][$key]['comment_num'] = (int) table('CourseComment')->where('goods_id', $value['id'])->count();
            }
        }

        //高中部课程
        $map              = array();
        $map['column_id'] = array('in', '13,14,15,16,17');
        $data['course_2'] = dao('Article')->getList($map, 'id,title,btitle,publish_time,thumb,base_orders,hot', 3, 6);
        if ($data['course_2']['list']) {
            foreach ($data['course_2']['list'] as $key => $value) {
                $data['course_2']['list'][$key]['comment_num'] = (int) table('CourseComment')->where('goods_id', $value['id'])->count();
            }
        }

        //教研团队
        $map              = array();
        $map['column_id'] = 7;
        $data['teacher']  = dao('Article')->getList($map, 'id,title,btitle,publish_time,thumb,position,position_en,description,description_en', 2);

        $other = array(
            'timeCopy' => array(
                'year'  => '年',
                'month' => '月',
                'day'   => '天',
                'hours' => '小时',
                'mins'  => '分钟',
                'secs'  => '秒',
            ),
        );
        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
