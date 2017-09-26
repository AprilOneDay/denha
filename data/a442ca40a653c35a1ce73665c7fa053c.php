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
	<div id="console-content-edit">
		<div class="modal-content">
			<div class="panel-body">
				<form class="form-horizontal" role="form" action="">
					<fieldset>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span>店铺名称</span>
							</label>
							<div class="col-sm-8">
								<input type="text" value="<?php echo !isset($data['name']) ? null : $data['name']; ?>" name="name" placeholder="标题"  disabled class="form-control">	
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span>店铺头图</span>
							</label>
							<div class="col-sm-8">
								<img src="<?php echo $data['avatar']; ?>" width="150" height="100" style="margin-left: 10px;">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span for="myDate">店铺评分</span>
							</label>
							<div class="col-sm-8">
								<select data-selected="<?php echo !isset($data['tag']) ? null : $data['tag']; ?>" name="tag" class="form-control w160">
									<?php if($other['tag']){ foreach($other['tag'] as $key => $value){ ?>
	                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
	                            	<?php }} ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span for="myDate">店铺照片</span>
							</label>
							<div class="col-sm-8">
								<?php if($data['ablum']){ foreach($data['ablum'] as $key => $value){ ?>
									<img src="<?php echo $value; ?>" width="150" height="100" style="margin-left: 10px;">
								<?php }} ?>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger"></span>
								<span for="myDate">店铺认证信息</span>
							</label>
							<div class="col-sm-8">
								<?php if($data['ide_ablum']){ foreach($data['ide_ablum'] as $key => $value){ ?>
									<img src="<?php echo $value; ?>" width="150" height="100" style="margin-left: 10px;">
								<?php }} ?>
							</div>
						</div>
						<div class="form-group radio" data-radio="<?php echo !isset($data['is_ide']) ? null : $data['is_ide']; ?>">
							<label class="control-label col-sm-3">认证状态：</label>
							<div class="radio-inline">
								<label>
									<input type="radio"  name="is_ide"  value="0"> 未认证 
								</label>
							</div>
							<div class="radio-inline">
								<label >
									<input type="radio" name="is_ide"  value="1"> 已认证
								</label>
							</div>
							<div class="radio-inline">
								<label>
									<input type="radio"  name="is_ide"  value="2"> 认证未通过
								</label>
							</div>
						</div>
						<div class="form-group radio" data-radio="<?php echo !isset($data['status']) ? null : $data['status']; ?>">
							<label class="control-label col-sm-3">店铺状态</label>
							<div class="radio-inline">
								<label>
									<input type="radio" name="status"  value="1"> 开启
								</label>
							</div>
							<div class="radio-inline">
								<label >
									<input type="radio" name="status"  value="2"> 关闭
								</label>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<a type="submit" class="btn btn-primary btn-comply">确定</a>
				<button type="button" class="btn btn-default" id="btn-close" >取消</button>
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


</body>
</html>