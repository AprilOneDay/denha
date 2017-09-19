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
  		<div class="border-top">
			<div class="border-top-left fl">
				<ul>
					<li><a class="logo">Denha</a></li>
				</ul>
			</div>
			<div class="border-top-right fr">
				<ul>
					<li><a href="javascript:;"><?php echo $this->consoleName; ?></a></li>
					<li><a href="<?php echo url('login/login_out'); ?>">退出</a></li>
				</ul>
			</div>
		</div>
		<div class="wrapper container-fluid">
			<nav class="sidebar-inner fl col-md-1">
				<div class="sidebar-fold" ><span class="glyphicon glyphicon-transfer"></span></div>
				<ul>
					<?php if($list){ foreach($list as $key => $value){ ?>
					<li>
						<a href="javascript:;" @click="open(key)">
							<span class="<?php echo $value['icon']; ?>"></span><?php echo $value['name']; ?>
						</a>
						<?php if($value['child']){ ?>
							<dl>
								<?php if($value['child']){ foreach($value['child'] as $k => $v){ ?>
									<dd>
										<a data-id="<?php echo $v['id']; ?>" href="<?php echo $v['url']; ?>" target="iframe0"  class="sec-list-show" data-name="<?php echo $v['name']; ?>">
											<span class="<?php echo $v['icon']; ?>" ></span><?php echo $v['name']; ?>
										</a>
									</dd>
								<?php }} ?>
							</dl>
						<?php } ?>
					</li>
					<?php }} ?>
				</ul>
			</nav>
			
			<div class="product-nav-scene fl col-md-1">
				<div class="title">设置</div>
				<ul>
					<?php if($list){ foreach($list as $key => $value){ ?>
					<li>
						<?php if($value['child']){ ?>
						<a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>
						<?php }else{ ?>
						<a href="<?php echo $value['url']; ?>" target="iframe0"><span></span>
						<?php } ?>
							<?php echo $value['name']; ?>
						</a>
						<?php if($value['child']){ ?>
							<dl>
								<?php if($value['child']){ foreach($value['child'] as $k => $v){ ?>
									<dd>
										<a href="<?php echo $v['url']; ?>" target="iframe0">
											<span class="<?php echo $v['icon']; ?>"></span><?php echo $v['name']; ?>
										</a>
									</dd>
								<?php }} ?>
							</dl>
						<?php } ?>
					</li>
					<?php }} ?>
				</ul>
			</div>
			
			<div class="content-main fl" >
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/setting/menus/index" frameborder="false" scrolling="auto" style="border:none" width="100%" height="auto" allowtransparency="true"></iframe>
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
	$('.sec-list-show').click(function(){
		var id = $(this).attr('data-id');
		var name = $(this).attr('data-name');
		$.post('/index/index/menus',{id:id},function(result){
			$('.product-nav-scene').find('.title').text(name);
			$('.product-nav-scene').css('display','block');
			$('.product-nav-scene').find('ul').html(result);
		},"html");
	})
	</script>
</body>
</html>