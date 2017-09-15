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
			<div class="modal-body clearfix">
				<div class="panel">
					<div class="panel-body">
						<form class="form-horizontal" role="form" action="">
							<input type="hidden" value="<?php echo !isset($data['id']) ? null : $data['id']; ?>" name="id">	
							<fieldset>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>上级菜单</span>
									</label>
									 <div class="col-sm-8">
										<select name="parentid" class="form-control w160" data-selected="<?php echo !isset($data['parentid']) ? null : $data['parentid']; ?>">
											<option value="0">作为一级菜单</option>
											<?php if($treeList){ foreach($treeList as $key => $value){ ?>
											<option value="<?php echo $value['id']; ?>" ><?php echo $value['htmlname']; ?></option>
											<?php }} ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>菜单名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['name']) ? null : $data['name']; ?>" name="name" placeholder="菜单名称" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>Icon图标</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['icon']) ? null : $data['icon']; ?>" name="icon" placeholder="Icon图标" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>模块名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['module']) ? null : $data['module']; ?>" name="module" placeholder="控制器名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>控制器名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['controller']) ? null : $data['controller']; ?>" name="controller" placeholder="控制器名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>方法名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['action']) ? null : $data['action']; ?>" name="action" placeholder="方法名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>附加参数</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['parameter']) ? null : $data['parameter']; ?>" name="parameter" placeholder="附加参数" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>请求地址</span>
									</label>
									<div class="col-sm-8">
										<input type="text" value="<?php echo !isset($data['url']) ? null : $data['url']; ?>" name="url" placeholder="请求地址" class="form-control">
									</div>
								</div>
								<div class="form-group radio" data-radio="<?php echo !isset($data['is_show']) ? null : $data['is_show']; ?>">
									<label class="control-label col-sm-3">是否显示：</label>
									<div class="radio-inline">
										<label>
											<input type="radio"  name="is_show" value="1" checked> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio"  name="is_show" value="0"> 否
										</label>
									</div>
								</div>
								<div class="form-group radio" data-radio="<?php echo !isset($data['is_white']) ? null : $data['is_white']; ?>">
									<label class="control-label col-sm-3">是否白名单：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" name="is_white"  value="1" > 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio"  name="is_white"  value="0" checked> 否
										</label>
									</div>
								</div>
								<div class="form-group radio" data-radio="<?php echo !isset($data['status']) ? null : $data['status']; ?>">
									<label class="control-label col-sm-3">是否有效：</label>
									<div class="radio-inline">
										<label>
											<input type="radio"  name="status"  value="1" checked> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" name="status"  value="0"> 否
										</label>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
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

	<script type="text/javascript">

	</script>
</body>
</html>