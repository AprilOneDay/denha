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
	<div id="console-setting-menus-edit">
		<div class="modal-content">
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="">
					<input type="hidden" value="<?php echo !isset($data['id']) ? null : $data['id']; ?>" name="id">	
					<fieldset>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span>规则内容</span>
							</label>
							<div class="col-sm-8">
								<input type="text" value="<?php echo !isset($data['content']) ? null : $data['content']; ?>" name="content" placeholder="菜单名称" disabled class="form-control">	
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>积分数</span>
							</label>
							<div class="col-sm-8">
								<input type="text" value="<?php echo !isset($data['value']) ? null : $data['value']; ?>" name="value" placeholder="菜单名称" class="form-control">	
							</div>
						</div>
						
						<div class="form-group radio"  data-radio="<?php echo !isset($data['status']) ? null : $data['status']; ?>">
							<label class="control-label col-sm-3">是否显示：</label>
							<div class="radio-inline">
								<label>
									<input type="radio"  name="status" value="1" > 是
								</label>
							</div>
							<div class="radio-inline">
								<label >
									<input type="radio"  name="status" value="0"> 否
								</label>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary btn-comply" click="comply">确定</button>
				<button type="button" class="btn btn-default" id="btn-close">取消</button>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="/ststic/admin/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="/ststic/admin/js/common.js"></script>
	<script type="text/javascript" src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/vendor/pace/pace.min.js"></script>
	<script type="text/javascript" src="/vendor/layer/layer.js"></script>
	<script type="text/javascript" src="/vendor/laydate/laydate.js"></script>
    <script type="text/javascript" src="/vendor/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/vendor/ueditor/ueditor.all.js"></script>


	<script type="text/javascript">

	</script>
</body>
</html>