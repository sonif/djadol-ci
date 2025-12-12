
                  <div class='row'>
                    <div class='col'>
                      <div class='card shadow'>
                        <div class='card-header'>
                            <div class="row align-items-center">
                                <div class="col-7">
                                  <h5 class="h3 mb-0 text-uppercase"><?php echo $form->form_name ?></h5>
                                </div>
                                <div class="col-5 text-right">
                                  <?php if (in_array('xcreate', $ar_haklistakses)): ?>
                                    <div class="btn-group" >
                                        <button
                                            data-url="<?php echo site_url('formx/formx/form/'.$form_id) ?>" data-id="div_modal_form_<?php echo $form_id?>"
                                            <?php if($this->input->post('parent_id'))
                                            echo 'data-parent_id="'.$this->input->post('parent_id').'"' ;
                                            echo 'data-parent_column="'.$this->input->post('parent_column').'"' ;
                                            ?>
                                            class="btn btn-info btn-sm openmodal m-1">
                                            <i class="fa fa-pencil"></i> Add
                                        </button>
                                    </div>
                                    <?php endif ?>
                                    <div class="btn-group " id="datatable_ajax_tools_<?php echo $form_id ?>">
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
                                </div>
                              </div>
                        </div><!-- /.box-header -->
                        <div class='card-body'>
                            <div class='table-responsive'>
                                <!-- <div class="row">
                                    <?php foreach ($m_form_filter->result() as $form_filter): ?>
                                    <div class="col-md-3 pull-right">
                                        <select name="<?php echo $form_filter->column_name ?>" class='form-control select2-ajax form-filter' data-url='<?php echo site_url('formx/dropdown/dd/'.$form_filter->dropdown_name) ?>' data-placeholder="<?php echo $form_filter->placeholder ?>">
                                        </select>
                                    </div>
                                    <?php endforeach ?>
                                </div> -->
                                <!-- <div class="table-actions-wrapper">
                                    <span> </span>
                                    <select class="table-group-action-input form-control input-inline input-small input-sm">
                                        <option value="">Select...</option>
                                        <option value="delete">Delete</option>
                                    </select>
                                    <button class="btn btn-sm green table-group-action-submit">
                                        <i class="fa fa-check"></i> Submit</button>
                                </div> -->
                                <table class="table table-hover" id="datatable_<?php echo $form_id ?>">
                                    <thead class="thead-dark">
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
                                                <?php if ($p->type == 'int'||$p->type == 'int_separator'): ?>
                                                    <td>
                                                        <div class="input-group input-small ">
                                                            <input type="text" class="form-control form-filter" name="<?php echo $p->column_name ?>_min" placeholder="min">
                                                        </div>
                                                        <div class="input-group input-small ">
                                                            <input type="text" class="form-control form-filter" name="<?php echo $p->column_name ?>_max" placeholder="max">
                                                        </div>
                                                    </td>
                                                <?php elseif ($p->type == 'date' || $p->type == 'datetime'): ?>
                                                    <td>
                                                        <div class="date-picker input-daterange">
                                                            <input autocomplete="off" type="text" class="form-control form-control-sm form-filter" name="<?php echo $p->column_name ?>_min" placeholder="from">
                                                            <input autocomplete="off" type="text" class="form-control form-control-sm form-filter" name="<?php echo $p->column_name ?>_max" placeholder="to">
                                                        </div>
                                                       <!--  <input type="text" class="form-control form-filter input-small date-picker" name="<?php echo $p->column_name ?>_min" placeholder="min">
                                                        <input type="text" class="form-control form-filter input-small date-picker" name="<?php echo $p->column_name ?>_max" placeholder="max"> -->
                                                    </td>
                                                 <?php elseif ($p->type == 'select'||$p->type == 'radio'): ?>
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
                                                    <button class="btn btn-sm btn-outline-info filter-submit margin-bottom" title="search">
                                                    <i class="fa fa-search"></i></button>
                                                    <button class="btn btn-sm btn-outline-danger filter-cancel" title="reset">
                                                    <i class="fa fa-times"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <?php if(!empty($form->footersum_index_table)) :?>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <?php foreach ($form_param->result() as $p): ?>
                                            <th></th>
                                            <?php endforeach ?>
                                            <!-- <th colspan="4" style="text-align:right">Total:</th>
                                            <th></th> -->
                                        </tr>
                                    </tfoot>
                                    <?php endif ?>
                                </table>
                            </div><!-- /.table-container -->
                        </div><!-- /.portlet-body -->
                      </div><!-- /.portlet -->
                    </div><!-- /.col -->
                  </div><!-- /.row -->


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
                            echo "'className': 'text-right'";
                        else
                            echo "'className': 'text-left'";
                    ?>


                },
            <?php endforeach ?>

            ],
            "order": [
                [<?php echo $order_col ?>, "<?php echo $order_type ?>"]
            ],
            // ----- fixed column -----
            // scrollY:        "400px",
            // scrollX:        true,
            // fixedColumns: {
            //     leftColumns: 0,
            //     rightColumns: 1
            // },
            scrollCollapse: true,
            <?php if(!empty($form->footersum_index_table)) :?>
            "footerCallback": function ( row, data, start, end, display ) {
                var api = this.api();
                var COLNUMBER = 4;
                // Remove the formatting to get integer data for summation
                var intVal = function ( i ) {
                    return typeof i === 'string' ?
                        i.replaceAll('.','')*1 :
                        typeof i === 'number' ?
                            i : 0;
                            
                };
                
                <?php 
                $index_col_sum = explode(",", $form->footersum_index_table);
                foreach ($index_col_sum as $z): ?>
                    // Total over all pages
                    COLNUMBER = <?php echo $z?>;
                    if (api.column(COLNUMBER).data().length){
                        var total = api
                        .column( COLNUMBER )
                        .data()
                        .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                        } ) 
                    }else{ total = 0};
        
                    // Update footer
                    $( api.column(COLNUMBER).footer() ).html(
                        formatMoney(intVal(total),',','.')
                        // +' '+total
                    );
                <?php endforeach ?>
                
            }
            <?php endif?>
        }
    });

    $('#datatable_ajax_tools_<?php echo $form_id ?> > div > button.tool-action').on('click', function() {
        var action = $(this).attr('data-action');
        console.log(action);
        datatableAjax_<?php echo $form_id ?>.getDataTable().button(action).trigger();
    });
});

</script>
