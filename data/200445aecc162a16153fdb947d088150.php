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
							<h5>推荐列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary btn-open"  data-href="<?php echo url('add_recommend'); ?>"  data-height="500px" data-width="356px">添加推荐</a>
						</div>
					</div>

					<form class="form-inline ng-pristine ng-valid" action=""  method="get">
                        <div class="form-group">
                            <select class="form-control" name="field" data-selected="<?php echo !isset($param['field']) ? null : $param['field']; ?>">
                                <option value="value">内容</option>
                            </select>
                            <input type="text" class="form-control w120" placeholder="Search" name="keyword" value="<?php echo !isset($param['keyword']) ? null : $param['keyword']; ?>" >
                            <button type="submit" class="btn btn-default" @click="search()">搜索</button>
                        </div>
                    </form>
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width:75px;">ID</th>
											<th style="width:100px;">类型</th>
											<th>关键词</th>
											<th style="width:160px; text-align:center;">状态</th>
											<th style="width:160px; text-align:center;">操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in list">
											<td><?php echo $value['id']; ?></td>
											<td><?php echo $other['typeCopy'][$value['type']]; ?></td>
											<td><?php echo $value['value']; ?></td>
											<td align='center'>
												<?php if($value['status']){ ?>
													<a data-href="<?php echo url('change_status'); ?>" data-type="SearchRemmond" data-id="<?php echo $value['id']; ?>" data-status="0" style="color: green" class="btn-ajax-post">启用</a>
												<?php }else{ ?>
													<a data-href="<?php echo url('change_status'); ?>" data-type="SearchRemmond" data-id="<?php echo $value['id']; ?>" data-status="1" style="color: red" class="btn-ajax-post">禁用</a>
												<?php } ?>
											</td>
											<td align='center'>
												<a data-href="<?php echo url('del'); ?>" data-table="SearchRemmond" data-type="<?php echo $value['type']; ?>" data-value="<?php echo $value['value']; ?>"  class="btn-ajax-post">删除</a>
											</td>
										</tr>
										<?php }} ?>
									</tbody>
								    <tfoot>
							          	<tr>
          									<td colspan="13"><?php echo $pages; ?></td>
          								</tr>
									</tfoot>
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