<div class="row">
<?php if ($images): ?>

  <?php foreach ($images as $img): ?>
    <?php if (strpos($img,'thumb') === false): ?>
	<?php 
		$supported_image = array(
		    'gif',
		    'jpg',
		    'jpeg',
		    'png'
		);

		$ext = strtolower(pathinfo($img, PATHINFO_EXTENSION)); // Using strtolower to overcome case sensitive
		if (in_array($ext, $supported_image)) {
			$is_image = true;
		}else{
			$is_image = false;
		}
	 ?>
    <div class="col-sm-6 col-md-3">
    	<div class="thumbnail">
	        <a href="<?php echo base_url('uploads/'.$dt.'/'.$img) ?>" class="fancybox-button" data-rel="a">
	        	<?php if ($is_image): ?>
		            <img src="<?php echo base_url('uploads/'.$dt.'/'.$img) ?>" alt="100%x180" style="height: 180px; width: 100%; display: block;" > 
	            <?php else: ?>
		            <img src="<?php echo base_url('assets/global/img/Filetype-Docs-icon.png') ?>" alt="100%x180" style="height: 180px; width: 100%; display: block;" > 

	        	<?php endif ?>
	        </a>
	        <div class="caption" style="word-break:break-all;">
	            <p><?php echo $img ?></p>
	            <?php if (!$readonly): ?>
	            <p>
	                <button type="button" class="btn red dz_remove_button" data-filename="<?php echo $img ?>" data-dt="<?php echo $dt ?>"> Delete </button>
	            </p>
	            <?php endif ?>
	        </div>
    	</div>
    </div>
    <?php endif; ?>
  <?php endforeach ?>
</div>
<?php endif ?>


<?php
    $dt_funct = str_replace('/', '_', $dt);
?>
<script>
	$('.dz_remove_button').click(function(event) {
		dz_remove_file_<?php echo $dt_funct ?>($(this).data('filename'),$(this).data('dt'));
	});

	function dz_remove_file_<?php echo $dt_funct ?>(filename,dt) {
		$.ajax({
			url: '<?php echo site_url("dropzone/upload_delete/") ?>',
			type: 'POST',
			dataType: 'json',
			data: {
				filename: filename,
				dt: dt,
			},
		})
		.done(function() {
        	dropzone_load_img_<?php echo $dt_funct ?>();
		})
		.fail(function() {
		})
		.always(function() {
		});

	}

	$(".fancybox-button").fancybox({
		groupAttr: 'data-rel',
		prevEffect: 'none',
		nextEffect: 'none',
		closeBtn: true,
		helpers: {
			title: {
				type: 'inside'
			}
		}
	});
</script>
