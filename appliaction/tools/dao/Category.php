<?php
namespace app\tools\dao;

class Category
{
    public function getList($id = 0)
    {

        static $_category = array();

        if(!isset($_category[$id])){
    	 	$map['parentid'] = $id;
        	$list            = table('Category')->where($map)->field('id,name')->find('array');

	        foreach ($list as $key => $value) {
	            $list[$value['id']] = $value['name'];
	        }
        }


        return $_category[$id]
    }

}
