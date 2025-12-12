
<form id="finput" action="<?php echo site_url('transaksi/transaksi/post_input_per_dusun/'); ?>" method="post">
<input name="input_tahun" type="hidden" value="<?php echo @$input_tahun; ?>"/>
<input name="input_bulan" type="hidden" value="<?php echo @$input_bulan; ?>"/>
<input name="input_dusun" type="hidden" value="<?php echo @$input_dusun; ?>"/>

<table class="table table-striped table-hover table-bordered" id="tb_input_by_dusun"
    width="100%" cellspacing="0" role="grid" aria-describedby="example_info" style="width: 100%;">
<thead class="thead-dark">                            
    <tr role="row" class="heading">
        <th width="30">No</th>
        <th width="100" align="center">Pelanggan</th>
        <th>Meteran Bulan Lalu (m3)</th> 
        <th>Meteran Bulan Ini (m3)</th>     
    </tr>
</thead>
<tbody>
    <?php
        $i=0;
        foreach($v_customer->result() as $r):
            $i++;
    ?>
        <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo "(".$r->customer_code.")<br/>".$r->customer_fullname;?></td>
            <td><?php echo $r->bulan_lalu??0;?></td>
            <td>
            <input type="hidden" class="form-control bulan_lalu" name="bulan_lalu_<?php echo $r->customer_id; ?>" id="bulan_lalu_<?php echo $r->customer_id; ?>" value="<?php echo $r->bulan_lalu??0;?>" />
            <?php
                $readonly = "";
                if($r->transaksi_status == 'lunas'):
                    $readonly = "readonly";
                endif;
            ?>
            
            <input type="text" lang="<?php echo $r->bulan_lalu??0;?>" class="form-control bulan_ini" name="bulan_ini_<?php echo $r->customer_id; ?>" id="bulan_ini_<?php echo $r->customer_id; ?>" value="<?php echo $r->bulan_ini??0;?>" <?php echo $readonly; ?> />
            
            </td>
            
        </tr>
    <?php
        endforeach;
    ?>
</tbody>
</table>
<center>
    <button class="btn btn-sm btn-default" type="submit">Simpan</button>
</center
</form>
<script>

    $('#finput').submit(function(e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var isError = false;
        $( ".bulan_ini" ).each(function() {
            var element = $(this);
            if($( this ).val() < $(this).attr('lang')){
                setError(element);
                isError = true;
            }else{
                removeError(element);
            }
        });
        if(isError){
            main.alertMessage('Input harus lebih besar dari bulan lalu!',"error");
        }else{
            main.submitAjaxModal($(this));
        }
        return false;
    });

    $('#tb_input_by_dusun').DataTable({
        "lengthMenu": [[20, 50, 100, -1], [20, 50, 100, "All"]],
        "paging":false
    });

    $(".bulan_ini").on('change',function(e){
        var ini = $(this).val();
        var lalu = $(this).attr('lang');
        var element = $(this);
        if(ini < lalu){
            setError(element);
            
        }else{
            removeError(element);
        }
    });

    function setError(element) {
        element.closest('.form-group').addClass('has-danger');
        element.addClass('is-invalid');
        var error = $("<div/>")   // creates a div element
                            .addClass("invalid-feedback")   // add a class
                            .html("Input harus lebih besar dari bulan lalu!");
        if(element.parent().find(".invalid-feedback").length  == 0){
            error.insertAfter(element); 
        }
    }

    function removeError(element) {
        element.closest('.form-group').removeClass('has-danger');
        element.removeClass('is-invalid');
        element.parent().find(".invalid-feedback").remove();
    }

</script>
