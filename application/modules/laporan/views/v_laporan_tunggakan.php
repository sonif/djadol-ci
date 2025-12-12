
<!-- Main content -->
<div class='card shadow'>
        <div class='card-header'>
          <div class="col-7">
              <h5 class="h3 mb-0 text-uppercase">Laporan Absensi</h5>
          </div>
        </div>
        <div class='card-body form'>
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="cb_month">Bulan</label>
                        <select name='cb_month' id="cb_month" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_month') ?>'>
                            
                        </select>   
                    </div>
                    <div class="form-group col-md-3">
                        <label for="cb_year">Tahun</label>
                        <select name='cb_year' id="cb_year" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_year') ?>'>
                            <option value="<?php echo date('Y'); ?>" selected><?php echo date('Y'); ?></option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="cb_agen">Sales</label>
                        <select name='cb_agen' id="cb_agen" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_user_agen') ?>'>
                        </select> 
                    </div>
                </div>
                <div id="row">
                    <center>
                    <button class="btn btn-default btn-sm" id="btn_load">Load Laporan</button>
                    </center>
                </div>
            <hr/>
            <div id="wrap_loading" style="display:none">
                <center>
                    <div class="icon icon-shape bg-gradient-purple text-white rounded-circle shadow">
                        <i class="fa fa-spinner fa-spin fa-2x fa-fw"></i>
                    </div>
                </center>
            </div>

            <div class='table-responsive' id='wrap_table'>
                
            </div><!-- wrap_table End-->
        </div><!-- /.box-body -->
      </div><!-- /.box -->
      
<script>
    function show_form(id){
        var mymodal = $('#'+id);
        mymodal.modal('show');
    }

    function load_report(){
        $("#wrap_loading").show();
        $("#wrap_table").load("<?php echo site_url('laporan/laporan/tunggakan_ajax/');?>"
            ,{ cb_month : $("#cb_month").val(),
                cb_agen : $("#cb_agen").val(),
                cb_year : $("#cb_year").val(),}
            , function() {
                $("#wrap_loading").hide();
        });        
    }

    $(document).ready(function () {
        $('.date-year').datepicker({
            orientation:"left",
            format:"yyyy",
            minViewMode:"years",
            autoclose:true
        });

        $("#btn_load").on('click',function(e){
            load_report();
        });
    });
</script>