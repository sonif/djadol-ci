<table class="table table-striped table-hover table-bordered" id="tbbelum"
                                width="100%" cellspacing="0" role="grid" aria-describedby="example_info" style="width: 100%;">
    <thead class="thead-dark">                            
        <tr role="row" class="heading">
        <th width="30">No.</th>
        <th width="100" align="center">Nama <?php echo $text_display; ?></th>
        <th width="100">Action</th>      
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
    function show_form(id){
        var mymodal = $('#'+id);
        mymodal.modal('show');
    }

    $(document).ready(function () {
        var tbs = new Datatable_metronic();
        // tbs.setDefaultParam("filter_customer_name",$("#filter_customer_name").val());
        // tbs.setDefaultParam("booking_date",$("#booking_date").val());
        tbs.init({
            src : $("#tbbelum"),
            dataTable:{
                "ajax":{
                    "url":"<?php echo site_url("transaksi/transaksi/getDatatable_belum");?>",
                },
                "order":[
                    [1,"asc"]
                ],
            }
        });  
    });

</script>