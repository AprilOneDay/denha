<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>个人博客 - <?php echo $data['title']; ?></title>
	<meta name="keywords" content=""/>
	<meta name="description" content="<?php echo $data['description']; ?>"/>
	<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<link rel="stylesheet" href="<?php echo getConfig('config','vendor'); ?>/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<?php echo getConfig('config','vendor'); ?>/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<?php echo getConfig('config','vendor'); ?>/pace/themes/blue/pace-theme-minimal.css" />
	<link rel="stylesheet" href="<?php echo getConfig('config','ststic'); ?>/blog/css/common.css" />
	<link rel="stylesheet" href="<?php echo getConfig('config','ststic'); ?>/blog/css/css.css" />
</head>
<body>
	<div class="wapper w14">
		<div class="top w" >
			<div class="location">
				<i class="fa fa-volume-up"></i>
				<a hefr="javascript:;">站点通知公告</a>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="index-content container-fluid">
			<div class="left col-md-9 col-xs-12">
				<div class="news-content">
					<h2><?php echo $data['title']; ?></h2>
					<div class="desc pull-left">
						<dt>
							<dl><i class="fa fa-eye"></i> 热度 555</dl>
							<dl><i class="fa fa-fire"></i> 评论 5</dl>
							<dl class="hidden-sm hidden-xs"><i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$data['created']); ?></dl>
						</dt>
					</div>
					<div class="clearfix"></div>
					<div class="content">
						<?php echo $data['content']; ?>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="comment">
					<ul>
						<li>
							<label>xxxx</label>
							<p>谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好</p>
							<div class="buttom">
								<div class="pull-left">
									<i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$data['created']); ?>
								</div>
								<div class="pull-right">
									<a href="javascript:;">举报</a>
									<a href="javascript:;">回复[0]</a>
								</div>
							</div>
							<div class="clearfix"></div>
						</li>
						<li>
							<label>xxxx</label>
							<p>谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好</p>
							<div class="buttom">
								<div class="pull-left">
									<i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$data['created']); ?>
								</div>
								<div class="pull-right">
									<a href="javascript:;">举报</a>
									<a href="javascript:;">回复[0]</a>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="comment-chlid">
								<ul>
									<li>
										<label>xxxx</label>
										<p>谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好谢教授平时很忙吧？再忙也要看书学习哈，写文章还是需要点证据和论点的，逻辑混乱了不好</p>
										<div class="buttom">
											<div class="pull-left">
												<i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$data['created']); ?>
											</div>
											<div class="pull-right">
												<a href="javascript:;">举报</a>
											</div>
										</div>
										<div class="clearfix"></div>
									</li>
								</ul>
				

		       				 	<form method="post"  class="form-horizontal">
		       				 		<div class="form-group">
									    <label for="inputEmail3" class="col-sm-2 control-label">称呼</label>
									    <div class="col-sm-10">
									      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
									    </div>
								  	</div>
		       				 		<div class="form-group">
									    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
									    <div class="col-sm-10">
									      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
									    </div>
								  	</div>
					               
									<p><textarea name="comment" id="comment" rows="10" tabindex="4"></textarea></p>
    						 	</form>

	
							</div>
							<div class="clearfix"></div>
						</li>
					</ul>
				</div>
			</div>
			<div class="right col-md-3 hidden-sm hidden-xs">
				<form action="<?php echo url('index'); ?>" id="form">
					<div class="index-search">
					    <div class="input-group">
					      <input type="text" class="form-control" id="exampleInputAmount" placeholder="文章搜索" name="keyword" value="<?php echo $keyword; ?>">
					      <a class="input-group-addon btn737 btn-search"  href="javascript:;">搜索</a>
					    </div>
					</div>
				</form>
				<div class="clearfix"></div>
				<div class="tags">
					<div class="title btn737">分类目录</div>
					<div class="tags-content">
						<ul>
							<li><a href="/">全部</a></li>
							<?php if($listClass){ foreach($listClass as $key => $value){ ?>
							<li><a href="<?php echo url('index',array('tag'=>$value['tag'])); ?>"><?php echo $tagCopy[$value['tag']]; ?> (<?php echo $value['num']; ?>)</a></li>
							<?php }} ?>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>

				<div class="article">
					<div class="title btn737">热门文章</div>
					<div class="article-content">
						<ul>
							<?php if($randList){ foreach($randList as $key => $value){ ?>
							<li>
								<a href="<?php echo url('detail',array('id'=>$value['id'])); ?>" title="<?php echo $value['title']; ?>">
								· <?php echo $value['title']; ?>
								</a>
							</li>
							<?php }} ?>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
				<div class="clearfix"></div>

				<!-- <div class="article">
					<div class="title btn737">最新评论</div>
					<div class="article-content">
						<ul>
							<li>
								<div class="user">
									<span>游客</span>
									<time>1周前</time>
								</div>
								<p>还是你自己的那个好看</p>
								
							</li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<li><a href="javascript:;">· 文章测试标题大概不需要多长测试一下就行了</a></li>
							<div class="clearfix"></div>
						</ul>
					</div>
				</div> -->
				<div class="clearfix"></div>
			</div> 
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="footer w14">
	<div class="link hidden-sm hidden-xs">
		<ul>
			<li class="link-title">友情链接：</li>
			<li><a href="javascript:;">百度</a></li>
			<li><a href="javascript:;">百度</a></li>
			<li><a href="javascript:;">百度</a></li>
			<li><a href="javascript:;">百度</a></li>
			<div class="clearfix"></div>
		</ul>
	</div>
	<div class="clearfix"></div>
	<div class="copy">
		版权所有@copy 2017 四月工作室
	</div>
</div>
	<script type="text/javascript" src="<?php echo getConfig('config','ststic'); ?>/console/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="<?php echo getConfig('config','vendor'); ?>/pace/pace.min.js"></script>
	<script type="text/javascript" src="<?php echo getConfig('config','vendor'); ?>/layer/layer.js"></script>
	<script type="text/javascript" src="<?php echo getConfig('config','ststic'); ?>/blog/js/common.js"></script>
</body>
</html>