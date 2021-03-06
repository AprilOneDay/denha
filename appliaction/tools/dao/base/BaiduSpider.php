<?php
/**
 * 百度抓取
 */
namespace dao\base;

class BaiduSpider
{

    /**
     * 百度主动推送
     * @date   2017-09-30T14:37:51+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function pull($content = '', $url = 'http://www.denha.cn/index/index/detail/s/id/', $token = '', $site = 'www.denha.cn')
    {
        $urls = (array) ($url . $content);
        if (!$content) {
            return array('status' => false, 'msg' => '内容为空');
        }

        $token = $token ? $token : config('sitemap_token');
        if (!$token) {
            return array('status' => false, 'msg' => 'token配置失败');
        }

        $api     = 'http://data.zz.baidu.com/urls?site=' . $site . '&token=' . $token;
        $ch      = curl_init();
        $options = array(
            CURLOPT_URL            => $api,
            CURLOPT_POST           => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POSTFIELDS     => implode("\n", $urls),
            CURLOPT_HTTPHEADER     => array('Content-Type: text/plain'),
        );

        curl_setopt_array($ch, $options);
        $result = curl_exec($ch);
        $result = json_decode($result, true);
        if (isset($result['error'])) {
            return array('status' => false, 'msg' => '百度主动推送失败：' . $result['error'] . ' ' . $result['message']);
        }

        return array('status' => true, 'msg' => '推送成功');
    }

    /**
     * 百度主动更新
     * @date   2017-09-30T14:37:51+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function update($content = '', $url = 'http://www.denha.cn/index/index/detail/s/id/', $site = 'www.denha.cn')
    {
        $urls = (array) ($url . $content);
        if (!$content) {
            return array('status' => false, 'msg' => '内容为空');
        }

        $token = $token ? $token : config('sitemap_token');
        if (!$token) {
            return array('status' => false, 'msg' => 'token配置失败');
        }

        $api     = 'http://data.zz.baidu.com/update?' . $site . '&token=' . $token;
        $ch      = curl_init();
        $options = array(
            CURLOPT_URL            => $api,
            CURLOPT_POST           => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POSTFIELDS     => implode("\n", $urls),
            CURLOPT_HTTPHEADER     => array('Content-Type: text/plain'),
        );
        curl_setopt_array($ch, $options);
        $result = curl_exec($ch);
        $result = json_decode($result, true);
        if (isset($result['error'])) {
            return array('status' => false, 'msg' => '百度主动推送失败：' . $result['error'] . ' ' . $result['message']);
        }

        return array('status' => true, 'msg' => '推送更新成功');
    }
}
