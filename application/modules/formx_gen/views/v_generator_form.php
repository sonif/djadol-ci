<div class='row'>
    <div class='col-md-12'>
		<div class='card shadow'>
	        <div class='card-header'>
	            <div class="caption">
	                <span class="caption-subject font-green sbold uppercase">Form </span>
	            </div>
	        </div><!-- /.box-header -->
	        <div class='card-body'>
				<form action="<?php echo site_url('formx_gen/formx_gen/form_action') ?>" method="post" id="input_form" class="horizontal-form">
					<div class='form-body'>
            			<div class='row'>
            				<div class='col-md-6'>
                				<div class='form-group'>
                					<label class='control-label'>Table</label>
													<select name="table_name" id="table_list" class="form-control select2me">
														<?php foreach ($table->result() as $r): ?>
															<option value="<?php echo $r->table_name ?>" <?php if($row && $row->form_table == $r->table_name) echo 'selected=""'; ?>><?php echo $r->table_name ?></option>
														<?php endforeach ?>
													</select>
												</div>
										</div>
										<div class='col-md-6'>
                				<div class='form-group'>
                					<label class='control-label'>Table for datatable</label>
													<select name="form_table_read" id="form_table_read" class="form-control select2me">
															<option value=""></option>
														<?php foreach ($table->result() as $r): ?>
															<option value="<?php echo $r->table_name ?>" <?php if($row && $row->form_table_read == $r->table_name) echo 'selected=""'; ?>><?php echo $r->table_name ?></option>
														<?php endforeach ?>
													</select>
												</div>
										</div>
            				<div class='col-md-6'>
                				<div class='form-group'>
                					<label class='control-label'>Form name</label>
                					<input type="text" name="form_name" class="form-control" value="<?php if($row) echo $row->form_name  ?>">
            					</div>
        					</div>
        					<div class='col-md-6'>
                				<div class='form-group'>
                					<label class='control-label'>Slug name</label>
                					<input type="text" name="slug" class="form-control" value="<?php if($row) echo $row->slug  ?>">
            					</div>
        					</div>
        					<div class='col-md-6'>
                				<div class='form-group'>
                					<label class='control-label'>Soft Delete</label>
                					<select name="is_soft_delete" class="form-control">
                						<option value="0" <?php if($row &&  $row->is_soft_delete == 0) echo "selected"  ?>>Tidak</option>
                						<option value="1" <?php if($row &&  $row->is_soft_delete == 1) echo "selected"  ?>>Ya</option>
                					</select>
            					</div>
        					</div>

        					<div class='col-md-6'>
                				<div class='form-group'>
                					<label class='control-label'>Parent Form ID</label>
                					<select name="parent_form_id" class="form-control select2me" data-allow-clear='true'>
                						<option value=""></option>
										<?php foreach ($form_list as $r): ?>
											<option value="<?php echo $r->id ?>" <?php if($row && $row->parent_form_id == $r->id) echo 'selected=""'; ?>><?php echo $r->form_name.' ['.$r->form_table.']' ?></option>
										<?php endforeach ?>
									</select>
                					<!-- <input type="text" name="parent_form_id" class="form-control" value="<?php if($row) echo $row->parent_form_id  ?>"> -->
            					</div>
        					</div>
        					<div class='col-md-6'>
                				<div class='form-group'>
                					<label class='control-label'>Column FK</label>
                					<input type="text" name="parent_form_foreign_key" class="form-control" value="<?php if($row) echo $row->parent_form_foreign_key  ?>">
            					</div>
        					</div>
        					<input type="hidden" name="form_id" value="<?php echo $id ?>">
        				</div>
						<div class="row" id="div_field"></div>
    				</div>
    				<div class='form-actions'>
			            <div class='row'>
			              <div class='col-md-12'>
				  			<button type='submit' class='btn btn-primary' name='mode' value='new' >Simpan</button>
			              </div>
			            </div>
		            </div>
		          </div>
				</form>
	        </div><!-- /.portlet-body -->
	      </div><!-- /.portlet -->
  	</div>
</div>
<script>
	$('#table_list').change(function(event) {
		var table = "";
    var table_primary = $(this).val();
		var table_view = $('#form_table_read').val();
		if(table_view != ""){
			table = table_view;
		}else{
			table = table_primary;
		}

		$('#div_field').load('<?php echo site_url("formx_gen/formx_gen/form_field") ?>',{
		table: table, id:"<?php echo $id ?>"} ,
			function(){
			/* Stuff to do after the page is loaded */
		});

		var form_id  = $("input[name='form_id']",$('#input_form')).val();
		if (form_id == '') {
			var table_text = $('#table_list option:selected').text();
			$("input[name='form_name']",$('#input_form')).val(table_text);
			$("input[name='slug']",$('#input_form')).val(table_text);
		}

	}).change();

	$('#input_form').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
  	});
</script>
