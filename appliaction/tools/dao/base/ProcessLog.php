<?php
/**
 * 流程操作记录
 */
namespace dao\base;

class ProcessLog
{

    /**
     * 提交流程记录 多步操作 注意执行该方法前开启事务流程防止数据异常
     * @date   2019-04-27T16:03:41+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid      [操作人uid]
     * @param  [type]                   $status   [所属值]
     * @param  [type]                   $links    [关联值 数组则批量提交]
     * @param  [type]                   $options  [配置参数]
     *                                            tables 同步更新其他数据的状态字段到最新值 [数据表,关联link的字段名称,需要更新字段名称]
     *                                            remark 流程操作备注
     *                                            params 其他参数
     *                                            type   手动定义类型
     */
    public function add($uid, $status, $links, $options = [])
    {
        if (!$uid || !$status || !$links) {
            return false;
        }

        $tables = isset($options['tables']) ? $options['tables'] : []; // 同步更新其他数据的状态字段到最新值
        $remark = isset($options['remark']) ? $options['remark'] : '';
        $params = isset($options['params']) ? $options['params'] : [];
        $type   = isset($options['type']) ? $options['type'] : 0;

        $links = is_array($links) ? $links : (array) $links;

        // 根据status 获取type类型
        if (!$type) {
            $type = table('Category')->where('id', $status)->value('parentid');
        }

        foreach ($links as $id) {
            if ($id) {
                $data[] = [
                    'uid'     => $uid,
                    'type'    => $type,
                    'status'  => $status,
                    'link'    => $id,
                    'remark'  => $remark,
                    'params'  => json_encode($params),
                    'created' => TIME,
                    'is_new'  => 1,
                ];
            }
        }

        // 之前状态更新为老状态
        $map           = [];
        $map['type']   = $type;
        $map['link']   = ['in', $links];
        $map['is_new'] = 1;
        $result        = table('ProcessLog')->where($map)->save('is_new', 0);

        // 提交新状态
        $result = table('ProcessLog')->addAll($data);

        if ($result === false) {
            return false;
        }

        // $tables[数据表,关联link的字段名称,需要更新字段名称]
        // 同步更新$tableName表的$statusField的值
        if ($tables) {
            foreach ($tables as $table) {
                list($tableName, $mapField, $statusField) = $table;

                if (!$tableName || !$mapField || !$statusField) {
                    return false;
                }

                $map            = [];
                $map[$mapField] = ['in', $links];

                $data               = [];
                $data[$statusField] = $status;

                $result = table($tableName)->where($map)->save($data);

                if ($result === false) {
                    return false;
                }
            }
        }

        return true;

    }

}
