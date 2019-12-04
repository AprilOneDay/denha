<?php
namespace app\admin\common;

use denha\Controller;

class Clear extends Controller
{

    /** 清除缓存模板文件 /admin/common/clear/data_tpl_file */
    public function dataTplFile()
    {
        $path = DATA_TPL_PATH;

        if (is_dir($path)) {
            $p = scandir($path);

            $num = 0;
            foreach ($p as $val) {
                if (is_file($path . $val)) {
                    unlink($path . $val);
                    $num++;
                }
            }
        }

        $this->ajaxReturn(true, '清除成功:' . $num . '个文件');

    }

}
