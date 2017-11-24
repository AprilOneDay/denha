<?php
/**
 * 教室相关功能
 */
namespace app\study\tools\dao;

class Classroom
{
    /** 进入教室记录 */
    public function centerLog($uid = 0, $type = 1, $data = array(), $goodsId = 0, $courseId = 0)
    {

        $data['uid']       = $uid;
        $data['type']      = $type;
        $data['goods_id']  = $goodsId;
        $data['course_id'] = $courseId;

        $data['created'] = TIME;

        $map['uid']       = $uid;
        $map['type']      = $type;
        $map['goods_id']  = $goodsId;
        $map['course_id'] = $courseId;

        $classroomLog = table('TeacherClassroomLog')->where($map)->find();
        if (!$classroomLog) {

            $result = table('TeacherClassroomLog')->add($data);
            if (!$result) {
                return array('status' => false, 'msg' => '操作失败');
            }
        } else {

            $data            = array();
            $data['created'] = TIME;

            $result = table('TeacherClassroomLog')->where('id', $classroomLog['id'])->svae($data);
            if (!$result) {
                return array('status' => false, 'msg' => '操作失败');
            }
        }

        return array('status' => true, 'msg' => '操作成功');

    }
}
