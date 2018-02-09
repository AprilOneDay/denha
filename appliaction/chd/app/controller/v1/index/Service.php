<?php
/**
 * 服务模块
 */
namespace app\chd\app\controller\v1\index;

use app\app\controller;
use app\chd\app\controller\v1\Init;
use denha\Start;

class Service extends Init
{

    /** 栏目分类 */
    public function menus()
    {
        $parentid = get('parentid', 'intval', 0);

        $map['web_type'] = 4;
        $map['parentid'] = $parentid;

        $field = 'name,bname';
        if ($this->lg != 'zh') {
            $field = "name_{$this->lg},bname_{$this->lg}";
        }
        $field .= ",id,thumb,is_show,parentid";

        $list = table('Column')->where($map)->field($field)->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['finally_name']  = dao('Article')->getLgValue($value, 'name', $this->lg);
            $list[$key]['finally_bname'] = dao('Article')->getLgValue($value, 'bname', $this->lg);
            $list[$key]['thumb']         = $this->appImg($value['thumb'], 'column');

            //获取栏目学习状态
            $status = 0;
            if (!$this->uid) {
                $status = 0;
            } else {
                $map              = array();
                $map['uid']       = $this->uid;
                $map['column_id'] = $value['id'];
                $status           = (int) table('ChdUser')->where($map)->field('status')->find('one');
            }
            $list[$key]['user_status'] = $status;
        }

        $data['list'] = (array) $list;

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

    /**
     * 列表内容
     * @date   2017-12-04T10:46:16+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;
        $order    = get('order', 'text', '');

        $columnId = get('cid', 'intval', 0);
        $keyword  = get('keyword', 'text', '');

        if (!$columnId) {
            $this->appReturn(array('stauts' => false, 'msg' => '参数错误'));
        }

        $map['column_id'] = $columnId;

        if ($keyword) {
            $field            = $this->lg != 'zh' ? 'title_' . $this->lg : 'title';
            $map[$field]      = array('instr', $keyword);
            $map['column_id'] = array('not in', '61,62,63,64,65');
        }

        $order = $order;

        $field = 'title,description';
        if ($this->lg != 'zh') {
            $field = "title_{$this->lg},description_{$this->lg}";
        }
        $field .= ",id,thumb,thumb,video,created";

        $data = dao('Article')->getList($map, $field, 1, $pageSize, $pageNo, $order);

        $list = $data['list'] ? $data['list'] : array();

        foreach ($list as $key => $value) {
            $list[$key]['thumb'] = $this->appImg($value['thumb'], 'article');
            $list[$key]['video'] = $value['video'] ? Start::$config['h5Url'] . $value['video'] : '';

            $list[$key]['finally_title']       = dao('Article')->getLgValue($value, 'title', $this->lg);
            $list[$key]['finally_description'] = dao('Article')->getLgValue($value, 'description', $this->lg);

        }

        $data['list'] = $list ? $list : array();

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

    /**
     * 单页内容
     * @date   2017-12-04T10:46:07+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detail()
    {
        $columnId = get('cid', 'intval', 0);
        $id       = get('id', 'intval', 0);

        if ($columnId) {
            $map['column_id'] = $columnId;
        }

        if ($id) {
            $map['id'] = $id;
        }

        $field = 'content,title,description';
        if ($this->lg != 'zh') {
            $field = "title_{$this->lg},content_{$this->lg},description_{$this->lg}";
        }
        $field .= ',created,column_id,id';

        $data = dao('Article')->getRowContent($map, $field, 1);

        if ($data) {

            $map              = array();
            $map['parentid']  = 58;
            $map['is_show']   = 1;
            $checkColumnArray = table('Column')->where($map)->field('id')->find('one', true);

            if (in_array($data['column_id'], $checkColumnArray)) {
                if (!$this->uid) {
                    $this->appReturn(array('status' => false, 'msg' => '请登录', 'code' => 501));
                }

                //判断当前科目是否完成
                $map              = array();
                $map['uid']       = $this->uid;
                $map['column_id'] = $data['column_id'];
                $logStatus        = (int) table('ChdUser')->where($map)->field('status')->find('one');

                if ($logStatus != 2) {

                    // //获取最后完成的项目
                    // $map           = array();
                    // $map['uid']    = $this->uid;
                    // $map['status'] = 2;

                    // $successId = (int) table('ChdUser')->where($map)->order('created desc')->field('column_id')->find('one');

                    // if ($successId > 0 && $successId + 1 != $data['column_id']) {
                    //     $this->appReturn(array('status' => false, 'msg' => '请完成前面知识的学习'));
                    // } elseif (!$successId && $data['column_id'] != '61') {
                    //     $this->appReturn(array('status' => false, 'msg' => '请完成前面知识的学习'));
                    // }

                    //增加记录浏览记录
                    $dataLog               = array();
                    $dataLog['uid']        = $this->uid;
                    $dataLog['article_id'] = $data['id'];
                    $dataLog['column_id']  = $data['column_id'];
                    $result                = table('ChdLog')->add($dataLog);

                    //获取用户浏览当前栏目下的文章ID
                    $map              = array();
                    $map['column_id'] = $data['column_id'];
                    $map['uid']       = $this->uid;
                    $userLog          = table('ChdLog')->where($map)->field('article_id')->find('one', true);

                    //检测是否浏览完所有文章
                    $map               = array();
                    $map['column_id']  = $data['column_id'];
                    $map['is_show']    = 1;
                    $checkArticleArray = table('Article')->where($map)->field('id')->find('one', true);

                    // var_dump($userLog);
                    // var_dump($checkArticleArray);
                    // var_dump(array_diff($checkArticleArray, $userLog));die;

                    $status = !array_diff($checkArticleArray, $userLog) ? 2 : 1;

                    //记录课件学习状态
                    $map              = array();
                    $map['uid']       = $this->uid;
                    $map['column_id'] = $data['column_id'];
                    $chdId            = table('ChdUser')->where($map)->field('id')->find('one');

                    $dataLog              = array();
                    $dataLog['uid']       = $this->uid;
                    $dataLog['column_id'] = $data['column_id'];
                    $dataLog['status']    = $status;
                    $dataLog['created']   = TIME;

                    if ($chdId) {
                        $result = table('ChdUser')->where('id', $chdId)->save($dataLog);
                    } else {
                        $result = table('ChdUser')->add($dataLog);
                    }
                }

            }

            $data['finally_title']       = dao('Article')->getLgValue($data, 'title', $this->lg);
            $data['finally_description'] = dao('Article')->getLgValue($data, 'description', $this->lg);
            $data['finally_content']     = dao('Article')->getLgValue($data, 'content', $this->lg);
            $data['finally_content']     = dao('Article')->appContent($data['finally_content']);

        }

        $data = $data ? $data : (object) array();

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

}
