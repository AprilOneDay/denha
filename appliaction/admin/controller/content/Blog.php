<?php
/**
 * 博客内容管理
 */
namespace app\admin\controller\content;

use denha;

class Blog extends \app\admin\controller\Init
{

    public function index()
    {
        $param['field']        = get('field', 'text', 'title');
        $param['keyword']      = get('keyword', 'text', '');
        $param['tag']          = get('tag', 'intval', 0);
        $param['is_show']      = get('is_show', 'text', '');
        $param['is_recommend'] = get('is_recommend', 'text', '');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($param['pageNo'] - 1), 0) * $pageSize;

        $map['del_status'] = 0;

        if ($param['tag']) {
            $map['tag'] = $param['tag'];
        }

        if ($param['is_recommend'] != '') {
            $map['is_recommend'] = $param['is_recommend'];
        }

        if ($param['is_show'] != '') {
            $map['is_show'] = $param['is_show'];
        }

        if ($param['field'] && $param['keyword']) {
            if ($param['field'] == 'title') {
                $map['title'] = ['like', '%' . $param['keyword'] . '%'];
            }
        }
        $list  = table('Article')->where($map)->limit($offer, $pageSize)->order('id desc')->find('array');
        $total = table('Article')->where($map)->count();
        $page  = new denha\Pages($total, $pageNo, $pageSize, url('', $param));

        $other = array(
            'tag'             => getVar('tags', 'console.article'),
            'isShowCopy'      => array(0 => '隐藏', 1 => '显示'),
            'isRecommendCopy' => array(1 => '推荐', 0 => '不推荐'),
        );

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('other', $other);

        $this->show();
    }

    public function edit()
    {
        $id = get('id', 'intval', 0);
        if (IS_POST) {
            $param = post('data', 'json');
            if (!is_array($param)) {
                $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
            }

            $data['title']       = (string) $param['title'];
            $data['description'] = (string) $param['description'];
            $data['thumb']       = !($param['thumb'] && stripos($param['thumb'], 'nd.jpg') === false) ? '' : next(pathinfo($param['thumb']));

            $data['tag']          = max((int) $param['tag'], 1);
            $data['is_show']      = (int) $param['is_show'];
            $data['is_recommend'] = (int) $param['is_recommend'];

            $dataContent['content'] = (string) $param['content'];

            if (!$data['title']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请填写标题']);
            }

            if (!$dataContent['content']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请输入内容']);
            }

            if (!$data['description']) {
                $data['description'] = mb_substr(str_replace(' ', '&nbsp', strip_tags($dataContent['content'])), 0, 255, 'UTF-8');
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
            if ($id) {
                $article     = table('Article')->tableName();
                $articleData = table('ArticleBlog')->tableName();

                $map[$article . '.id'] = $id;

                $rs = table('Article')->join($articleData, "$articleData.id = $article.id", 'left')->where($map)->find();

                $rs['created'] = date('Y-m-d', $rs['created']);
                $rs['thumb']   = imgUrl($rs['thumb'], 'blog');
            } else {
                $rs = array('is_show' => 1, 'is_recommend' => 0);
            }

            $other = array(
                'tag' => getVar('tags', 'console.article'),
            );

            $this->assign('data', $rs);
            $this->assign('other', $other);
            $this->show();
        }
    }
}
