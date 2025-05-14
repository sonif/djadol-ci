<style>
    /*.DTFC_LeftBodyLiner{overflow-y:unset !important}
    .DTFC_RightBodyLiner{overflow-y:unset !important}
    .dataTables_scrollHead {
        border-bottom: 0px !important;
    }
    .dataTables_extended_wrapper .table.dataTable {
        margin: 0px !important;
    }
    table.dataTable thead td, table.dataTable thead th {
        border-bottom: unset !important;
    }
    .table-responsive {
        overflow-x: unset !important;
    }*/
}
</style>
<!-- <div class="page-content-wrapper"> -->
    <!-- BEGIN CONTENT BODY -->
    <!-- <div class="page-content"> -->
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE BAR -->
        <!-- <div class="page-bar">
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <a href="javascript:;"><?php echo $form->form_name ?></a>
                     <i class="fa fa-circle"></i>
                </li>
            </ul>
            <div class="page-toolbar">
            </div>
        </div> -->
        <!-- END PAGE BAR -->
        <!-- END PAGE HEADER-->
        <!-- <div class="row"> -->
            <!-- <div class="col-md-12"> -->
                <!-- BEGIN EXAMPLE TABLE PORTLET-->

                <!-- Main content -->
                  <div class='row'>
                    <div class='col-md-12'>
                      <div class='portlet light portlet-fit portlet-datatable bordered'>
                        <div class='portlet-title'>
                            <div class="caption">
                                <i class="icon-settings font-dark"></i>
                                <span class="caption-subject font-dark sbold uppercase"><?php echo $form->form_name ?>  </span>
                            </div>
                            <div class="actions">
                                <?php if (in_array('xcreate', $ar_haklistakses)): ?>
                                <div class="btn-group" >
                                    <button
                                        data-url="<?php echo site_url('formx/formx/form/'.$form_id) ?>" data-id="div_modal_form_<?php echo $form_id?>"
                                        <?php if($this->input->post('parent_id'))
                                        echo 'data-parent_id="'.$this->input->post('parent_id').'"' ;
                                        echo 'data-parent_column="'.$this->input->post('parent_column').'"' ;
                                        ?>
                                        class="btn btn-circle btn-info btn-sm openmodal">
                                        <i class="fa fa-pencil"></i> Add
                                    </button>
                                </div>
                                <?php endif ?>

                                <div class="btn-group">
                                    <a class="btn red btn-circle" href="javascript:;" data-toggle="dropdown">
                                        <i class="fa fa-share"></i>
                                        <span class="hidden-xs"> Tools </span>
                                        <i class="fa fa-angle-down"></i>
                                    </a>
                                    <ul class="dropdown-menu pull-right" id="datatable_ajax_tools_<?php echo $form_id ?>">
                                        <?php if ($form->is_import): ?>
                                        <li>
                                            <a href="javascript:;" class="openmodal" data-url="<?php echo site_url('formx/c_import/form/'.$form_id) ?>"
                                                data-id="div_modal_import_form_<?php echo $form_id?>">
                                                <i class="icon-cloud-upload"></i> import</a>
                                            <!-- <button data-url="<?php echo site_url('formx/c_import/form/'.$form_id) ?>" data-id="div_modal_import_form_<?php echo $form_id?>" type="button" class="btn btn-circle yellow openmodal">import</button> -->
                                        </li>
                                        <li class="divider"> </li>
                                        <?php endif ?>
                                        <li>
                                            <a href="javascript:;" data-action="0" class="tool-action">
                                                <i class="icon-printer"></i> Print</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-action="1" class="tool-action">
                                                <i class="icon-check"></i> Copy</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-action="2" class="tool-action">
                                                <i class="icon-doc"></i> PDF</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-action="3" class="tool-action">
                                                <i class="icon-paper-clip"></i> Excel</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" data-action="4" class="tool-action">
                                                <i class="icon-cloud-upload"></i> CSV</a>
                                        </li>
                                        <li class="divider"> </li>
                                        <li>
                                            <a href="javascript:;" data-action="5" class="tool-action">
                                                <i class="icon-refresh"></i> Reload</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                        <div class='portlet-body'>
                            <div class='table-container'>
                                <div class="row">
                                    <?php foreach ($m_form_filter->result() as $form_filter): ?>
                                    <div class="col-md-3 pull-right">
                                        <select name="<?php echo $form_filter->column_name ?>" class='form-control select2-ajax form-filter' data-url='<?php echo site_url('formx/dropdown/dd/'.$form_filter->dropdown_name) ?>' data-placeholder="<?php echo $form_filter->placeholder ?>">
                                        </select>
                                    </div>
                                    <?php endforeach ?>
                                </div>
                                <!-- <div class="table-actions-wrapper">
                                    <span> </span>
                                    <select class="table-group-action-input form-control input-inline input-small input-sm">
                                        <option value="">Select...</option>
                                        <option value="delete">Delete</option>
                                    </select>
                                    <button class="btn btn-sm green table-group-action-submit">
                                        <i class="fa fa-check"></i> Submit</button>
                                </div> -->
                                <table class="table table-striped table-bordered table-hover nowrap" id="datatable_<?php echo $form_id ?>">
                                    <thead>
                                        <tr role="row" class="heading">
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
                                            <th width="2%" class="not-export-column">Action</th>
                                        </tr>
                                        <tr role="row" class="filter">
                                            <td width="2%">
                                                <!-- <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                                    <input type="checkbox" class="group-checkable" data-set="#sample_2 .checkboxes" />
                                                    <span></span>
                                                </label> -->
                                            </td>
                                            <?php foreach ($form_param->result() as $p): ?>
                                                <?php if ($p->type == 'upload') continue; ?>
                                                <?php if ($p->type == 'int'): ?>
                                                    <td class="dt-body-right">
                                                        <div class="input-group input-small ">
                                                        <input type="text" class="form-control form-filter" name="<?php echo $p->column_name ?>_min" placeholder="min">
                                                            <span class="input-group-addon"> to </span>
                                                        <input type="text" class="form-control form-filter" name="<?php echo $p->column_name ?>_max" placeholder="max">
                                                    </div>
                                                    </td>
                                                <?php elseif ($p->type == 'date'): ?>
                                                    <td>
                                                        <div class="input-group input-medium date-picker input-daterange">
                                                            <input type="text" class="form-control form-filter" name="<?php echo $p->column_name ?>_min">
                                                            <span class="input-group-addon"> to </span>
                                                            <input type="text" class="form-control form-filter" name="<?php echo $p->column_name ?>_max">
                                                        </div>
                                                       <!--  <input type="text" class="form-control form-filter input-small date-picker" name="<?php echo $p->column_name ?>_min" placeholder="min">
                                                        <input type="text" class="form-control form-filter input-small date-picker" name="<?php echo $p->column_name ?>_max" placeholder="max"> -->
                                                    </td>
                                                 <?php elseif ($p->type == 'select'): ?>
                                                    <td>
                                                      <?php
                                                        if(!$options = json_decode($p->table_ref,true)){
                                                          $options = $this->Formx_model->get_array_dd($p->table_ref);
                                                        }
                                                        $data_attribut = array(
                                                                'class'       => 'form-control form-filter select2me',
                                                        );
                                                        $options[""]="";
                                                        $dd_value = "";
                                                        echo form_dropdown($p->column_name, $options, $dd_value,$data_attribut);
                                                       ?>
                                                    </td>
                                                <?php elseif ($p->type == 'select_ajax'): ?>
                                                    <td>
                                                        <select name='<?php echo $p->column_name ?>' class='form-control form-filter select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/'.$p->table_ref) ?>'></select>
                                                    </td>
                                                <?php else: ?>
                                                    <td><input type="text" class="form-control form-filter input-sm" name="<?php echo $p->column_name ?>"></td>
                                                <?php endif ?>
                                            <?php endforeach ?>
                                            <td>
                                                <div class="margin-bottom-5">
                                                    <button class="btn btn-sm green btn-outline filter-submit margin-bottom" title="search">
                                                    <i class="fa fa-search"></i></button>
                                                    <button class="btn btn-sm red btn-outline filter-cancel" title="reset">
                                                    <i class="fa fa-times"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div><!-- /.table-container -->
                        </div><!-- /.portlet-body -->
                      </div><!-- /.portlet -->
                    </div><!-- /.col -->
                  </div><!-- /.row -->

            <!-- </div> -->
        <!-- </div> -->
    <!-- </div> -->
    <!-- END CONTENT BODY -->
