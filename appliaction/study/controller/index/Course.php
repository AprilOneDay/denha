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

        $data['characteristics_copy'] = (array) dao('Category')->getName($data['characteristics'], $this->lg);

        if (!$data) {
            \denha\Log::error('信息不存在');
        }

        //评论列表
        $data['commentList'] = table('CourseComment')->where('goods_id', $id)->order('id desc')->find('array');
        if ($data['commentList']) {
            foreach ($data['commentList'] as $key => $value) {
                $user               = dao('User')->getInfo($value['uid'], 'nickname,avatar');
                $user['avatar']     = getConfig('config.app', 'imgUrl') . '/uploadfile/avatar/' . $user['avatar'];
                $list[$key]['user'] = $user;

                $data['commentList'][$key]['user'] = $user;
            }
        }

        //老师信息
        $data['teacher']                  = dao('User')->getInfo($data['teacher_uid'], 'real_name,avatar');
        $data['teacher']['avatar']        = $this->appImg($data['teacher']['avatar'], 'avatar');
        $data['teacher']['data']          = dao('Article')->getRowContent(array('teacher_uid' => $data['teacher_uid']), 'thumb,title,btitle,description,description_en', 2);
        $data['teacher']['data']['thumb'] = $this->appImg($data['teacher']['data']['thumb'], 'article');

        $map                = array();
        $map['teacher_uid'] = $data['teacher_uid'];

        $data['teacher']['data']['course_num'] = (int) table('ArticleCourse')->where($map)->count();

        $map                                    = array();
        $map['teacher_uid']                     = $data['teacher_uid'];
        $data['teacher']['data']['student_num'] = (int) table('OrdersCourse')->where($map)->count();
        //推荐列表
        $data['remmondList'] = dao('RecommendList', 'study')->recommendList();

        //增加浏览记录
        table('Article')->where('id', $id)->save(array('hot' => array('add', 1)));

        if ($data['class_type'] == 3) {
            $tpl = 'hight_school/detail_video' . $this->lg;
        } else {
            $tpl = 'hight_school' . '/' . ACTION . $this->lg;
        }

        $this->assign('data', $data);
        $this->show($tpl);
    }
}
