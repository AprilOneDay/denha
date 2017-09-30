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
							<h5>文章列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary btn-open" data-href="<?php echo url('edit'); ?>" data-width="90%" data-height="800px">添加文章</a>
						</div>
					</div>
					<form class="form-inline ng-pristine ng-valid" action=""  method="get">
                        <div class="form-group">
                    	  	<select class="form-control" data-selected="<?php echo !isset($param['tag']) ? null : $param['tag']; ?>" name="param[tag]">
                            	<option value="0">选择类型</option>
                            	<?php if($other['tag']){ foreach($other['tag'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                        	<select class="form-control" data-selected="<?php echo !isset($param['is_show']) ? null : $param['is_show']; ?>" name="param[is_show]">
                                <option value="">选择状态</option>
                                <?php if($other['isShowCopy']){ foreach($other['isShowCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" data-selected="<?php echo !isset($param['is_recommend']) ? null : $param['is_recommend']; ?>" name="param[is_recommend]">
                                <option value="">选择推荐状态</option>
                                <?php if($other['isRecommendCopy']){ foreach($other['isRecommendCopy'] as $key => $value){ ?>
                               		<option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                            	<?php }} ?>
                            </select>
                            <select class="form-control" data-selected="<?php echo !isset($param['field']) ? null : $param['field']; ?>" name="param[field]">
                                <option value="">请选择搜索条件</option>
                                <option value="title">标题</option>
                            </select>
                            <input type="text" class="form-control w120" placeholder="Search" name="param[keyword]" value="<?php echo !isset($param['keyword']) ? null : $param['keyword']; ?>" >
                            <button type="submit" class="btn btn-default">搜索</button>
                        </div>
                    </form>
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width:75px;">ID</th>
											<th>标题</th>
											<th style="width:120px;">类型</th>
											<th style="width:120px;">发布时间</th>
											<th style="width:120px;">状态</th>
											<th style="width:160px; text-align:center;">编辑/操作</th>
										</tr>
									</thead>
									<tbody>
										<?php if($list){ foreach($list as $key => $value){ ?>
									 	<tr v-for="list in data.list">
											<td><?php echo $value['id']; ?></td>
											<td><?php echo $value['title']; ?></td>
											<td><?php echo $other['tag'][$value['tag']]; ?></td>
											<td><?php echo date('Y-m-d H:i',$value['created']); ?></td>
											<td><?php echo $other['isShowCopy'][$value['is_show']]; ?></td>
											<td align='center'>
												<a data-href="<?php echo url('edit',array('id'=>$value['id'])); ?>" data-title="编辑文章" data-width="90%"  data-height="800px" class="btn-open">编辑</a>
												<span class="text-explode">|</span>
												<a>评价</a>
												<span class="text-explode">|</span>
												<a ng-click="delete(list.id)">删除</a>
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