<?php
/**
 * 广告图片管理
 */
namespace app\admin\content;

use app\admin\Init;

class Banner extends Init
{
    public function lists()
    {
        $list = table('Banner')->select();

        $this->assign('list', $list);
        $this->show();
    }

    /**
     * 广告图片编辑
     * @date   2017-10-16T16:22:59+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function edit()
    {
        $id = get('id', 'intval', 0);
        if (IS_POST) {
            $data['title'] = post('title', 'text', '');

            if (!$data['title']) {
                $this->ajaxReturn(array('status' => false, 'msg' => '请输入分类名称'));
            }

            if ($id) {
                $result = table('Banner')->where(array('id' => $id))->save($data);
                if ($result) {
                    $this->ajaxReturn(array('status' => true, 'msg' => '修改成功'));
                }
            } else {
                $result = table('Banner')->add($data);
                if ($result) {
                    $this->ajaxReturn(array('status' => true, 'msg' => '添加成功'));
                }
            }

            $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
        } else {

            $rs = table('Banner')->where(array('id' => $id))->find();

            $this->assign('data', $rs);
            $this->show();
        }
    }

    /**
     * 广告相册
     * @date   2017-10-16T16:23:14+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function dataList()
    {
        $bannerId = get('id', 'intval', 0);

        $list = table('BannerData')->where(array('banner_id' => $bannerId))->order('sort asc')->select();

        foreach ($list as $key => $value) {
            $list[$key]['path'] = imgUrl($value['path'], 'banner');
        }

        $this->assign('bannerId', $bannerId);
        $this->assign('list', $list);
        $this->show();
    }

    /**
     * 编辑广告相册
     * @date   2017-10-16T16:23:26+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function dataEdit()
    {
        $id = get('id', 'intval', 0);
        if ($id) {
            $rs = table('BannerData')->where('id', $id)->find();
        } else {
            $rs['sort'] = 0;
        }

        $other = array(
            'appTypeCopy'  => getVar('admin.banner.app_type'),
            'jumpTypeCopy' => ['1' => '当前窗口', '2' => '新窗口'],
        );

        $this->show('', ['data' => $rs, 'other' => $other]);

    }

    public function dataEditPost($value = '')
    {
        $id = get('id', 'intval', 0);

        $data = post('info');

        if (!$data['path']) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请上传图片'));
        }

        if ($id) {
            $result = table('BannerData')->where(array('id' => $id))->save($data);
            if ($result) {
                $this->ajaxReturn(array('status' => true, 'msg' => '修改成功'));
            }
        } else {
            $data['banner_id'] = get('banner_id', 'intval', 0);

            if (!$data['banner_id']) {
                $this->ajaxReturn(array('status' => false, 'msg' => '参数错误'));
            }

            $result = table('BannerData')->add($data);
            if ($result) {
                $this->ajaxReturn(array('status' => true, 'msg' => '添加成功'));
            }
        }

        $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
    }

    /**
     * 更新排序
     * @date   2017-10-12T11:40:35+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function updateSort()
    {
        $id = post('id');
        foreach ($id as $key => $value) {
            if ($value !== '') {
                $data[$value][] = $key;
            }
        }

        foreach ($data as $key => $value) {
            $map       = [];
            $map['id'] = ['in', $value];

            $result = table('BannerData')->where($map)->save('sort', $key);
            if ($result === false) {
                $this->ajaxReturn(array('status' => false, 'msg' => '更新失败', 'sql' => table('BannerData')->getLastSql()));
            }

        }

        $this->ajaxReturn(array('msg' => '更新成功'));
    }

    /**
     * 删除相册
     * @date   2017-10-16T16:24:10+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function delData()
    {
        $id = post('id', 'intval', 0);
        if (!$id) {
            $this->ajaxReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $result = table('BannerData')->where('id', $id)->delete();
        if (!$result) {
            $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->ajaxReturn(array('msg' => '操作成功'));
    }
}
