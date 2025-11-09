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
            $tt = "Detail Jurnal Warehouse";
            if(!empty($rtitle)){
                $tt = $rtitle;
            }
        ?>
        <h2><?php echo $tt; ?></h2>
        <div>
            Tanggal Jurnal : <?php echo $header->created_at;?> <br/>
            Warehouse : <?php echo $header->warehouse_name;?> <br/>
        </div>
    </center>

    <table align="center" class="table-report" border="1" width="98%" cellspacing="0" cellpadding="2px" style="width: 98%;">
        <thead>                            
            <tr>
                <th align="center">No</th>
                <th >Produk</th>
                <th >Jumlah</th>
                <th >Harga Satuan</th>
                <th>Subtotal</th>
            </tr>
        </thead>
    <tbody>
        <?php
            $i=0;
            $tstyle = " ";
            // var_dump($v_report->result());
            if($record->num_rows() <= 0):
                echo "<tr><td colspan='5' align='center'>-- Tidak ada data --</td></tr>";
            endif;
            foreach($record->result() as $r):
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
                <td><?php echo number_format($r->price,0,',','.');?></td>
                <td>
                    <?php echo number_format($r->subtotal,0,',','.');?>
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