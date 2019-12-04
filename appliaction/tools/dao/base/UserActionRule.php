<?php
/**
 * 用户行文规则模块
 */
namespace dao\base;

class UserActionRule
{
    /**
     * 获取规则信息
     * @date   2017-09-18T13:48:49+0800
     * @author ChenMingjiang
     * @param  [type]                   $id [description]
     * @return [type]                       [description]
     */
    public function get($id)
    {
        $data = where('UserActionRule')->where('id', $id)->find();
        return $data;
    }

    /**
     * 直接增加记录信息
     * @date   2017-10-25T14:23:33+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid     [用户uid]
     * @param  [type]                   $content [内容]
     * @param  [type]                   $value   [积分值]
     * @param  boolean                  $isUser  [是否执行修改会员积分]
     */
    public function addTemp($uid = 0, $content = '', $type = 0, $value = 0, $flag = '', $isUser = true)
    {
        if (!$uid) {
            return ['status' => false, 'msg' => '参数错误'];
        }

        if (!$type) {
            return ['status' => false, 'msg' => '输入记录类型'];
        }

        if (!$content) {
            return ['status' => false, 'msg' => '请输入积分内容'];
        }

        $data['type']    = $type;
        $data['flag']    = $flag;
        $data['uid']     = $uid;
        $data['content'] = $content;
        $data['value']   = $value;
        $data['created'] = TIME;
        $reslut          = table('UserActionLog')->add($data);

        // 增加用户积分
        if ($reslut && $isUser && $type == 1) {
            $reslut = $this->type_1($uid, $data['value']);
        }

        return ['status' => true, 'msg' => '操作完成', 'data' => ['value' => $value]];
    }

    /**
     * 通过规则触发流程
     * @date   2019-02-21T17:18:20+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid     [description]
     * @param  [type]                   $flag    [description]
     * @param  array                    $options [description]
     *                                           get_value  增加对应积分/经验/xxx 值 如此存在值 则 覆盖默认规则值
     *                                           lose_value 减少对应积分/经验/xxx 值 如此存在值 则 覆盖默认规则值
     *                                           params  动态字段
     *                                           is_change 是否执行修改 默认:true true:执行对应值的修改 false:只记录不修改
     *                                           is_change_all 修改总积分 默认情况下增加积分修改，减少积分不修改 false:不修改 true:强制修改
     */
    public function add($uid, $flag, $options = [])
    {

        $getValue  = isset($options['get_value']) ? $options['get_value'] : 0;
        $loseValue = isset($options['lose_value']) ? $options['lose_value'] : 0;
        $params    = isset($options['params']) ? $options['params'] : '';
        $isChange  = isset($options['is_change']) ? $options['is_change'] : true;

        if (!$uid || !$flag) {
            return ['status' => false, 'msg' => '参数错误'];
        }

        $rule = table('UserActionRule')->where('flag', $flag)->find();

        if (!$rule) {
            return ['status' => false, 'msg' => '规则信息不存在'];
        }

        if (!$rule['status']) {
            return ['status' => false, 'msg' => '操作失败,该功能已关闭'];
        }

        $data['uid']     = $uid;
        $data['flag']    = $flag;
        $data['content'] = $rule['content'];
        $data['params']  = json_encode($params, JSON_UNESCAPED_UNICODE);
        $data['created'] = TIME;

        $getValue  = (int) ($getValue ? $getValue : $rule['get_value']);
        $loseValue = -(int) ($loseValue ? $loseValue : $rule['lose_value']);

        // 得到
        if ($rule['get_type'] && $getValue > 0) {
            // 保存日志
            $data['type']  = $rule['get_type'];
            $data['value'] = (string) $getValue;
            $reslut        = table('UserActionLog')->add($data);

            if ($reslut === false) {
                return ['status' => false, 'msg' => '记录添加失败'];
            }

            if ($isChange) {
                switch ($rule['get_type']) {
                    case '1':
                        $reslut = $this->type_1($uid, $getValue, $options)['status'];
                        break;
                    case '2':
                        $reslut = $this->type_2($uid, $getValue, $options)['status'];
                        break;
                    case '3':
                        $reslut = $this->type_3($uid, $getValue, $options)['status'];
                        break;
                    case '4':
                        $reslut = $this->type_4($uid, $getValue, $options)['status'];
                        break;
                    default:
                        # code...
                        break;
                }
            }

            if ($reslut === false) {
                return ['status' => false, 'msg' => $class . '：操作失败'];
            }
        }

        // 失去
        if ($rule['lose_type'] && $loseValue < 0) {
            // 保存日志
            $data['type']  = $rule['lose_type'];
            $data['value'] = (string) $loseValue;

            $reslut = table('UserActionLog')->add($data);

            if ($reslut === false) {
                return ['status' => false, 'msg' => '记录添加失败'];
            }

            if ($isChange) {
                switch ($rule['lose_type']) {
                    case '1':
                        $reslut = $this->type_1($uid, $loseValue, $options)['status'];
                        break;
                    case '2':
                        $reslut = $this->type_2($uid, $loseValue, $options)['status'];
                        break;
                    case '3':
                        $reslut = $this->type_3($uid, $loseValue, $options)['status'];
                        break;
                    case '4':
                        $reslut = $this->type_4($uid, $loseValue, $options)['status'];
                        break;
                    default:
                        # code...
                        break;
                }
            }

            if ($reslut === false) {
                return ['status' => false, 'msg' => $class . '：操作失败'];
            }
        }

        return ['status' => true, 'msg' => '操作完成'];
    }

