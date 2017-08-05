<template>
	<div id="console-menus-index">
		<div class="view-content-container" >
			<div class="row">
				<div class="col-sm-12">
					<div class="console-title console-title-border clearfix">
						<div class="pull-left">
							<h5>菜单列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary btn-console-open" data-href="/#/add" data-height="80%">添加菜单</a>
						</div>
					</div>
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width:75px;">ID</th>
											<th>菜单名称</th>
											<th style="width:120px;">图标</th>
											<th style="width:120px;">模块</th>
											<th style="width:120px;">控制器</th>
											<th style="width:120px;">方法</th>
											<th style="width:120px;">附加参数</th>
											<th style="width:80px; text-align:center;">排序</th>
											<th style="width:80px; text-align:center;">状态</th>
											<th style="width:80px; text-align:center;">显示</th>
											<th style="width:160px; text-align:center;">编辑/操作</th>
										</tr>
									</thead>
									<tbody>
										<!-- <tr ng-repeat="uo in list" id="{{uo.id}}">
											<td>{{uo.id}}</td>
											<td><span ng-bind-html="uo.delimiter|trustAsHtml"></span>{{uo.name}}</td>
											<td>{{uo.icon}}</td>
											<td>{{uo.module}}</td>
											<td>{{uo.controller}}</td>
											<td>{{uo.action}}</td>
											<td>{{uo.parameter}}</td>
											<td align='center'>{{uo.sort}}</td>
											<td align='center'>{{uo.status}}</td>
											<td align='center'>{{uo.is_show}}</td>
											<td align='center'>
												<a ng-click="open(0,uo.id)">添加子菜单</a>
												<span class="text-explode">|</span>
												<a ng-click="open(uo.id,0)">编辑</a>
												<span class="text-explode">|</span>
												<a ng-click="delete(uo.id)">删除</a>
											</td>
										</tr> -->
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>