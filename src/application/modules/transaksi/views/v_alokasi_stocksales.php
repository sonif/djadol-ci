
<!-- Main content -->
<div class='card shadow'>
        <div class='card-header'>
          <div class="col-7">
              <h5 class="h3 mb-0 text-uppercase">Input Alokasi Stok Barang</h5>
          </div>
        </div>
        <div class='card-body form'>
            <form id="alokasiForm">
                <table id="detailTable">
                    <thead>
                        <tr>
                            <div class="form-group">
                                <th colspan="3">
                                    <label>Sales adb :</label>
                                    <select name='cb_agen' id="cb_agen" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_user_agen'); ?>'>
                                </th>
                            </div>
                        </tr>
                        <tr>
                            <th width="200px">Barang</th>
                            <th width="100px">Jumlah</th>
                            <th width="10%"><button type="button" class="btn btn-success btn-sm" id="addRow">+</button></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                            <select name='cb_product' id="cb_product" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_product'); ?>'>
                            </td>
                            <td><input type="number" name="jumlah[]" class="form-control" required></td>
                            <td><button type="button" class="btn btn-danger btn-sm removeRow">x</button></td>
                        </tr>
                    </tbody>
                </table>

                <button type="submit" class="btn btn-primary">Simpan Semua</button>
            </form>

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

    $(document).ready(function () {
        $("#addRow").click(function() {
            let newRow = $("#detailTable tbody tr:first").clone();
            newRow.find("input").val('');
            $("#detailTable tbody").append(newRow);
        });

        // Hapus baris
        $(document).on('click', '.removeRow', function() {
            if ($("#detailTable tbody tr").length > 1)
            $(this).closest('tr').remove();
        });

        
        $('.date-year').datepicker({
            orientation:"left",
            format:"yyyy",
            minViewMode:"years",
            autoclose:true
        });

    });
</script>