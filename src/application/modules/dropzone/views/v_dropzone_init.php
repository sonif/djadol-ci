<?php 
	$readonly = ($dz_readonly == "readonly") ? "true" : "false" ;
	$dz_id_gen = uniqid();
	$dt_funct = str_replace('/', '_', $dt); 
?>

<div>
<?php if ($readonly == "false"): ?>
  <button class="btn openmodal margin-bottom-10 green" data-id="div_img_upload" data-url="<?php echo site_url('dropzone/upload_form') ?>" id='upload_kerusakan' data-dt="<?php echo $dt ?>">upload<i class="fa fa-upload"></i>
  </button>
<?php endif ?>
  <span id="dz_contain_img_<?php echo $dz_id_gen; ?>"></span>
</div>
<script>
	function dropzone_load_img_<?php echo $dt_funct ?>() {
	    $('#dz_contain_img_<?php echo $dz_id_gen; ?>').html('Loading...');
	    $('#dz_contain_img_<?php echo $dz_id_gen; ?>').load('<?php echo site_url("dropzone/list_image") ?>', { "dt": "<?php echo $dt ?>","readonly":"<?php echo $readonly ?>" });
	  }
  	dropzone_load_img_<?php echo $dt_funct ?>();
</script>