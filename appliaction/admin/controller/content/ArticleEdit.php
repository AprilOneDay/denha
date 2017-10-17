<?php
/**
 * 文章内容管理
 */
namespace app\admin\controller\content;

class ArticleEdit extends \app\admin\controller\Init
{
    public function edit()
    {
        $id = get('id', 'intval', 0);
        if (IS_POST) {

            $data['title']       = post('title', 'text', '');
            $data['description'] = post('description', 'text', '');
            $data['thumb']       = post('thumb', 'img', '');
            $data['origin']      = post('origin', 'text', '');

            $data['tag']          = max(post('tag', 'intval', 0), 1);
            $data['is_show']      = post('is_show', 'intval', '');
            $data['is_recommend'] = post('is_recommend', 'intval', '');

            $dataContent['content'] = post('content', 'text', '');

            if (!$data['title']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请填写标题']);
            }

            if (!$dataContent['content']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请输入内容']);
            }

            if (!$data['description']) {
                $data['description'] = mb_substr(str_replace(' ', '', strip_tags($dataContent['content'])), 0, 255, 'UTF-8');
            }

            if ($id) {
                $result = table('Article')->where(array('id' => $id))->save($data);
                if ($result) {
                    $resultData = table('ArticleBlog')->where(array('id' => $id))->save($dataContent);
                    dao('BaiduSpider')->pull($id); //百度主动推送
                    $this->ajaxReturn(array('status' => true, 'msg' => '修改成功'));
                } else {
                    $this->ajaxReturn(array('status' => false, 'msg' => '修改失败'));
                }
            } else {
                $data['created'] = TIME;
                $result          = table('Article')->add($data);
                if ($result) {
                    $dataContent['id'] = $result;
                    $resultData        = table('ArticleBlog')->add($dataContent);
                    dao('BaiduSpider')->pull($result); //百度主动推送
                    $this->ajaxReturn(array('status' => true, 'msg' => '添加成功'));
                } else {
                    $this->ajaxReturn(array('status' => false, 'msg' => '添加失败'));
                }
            }

        } else {
            if ($id) {
                $article     = table('Article')->tableName();
                $articleData = table('ArticleBlog')->tableName();

                $map[$article . '.id'] = $id;

                $rs = table('Article')->join($articleData, "$articleData.id = $article.id", 'left')->where($map)->find();

                $rs['created'] = date('Y-m-d', $rs['created']);
                $rs['thumb']   = json_encode((array) imgUrl($rs['thumb'], 'blog'));

            } else {
                $rs              = array('is_show' => 1, 'is_recommend' => 0, 'created' => date('Y-m-d', TIME));
                $rs['column_id'] = get('column_id', 'intval', 0);
            }

            $other = array(
                'tag'            => getVar('tags', 'console.article'),
                'columnListCopy' => dao('Column', 'admin')->columnList(),
            );

            $this->assign('data', $rs);
            $this->assign('other', $other);
            $this->show();
        }
    }
}
