<?php
/** 路由重写模块 */
namespace app\admin\setting;

use app\admin\Init;

class Route extends Init
{
    public function lists()
    {

        $list = table('RouteRule')->select();

        $list = isset($list) ? $list : [];

        $other = [
            'statusCopy' => ['关闭', '开启'],
        ];

        $this->show('', [
            'list'  => $list,
            'other' => $other,
        ]);
    }

    public function edit()
    {

        $id = get('id', 'intval', 0);
        if ($id) {
            $data = table('RouteRule')->where('id', $id)->find();
        } else {
            $data = ['status' => 1];
        }

        $other = [
            'typeCopy' => [1 => 'PC站', 2 => '手机站'],
        ];

        $this->show('', [
            'data'  => $data,
            'other' => $other,
        ]);
    }

    public function editPost()
    {
        $id = get('id', 'intval', 0);

        $data['name']         = post('name', 'text', '');
        $data['url']          = post('url', 'text', '');
        $data['change_url']   = post('change_url', 'text', '');
        $data['params']       = trim(post('params', 'text', ''), '/');
        $data['suffix']       = post('suffix', 'text', '');
        $data['limit_suffix'] = implode(',', (array) post('limit_suffix', 'text', ''));
        $data['type']         = implode(',', (array) post('type', 'text', ''));

        $data['title']       = post('title', 'text', '');
        $data['keyword']     = post('keyword', 'text', '');
        $data['description'] = post('description', 'text', '');

        $data['status'] = post('status', 'intval', 1);

        $data['change_url'] = $data['change_url'] == '/' ? $data['change_url'] : trim($data['change_url'], '/');

        if (!$data['name']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请输入规则名称']);
        }

        if (!$data['url']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请输入原路由地址']);
        }

        // if (!$data['change_url']) {
        //     $this->ajaxReturn(['status' => false, 'msg' => '请输入新地址']);
        // }

        //原路由地址 必须以'/'开头
        $data['url'] = stripos($data['url'], '/') === 0 ? $data['url'] : '/' . $data['url'];
        $data['url'] = rtrim($data['url'], '/');

        //如果原路由是新路由地址则转换成老路由
        $url         = table('RouteRule')->where('change_url', trim($data['url'], '/'))->value('url');
        $data['url'] = $url ? $url : $data['url'];

        //重写地址 不可以'/'开头
        $data['change_url'] = ltrim($data['change_url'], '/');

        //检查是否存在规则名称
        $isName = table('RouteRule')->where('name', $data['name'])->where('id', '!=', $id)->count();
        if ($isName) {
            $this->ajaxReturn(['status' => false, 'msg' => '规则名已存在']);
        }

        //检查是否存在原路由地址
        $isUrl = table('RouteRule')->where('url', $data['url'])->where('params', $data['params'])->where('id', '!=', $id)->count();
        if ($isUrl) {
            $this->ajaxReturn(['status' => false, 'msg' => '该地址已重写过规则了']);
        }

        //检查是否存在新路由地址
        $isUrl = table('RouteRule')->where('change_url', $data['change_url'])->where('id', '!=', $id)->count();
        if ($isUrl) {
            $this->ajaxReturn(['status' => false, 'msg' => '新路由地址已存在']);
        }

        if (!$id) {

            $data['created'] = TIME;

            $result = table('RouteRule')->add($data);
        } else {
            //dao('RouteRule')->clearCache($id);

            $result = table('RouteRule')->where('id', $id)->save($data);
        }

        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
        }

        // //清除缓存
        // dao('RouteRule')->clearCache($result);

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }

    /** [deletePost description] */
    public function deletePost()
    {
        $id = post('id', 'intval', 0);

        $result = table('RouteRule')->where('id', $id)->delete();
        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '删除失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);
    }

    /** 更改状态 */
    public function changeStatusPost()
    {
        $id    = post('id', 'intval', 0);
        $value = post('value', 'text', '');

        if (!$id || $value == '') {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $result = table('RouteRule')->where('id', $id)->save('status', $value);
        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }
}
