<div class="row">
<div class="form-group col-md-3">
    <label for="cb_year">Tahun</label>
    <select name='cb_year' id="cb_year" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_year') ?>'>
    <option value="<?php echo date('Y'); ?>" selected="selected"><?php echo date('Y'); ?></option>
    </select>  
</div>
<div class="form-group col-md-3">
    <label for="cb_month">Bulan</label>
    <select name='cb_month' id="cb_month" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_month') ?>'>
    <option value="<?php echo date('m'); ?>" selected="selected"><?php echo date('m'); ?></option>
    </select>  
</div>
</div>

<table class="table table-striped table-hover table-bordered" id="tbbelum"
                                width="100%" cellspacing="0" role="grid" aria-describedby="example_info" style="width: 100%;">
    <thead class="thead-dark">                            
        <tr role="row" class="heading">
        <th width="30">No.</th>
        <th width="100" align="center">Nama</th>
        <th width="100">Kode Pelanggan</th>      
        </tr>
        <tr role="row" class="filter">
            <td><b>Filter</b></td>
            <td><input type="text" class="form-control form-filter" name="filter_customer_name" /></td>
            <td>&nbsp;</td>
        </tr>
    </thead>
    <tbody>
    
    </tbody>
</table>

<script>
    $(document).ready(function () {
        var tbsbelum = new Datatable();

        tbsbelum.setDefaultParam("filter_cb_year",$("#cb_year").val());
        tbsbelum.setDefaultParam("filter_cb_month",$("#cb_month").val());

        tbsbelum.init({
            src : $("#tbbelum"),
            dataTable:{
                "ajax":{
                "url":"<?php echo site_url("transaksi/transaksi/getDatatable_belum");?>",
                },
                "order":[
                    [1,"asc"]
                ],
                "pageLength": 5, 
                "lengthMenu": [[5, 10, 25, -1], [5, 10, 25, "All"]]
            }
        });  

        $('#cb_year,#cb_month').on('change', function(){
            tbsbelum.setDefaultParam("filter_cb_year",$("#cb_year").val());
            tbsbelum.setDefaultParam("filter_cb_month",$("#cb_month").val());
            tbsbelum.getDataTable().ajax.reload();
        });

    });

</script>

