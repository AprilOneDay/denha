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
        $data['teacher']           = dao('User')->getInfo('real_name,avatar');
        $data['teacher']['avatar'] = $this->appImg($data['teacher']['avatar'], 'avatar');

        //推荐列表
        $data['remmondList'] = dao('RecommendList', 'study')->recommendList();

        //增加浏览记录
        table('Article')->where('id', $id)->save(array('hot' => array('add', 1)));

        $this->assign('data', $data);
        $this->show('hight_school' . '/' . ACTION . $this->lg, false, false);
    }
}
