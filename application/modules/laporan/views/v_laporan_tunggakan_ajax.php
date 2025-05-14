<div class="row">
    <div class="col-md-12">
        <button class="btn btn-default btn-sm" id="btn_print_report"><i class="fa fa-print"></i> Print</button>
    </div>
</div>

<div id="divprint">
    <style>
        table .table-report {
            border-collapse: collapse;
        }
        td th .table-report {
            padding: 5px;
        }
        .trow{
            -webkit-print-color-adjust: exact;
            background-color: #ffd200;
        }
        table thead{
            background-color: #39e1e5;
            -webkit-print-color-adjust: exact;
        }
    </style>

    <center>
        <?php
            $tt = "Laporan Tunggakan";
            if(!empty($rtitle)){
                $tt = $rtitle;
            }
        ?>
        <h2><?php echo $tt." (Tahun ".$input_tahun.")"; ?></h2>
    </center>

    <table align="center" class="table-report" border="1" width="98%" cellspacing="0" cellpadding="2px" style="width: 98%;">
        <thead>                            
            <tr>
                <th width="30" align="center">No</th>
                <th width="30" align="center">Tag. Bulan</th>
                <th width="200" align="center">Pelanggan</th>
                <th width="200" align="center">Dusun</th>
                <th width="80" align="center">RT/RW</th>
                <th width="80" align="center">Stan</th>
                <th width="100" align="center">(m3)</th> 
                <th width="100" align="center" >Tunggakan</th>
                <th width="100" align="center" >Denda</th>
                <th width="100" align="center" >Admin</th>
                <th width="100" align="center" >Total</th>   
            </tr>
        </thead>
    <tbody>
        <?php
            $i=0;
            $tstyle = " ";
            foreach($v_customer->result() as $r):
                $i++;
                if($i % 2 == 0):
                    $tstyle = " class='trow' ";
                else:
                    $tstyle = "";
                endif;

        ?>
        
            <tr <?php echo $tstyle; ?>>

                <td align="center" >
                    <?php 
                        echo $i; 
                        if($r->jumlah_tunggakan >= 3):
                            echo "(*)";
                        endif;
                    ?>
                </td>
                <td align="center" ><?php echo $month[$r->transaksi_month_issue]."/".$r->transaksi_year_issue; ?></td>
                <td><?php echo "(".$r->customer_code.") ".$r->customer_fullname;?></td>
                <td><?php echo $r->dusun_name;?></td>
                <td align="center"><?php echo $r->customer_rt."/".$r->customer_rw;?></td>
                <td align="center"><?php echo $r->transaksi_count_before."-".$r->transaksi_count_now;?></td>
                <td align="center" ><?php echo ($r->transaksi_count_now-$r->transaksi_count_before); ?></td>
                <td align="right" ><?php echo $r->transaksi_subtotal; ?></td>   
                <td align="right" ><?php echo ($r->transaksi_pinalty); ?></td>
                <td align="right" ><?php echo ($r->transaksi_admin_price); ?></td>  
                <td align="right" ><?php echo ($r->transaksi_total); ?></td>   
            </tr>
            
        <?php
            endforeach;
        ?>
    </tbody>
    </table>
</div>

<script>    

    $("#btn_print_report").on('click',function(e){
        $('#divprint').printThis({
            loadCSS : "<?php echo base_url('assets/css/table_print2.css')?>",
        });
    });
    
</script>
