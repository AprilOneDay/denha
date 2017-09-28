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
								<span>上级分类</span>
							</label>
							 <div class="col-sm-8">
								<select name="parentid" class="form-control w160" data-selected="<?php echo !isset($data['parentid']) ? null : $data['parentid']; ?>">
									<option value="0">作为一级分类</option>
									<?php if($treeList){ foreach($treeList as $key => $value){ ?>
									<option value="<?php echo $value['id']; ?>" ><?php echo $value['htmlname']; ?></option>
									<?php }} ?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>分类名称</span>
							</label>
							<div class="col-sm-8">
								<input type="text" value="<?php echo !isset($data['name']) ? null : $data['name']; ?>" name="name" placeholder="分类名称" class="form-control">	
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>缩略图</span>
							</label>
							<div class="col-sm-8">
								<a class="btn btn-primary btn-ablum" data-name="thumb" data-value='<?php echo !isset($data['thumb']) ? null : $data['thumb']; ?>' data-path="category" data-max="1">添加图片</a>
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
						
						<div class="form-group radio"  data-radio="<?php echo !isset($data['is_show']) ? null : $data['is_show']; ?>">
							<label class="control-label col-sm-3">是否显示：</label>
							<div class="radio-inline">
								<label>
									<input type="radio"  name="is_show" value="1" > 是
								</label>
							</div>
							<div class="radio-inline">
								<label >
									<input type="radio"  name="is_show" value="0"> 否
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