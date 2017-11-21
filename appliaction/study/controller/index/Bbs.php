<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\index;

class Bbs extends \app\study\controller\Init
{
    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);

        $cid = get('cid', 'intval', 0);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['column_id'] = $cid;
        $map['is_review'] = 1;

        $list = table('Article')->where($map)->field('uid,title,btitle,thumb,id,description,description_en,publish_time,comment_num,comment_uid,comment_time,hot')->order('is_top desc,id desc')->limit($offer, $pageSize)->find('array');

        $total = table('Article')->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url('', array('cid' => $cid)));

        foreach ($list as $key => $value) {
            $list[$key]['user']              = dao('User')->getInfo($value['uid'], 'avatar,nickname');
            $list[$key]['publish_time_copy'] = dao('Time')->diffDate($value['publish_time'], TIME);
            $list[$key]['comment_time_copy'] = dao('Time')->diffDate($value['comment_time'], TIME);
            $list[$key]['comment_num']       = dao('Number')->million($value['comment_num']);
            $list[$key]['commentUser']       = dao('User')->getInfo($value['comment_uid'], 'avatar,nickname');
        }

        $columnList = table('Column')->where('parentid', $this->parentColumn['id'])->field('id,name,bname,jump_url')->find('array');

        //推荐列表
        $remmond['remmondList'] = dao('RecommendList', 'study')->recommendList();
        //热门话题
        $remmond['hotList'] = dao('RecommendList', 'study')->hotList();

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
        $this->assign('list', $list);
        $this->assign('remmond', $remmond);
        $this->assign('columnList', $columnList);
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /**
     * 详情
     * @date   2017-11-17T13:40:02+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detail()
    {
        $id  = get('id', 'intval', 0);
        $cid = get('cid', 'intval', 0);

        $map['id']         = $id;
        $data              = dao('Article')->getRowContent($map, '', 1);
        $data['content']   = nl2br($data['content']);
        $data['enjoy_num'] = dao('Enjoy')->count(2, $id);
        $data['comment']   = dao('Comment')->getList(5, $id); //获取评价内容

        if ($data['comment']) {
            foreach ($data['comment'] as $key => $value) {
                $data['comment'][$key]['enjoy_num'] = dao('Enjoy')->count(3, $value['id']);
            }
        }

        $columnList = table('Column')->where('parentid', $this->parentColumn['id'])->field('id,name,bname,jump_url')->find('array');

        //推荐列表
        $data['remmondList'] = dao('RecommendList', 'study')->recommendList();
        //热门话题
        $data['hotList'] = dao('RecommendList', 'study')->hotList();

        //增加浏览记录
        table('Article')->where('id', $id)->save(array('hot' => array('add', 1)));

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->assign('columnList', $columnList);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    //发表评论
    public function comment()
    {
        $goodsId = post('goods_id', 'intval', 0);
        $content = post('content', 'text', '');

        if (!$this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '请先登录'));
        }

        if (!$content) {
            $this->appReturn(array('status' => false, 'msg' => '请输入内容'));
        }

        $result = dao('Comment')->add($this->uid, 5, $goodsId, $content);

        if ($result['status']) {
            //增加最后评论记录
            $data['comment_uid']  = $this->uid;
            $data['comment_num']  = array('add', 1);
            $data['comment_time'] = TIME;
            table('Article')->where('id', $goodsId)->save($data);
        }

        $this->appReturn($result);
    }

    /**
     * 增加点赞
     * @date   2017-09-25T15:44:51+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function like()
    {
        $type = post('type', 'intval', 2);
        $id   = post('id', 'intval', 0);

        $reslut = dao('Enjoy')->add($this->uid, $type, $id);
        $this->appReturn($reslut);
    }

    /**
     * 取消点赞
     * @date   2017-09-25T15:47:52+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function delLike()
    {
        $type = post('type', 'intval', 2);
        $id   = post('id', 'intval', 0);

        $reslut = dao('Enjoy')->del($this->uid, $type, $id);
        $this->appReturn($reslut);
    }

    /**
     * 回复
     * @date   2017-09-25T16:17:17+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function relpyComment()
    {
        $content  = post('content', 'text', '');
        $parentId = post('comment_id', 'intval', 0);
        $toUid    = post('to_uid', 'intval', 0);

        if (!$this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '请先登录'));
        }

        if (!$content) {
            $this->appReturn(array('status' => false, 'msg' => '请输入内容'));
        }

        $reslut = dao('Comment')->reply($this->uid, 1, $content, $parentId, $toUid);
        $this->appReturn($reslut);
    }

    /** 发帖 */
    public function add()
    {

        $title    = post('title', 'text', '');
        $content  = post('content', 'text', '');
        $columnId = post('column_id', 'intval', 0);

        if (!$this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '请登录'));
        }

        if (!$columnId) {
            $this->appReturn(array('status' => false, 'msg' => '请选择板块'));
        }

        if (!in_array($columnId, array('23', '24', '25'))) {
            $this->appReturn(array('status' => false, 'msg' => '该模块不可上传'));
        }

        if (!$title) {
            $this->appReturn(array('status' => false, 'msg' => '请输入标题'));
        }

        if (!$content) {
            $this->appReturn(array('status' => false, 'msg' => '请输入内容'));
        }

        $data['uid']       = $this->uid;
        $data['title']     = $title;
        $data['column_id'] = $column_id;
        $data['is_review'] = 0;
        $data['model_id']  = 1;
        $data['column_id'] = $columnId;
        $data['created']   = $data['publish_time']   = TIME;

        $map['uid']   = $this->uid;
        $map['title'] = $title;

        $is = table('Article')->where($map)->field('id')->find();
        if ($is) {
            $this->appReturn(array('status' => false, 'msg' => '请勿重复发布内容'));
        }

        $result = table('Article')->add($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '发布失败,请稍后重试'));
        }

        $data            = array();
        $data['content'] = $content;
        $data['id']      = $result;

        $resultData = table('ArticleData')->add($data);
        if (!$resultData) {
            $this->appReturn(array('status' => false, 'msg' => '数据保存失败,请联系管理员'));
        }

        $this->appReturn(array('msg' => '发布成功,请耐心等待管理员审核'));
    }
}
