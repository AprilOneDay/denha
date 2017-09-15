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
	<div id="console-setting-admin-edit">
		<div class="modal-content">
			<div class="modal-body clearfix">
				<div class="panel">
					<div class="panel-body">
						<form class="form-horizontal" role="form">
							<fieldset>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>昵称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['nickname']) ? null : $data['nickname']; ?>" name="nickname" placeholder="昵称" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>用户名</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['username']) ? null : $data['username']; ?>" name="username" placeholder="用户名" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>密码</span>
									</label>
									<div class="col-sm-8">
										<input type="password" value="<?php echo !isset($data['password']) ? null : $data['password']; ?>" name="password" placeholder="密码" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>所属分组</span>	
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['group']) ? null : $data['group']; ?>" name="group" placeholder="所属分组" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>手机号</span>	
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['mobile']) ? null : $data['mobile']; ?>" name="mobile" placeholder="手机号" class="form-control">
									</div>
								</div>
								
								<div class="form-group radio" data-radio="<?php echo !isset($data['status']) ? null : $data['status']; ?>">
									<label class="control-label col-sm-3">状态：</label>
									<div class="radio-inline">
										<label>
											<input type="radio"  name="status" value="1" > 开启
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio"  name="status" value="0"> 关闭
										</label>
									</div>
								</div>
								
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary btn-comply" >确定</button>
				<button type="button" class="btn btn-default" id="btn-close">取消</button>
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