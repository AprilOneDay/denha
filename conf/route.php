<?php
use denha\Route;

$list = table('RouteRule')->field('url,change_url,type,params,suffix')->where('status', 1)->select();

foreach ($list as $key => $value) {
    Route::rule($value['url'], '/' . $value['change_url'], ['params' => $value['params'], 'suffix' => $value['suffix']]);
}
