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
								<span>关键词</span>
							</label>
							<div class="col-sm-8">
								<select name="type" class="form-control w160" >
									<option value="0">选择类型</option>
									<?php if($other['typeCopy']){ foreach($other['typeCopy'] as $key => $value){ ?>
									<option value="<?php echo $key; ?>" ><?php echo $value; ?></option>
									<?php }} ?>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>关键词</span>
							</label>
							<div class="col-sm-8">
								<input type="text" name="value" placeholder="关键词" class="form-control">	
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span>排序</span>
							</label>
							<div class="col-sm-8">
								<input type="text" name="sort" value="0"  placeholder="排序" class="form-control">	
							</div>
						</div>
						
						<div class="form-group radio" >
							<label class="control-label col-sm-3">状态：</label>
							<div class="radio-inline">
								<label>
									<input type="radio"  name="status" value="1" checked> 开启
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