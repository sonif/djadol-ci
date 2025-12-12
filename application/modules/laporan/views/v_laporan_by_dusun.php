
<!-- Main content -->
<div class='card shadow'>
    <div class='card-header'>
        <div class="col-7">
            <h5 class="h3 mb-0 text-uppercase">Laporan Tagihan By Dusun  </h5>
        </div>
    </div>
    <div class='card-body form'>
        <div class='col-md-3'>
            <div class='form-group'>
            <label class='control-label'>Tahun</label>
            <div class=''>
                <input type="text" class="form-control date-year" name="cb_tahun" id="cb_tahun" value="<?php echo date('Y'); ?>"/>
            </div>
            </div>
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

    function load_report(year){
        $("#wrap_loading").show();
        $("#wrap_table").load("<?php echo site_url('laporan/laporan/by_dusun_ajax/');?>"+year, { limit: 25 }, function() {
            $("#wrap_loading").hide();
        });        
    }

    load_report('<?php echo date('Y'); ?>');

    $(document).ready(function () {
        $('.date-year').datepicker({
            orientation:"left",
            format:"yyyy",
            minViewMode:"years",
            autoclose:true
        });

        $("#cb_tahun").on('change',function(e){
            load_report($(this).val());
        });
    });
</script>