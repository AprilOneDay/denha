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
	<div id="console-content-index-index">
		<div class="view-content-container" >
			<div class="row">
				<div class="col-sm-12">
					<div class="console-title console-title-border clearfix">
						<div class="pull-left">
							<h5>广告列表</h5>
							<a class="btn btn-xs btn-toinstlist pull-right" href="javascript:history.go(-1);">
								<span class="icon-toinstlist"></span>
								<span>返回列表</span>
							</a>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary btn-open" data-href="<?php echo url('data_edit',array('banner_id'=>$bannerId)); ?>"  data-height="500px" data-width="500px">添加相册</a>
						</div>
					</div>
					<!-- <form class="form-inline ng-pristine ng-valid" action=""  method="get">
					                        <div class="form-group">
					                            <select class="form-control" name="field">
					                                <option value="title">标题</option>
					                            </select>
					                            <input type="text" class="form-control w120" placeholder="Search" name="keyword" value="<?php echo !isset($param['keyword']) ? null : $param['keyword']; ?>" >
					                            <button type="submit" class="btn btn-default" >搜索</button>
					                        </div>
					                    </form> -->
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width:75px;">ID</th>
											<th>图片</th>
											<th>简介</th>
											<th style="width:160px; text-align:center;">编辑/操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in list">
											<td><?php echo $value['id']; ?></td>
											<td><img src="<?php echo $value['path']; ?>" width="150" height="100"></td>
											<td><?php echo $value['description']; ?></td>
											<td align='center'>
												<a data-href="<?php echo url('data_edit',array('id'=>$value['id'])); ?>"  data-height="500px" data-width="500px"  data-title="编辑信息"  class="btn-open">编辑</a>
												<a href="javascript:;">删除</a>
											</td>
										</tr>
										<?php }} ?>
									</tbody>
									<page :pages="pages" v-on:getPages="getPages"></page>
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
	<script type="text/javascript" src="/vendor/laydate/laydate.js"></script>
    <script type="text/javascript" src="/vendor/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/vendor/ueditor/ueditor.all.js"></script>


	<script type="text/javascript">
	</script>
</body>
</html>