<?php
namespace app\fastgo\app\controller\v1;

use denha;

class ApiInit extends denha\Controller
{
    public $config;
    public $version;
    public $lg = 'zh'; //返回提示信息语言版本

    public function __construct()
    {
        $config = getConfig('api');

        $this->config = $config[0];

        !isset($_SERVER['HTTP_VERSION']) ?: $this->version = (string) $_SERVER['HTTP_VERSION'];
        !isset($_SERVER['HTTP_LG']) ?: $this->lg           = (string) $_SERVER['HTTP_LG'];

        $data['ip']         = getIP();
        $data['controller'] = CONTROLLER;
        $data['action']     = ACTION;
        $data['url']        = URL;
        $data['data']       = json_encode(post('all'));
        $data['created']    = TIME;

        //var_dump($data);die;

        table('ApiLog')->add($data);

        $this->checkApiSecret();
    }

    //9c57478a9ffd7d3fbabaadaf6aad0f01
    //w2g2O5r7fuqyP7A5ba8MSMhrP4H47mVv
    //1514875374

    /** 检测签名 */
    public function checkApiSecret()
    {
        $data['signature'] = post('signature', 'text', '');
        $data['created']   = post('created', 'test', '');

        if (!$data['signature']) {
            $this->apiReturn(array('status' => fasle, 'msg' => '请上传签名'));
        }

        if (md5($this->config['secret'] . $data['created']) != $data['signature']) {
            $this->apiReturn(array('status' => fasle, 'msg' => '签名失败'));
        }
    }

    /** api返回信息 */
    public function apiReturn($value)
    {
        header("Content-Type:application/json; charset=utf-8");
        $array = array(
            'code'   => 200,
            'status' => true,
            'data'   => array('list' => array()),
            'msg'    => '获取数据成功',
        );

        $value = array_merge($array, $value);
        if ($this->lg != 'zh') {
            $value['msg'] = dao('BaiduTrans')->baiduTrans($value['msg'], $this->lg);
        }

        //更新日志记录
        $map['created']    = TIME;
        $map['controller'] = CONTROLLER;
        $map['ACTION']     = ACTION;

        $data['status'] = $value['status'] == true ? 1 : 0;
        $data['msg']    = $value['msg'];

        table('ApiLog')->where($map)->save($data);

        exit(json_encode($value));
    }
}
