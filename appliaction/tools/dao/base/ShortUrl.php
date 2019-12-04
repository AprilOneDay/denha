<?php
/**
 * 短地址模块
 */
namespace dao\base;

class ShortUrl
{
    public function getUrl($shortUrl)
    {
        $url = (string) table('ShortUrl')->where('short_url', $shortUrl)->order('id desc')->value('url');

        return $url;
    }

    public function urlShort($langUrl)
    {

        $shortUrl = table('ShortUrl')->where('url', $langUrl)->order('id desc')->value('short_url');
        if ($shortUrl) {
            return $shortUrl;
        }

        $url    = crc32($langUrl);
        $result = sprintf("%u", $url);

        while ($result > 0) {
            $s = $result % 62;
            if ($s > 35) {
                $s = chr($s + 61);
            } elseif ($s > 9 && $s <= 35) {
                $s = chr($s + 55);
            }

            $shortUrl .= $s;
            $result = floor($result / 62);

        }

        table('ShortUrl')->add(['url' => $langUrl, 'short_url' => $shortUrl]);

        return $shortUrl;
    }

}
