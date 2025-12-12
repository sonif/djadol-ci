<div class="row">
    <div class="col-md-12">
        <button class="btn btn-default btn-sm" id="btn_print_report2"><i class="fa fa-print"></i> Print</button>
    </div>
</div>

<div id="divprint2">
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
            $tt = "Laporan Sock Sales";
            if(!empty($rtitle)){
                $tt = $rtitle;
            }
        ?>
        <h2><?php echo $tt; ?></h2>
        <div>
            <?php echo "Nama Sales : (".$input_agen->email.") ".$input_agen->full_name; ?><br/>
            
        </div>
    </center>

    <table align="center" class="table-report" border="1" width="98%" cellspacing="0" cellpadding="2px" style="width: 98%;">
        <thead>                            
            <tr>
                <th align="center">No</th>
                <th >Nama Produk</th>
                <th >Jumlah</th>
            </tr>
        </thead>
    <tbody>
        <?php
            $i=0;
            $tstyle = " ";
            // var_dump($v_report->result());
            if($v_report->num_rows() <= 0):
                echo "<tr><td colspan='3' align='center'>-- Tidak ada data --</td></tr>";
            endif;
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
                <td><?php echo $r->product_name;?> </td>
                <td><?php echo $r->count;?> </td>
                <!-- <td><button class="btn btn-info btn-sm btn_detil_visit" lang="<?php echo $r->id; ?>">Detail</button></td> -->
            </tr>
            
        <?php
            endforeach;
        ?>
    </tbody>
    </table>
</div>

<script>    

    $("#btn_print_report2").on('click',function(e){
        $('#divprint2').printThis({
            loadCSS : "<?php echo base_url('assets/css/table_print2.css')?>",
        });
    });

</script>
