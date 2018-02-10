<?php
/**
 * 车友圈模块
 */
namespace app\chd\h5\controller\index;

use denha\Controller;

class Download extends Controller
{

    public function index()
    {
        $w   = get('w', 'intval', 200);
        $h   = get('h', 'intval', 200);
        $img = 'http://qr.liantu.com/api.php?text=' . URL . '/h5/index/download/all&w=' . $w . '&h=' . $h;
        header("Content-Type:image/png");
        echo file_get_contents($img);
    }

    public function all()
    {
        $agent = $_SERVER['HTTP_USER_AGENT'];
        // if (stripos($agent, 'iphone') || stripos($agent, 'ipad')) {
        //     $src = 'https://itunes.apple.com/us/app/pocket-auto-ca/id1309482351?l=zh&ls=1&mt=8';
        // } else {
        $src = URL . '/uploadfile/app/app.apk';
        // }
        if (stripos($agent, 'MicroMessenger')) {
            //header("Content-Type:image/png");
            //echo file_get_contents(URL . '/uploadfile/app/wxtips.png');
            $this->show();
        } else {
            header('LOCATION:' . $src);
        }

    }

}
