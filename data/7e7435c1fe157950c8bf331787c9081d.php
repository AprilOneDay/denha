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
							<h5>店铺列表</h5>
						</div>
					</div>
					<form class="form-inline ng-pristine ng-valid" action=""  method="get">
                        <div class="form-group">
                        	<select class="form-control" data-selected="<?php echo $param['is_ide']; ?>" name="param[is_ide]">
                                <option value="">状态</option>
                                <?php if($other['isIdeCopy']){ foreach($other['isIdeCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" name="param[field]" data-selected="<?php echo !isset($param['field']) ? null : $param['field']; ?>">
                                <option value="uid">UID</option>
                                <option value="name">店铺名称</option>
                            </select>
                            <input type="text" class="form-control w120" placeholder="Search" name="param[keyword]" value="<?php echo !isset($param['keyword']) ? null : $param['keyword']; ?>" >
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
											<th>店铺名称</th>
											<th>所属用户/UID</th>
											<th>店铺联系电话</th>
											<th style="width:120px;">资质认证</th>
											<th style="width:120px;">状态</th>
											<th style="width:160px; text-align:center;">操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in list">
											<td><?php echo $value['id']; ?></td>
											<td><?php echo $value['name']; ?></td>
											<td><?php echo $value['user']['nickname']; ?> / <?php echo $value['uid']; ?></td>
											<td><?php echo $value['user']['mobile']; ?></td>
											<td><?php echo $other['isIdeCopy'][$value['is_ide']]; ?></td>
											<td>
												<?php if($value['status']){ ?>
													<a href="javascript:;" style="color: green">营业中</a>
												<?php }else{ ?>
													<a href="javascript:;" style="color: red">关闭中</a>
												<?php } ?>
											</td>
											<td align='center'>
												<a data-href="<?php echo url('edit',array('id'=>$value['id'])); ?>"  data-width="90%"  data-title="店铺详情"  class="btn-open">详情</a>
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