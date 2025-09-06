
<div class="table-responsive">
    <table class="table table-hover table-responsive" id="parameter_table">
        <thead>
            <tr>
                <th> Sort </th>
                <th> 
                    <input type="checkbox" id="check_all_active"> act 
                    <input type="checkbox" id="check_all_datatable"> dt
                    <input type="checkbox" id="check_all_unique"> uni
                    <input type="checkbox" id="check_all_req"> Req 
                </th>
                <th> __Column Name / label text__</th>
                <th> Type </th>
            </tr>
        </thead>
        <tbody>
    	<?php $order = 1; ?>
    	<?php foreach ($field->result() as $r): ?>
            <?php if($r->column_name == $pk) continue;?>
            <?php if($r->column_name == 'id') continue;?>
            <?php //if($r->column_name == 'created_at') continue;?>
            <?php //if($r->column_name == 'created_by') continue;?>
            <?php if($r->column_name == 'updated_at') continue;?>
            <?php if($r->column_name == 'updated_by') continue;?>
            <?php if($r->column_name == 'deleted_at') continue;?>
            <?php if($r->column_name == 'sync_at') continue;?>
    		<?php if($r->column_name == 'id') continue;?>
            <?php
                if (!empty($form_id)) {
                    $filter = array(
                        'form_id' => $form_id,
                        'column_name' => $r->column_name,
                    );
                    $row = $this->M_form_param->get($filter);
                }else{
                    $row = null;
                }

             ?>
            <tr>
                <td> 
                    <input type="text" class="form-control input-xsmall" name="order_<?php echo $r->column_name ?>" value="<?php echo ($row) ? $row->order_no : '' ?>" >
                </td>
                <td>
                    <input type="checkbox" name="active_<?php echo $r->column_name ?>" value="1" class="active" <?php echo ($row && $row->active) ? 'checked=""' : '' ?>> Active
                    <br>
                    <input type="checkbox" name="column_datatable_<?php echo $r->column_name ?>" value="1" class="column_datatable" <?php echo ($row && $row->column_datatable) ? 'checked=""' : '' ?>> Datatable
                    <br>
                    <input type="checkbox" name="column_rest_<?php echo $r->column_name ?>" value="1" class="column_rest" <?php echo ($row && $row->column_rest) ? 'checked=""' : '' ?>> Rest
                    <br>
                    <input type="checkbox" name="column_unique_<?php echo $r->column_name ?>" value="1" class="column_unique" <?php echo ($row && $row->is_unique) ? 'checked=""' : '' ?>> Unique
                    <br>
                    <?php
                        $required = 'YES';
                        if ($r->is_nullable == 'YES') {
                            $required = 'NO';
                        }
                     ?>
                    <input type="checkbox" name="required_<?php echo $r->column_name ?>" value="1" class="req"
                        <?php
                            if($required == 'YES') {
                                echo "checked";
                            }else if ($row && $row->required) {
                                echo "checked";
                            }
                        ?>
                    >
                    <?php echo "Required (db :".$required.")"; ?>
                </td>
                <td>
                    <?php echo $r->column_name ?><br>
                    <input type="text" class="form-control" name="label_name_<?php echo $r->column_name ?>" value="<?php echo ($row) ? $row->label_name : str_replace('_', ' ', $r->column_name) ?>" >
                    <span id="upload_<?php echo $r->column_name ?>" style="display: none;">
                        path upload : 'uploads/folder_name/'
                        <input  type="text" class="form-control" name="path_upload_<?php echo $r->column_name ?>" value="<?php echo ($row) ? $row->path_upload : '' ?>"  > 
                    </span> 
                </td>
                <td>
                    <?php echo "db : ".$r->data_type ?>
                    <br>
                    Type :
                    <?php
                        if ($row) {
                            $set_type = $row->type;
                        }else{
                            if ($r->data_type == 'double precision' || $r->data_type == 'numeric'|| $r->data_type == 'integer') {
                                $set_type = "int";
                            }else{
                                $set_type = $r->data_type;
                            }
                        }
                        $options = json_decode('{
                            "text":"text",
                            "textarea":"textarea",
                            "ckeditor":"ckeditor",
                            "int":"int",
                            "numeric":"numeric",
                            "int_separator":"int_separator",
                            "date":"date",
                            "datetime":"datetime",
                            "select_ajax":"select_ajax",
                            "select":"select",
                            "selfemployee":"selfemployee",
                            "checkbox":"checkbox",
                            "radio":"radio",
                            "upload":"dropzone",
                            "file":"file",
                            "img":"img",
                            "password":"password",
                            "latlong":"latlong"
                        }',true);
                        // echo form_dropdown("type_".$r->column_name, $options,$set_type);
                     ?>
                    <select name="type_<?php echo $r->column_name ?>" id="type_<?php echo $r->column_name ?>"  class="tipefield" data-columnname="<?php echo $r->column_name ?>">
                        <?php foreach ($options as $key => $value): ?>
                        <?php 
                            $selected = "";
                            if ($row) {
                                if ($value == $set_type) {
                                    $selected = "selected";
                                }
                            }
                            
                         ?>
                        <option value="<?php echo $key ?>" <?php echo $selected ?>><?php echo $value ?></option> 
                        <?php endforeach ?>
                    </select>

                     <br>
                     <select name="table_ref_<?php echo $r->column_name ?>" id="table_ref_<?php echo $r->column_name ?>" style="display: none;">
                        
                    <option value="">PILIH</option>
                    <?php foreach ($dropdown->result() as $r): ?>
                        <?php 
                            $selected = "";
                            if ($row) {
                                if ($r->dd_title == $row->table_ref) {
                                    $selected = "selected";
                                }
                            }
                            
                         ?>
                        <option value="<?php echo $r->dd_title ?>" <?php echo $selected ?>><?php echo $r->dd_title ?></option>    
                    <?php endforeach ?>
                    </select>
                </td>
                
            </tr>
    	<?php endforeach ?>
        </tbody>
    </table>
</div>

<script>
    $('.tipefield').change(function(event) {
		if(this.value == 'img' || this.value == 'file') {
            var columnname = $(this).data('columnname');
            $('#upload_'+columnname).show();
        }else if(this.value == 'select_ajax' || this.value == 'select'){
            var columnname = $(this).data('columnname');
            $('#table_ref_'+columnname).show();
            console.log(this.value);
        }
	}).change();

	$('#check_all_active').change(function(event) {
		$('.active').not(this).prop('checked', this.checked);
	});
	$('#check_all_req').change(function(event) {
        $('.req').not(this).prop('checked', this.checked);
    });
    $('#check_all_datatable').change(function(event) {
        $('.column_datatable').not(this).prop('checked', this.checked);
    });
    $('#check_all_unique').change(function(event) {
		$('.column_unique').not(this).prop('checked', this.checked);
	});

    /* Create an array with the values of all the input boxes in a column, parsed as numbers */
    $.fn.dataTable.ext.order['dom-text-numeric'] = function  ( settings, col )
    {
        return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
            var x = 1000;
            if ($('input', td).val() != '')
                x = $('input', td).val();

            return x * 1;
        } );
    }
    $(document).ready( function () {
        $('#parameter_table').DataTable({
            "dom": "t",
            "paging": false,
            "ordering": false,
            "columnDefs": [
                {
                    "targets": 0,
                    "orderDataType": "dom-text-numeric"
                 }
            ],
            "order": [
                [0, "asc"]
            ],
        });
    } );
</script>

