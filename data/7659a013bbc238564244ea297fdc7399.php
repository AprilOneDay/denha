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
	<div id="console-admin-index">
		<div class="view-content-container" >
			<div class="row">
				<div class="col-sm-12">
					<div class="console-title console-title-border clearfix">
						<div class="pull-left">
							<h5>管理员列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary btn-open"  data-href="<?php echo url('edit'); ?>"  data-height="600px" data-width="356px">添加管理员</a>
						</div>
					</div>
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th >ID</th>
											<th>用户名</th>
											<th>昵称</th>
											<th>管理组</th>
											<th>手机号</th>
											<th>创建时间</th>
											<th>登录时间</th>
											<th>状态</th>
											<th style="text-align:center;">编辑/操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in data.list">
											<td><?php echo $value['id']; ?></td>
											<td><?php echo $value['username']; ?></td>
											<td><?php echo $value['nickname']; ?></td>
											<td><?php echo $value['group']; ?></td>
											<td><?php echo $value['mobile']; ?></td>
											<td><?php echo date('Y-m-d H:i',$value['created']); ?></td>
											<td><?php echo date('Y-m-d H:i',$value['login_time']); ?></td>
											<td>
												<?php if($value['status']){ ?>
													<p style="color:green"><?php echo $statusCopy[$value['status']]; ?></p>
												<?php }else{ ?>
													<p style="color:red"><?php echo $statusCopy[$value['status']]; ?></p>
												<?php } ?>
											</td>
											<td align='center'>
												<a data-title="编辑管理员" class="btn-open"  data-href="<?php echo url('edit',array('id'=>$value['id'])); ?>"  data-height="600px" data-width="356px">编辑</a>
												<span class="text-explode">|</span>
												<a @click="del(list.id)">删除</a>
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