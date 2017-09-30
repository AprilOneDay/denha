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
							<h5>推荐服务</h5>
						</div>
					</div>
					<form class="form-inline ng-pristine ng-valid" action=""  method="get">
                        <div class="form-group">
                            <select class="form-control" data-selected="<?php echo $param['status']; ?>" name="param[status]">
                                <option value="">状态</option>
                                <?php if($other['statusCopy']){ foreach($other['statusCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                         	<select class="form-control" data-selected="<?php echo $param['sign']; ?>" name="param[sign]">
                                <option value="">类型</option>
                                <?php if($other['signCopy']){ foreach($other['signCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
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
											<th style="width:200px;">申请用户</th>
											<th style="width:100px;">期望价格</th>
											<th style="width:50px;">状态</th>
											<th style="width:50px;">发布时间</th>
											<th style="width:80px; text-align:center;">操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in list">
											<td><?php echo $value['id']; ?></td>
											<td><?php echo $other['signCopy'][$value['sign']]; ?></td>
											<td><?php echo $value['user']['nickname']; ?></td>
											<td><?php echo $value['price']; ?></td>
											<td><?php echo $other['statusCopy'][$value['status']]; ?></td>
											<td><?php echo date('Y-m-d H:i',$value['created']); ?></td>
											<td align='center'>
												<a data-href="<?php echo url('show_shop_list',array('id'=>$value['id'])); ?>"  data-height="500px" data-width="80%"  data-title="推荐汽车"  class="btn-open">推荐</a>
											</td>
										</tr>
										<td colspan="13">
											<table class="table" >
												<thead> 
													<tr>
														<th style="width: 100px;">详细介绍:</th><th><?php echo $value['description']; ?></th>
													</tr>
												</thead>
											</table>
										</td>
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