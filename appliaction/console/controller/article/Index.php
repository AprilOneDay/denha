<?php
namespace app\console\controller\article;

use denha;

class Index extends denha\Controller
{
    public function edit()
    {
        if (IS_POST) {
            $param = post('data', 'json');
            if (!is_array($param)) {
                $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
            }

            $data['title']       = (string) $param['title'];
            $data['description'] = (string) $param['description'];

            $data['tag']     = max((int) $param['tag'], 1);
            $data['is_show'] = (int) $param['is_show'];

            $dataContent['content'] = (string) $param['content'];

            if (!$data['title']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请填写标题']);
            }

            if (!$dataContent['content']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请输入内容']);
            }

            if ($param['id']) {
                $result = table('Article')->where(['id' => $param['id']])->save($data);
                if ($result) {
                    $resultData = table('ArticleBlog')->where(['id' => $param['id']])->save($dataContent);
                    $this->ajaxReturn(['status' => true, 'msg' => '修改成功', 'id' => $result]);
                } else {
                    $this->ajaxReturn(['status' => false, 'msg' => '修改失败']);
                }
            } else {
                $data['created'] = TIME;
                $result          = table('Article')->add($data);
                if ($result) {
                    $dataContent['id'] = $result;
                    $resultData        = table('ArticleBlog')->add($dataContent);
                    $this->ajaxReturn(['status' => true, 'msg' => '添加成功', 'id' => $result]);
                } else {
                    $this->ajaxReturn(['status' => false, 'msg' => '添加失败']);
                }
            }

        } else {
            $id = get('id', 'intval', 0);

            if ($id) {
                $article     = table('Article')->tableName();
                $articleData = table('ArticleBlog')->tableName();

                $map[$article . '.id'] = $id;

                $rs = table('Article')->join($articleData, "$articleData.id = $article.id", 'left')->where($map)->find();
            }

            $data = [
                'data'  => $rs,
                'other' => [
                    'tag' => getVar('tags', 'console.article'),
                ],
            ];
            $this->ajaxReturn(['status' => true, 'msg' => '获取数据成果', 'data' => $data]);
        }
    }
}
