<?php
namespace Controller\Pc;

use Denha;

class Init extends Denha\Controller
{
    public $templateList;
    public $title;
    public $keywords;
    public $description;

    public function checkedCatid()
    {
        //获取所选模板
        $catid = get('catid', 'intval', 0);
        if (!$catid) {
            die('参数错误');
        }
        $category = table('category')->where(array('catid' => $catid))->field('setting')->find();
        !$category ? die('栏目信息不存在') : '';
        $setting = json_decode($category['setting'], true);
        if (!$setting) {
            @eval("\$setting = $category[setting];");
        }

        if ($setting['meta_title']) {
            $this->title       = $setting['meta_title'];
            $this->keywords    = $setting['meta_keywords'];
            $this->description = $setting['meta_description'];
        } else {
            $site              = table('site')->where(array('siteid' => 1))->field('name,site_title,description')->find();
            $this->title       = $site['name'];
            $this->keywords    = $site['site_title'];
            $this->description = $site['description'];
        }

        return $this->templateList = $setting['template_list'];
    }

}
