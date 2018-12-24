<?php
/**
 * 路由规则模块
 */
namespace dao\base;

use denha\Route;

class RouteRule
{
    public $cacheNamePrex = 'route_';

    //清除缓存
    public function clearCache($id = 0, $url = '')
    {

        $route     = table('RouteRule')->where('id', $id)->field('url,params')->find();
        $cacheName = $this->cacheNamePrex . $route['url'] . '/' . $route['params'];
        cache($cacheName, null);

        if ($url) {
            $cacheName = 'route_' . $url;
            cache($cacheName, null);
        }

    }

    /** 查询单条规则 */
    public function find($map = [])
    {

        $url    = !empty($map['url']) ? $map['url'] : '';
        $params = !empty($map['params']) ? $map['params'] : '';

        $cacheName = $this->cacheNamePrex . $url . '/' . $params;

        $route = table('RouteRule')->where($map)->field('url,change_url,suffix,status,type,params')->find();

        return $route;
    }

    /** 检测路由 */
    public function checkRoute($route)
    {
        if ($route) {
            //未开启
            if (empty($route['status']) || $route['status'] != 1) {
                $route = [];
            }

            //手机版未开启
            if (isMobile() && strpos($route['type'], '2') === false) {
                $route = [];
            }

            //PC版未开启
            if (!isMobile() && strpos($route['type'], '1') === false) {
                $route = [];
            }
        }

        return $route;

    }

    /** 检查路由规则 */
    public function getRouteUrl($uri, $params = '')
    {

        $uriArr = explode('/s/', $uri);

        if (isset($uriArr[1])) {
            $params    = $uriArr[1];
            $changeUrl = $uriArr[0];
        } else {
            $changeUrl = $uri;
        }

        $changeUrl = ltrim(trim($changeUrl), '/');

        // 先查询参数路由
        $map               = [];
        $map['change_url'] = $changeUrl;
        if (!empty($params)) {
            $map['params'] = $params;
        }
        $route = dao('RouteRule')->find($map);

        // 再查询不带参数路由
        if (!$route && !empty($params)) {
            $route = dao('RouteRule')->find(['change_url' => $changeUrl]);
        }

        // 保留GET参数
        if (!empty($route['params'])) {
            Route::changeGetValue($route['params']);
        }

        return isset($route['url']) ? ($params ? $route['url'] . '/s/' . $params : $route['url']) : $uri;
    }

    /** 检查路由规则 */
    public function getRouteChangeUrl($uri, $params = '')
    {

        $uriArr = explode('/s/', $uri);
        if (isset($uriArr[1])) {
            $params    = $uriArr[1];
            $changeUrl = $uriArr[0];
        } else {
            $changeUrl = $uri;
        }

        $changeUrl = '/' . ltrim(trim($changeUrl), '/');

        // 先查询参数路由
        $map        = [];
        $map['url'] = $changeUrl;
        if (!empty($params)) {
            $map['params'] = $params;
        }

        $route = dao('RouteRule')->find($map);
        // 如果查询到route 则去除params参数
        $params = $route && $params ? '' : $params;

        // 再查询不带参数路由
        if (!$route && !empty($params)) {
            $route = dao('RouteRule')->find(['url' => $changeUrl]);
        }

        return '/' . ltrim(isset($route['change_url']) ? ($params ? $route['change_url'] . '/s/' . $params : '/' . $route['change_url']) : $uri, '/');
    }
}
