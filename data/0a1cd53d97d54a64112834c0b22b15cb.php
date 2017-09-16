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
				<form class="form-horizontal" role="form">
					<fieldset>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>标题</span>
							</label>
							<div class="col-sm-8">
								<input type="text" value="<?php echo !isset($data['title']) ? null : $data['title']; ?>" name="title" placeholder="标题"  required class="form-control">	
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>缩略图</span>
							</label>
							<div class="col-sm-8">
								<up-img  value="<?php echo !isset($data['thumb']) ? null : $data['thumb']; ?>" name="thumb" :max-num="1" :path="'blog'"></up-img>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span for="myDate">标签</span>
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
								<span class="text-danger">*</span>
								<span for="myDate">发布时间</span>
							</label>
							<div class="col-sm-8">
								<my-datepicker field="myDate"	placeholder="选择日期" value="<?php echo !isset($data['thumb']) ? null : $data['thumb']; ?>" name="created" format="yyyy/mm/dd" :backward="false" :no-today="false" :forward="false"></my-datepicker>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>摘要</span>
							</label>
							<div class="col-sm-8">
								<textarea name="description" placeholder="输入摘要内容" class="form-control"><?php echo !isset($data['description']) ? null : $data['description']; ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3">
								<span class="text-danger">*</span>
								<span>内容</span>
							</label>
							<div class="col-sm-8">
							 	<script id="container" name="content" type="text/plain">
							 	<?php echo !isset($data['content']) ? null : $data['content']; ?>
							 	</script>
							 	<!-- 配置文件 -->
							    <script type="text/javascript" src="/vendor/ueditor/ueditor.config.js"></script>
							    <!-- 编辑器源码文件 -->
							    <script type="text/javascript" src="/vendor/ueditor/ueditor.all.js"></script>
							    <!-- 实例化编辑器 -->
							    <script type="text/javascript">
							        var ue = UE.getEditor('container');
							    </script>
							</div>
						</div>
						<div class="form-group radio" data-radio="<?php echo !isset($data['is_recommend']) ? null : $data['is_recommend']; ?>">
							<label class="control-label col-sm-3">推荐排行榜：</label>
							<div class="radio-inline">
								<label>
									<input type="radio"  name="is_recommend"  value="1"> 推荐
								</label>
							</div>
							<div class="radio-inline">
								<label >
									<input type="radio" name="is_recommend"  value="0"> 不推荐
								</label>
							</div>
						</div>
						<div class="form-group radio" data-radio="<?php echo !isset($data['is_show']) ? null : $data['is_show']; ?>">
							<label class="control-label col-sm-3">显示状态：</label>
							<div class="radio-inline">
								<label>
									<input type="radio" name="is_show"  value="1"> 显示
								</label>
							</div>
							<div class="radio-inline">
								<label >
									<input type="radio" name="is_show"  value="0"> 隐藏
								</label>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<a type="submit" class="btn btn-primary" @click="comply">确定</a>
				<button type="button" class="btn btn-default" id="btn-close"@click="btnClose">取消</button>
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