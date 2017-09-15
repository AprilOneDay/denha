<!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
	<meta name="keywords" content=""/>
	<title>后台管理</title>
		<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/vendor/pace/themes/blue/pace-theme-minimal.css" />
	<link rel="stylesheet" href="/ststic/admin/css/common.css" />
	<link rel="stylesheet" href="/ststic/admin/css/css.css" />
</head>
  	<body>
	<div id="console-setting-menus-index">
		<div class="view-content-container" >
			<div class="row">
				<div class="col-sm-12">
					<div class="console-title console-title-border clearfix">
						<div class="pull-left">
							<h5>菜单列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary btn-open" data-href="<?php echo url('edit'); ?>"  data-height="750px">添加菜单</a>
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
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr>
											<td><?php echo $value['id']; ?></td>
											<td><span><?php echo $value['delimiter']; ?></span><?php echo $value['name']; ?></td>
											<td><?php echo $value['module']; ?></td>
											<td><?php echo $value['controller']; ?></td>
											<td><?php echo $value['action']; ?></td>
											<td><?php echo $value['parameter']; ?></td>
											<td align='center'><?php echo $value['sort']; ?></td>
											<td align='center'><?php echo $value['status']; ?></td>
											<td align='center'><?php echo $value['is_show']; ?></td>
											<td align='center'>
												<a class="btn-open" data-href="<?php echo url('edit',array('parentid'=>$value['id'])); ?>" data-title="编辑菜单" data-height="800px" data-parentId="list.id">添加子菜单</a>
												<span class="text-explode">|</span>
												<a class="btn-open" data-href="<?php echo url('edit',array('id'=>$value['id'])); ?>" data-title="编辑菜单" data-id="list.id"  data-height="800px">编辑</a>
												<span class="text-explode">|</span>
												<a onclick="del(list.id)">删除</a>
											</td>
										</tr>
										<?php }} ?>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="/ststic/admin/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="/ststic/admin/js/common.js"></script>
	<script type="text/javascript" src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/vendor/pace/pace.min.js"></script>
	<script type="text/javascript" src="/vendor/layer/layer.js"></script>

	<script type="text/javascript">
	</script>
</body>
</html>