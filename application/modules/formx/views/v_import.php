<form action="<?php echo site_url('formx/c_import/form_action') ?>" class="form-horizontal" method="POST" role="form" id="import_form_<?php echo $form_id; ?>" enctype="multipart/form-data">
	<legend>Form Import</legend>

    <div class="form-group">
        <label class="col-md-3 control-label">template</label>
        <div class="col-md-9">
			<a class="btn btn-danger" href="<?php echo site_url('formx/c_import/sample/'.$form_id) ?>" role="button"><i class="fa fa-download"></i> Template</a>
        </div>
    </div>
	<div class="form-group">
        <label class="col-md-3 control-label">file upload</label>
        <div class="col-md-9">
			<input type="file" class="" name="file_import" >
        </div>
    </div>

	<input type="hidden" name="form_id" value="<?php echo $form_id ?>">
	<div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
				<button type="submit" class="btn green">Submit</button>
            </div>
        </div>
    </div>
</form>
<div id="message_error_<?php echo $form_id; ?>" style="margin-top: 10px"></div>
<script type="text/javascript">
  $('#import_form_<?php echo $form_id; ?>').submit(function(e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        main.submitAjaxModal($(this));
        return false;
  });
	$( document ).ajaxSuccess(function( event, xhr, settings ) {
    if ( settings.url == "<?php echo site_url('formx/c_import/form_action') ?>" ) {
    	console.log(xhr.responseJSON.message);
    	App.alert({
    		type: 'danger',
    		message:xhr.responseJSON.message_error,
    		container: $('#message_error_<?php echo $form_id; ?>'),
            place: 'prepend'
    	});
    	$('#'+xhr.responseJSON.datatable).DataTable().ajax.reload();
    }
  });
</script>
