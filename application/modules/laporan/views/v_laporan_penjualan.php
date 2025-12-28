<style>
    body.modal-open {
        overflow: auto !important;
        padding-right: 0 !important;
    }
    .modal-backdrop {
        display: none !important;
    }
</style>
<!-- Main content -->
<div class='card shadow'>
        <div class='card-header'>
          <div class="col-7">
              <h5 class="h3 mb-0 text-uppercase">Laporan Penjualan Agen</h5>
          </div>
        </div>
        <div class='card-body form'>
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="date_start">Start Date</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="cursor:pointer" onclick="$('#date_start').focus();">
                                    <i class="fa fa-calendar"></i>
                                </span>
                                <input type="text" name="date_start" id="date_start" class="form-control datepick"/> 
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="date_end">End Date</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="cursor:pointer" onclick="$('#date_end').focus();">
                                    <i class="fa fa-calendar"></i>
                                </span>
                                <input type="text" name="date_end" id="date_end" class="form-control datepick"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="row">
                    <center>
                    <button class="btn btn-default btn-sm" id="btn_load">Load Penjualan Agen</button>
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
        $("#wrap_table").load("<?php echo site_url('laporan/laporan/penjualan_ajax/');?>"
            ,{ date_start : $("#date_start").val(),
                date_end : $("#date_end").val(),
            }
            , function() {
                $("#wrap_loading").hide();
        });        
    }

    $(document).ready(function () {
        $('.datepick').datepicker({
            orientation:"left",
            format:"yyyy-mm-dd",
            autoclose:true,
            todayHighlight:true,
        });

        $("#btn_load").on('click',function(e){
            load_report();
        });
    });
</script>