    // 积分操作
    public function type_1($uid, $value = 0, $options = [])
    {
        $isChangeAll = isset($options['is_change_all']) ? $options['is_change_all'] : false;

        // 更变用户积分
        $data['integral'] = ['add', $value];

        if ($value > 0 || $isChangeAll) {
            $data['integral_all'] = ['add', $value];
        }

        // flase 强制不修改
        if (!$isChangeAll && isset($data['integral_all'])) {
            unset($data['integral_all']);
        }

        $result = table('User')->where('uid', $uid)->save($data);
        if ($result === false) {
            return ['status' => false, 'msg' => '操作失败'];
        }

        return ['status' => true, 'msg' => '操作成功'];
    }

    // 经验值操作
    public function type_2($uid, $value = 0, $options = [])
    {
        //更变用户积分
        $result = table('User')->where('uid', $uid)->save('experience', 'add', $value);
        if (!$result) {
            return ['status' => false, 'msg' => '操作失败'];
        }

        return ['status' => true, 'msg' => '操作成功'];
    }

    // 抵扣卷操作
    public function type_3($uid, $value = 0, $options = [])
    {
        $couponIds = explode(',', $value);
        foreach ($couponIds as $couponId) {
            $result = dao('Coupon')->send($uid, $couponId, 2);
        }
    }

    // 金额操作
    public function type_4($uid, $value = 0, $options = [])
    {
        // 更变用户金额
        $result = table('User')->where('uid', $uid)->save('money', 'add', $value);
        if (!$result) {
            return ['status' => false, 'msg' => '操作失败'];
        }

        return ['status' => true, 'msg' => '操作成功'];
    }

    /**
     * 获取积分规则文案
     * @date   2018-01-19T17:29:40+0800
     * @author ChenMingjiang
     * @param  [type]                   $flag [规则标识符]
     * @param  string                   $lg   [语言]
     * @return [type]                         [description]
     */
    public function getRuleTitle($flag, $lg = 'zh')
    {
        $map         = [];
        $map['flag'] = $flag;

        if ($lg != 'zh') {
            $field = 'content_' . $lg;
        } else {
            $field = 'content';
        }

        $title = (string) table('UserActionRule')->where($map)->field($field)->value();

        return $title;
    }

    /** 积分明细列表 */
    public function getList($uid, $lg = 'zh', $pageNo, $pageSize = 99)
    {
        $map        = [];
        $map['uid'] = $uid;

        $offer = max(($pageNo - 1) * $pageSize, 0);

        $list = table('IntegralLog')->where($map)->order('created desc')->limit($offer, $pageSize)->select();

        foreach ($list as $key => $value) {

            $value['value'] < 0 ?: $list[$key]['value'] = '+' . $value['value'];

            $list[$key]['title']        = $this->getRuleTitle($value['flag'], $lg);
            $list[$key]['created_copy'] = date('Y-m-d', $value['created']);
        }

        return $list;
    }
}
