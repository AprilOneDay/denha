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