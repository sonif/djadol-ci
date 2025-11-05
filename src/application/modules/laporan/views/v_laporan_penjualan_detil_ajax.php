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
            $tt = "Laporan Penjualan Sales : Penjualan di Retail";
            if(!empty($rtitle)){
                $tt = $rtitle;
            }
        ?>
        <h2><?php echo $tt; ?></h2>
        <div>
            <?php echo "(Start : ".$input_date_start.", End : ".$input_date_end.")"; ?><br/>
            
        </div>
    </center>

    <table align="center" class="table-report" border="1" width="98%" cellspacing="0" cellpadding="2px" style="width: 98%;">
        <thead>                            
            <tr>
                <th align="center">No</th>
                <th >Tanggal</th>
                <th >Nama Retail</th>
                <th >Alamat</th>
                <th>Total</th>
            </tr>
        </thead>
    <tbody>
        <?php
            $i=0;
            $tstyle = " ";
            // var_dump($v_report->result());
            foreach($v_report->result() as $r):
                $i++;
                if($i % 2 == 0):
                    $tstyle = " class='trow' ";
                else:
                    $tstyle = "";
                endif;
        ?>
        
            <tr <?php echo $tstyle; ?>>
                <td align="center"><?php echo $i;?></td>
                <td><?php echo $r->created_at;?> </td>
                <td><?php echo $r->retail_name;?> </td>
                <td><?php echo $r->retail_address;?></td>
                <td>
                    <?php echo number_format($r->total_price,0,',','.');?>
                </td>
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