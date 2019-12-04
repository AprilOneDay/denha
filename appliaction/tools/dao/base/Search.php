<?php
/**
 * 搜索模块
 */
namespace dao\base;

class Search
{

    /**
     * [run description]
     * @date   2019-11-12T11:40:10+0800
     * @author ChenMingjiang
     * @param  integer                  $uid   [用户uid]
     * @param  string                   $value [搜索值]
     * @param  integer                  $type  [类型/场景值]
     * @return [type]                   [description]
     */
    public function run($uid = 0, $value = '', $type = 1)
    {
        $value  = trim($value);
        $result = $this->check($type, $value);
        if (!$result['status']) {
            return $result;
        }

        $result = $this->addLog($uid, $type, $value);

        return ['status' => true, 'msg' => '操作完成'];

    }

    /**
     * 搜索检测
     * @date   2017-09-20T09:16:01+0800
     * @author ChenMingjiang
     * @param  integer                  $type  [description]
     * @param  string                   $value [description]
     * @return [type]                          [description]
     */
    public function check($type = 0, $value = '')
    {
        if (!$type || !$value) {
            return ['status' => false, 'msg' => '参数错误'];
        }

        $map['value']  = $value;
        $map['type']   = $type;
        $map['status'] = 1;

        $is = table('SearchDisable')->where($map)->value('id');
        if ($is) {
            return ['status' => false, 'msg' => '根据相关规定 ' . $value . ' 已被禁止'];
        }

        return ['status' => true, 'msg' => '通过验证'];
    }

    /**
     * 增加搜索记录
     * @date   2017-09-20T09:16:28+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid   [description]
     * @param  [type]                   $type  [description]
     * @param  [type]                   $value [description]
     */
    public function addLog($uid = 0, $type = 0, $value = '')
    {
        if (!$type || !$value) {
            return ['status' => false, 'msg' => '参数错误'];
        }

        $data['uid']     = $uid;
        $data['type']    = $type;
        $data['value']   = $value;
        $data['created'] = TIME;

        $map['value'] = $value;
        $map['type']  = $type;
        $map['uid']   = $uid;

        $id = table('SearchLog')->where($map)->value('id');

        if (!$id) {
            $result = table('SearchLog')->add($data);
        } else {

            $data['update_time'] = TIME;
            $data['hot']         = ['add', 1];
            $data['del_status']  = 0;

            $result = table('SearchLog')->where('id', $id)->save($data);
        }

        if (!$result) {
            return ['status' => false, 'msg' => '执行失败'];
        }
        return ['status' => true, 'msg' => '添加成功'];
    }

    /**
     * 增加搜索推荐
     * @date   2017-09-20T09:17:51+0800
     * @author ChenMingjiang
     */
    public function addRecommend($type = 0, $value = '')
    {
        if (!$type) {
            return ['status' => false, 'msg' => '请选择类型'];
        }

        if (!$value) {
            return ['status' => false, 'msg' => '请输入内容'];
        }

        $data['type']    = (int) $type;
        $data['value']   = (string) $value;
        $data['created'] = TIME;

        //查询是否禁用
        $isDisable = table('SearchDisable')->where('type', $type)->where('value', $value)->value('id');
        if ($isDisable) {
            return ['status' => false, 'msg' => '关键词已被禁用不可推荐,请先删除禁用关键字'];
        }

        $id = table('SearchRemmond')->where('type', $type)->where('value', $value)->value('id');
        if ($id) {
            return ['status' => false, 'msg' => '请勿重复添加'];
        }

        $result = table('SearchRemmond')->add($data);

        if ($result) {
            return ['status' => true, 'msg' => '添加搜索推荐成功'];
        }

    }

    /**
     * 增加搜索禁用
     * @date   2017-09-20T09:17:58+0800
     * @author ChenMingjiang
     */
    public function addDisable($type = 0, $value = '')
    {
        if (!$type) {
            return array('status' => false, 'msg' => '请选择类型');
        }

        if (!$value) {
            return array('status' => false, 'msg' => '请输入内容');
        }

        $data['type']  = (int) $type;
        $data['value'] = (string) $value;

        //查询是否推荐
        $isDisable = table('SearchRemmond')->where('type', $type)->where('value', $value)->value('id');
        if ($isDisable) {
            return ['status' => false, 'msg' => '关键词已被推荐不可禁用,请先删除推荐关键字'];
        }

        $id = table('SearchDisable')->where('type', $type)->where('value', $value)->value('id');

        if ($id) {
            return ['status' => false, 'msg' => '请勿重复添加'];
        }

        $result = table('SearchDisable')->add($data);

        if ($result) {
            return ['status' => true, 'msg' => '添加搜索禁用成功'];
        }
    }

    /**
     * 删除推荐 删除禁用
     * @date   2017-09-30T11:56:12+0800
     * @author ChenMingjiang
     * @param  [type]                   $table [description]
     * @param  integer                  $type  [description]
     * @param  string                   $value [description]
     * @return [type]                          [description]
     */
    public function del($table, $type = 0, $value = '')
    {
        if (!in_array($table, ['SearchDisable', 'SearchRemmond'])) {
            return ['status' => false, 'msg' => '非法操作'];
        }

        if (!$type || !$value) {
            return ['status' => false, 'msg' => '参数错误'];
        }

        $map['type']  = $type;
        $map['value'] = $value;

        $id = table($table)->where($map)->value('id');

        if (!$id) {
            return ['status' => false, 'msg' => '信息不存在'];
        }

        $reslut = table($table)->where('id', $id)->delete();
        if (!$reslut) {
            return ['status' => false, 'msg' => '删除失败'];
        }
        return ['status' => true, 'msg' => '删除成功'];
    }

}
