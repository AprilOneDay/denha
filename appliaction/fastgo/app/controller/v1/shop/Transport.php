<?php
/**
 * 商家会员相关
 */
namespace app\fastgo\app\controller\v1\shop;

use app\fastgo\app\controller\v1\Init;

class Transport extends Init
{
    
	/*获取中转地址*/
	public function transferAddress(){
		
		$cityId = post('cityId', 'intval', '');
		$data = table('warehouseInfo')->where('country_id',$cityId)->field('id,name,mobile,address,zip_code')->find();
		if (empty($data)) {
            $this->appReturn(array('status' => false, 'msg' => '暂无地址信息'));
        }
		
		$transInfo = array('转运包裹先寄到Fastgo中转仓,分别拆包转运哦-收件人、仓库地址是Fastgo收录包裹的唯一标识,不可更改!','亲,邮寄物品分国际管制和国内管制哦，"禁运物品"寄到Fastgo中转仓也没有办法帮您转运出去呢！为了给您更好的转运体验，请跟随我一起了解"禁运物品"有哪些把');
		
		$this->appReturn(array('msg' => '获取数据成功', 'data' => $data,'transInfo'=>$transInfo);

	}
	
	/*设置默认中转地址*/
	public function defaultTransfer(){
		
		$trans_id = post('id', 'intval', '');
		$uid = $this->uid;
		if(!$uid){
			$this->appReturn(array('status' => false, 'msg' => '请登录后在操纵'));
		}
		if(!$trans_id){
			$this->appReturn(array('status' => false, 'msg' => '请选择需要设为默认的中转地址'));
		}
		$result = table('user')->where('id',$uid)->save(array('default_transfer'=>$trans_id));
		$this->appReturn(array('msg' => '操作成功'));
		
	}
	
	/*获取默认中转地址*/
	public function addPackage(){
		
		$uid = $this->uid;
		if(!$uid){

			$this->appReturn(array('status' => false, 'msg' => '请登录后在操纵'));
			
		}

		$user = table('user')->where('id',$uid)->field('default_transfer')->find();
		if(empty($user['default_transfer'])){
			
			$this->appReturn(array('status' => false, 'msg' => '未设置默认中转地址'));
			
		}
		$data = table('warehouseInfo')->where('id',$user['default_transfer'])->find();
		$this->appReturn(array('msg' => '获取数据成功', 'data' => $data);
		
	}

}
