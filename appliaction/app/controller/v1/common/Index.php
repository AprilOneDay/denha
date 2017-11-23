<?php
/**
 * 首页模块
 */
namespace app\app\controller\v1\common;

use app\app\controller;

class Index extends \app\app\controller\Init
{

    /**
     * 获取分类
     * @date   2017-09-18T10:16:11+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getCategory()
    {
        $id = post('id', 'intval', 0);

        $data = $this->appArray(dao('Category')->getList($id, $this->lg));
        $this->appReturn(array('data' => $data));
    }

    /**
     * 获取车型分类
     * @date   2017-09-25T15:25:46+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getCarModel()
    {
        $data = $this->appArray(getVar('model', 'car'));
        $this->appReturn(array('data' => $data));
    }

    /**
     * 获取服务分类 去除了汽车销售
     * @date   2017-09-18T10:16:11+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getService()
    {
        $list = table('Category')->where(array('parentid' => 19, 'is_show' => 1))->field('id,name,bname,thumb')->find('array');

        foreach ($list as $key => $value) {
            $list[$key]['thumb'] = $this->appimg($value['thumb'], 'category');

            if ($this->lg == 'en') {
                $list[$key]['value'] = $value['bname'];
            } else {
                $list[$key]['value'] = $value['name'];
            }

            unset($list[$key]['name']);
            if ($value['id'] == 23) {
                unset($list[$key]);
            }
        }

        $list = array_values($list);

        $data = $list ? $list : array();

        //$this->appReturn(array('status' => false, 'msg' => $this->lg));
        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

    /** 获取安卓最新下载版本 */
    public function version()
    {
        $data            = table('AppVersion')->order('id desc')->find();
        $data['apk_url'] = URL . $data['apk_url'];

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }
}
