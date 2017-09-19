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
								<span class="text-danger">*</span>
								<span>缩略图</span>
							</label>
							<div class="col-sm-8">
								<a class="btn btn-primary btn-ablum" data-name="path" data-value='<?php echo !isset($data['path']) ? null : $data['path']; ?>' data-path="banner" data-max="1">添加图片</a>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span>简介</span>
							</label>
							<div class="col-sm-8">
								<textarea name="description" placeholder="简介" class="form-control"><?php echo !isset($data['description']) ? null : $data['description']; ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>排序</span>
							</label>
							<div class="col-sm-8">
								<input type="text" value="<?php echo !isset($data['sort']) ? null : $data['sort']; ?>" name="sort" placeholder="排序" class="form-control">	
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