        <div class="row">
            <div class="col">
                <div class='card shadow'>
                    <div class='card-header'>
                        <div class="row align-items-center">
                            <div class="col-md-7">
                                <h5 class="h3 mb-0 text-uppercase"><?php echo $m_flow->name ?></h5>
                            </div>
                            <div class="col-md-5 text-right">
                                <?php //if (in_array('xcreate', $ar_haklistakses)): ?>
                                    <?php if ($usergroup_creator == $usergroup_id || empty($usergroup_creator)): ?>
                                    <div class="btn-group" >
                                            <?php echo anchor('formx/flow/form/'.$flow_id,'<i class="fa fa-pencil"></i> Create',array('class'=>'btn btn-circle btn-info btn-sm'));?>
                                    </div>
                                    <?php endif ?>
                                <?php //endif ?>
                                <div class="btn-group " id="datatable_ajax_tools">
                                    <button class="btn btn-sm btn-default dropdown-toggle m-1" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Tools
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                                    <button class="dropdown-item tool-action" type="button" data-action="0">print</button>
                                    <button class="dropdown-item tool-action" type="button" data-action="1">copy</button>
                                    <button class="dropdown-item tool-action" type="button" data-action="2">pdf</button>
                                    <button class="dropdown-item tool-action" type="button" data-action="3">excel</button>
                                    <button class="dropdown-item tool-action" type="button" data-action="4">csv</button>
                                    <button class="dropdown-item tool-action" type="button" data-action="5">reload</button>
                                    </div>
                                </div>
                                <!-- <div class="btn-group ">
                                    <button class="btn btn-sm btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Tools
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                                            <button class="dropdown-item tool-action" type="button" data-action="0">print</button>
                                            <button class="dropdown-item tool-action" type="button" data-action="1">copy</button>
                                            <button class="dropdown-item tool-action" type="button" data-action="2">pdf</button>
                                            <button class="dropdown-item tool-action" type="button" data-action="3">excel</button>
                                            <button class="dropdown-item tool-action" type="button" data-action="4">csv</button>
                                            <button class="dropdown-item tool-action" type="button" data-action="5">reload</button>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div><!-- /.box-header -->
                    <div class='card-body'>
                        <div class='table-container'>
                            <!-- <div class="table-actions-wrapper">
                                <span> </span>
                                <select class="table-group-action-input form-control input-inline input-small input-sm">
                                    <option value="">Select...</option>
                                    <option value="delete">Delete</option>
                                </select>
                                <button class="btn btn-sm green table-group-action-submit">
                                    <i class="fa fa-check"></i> Submit</button>
                            </div> -->
                            <table class="table table-striped table-bordered table-hover" id="mytable">
                                <thead>
                                    <tr role="row" class="heading">
                                        <!-- <th width="2%"><input type="checkbox" class="group-checkable"> </th> -->
                                        <th>No</th>

                                        <?php foreach ($form_param->result() as $p): ?>
                                        <?php if ($p->type == 'upload') continue; ?>

                                        <th>
                                            <?php
                                            if (!empty($p->label_name)) {
                                                echo $p->label_name;
                                            }else{
                                                echo $p->column_name;
                                            }
                                            ?>
                                        </th>
                                        <?php endforeach ?>
                                        <th>Status</th>
                                        <th class="not-export-column">Action</th>
                                    </tr>
                                    <tr role="row" class="filter">
                                        <td></td>
                                        <?php foreach ($form_param->result() as $p): ?>
                                            <?php if ($p->type == 'upload') continue; ?>
                                            <?php if ($p->type == 'int'): ?>
                                                <td>
                                                    <input type="text" class="form-control form-filter input-sm" name="<?php echo $p->column_name ?>_min" placeholder="min">
                                                    <input type="text" class="form-control form-filter input-sm" name="<?php echo $p->column_name ?>_max" placeholder="max">
                                                </td>
                                            <?php elseif ($p->type == 'date'): ?>
                                                <td>
                                                    <input type="text" class="form-control form-filter input-sm date-picker" name="<?php echo $p->column_name ?>_min" placeholder="min">
                                                    <input type="text" class="form-control form-filter input-sm date-picker" name="<?php echo $p->column_name ?>_max" placeholder="max">
                                                </td>
                                            <?php elseif ($p->type == 'select'||$p->type == 'select_ajax'||$p->type == 'selfemployee'): ?>
                                                <td>
                                                    <select name='<?php echo $p->column_name ?>' class='form-control form-filter select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/'.$p->table_ref) ?>'></select>
                                                </td>
                                            <?php else: ?>
                                                <td><input type="text" class="form-control form-filter input-sm" name="<?php echo $p->column_name ?>"></td>
                                            <?php endif ?>
                                        <?php endforeach ?>
                                        <td>
                                            <!-- select ajax -->
                                            <select name='level_no' class='form-control form-filter select2-ajax' data-url='<?php echo site_url('formx/dropdown/flow_level/'.$m_flow->id) ?>'></select>

                                            <!-- select normal -->
                                            <?php 
                                            // $data_attribut = array(
                                            //     'class'       => 'form-control form-filter select2me',
                                            //     'data-allow-clear' => 'true'
                                            // );
                                            // $options = $this->Flow_model->getFlowLevelDropdown($m_flow->id);
                                            // $options[""]="";
                                            // $default_value = "";
                                            // echo form_dropdown('level_no', $options, $default_value,$data_attribut);
                                            ?>
                                        </td>
                                        <td>
                                            <div class="margin-bottom-5">
                                                <button class="btn btn-sm btn-default">
                                                <i class="fa fa-search filter-submit"></i> 
                                                Search</button>
                                                <button class="btn btn-sm btn-danger">
                                                <i class="fa fa-times filter-cancel"></i> 
                                                Reset</button>
                                            </div>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div><!-- /.table-container -->
                    </div><!-- /.portlet-body -->
                </div><!-- /.content -->

            </div>
        </div>

<script type="text/javascript">
$(document).ready(function() {

    var datatableAjax = new Datatable();
    datatableAjax.setDefaultParam("form_id","<?php echo $form_id ?>");
    datatableAjax.setDefaultParam("flow_id","<?php echo $flow_id ?>");
    datatableAjax.init({
        src: $("#mytable"),
        dataTable: {
            "ajax": {
                "url": "<?php echo site_url('formx/flow/getDatatable/') ?>", // ajax source
            },
            "columnDefs": [{ // define columns sorting options(by default all columns are sortable extept the first checkbox column)
                'orderable': false,
                'targets': [-1]
            }],
            "order": [
                [0, "desc"]
            ],// set first column as a default sort by asc
        }
    });

    $('#datatable_ajax_tools > div > button.tool-action').on('click', function() {
        var action = $(this).attr('data-action');
        console.log(action);
        datatableAjax.getDataTable().button(action).trigger();
    });
});

</script>
