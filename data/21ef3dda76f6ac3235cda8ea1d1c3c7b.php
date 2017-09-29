<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>四月 - 个人博客  - <?php echo $data['title']; ?></title>
	<meta name="keywords" content=""/>
	<meta name="description" content="<?php echo $data['description']; ?>"/>
	<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
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
				<div class="news-content">
					<h2><?php echo $data['title']; ?></h2>
					<div class="desc pull-left">
						<dt>
							<dl><i class="fa fa-eye"></i> 热度 <?php echo $data['hot']; ?></dl>
							<dl><i class="fa fa-fire"></i> 评论 <?php echo $data['comment']; ?></dl>
							<dl class="hidden-sm hidden-xs"><i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$data['created']); ?></dl>
						</dt>
					</div>
					<div class="clearfix"></div>
					<div class="content">
						<?php echo $data['content']; ?>
					</div>
				</div>
				<div class="clearfix"></div>
				<?php if($comment){ ?>
				<div class="comment">
					<ul>
						<?php if($comment){ foreach($comment as $key => $value){ ?>
						<li>
							<label><?php echo $value['nickname']; ?>:</label>
							<p><?php echo $value['content']; ?></p>
							<div class="buttom">
								<div class="pull-left">
									<i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$value['created']); ?>
								</div>
								<div class="pull-right">
									<a href="javascript:;" class="btn-ajax-post" data-href="<?php echo url('report/add'); ?>" data-goods_id="<?php echo $value['id']; ?>">举报</a>
									<a href="javascript:;" data-to_id="<?php echo $value['id']; ?>" data-parent_id="<?php echo $value['id']; ?>" class="btn-show-reply">回复[<?php echo $value['total']; ?>]</a>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="comment-chlid" style="display: none;">
								<ul></ul>
								<div class="alert alert-info" role="alert" style="margin-top: 2rem;">
									回复评论:
									<div class="pull-right">
										<a href="javascript:;" class="btn-comment-up">[收起]</a>
									</div>
								</div>
		       				 	<form  class="form-horizontal remark" action="<?php echo url('comment/reply'); ?>">
		       				 		<input type="hidden" class="form-control" name="goods_id"  value="<?php echo $data['id']; ?>">
		       				 		<input type="hidden" class="form-control" name="parent_id"  value="<?php echo $value['id']; ?>">
		       				 		<input type="hidden" class="form-control" name="to_id"  value="<?php echo $value['id']; ?>">
							 		<div class="form-group">
									    <label for="inputEmail3" class="col-sm-2 control-label">称呼</label>
									    <div class="col-sm-10">
									      <input type="text" class="form-control" name="nickname"  value="<?php echo !isset($user['nickname']) ? null : $user['nickname']; ?>"  placeholder="昵称">
									    </div>
								  	</div>
							 		<div class="form-group">
									    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
									    <div class="col-sm-10">
									      <input type="email" class="form-control" name="mail" value="<?php echo !isset($user['mail']) ? null : $user['mail']; ?>"  placeholder="Email">
									    </div>
								  	</div>
					               	<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">内容</label>
									    <div class="col-sm-10">
									      <textarea  class="form-control" name="content"></textarea>
									    </div>
							 		</div>
							 		<div class="form-group">
									    <div class="col-sm-offset-2 col-sm-10">
									      <button type="button" class="btn btn-primary btn-comply">确定</button>
									    </div>
								  	</div>
    						 	</form>
							</div>
							<div class="clearfix"></div>
						</li>
						<?php }} ?>
					</ul>
				</div>
				<?php } ?>
				<div class="alert alert-info" role="alert" style="margin-top: 2rem;">发表评价:</div>
			 	<form  class="form-horizontal remark" action="<?php echo url('comment/add'); ?>">
		 		 	<input type="hidden" class="form-control" name="goods_id"  value="<?php echo $data['id']; ?>">
			 		<div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">称呼</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="nickname"  value="<?php echo !isset($user['nickname']) ? null : $user['nickname']; ?>" placeholder="昵称">
					    </div>
				  	</div>
			 		<div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
					    <div class="col-sm-10">
					      <input type="email" class="form-control" name="mail" value="<?php echo !isset($user['mail']) ? null : $user['mail']; ?>"   placeholder="Email">
					    </div>
				  	</div>
	               	<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">内容</label>
					    <div class="col-sm-10">
					      <textarea  class="form-control" name="content"></textarea>
					    </div>
			 		</div>
			 		<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="button" class="btn btn-primary btn-comply">确定</button>
					    </div>
				  	</div>
			 	</form>
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
	<div class="fix">
		<ul>
			<li class="arrow-up"><i class="fa-3x fa fa-arrow-up" title="返回顶部"></i></li>
		</ul>
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
<div class="fix">
	<ul>
		<li class="arrow-up"><i class="fa-3x fa fa-arrow-up" title="返回顶部"></i></li>
	</ul>
</div>
	<script type="text/javascript" src="<?php echo getConfig('config','ststic'); ?>/console/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="<?php echo getConfig('config','vendor'); ?>/pace/pace.min.js"></script>
	<script type="text/javascript" src="<?php echo getConfig('config','vendor'); ?>/layer/layer.js"></script>
	<script type="text/javascript" src="<?php echo getConfig('config','ststic'); ?>/blog/js/common.js"></script>
	<script type="text/javascript">
	$('.btn-comment-up').click(function(){
		var comment = $(this).parent().parent().parent();
		comment.hide(1000);
	})
	$('.btn-show-reply').click(function(){
		var goods_id  = $('input[name=goods_id]').val();
		var parent_id = $(this).attr('data-parent_id');
		var to_id = $(this).attr('data-to_id'); 
		var comment = $(this).parent().parent().parent();
		$('.comment-chlid').css('display','none');
		comment.find('form').find('input[name=to_id]').val(to_id);
		comment.find('.comment-chlid').show(1000);
		$.post('<?php echo url('comment/children_list'); ?>',{goods_id:goods_id,parent_id:parent_id},function(result){
			comment.find('ul').html(result);
			$('.btn-show-reply').click(function(){
			 	to_id = $(this).attr('data-to_id'); 
				comment.find('form').find('input[name=to_id]').val(to_id);
			});
		},"text")
	})
	$('.fa-arrow-up').click(function(){
	 	var sc=$(window).scrollTop();
   		$('body,html').animate({scrollTop:0},300);
	})
	</script>
</body>
</html>