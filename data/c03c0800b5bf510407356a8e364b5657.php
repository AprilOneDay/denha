<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>四月 - 个人博客 | 程序员的工作记录点</title>
	<meta name="keywords" content="四月工作室 四月 个人博客 PHP程序 Denha框架"/>
	<meta name="description" content="时间没有记录,文字记录时间！四月的个人博客，这里是我的工作记录"/>
	<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta name="baidu-site-verification" content="IOphv8ZngJ" />
	<link rel="stylesheet" href="<?php echo getConfig('config','vendor'); ?>/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="<?php echo getConfig('config','vendor'); ?>/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<?php echo getConfig('config','vendor'); ?>/pace/themes/blue/pace-theme-minimal.css" />
	<link rel="stylesheet" href="<?php echo getConfig('config','ststic'); ?>/blog/css/common.css" />
	<link rel="stylesheet" href="<?php echo getConfig('config','ststic'); ?>/blog/css/css.css" />
	<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?eb42f04c15f2dc6876fc2c14439fc6ef";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>
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
				<?php if($list){ ?>
				<div class="news">
					<ul>
						<?php if($list){ foreach($list as $key => $value){ ?>
						<li>
							<span>
								<label>[<?php echo $tagCopy[$value['tag']]; ?>]</label> 
								<a href="<?php echo url('detail',array('id'=>$value['id'])); ?>" title="<?php echo $value['title']; ?>"><?php echo $value['title']; ?></a>
							</span>
							<div class="news-content">
								<?php if($value['thumb']){ ?>
								<a href="<?php echo url('detail',array('id'=>$value['id'])); ?>" title="<?php echo $value['title']; ?>">
									<img src="<?php echo imgUrl($value['thumb'],'blog'); ?>" class="hidden-sm hidden-xs">
								</a>
								<?php } ?>
								<div class="desc pull-left">
									<p ><?php echo $value['description']; ?></p>
									<dt>
										<dl><i class="fa fa-eye"></i> 热度 <?php echo $value['hot']; ?></dl>
										<dl><i class="fa fa-fire"></i> 评论 <?php echo $value['comment']; ?></dl>
										<dl class="hidden-sm hidden-xs"><i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$value['created']); ?></dl>
									</dt>
								</div>
							</div>
							<div class="clearfix"></div>	
						</li>
						<?php }} ?>
					</ul>
				</div>
				<?php }else{ ?>
				<div class="nd-news">
					<p>暂无相关内容</p>
				</div>
				<?php } ?>	
				<nav aria-label="Page navigation">
				  <?php echo $page; ?>
				</nav>
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