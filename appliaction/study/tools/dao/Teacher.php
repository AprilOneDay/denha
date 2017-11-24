<?php
/**
 * 老师相关模块
 */
namespace app\study\tools\dao;

class Teacher
{
    /**
     * 获取老师关联课程
     * @date   2017-11-24T11:30:35+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid [老师uid]
     * @return [type]                        [description]
     */
    public function getTeacherCourseList($uid)
    {
        $map['teacher_uid'] = $uid;
        $courseList         = dao('Article')->getList($map, 'title,btitle,id', 3);

        return $courseList;
    }
}