<!-- </div> -->

<script type="text/javascript">
$(document).ready(function() {

    var datatableAjax_<?php echo $form_id ?> = new Datatable();
    datatableAjax_<?php echo $form_id ?>.setDefaultParam("form_id","<?php echo $form_id ?>");
    <?php if ($this->input->post('parent_id')): ?>
    datatableAjax_<?php echo $form_id ?>.setDefaultParam("parent_id","<?php echo $this->input->post('parent_id') ?>");
    datatableAjax_<?php echo $form_id ?>.setDefaultParam("parent_column","<?php echo $this->input->post('parent_column') ?>");
    datatableAjax_<?php echo $form_id ?>.setDefaultParam("flow_id","<?php echo $this->input->post('flow_id') ?>");
    datatableAjax_<?php echo $form_id ?>.setDefaultParam("parent_form_id","<?php echo $this->input->post('parent_form_id') ?>");
    datatableAjax_<?php echo $form_id ?>.setDefaultParam("authorize","<?php echo $this->input->post('authorize') ?>");
    <?php endif ?>
    datatableAjax_<?php echo $form_id ?>.init({
        src: $("#datatable_<?php echo $form_id ?>"),
        dataTable: {
            "ajax": {
                "url": "<?php echo site_url('formx/formx/getDatatable/') ?>", // ajax source
            },
            "columnDefs": [
                {
                    'targets':0,
                    'orderable': false,
                },
                {
                    'targets':-1,
                    'orderable': false,
                },
            <?php
                $order_col = 0;
                $order_type = (!empty($form->col_sort_type)) ? $form->col_sort_type : "desc" ;
            ?>
            <?php $i_col=1; foreach ($form_param->result() as $p): ?>
                <?php if ($p->type == 'upload') continue; ?>
                <?php if ($p->column_name == $form->col_sort_name) $order_col = $i_col; ?>
                {
                    'targets': <?php echo $i_col++ ?>,
                    <?php
                        if ( in_array($p->type, ['int','numeric','int_separator']))
                            echo "'className': 'dt-body-right'";
                        else
                            echo "'className': 'dt-body-left'";
                    ?>


                },
            <?php endforeach ?>

            // { // define columns sorting options(by default all columns are sortable extept the first checkbox column)
            //     'orderable': false,
            //     'targets': [-1]
            // }
            ],
            "order": [
                [<?php echo $order_col ?>, "<?php echo $order_type ?>"]
            ],// set first column as a default sort by asc
            // scrollX:        true,
            // fixedColumns: {
            //   rightColumns: 1
            // },
        }
    });

    $('#datatable_ajax_tools_<?php echo $form_id ?> > li > a.tool-action').on('click', function() {
        var action = $(this).attr('data-action');
        datatableAjax_<?php echo $form_id ?>.getDataTable().button(action).trigger();
    });
});

</script>
