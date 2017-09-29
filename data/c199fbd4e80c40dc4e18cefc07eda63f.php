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
					<form class="form-inline ng-pristine ng-valid" action=""  method="get">
                        <div class="form-group">
                        	<select class="form-control" data-selected="<?php echo !isset($param['type']) ? null : $param['type']; ?>" name="param[type]">
                            	<option value="0">选择类型</option>
                            	<?php if($other['typeCopy']){ foreach($other['typeCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                        	<select class="form-control" data-selected="<?php echo !isset($param['is_urgency']) ? null : $param['is_urgency']; ?>" name="param[is_urgency]">
                                <option value="">急售</option>
                                <?php if($other['urgencyCopy']){ foreach($other['urgencyCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" data-selected="<?php echo !isset($param['brand']) ? null : $param['brand']; ?>" name="param[brand]">
                                <option value="">品牌</option>
                                <?php if($other['brandCopy']){ foreach($other['brandCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" data-selected="<?php echo !isset($param['is_recommend']) ? null : $param['is_recommend']; ?>" name="param[is_recommend]">
                                <option value="">首页平台推荐</option>
                                <?php if($other['recommendCopy']){ foreach($other['recommendCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" name="param[field]" data-selected="<?php echo !isset($param['field']) ? null : $param['field']; ?>">
                            	<option value="">选择搜索条件</option>
                                <option value="id">ID</option>
                                <option value="title">标题</option>
                            </select>
                            <input type="text" class="form-control w120" placeholder="Search" name="param[keyword]" value="<?php echo !isset($param['keyword']) ? null : $param['keyword']; ?>" >
                            <button type="submit" class="btn btn-default" @click="search()">搜索</button>
                        </div>
                    </form>
					<div class="console-form">
						<div class="mt8">
							<form class="form-horizontal" action="<?php echo url('add_car_id',array('id'=>$id)); ?>">
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width:75px;">#</th>
											<th style="width:75px;">ID</th>
											<th>标题</th>
											<th style="width:60px;">类型</th>
											<th style="width:200px;">卖家</th>
											<th style="width:60px;">急售</th>
											<th style="width:80px;">首页推荐</th>
											<th style="width:120px;">发布时间</th>
											<th style="width:50px;">状态</th>
											<th style="width:80px; text-align:center;">操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in list">
									 		<td><input type="checkbox" value="<?php echo $value['id']; ?>" name="id[]" <?php if(in_array($value['id'],$checkValue)){ ?>checked<?php } ?>></td>
											<td><?php echo $value['id']; ?></td>
											<td><?php echo $value['title']; ?></td>
											<td><?php echo $other['typeCopy'][$value['type']]; ?></td>
											<td><?php echo $value['nickname']; ?></td>
											<td><?php echo $other['urgencyCopy'][$value['is_urgency']]; ?></td>
											<td><?php echo $other['recommendCopy'][$value['is_recommend']]; ?></td>
											<td><?php echo date('Y-m-d H:i',$value['created']); ?></td>
											<td>
												<?php if($value['status']){ ?>
													<a href="javascript:;" style="color: green">上架</a>
												<?php }else{ ?>
													<a href="javascript:;" style="color: red">下架</a>
												<?php } ?>
											</td>
											<td align='center'>
												<a data-href="<?php echo url('edit',array('id'=>$value['id'])); ?>"  data-height="500px" data-width="356px"  data-title="修改规则"  class="btn-open">编辑</a>
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
								<div class="modal-footer">
									<button type="button" class="btn btn-primary btn-comply" click="comply">推荐</button>
									<button type="button" class="btn btn-default" id="btn-close">取消</button>
								</div>
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