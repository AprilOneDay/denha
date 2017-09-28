<?php if($list){ foreach($list as $key => $value){ ?>
<li>
	<label><?php echo $value['nickname']; ?> to <?php echo $value['to_nickname']; ?></label>
	<p><?php echo $value['content']; ?></p>
	<div class="buttom">
		<div class="pull-left">
			<i class="fa fa-clock-o"></i> 时间 <?php echo date('Y-m-d',$value['created']); ?>
		</div>
		<div class="pull-right">
			<a href="javascript:;">举报</a>
			<a href="javascript:;" data-to_id="<?php echo $value['id']; ?>" data-parent_id="<?php echo $value['id']; ?>" class="btn-show-reply">回复</a>
		</div>
	</div>
	<div class="clearfix"></div>
</li>
<?php }} ?>