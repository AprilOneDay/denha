<?php
/**
 * 公用模块
 */
namespace app\app\controller\v1\shop;

use app\app\controller;

class Server extends \app\app\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkShop();
    }

    /**
     * 编辑查看 提交 新增 二手车
     * @date   2017-09-15T09:32:24+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function carEdit()
    {
        if (IS_POST) {
            $id = post('id', 'intval', 0);

            $data['brand']        = post('brand', 'intval', 0);
            $data['produce_time'] = post('produce_time', 'intval', 0);
            $data['brand']        = post('brand', 'intval', 0);
            $data['is_lease']     = post('is_lease', 'intval', 0);

            $data['mileage'] = post('mileage', 'floatval', 0);
            $data['price']   = post('price', 'floatval', 0);

            $data['style']        = post('style', 'text', '');
            $data['model']        = post('model', 'text', '');
            $data['buy_time']     = post('buy_time', 'text', '');
            $data['city']         = post('city', 'text', '');
            $data['gearbox']      = post('gearbox', 'text', '');
            $data['gases']        = post('gases', 'text', '');
            $data['displacement'] = post('displacement', 'text', '');
            $data['model_remark'] = post('model_remark', 'text', '');
            $data['vin']          = post('vin', 'text', '');
            $data['mobile']       = post('mobile', 'text', '');
            $data['weixin']       = post('weixin', 'text', '');
            $data['qq']           = post('qq', 'text', '');
            $data['address']      = post('address', 'text', '');
            $data['description']  = post('description', 'text', '');

            $data['ablum'] = post('ablum', 'json', '');

            $files['ablum'] = files('ablum_files');

            if (!$data['brand']) {
                $this->appReturn(array('status' => false, 'msg' => '请选择品牌'));
            }

            if (!$data['style']) {
                $this->appReturn(array('status' => false, 'msg' => '请输入款号'));
            }

            if (!$data['mileage']) {
                $this->appReturn(array('status' => false, 'msg' => '请输入里程数'));
            }

            if (!$data['city']) {
                $this->appReturn(array('status' => false, 'msg' => '请输入城市'));
            }

            if (!$data['price']) {
                $this->appReturn(array('status' => false, 'msg' => '请输入报价'));
            }

            $data['ablum'] = $this->appUpload($files['ablum'], $data['ablum'], 'car');

            if (!$id) {
                $data['type']    = $this->group;
                $data['uid']     = $this->uid;
                $data['created'] = TIME;
                $data['title']   = $data['brand'] . ' ' .

                $result = table('GoodsCar')->add($data);

                if ($result) {
                    $this->appReturn(array('msg' => '添加成功'));
                }
            } else {
                $result = table('GoodsCar')->where(array('uid' => $this->uid, 'id' => $id))->save($data);
                if ($result) {
                    $this->appReturn(array('msg' => '编辑成功'));
                }
            }

            $this->appReturn(array('status' => false, 'msg' => '操作失败'));
        } else {
            $id   = get('id', 'intval', 0);
            $city = getVar('province', 'city');
            if ($id) {
                $data               = table('GoodsCar')->where(array('uid' => $this->uid, 'id' => $id))->find();
                $data['ablum']      = $data['ablum'] ? imgUrl(explode(',', $data['ablum']), 'car', 0, getConfig('config.app', 'imgUrl')) : array();
                $data['guarantee']  = explode(',', $data['guarantee']);
                $data['city_copy']  = $city[$data['city']];
                $data['brand_copy'] = $city[$data['city']];
            }

            $data['other'] = array(
                'city'    => $this->appArray($city),
                'gearbox' => $this->appArray(getVar('gearbox', 'car')),
                'gases'   => $this->appArray(getVar('gases', 'car')),
                'model'   => $this->appArray(getVar('model', 'car')),
            );

            $this->appReturn(array('data' => $data));
        }
    }

    /**
     * 编辑查看 提交 新增 服务
     * @date   2017-09-15T09:32:24+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function serviceEdit()
    {

    }
}
