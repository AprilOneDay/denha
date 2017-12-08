<?php
/**
 * 单页详情
 */
namespace app\undies\app\controller\v1\index;

use app\undies\app\controller\Init;
use denha\controller;

class Join extends Init
{
    public function apply()
    {
        $data['apply_name']     = post('apply_name', 'text', '');
        $data['join_city']      = post('join_city', 'text', '');
        $data['open_shop_time'] = post('open_shop_time', 'text', '');

        $data['market_positioning'] = post('market_positioning', 'text', '');
        $data['brand_Style']        = post('brand_Style', 'text', '');
        $data['main_series']        = post('main_series', 'text', '');
        $data['price']              = post('price', 'text', '');

        $data['name']    = post('name', 'text', '');
        $data['sex']     = post('sex', 'text', '');
        $data['age']     = post('age', 'text', '');
        $data['culture'] = post('culture', 'text', '');
        $data['mobile']  = post('mobile', 'text', '');
        $data['work']    = post('work', 'text', '');
        $data['qq']      = post('qq', 'text', '');
        $data['weixin']  = post('weixin', 'text', '');
        $data['address'] = post('address', 'text', '');

        $data['join_city']       = post('join_city', 'text', '');
        $data['average_income']  = post('average_income', 'text', '');
        $data['h_shop_name']     = post('h_shop_name', 'text', '');
        $data['is_ideal_shop']   = post('is_ideal_shop', 'text', '');
        $data['open_shop_time']  = post('open_shop_time', 'text', '');
        $data['invest_funds']    = post('invest_funds', 'text', '');
        $data['run_type']        = post('run_type', 'text', '');
        $data['management_type'] = post('management_type', 'text', '');
        $data['join_type']       = post('join_type', 'text', '');
        $data['sale_desc']       = post('sale_desc', 'text', '');

        $files['code'] = files('code');
        $data['code']  = $this->appUpload($files['code'], '', 'code');

        $data['experience'] = post('experience', 'text', '');
        $data['plan']       = post('plan', 'text', '');

        $data['created'] = TIME;
        $data['ip']      = getIP();

        if (!$data['apply_name']) {
            $this->appReturn(array('status' => false, 'msg' => '申请人姓名必填'));
        }

        if (!$data['join_city']) {
            $this->appReturn(array('status' => false, 'msg' => '加盟城市/区域必填'));
        }

        if (!$data['open_shop_time']) {
            $this->appReturn(array('status' => false, 'msg' => '计划开店时间必填'));
        }

        if (!$data['code']) {
            $this->appReturn(array('status' => false, 'msg' => '请上传身份证照片'));
        }

        $map               = array();
        $map['ip']         = $data['ip'];
        $map['apply_name'] = $data['apply_name'];

        $count = table('FromJoin')->where($map)->count();
        if ($count > 2) {
            $this->appReturn(array('status' => false, 'msg' => '请不要重复提交'));
        }

        $result = table('FromJoin')->add($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '申请失败,请稍后尝试'));
        }

        $this->appReturn(array('status' => false, 'msg' => '申请成功,请耐心等待工作人员联系'));
    }

}
