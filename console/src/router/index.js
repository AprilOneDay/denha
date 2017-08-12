import Vue from 'vue'
import Router from 'vue-router'


import Index from '@/console/index/Index' //后台首页框架
import Login from '@/console/index/Login' //后台首页框架

//import Setting from '@/console/setting/menus/Index' //后台首页框架
//import SettingAdd from '@/console/setting/menus/Edit' //后台首页框架

//const Setting = resolve => require(['../console/setting/menus/Index'], resolve);


Vue.use(Router)

const routes = [
	{
    	path:'/',
    	component:Login
    },
	{
	    path: '/console',component: Index,
	    children:[
	    	{path: 'setting/menus/index', component: resolve => require(['../console/setting/menus/Index'], resolve)},
	    	{path: 'setting/admin/index', component: resolve => require(['../console/setting/admin/Index'], resolve)},
	    ]
    },
]

export default new Router({
  routes
})