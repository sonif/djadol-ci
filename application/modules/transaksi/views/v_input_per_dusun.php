
<!-- Main content -->
<div class='card shadow'>
        <div class='card-header'>
          <div class="col-7">
              <h5 class="h3 mb-0 text-uppercase">Input Data per Dusun  </h5>
          </div>
        </div>
        <div class='card-body form'>
            <div class="row">
                <div class="form-group col-md-5">
                    <label for="cb_dusun">Dusun</label>
                    <select name='cb_dusun' id="cb_dusun" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_dusun') ?>'>
                    <option value="<?php echo date('Y'); ?>" selected="selected"></option>
                    </select>  
                </div>
                <div class="form-group col-md-3">
                    <label for="cb_year">Tahun</label>
                    <input type="text" class="form-control date-year" name="cb_tahun" id="cb_tahun" value="<?php echo date('Y'); ?>"/>
                </div>
                <div class="form-group col-md-3">
                    <label for="cb_month">Bulan</label>
                    <select name='cb_month' id="cb_month" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_month') ?>'>
                    <option value="<?php echo date('m'); ?>" selected="selected"><?php echo date('m'); ?></option>
                    </select>  
                </div>
            </div>
            <div id="row">
                <button class="btn btn-default btn-sm" id="btn_load">Mulai Input</button>
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
    $('.date-year').datepicker({
        orientation:"left",
        format:"yyyy",
        minViewMode:"years",
        autoclose:true
    });
    function show_form(id){
        var mymodal = $('#'+id);
        mymodal.modal('show');
    }

    function load_report(){
        $("#wrap_loading").show();
        $("#wrap_table").load("<?php echo site_url('transaksi/transaksi/input_per_dusun_ajax/');?>"
            ,{ cb_dusun : $("#cb_dusun").val(),
                cb_year : $("#cb_year").val(),
                cb_month :  $("#cb_month").val() }
            , function() {
                $("#wrap_loading").hide();
        });        
    }

    load_report();

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