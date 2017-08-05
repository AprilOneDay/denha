import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import Home from '@/components/Home'
import Index from '@/console/index/Index' //后台首页框架

import Setting from '@/console/setting/menus/Index' //后台设置
import SettingAdd from '@/console/setting/menus/Edit' //后台编辑菜单
import Firstcomponent from '@/components/Firstcomponent'

Vue.use(Router)

const routes = [
	{
	    path: '/',
	    component: Index,
	    meta: {
	      title:'Home'
	    },
	    //二级 对应denha/appliaction下的文件夹
	    children:[
	    	{
		    	path: 'setting', 
		    	component: Setting,
		    	//三级别 对应denha\application\二级名称 下的文件夹
		    	children:[
		    		{
		    			path:'menus',
		    			component:Setting,
		    		},
		    		{
		    			path:'add',
		    			component:SettingAdd,
		    		}
	    		]
	    	}
	    ]
    },
    {
    	path:'/add',
    	component:SettingAdd
    }
]

export default new Router({
  routes
})