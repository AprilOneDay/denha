<template>
	<div id="console-index-index">
	    
		<div class="wrapper">
			<nav class="sidebar-inner fl">
				<div class="sidebar-fold" ><span class="glyphicon glyphicon-transfer"></span></div>
				<ul>
					<li><a href="javascript:;" data-toggle="tooltip" data-placement="right" title="Tooltip on right"><span class="glyphicon glyphicon-triangle-right"></span>云计算机基础服务</a>
						<dl>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-tasks"></span>云服务器ECS</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-sort"></span>CDN</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-usd"></span>访问控制</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-phone"></span>云服务器ECS</a></dd>
						</dl>
					</li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>云计算机基础服务</a>
						<dl>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-tasks"></span>云服务器ECS</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-sort"></span>CDN</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-usd"></span>访问控制</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-phone"></span>云服务器ECS</a></dd>
						</dl>
					</li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>云计算机基础服务</a>
						<dl>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-tasks"></span>云服务器ECS</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-sort"></span>CDN</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-usd"></span>访问控制</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-phone"></span>云服务器ECS</a></dd>
						</dl>
					</li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>云计算机基础服务</a>
						<dl>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-tasks"></span>云服务器ECS</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-sort"></span>CDN</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-usd"></span>访问控制</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-phone"></span>云服务器ECS</a></dd>
						</dl>
					</li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>云计算机基础服务</a>
						<dl>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-tasks"></span>云服务器ECS</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-sort"></span>CDN</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-usd"></span>访问控制</a></dd>
							<dd><a href="javascript:;"><span class="glyphicon glyphicon-phone"></span>云服务器ECS</a></dd>
						</dl>
					</li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-tasks"></span>访问控制</a></li>
				</ul>
			</nav>
			
			<div class="product-nav-scene fl">
				<div class="title">设置</div>
				<ul>
					<li><router-link to="/setting/menus"><span></span>配置菜单</router-link></li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>存储</a>
						<dl>
							<dd><a href="javascript:;">云盘</a></dd>
							<dd><a href="javascript:;">文件存储</a></dd>
						</dl>
					</li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>存储</a>
						<dl>
							<dd><a href="javascript:;">云盘</a></dd>
							<dd><a href="javascript:;">文件存储</a></dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="content-main fl" >
				<router-view></router-view>
			</div>
		</div>
	</div>
</template>
<script>
export default {
  name: 'home',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>