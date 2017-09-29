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
							<h5>订单列表</h5>
						</div>
					</div>
					<form class="form-inline ng-pristine ng-valid" action=""  method="get">
                        <div class="form-group">
                        	<select class="form-control" data-selected="<?php echo !isset($param['type']) ? null : $param['type']; ?>" name="param[type]">
                            	<option value="0">选择类型</option>
                            	<?php if($other['typeCopy']){ foreach($other['typeCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                        	<select class="form-control" data-selected="<?php echo !isset($param['order_status']) ? null : $param['order_status']; ?>" name="param[order_status]">
                                <option value="">订单状态</option>
                                <?php if($other['orderStatusCopy']){ foreach($other['orderStatusCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" data-selected="<?php echo !isset($param['status']) ? null : $param['status']; ?>" name="param[status]">
                                <option value="">审核状态</option>
                                <?php if($other['statusCopy']){ foreach($other['statusCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                             <select class="form-control" data-selected="<?php echo !isset($param['origin']) ? null : $param['origin']; ?>" name="param[origin]">
                                <option value="">来源</option>
                                <?php if($other['originCopy']){ foreach($other['originCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" name="param[field]" data-selected="<?php echo !isset($param['field']) ? null : $param['field']; ?>">
                            	<option value="">选择搜索条件</option>
                                <option value="order_sn">订单编号</option>
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
											<th style="width:100px;">类型</th>
											<th>订单编号</th>
											<th style="width:200px;">订单总价</th>
											<th style="width:200px;">买家</th>
											<th style="width:200px;">卖家</th>
											<th style="width:100px;">审核状态</th>
											<th style="width:100px;">订单状态</th>
											<th style="width:120px;">发布时间</th>
											<th style="width:50px;">来源</th>
											<th style="width:80px; text-align:center;">操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in list">
											<td><?php echo $value['id']; ?></td>
											<td><?php echo $other['typeCopy'][$value['type']]; ?></td>
											<td><?php echo $value['order_sn']; ?></td>
											<td><?php echo $value['acount']; ?> <?php if($value['type'] == 1){ ?>万<?php } ?></td>
											<td><?php echo $value['user']['nickname']; ?></td>
											<td><?php echo $value['seller']['nickname']; ?></td>
											<td><?php echo $other['statusCopy'][$value['status']]; ?></td>
											<td><?php echo $other['orderStatusCopy'][$value['order_status']]; ?></td>
											<td><?php echo date('Y-m-d H:i',$value['created']); ?></td>
											<td><?php echo $other['originCopy'][$value['origin']]; ?></td>
											<td align='center'>
												<a data-href="<?php echo url('detail',array('id'=>$value['id'])); ?>"  data-height="500px" data-width="80%"  data-title="订单详情"  class="btn-open">详情</a>
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