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
        table thead{
            background-color: #ffd200;
        }
        td th .table-report {
            padding: 5px;
        }
        .trow{
            background-color: #39e1e5;
        }
    </style>

    <center>
        <h2>Laporan Pencatatan Meteran (<?php echo $input_bulan."/".$input_tahun; ?>)</h2>
    </center>

    <table align="center" class="table-report" border="1" width="95%" cellspacing="0" cellpadding="2px" style="width: 95%;">
        <thead>                            
            <tr>
                <th width="30" align="center">No</th>
                <th width="200" align="center">Pelanggan</th>
                <th width="200" align="center">Dusun</th>
                <th width="80" align="center">RT</th>
                <th width="80" align="center">RW</th>
                <th width="100" align="center">Meteran Bulan Lalu (m3)</th> 
                <th width="100" align="center" >Meteran Bulan Ini (m3)</th>     
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
                <td align="center" ><?php echo $i; ?></td>
                <td><?php echo "(".$r->customer_code.") ".$r->customer_fullname;?></td>
                <td><?php echo $r->dusun_name;?></td>
                <td align="center"><?php echo $r->customer_rt;?></td>
                <td align="center"><?php echo $r->customer_rw;?></td>
                <td align="right" ><?php echo $r->bulan_lalu??0;?></td>
                <td align="right" ><?php //echo $r->bulan_ini??0;?></td>   
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
            loadCSS : "<?php echo base_url('assets/css/table_print.css')?>",
        });
    });
    
</script>
