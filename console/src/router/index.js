import Vue from 'vue'
import Router from 'vue-router'


import Index from '@/console/index/Index' //后台首页框架

import Setting from '@/console/setting/menus/Index' //后台首页框架
import SettingAdd from '@/console/setting/menus/Edit' //后台首页框架

//const Setting = resolve => require(['../console/setting/menus/Index'], resolve);
//const SettingAdd = resolve => require(['../console/setting/menus/Edit'], resolve);

Vue.use(Router)

const routes = [
	{
    	path:'/',
    	component:Index
    },
	{
	    path: '/console',
	    component: Index,
	    meta: {
	      title:'Index'
	    },
	    //二级 对应denha/appliaction下的文件夹
	    children:[
	    	{path: 'menus/setting', component: Setting}
	    ]
    },
    {
    	path:'/console/setting/menus/add',
    	component:SettingAdd
    }
]

export default new Router({
  routes
})