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
                <th>Aksi</th>
            </tr>
        </thead>
    <tbody>
        <?php
            $i=0;
            $tstyle = " ";
            // var_dump($v_report->result());
            if($v_report->num_rows() <= 0):
                echo "<tr><td colspan='5' align='center'>-- Tidak ada data --</td></tr>";
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
                <td><?php echo $r->created_at;?> </td>
                <td><?php echo $r->retail_name;?> </td>
                <td><?php echo $r->retail_address;?></td>
                <td>
                    <?php echo number_format($r->total_price,0,',','.');?>
                </td>
                <td>
                    <span lang ="<?php echo $r->jurnal_id; ?>" 
                    class="btn btn-info btn-sm btn_detil_sale1" >
                        Detail
                    </span>
                </td>
            </tr>
            
        <?php
            endforeach;
        ?>
    </tbody>
    </table>
</div>

<!-- Modal -->
  <div class="modal fade" id="myModalSales">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Detail</h5>
          <span class="btn btn-secondary btn-sm" data-dismiss="modal" id="btn-close-Msales">Close</span>
        </div>
        <div class="modal-body">
          <p class="text-muted">Loading...</p>
        </div>
      </div>
    </div>
  </div>

<script>
    $("#btn_print_report2").on('click',function(e){
        $('#divprint2').printThis({
            loadCSS : "<?php echo base_url('assets/css/table_print2.css')?>",
        });
    });

    $("#btn-close-Msales").on('click',function(e){
        $('#myModalSales').modal('hide');
    });

    $(".btn_detil_sale1").on('click',function(e){
        var jurnal = $(this).attr('lang');
        
        // Optional: show loading state
        $('#myModalSales .modal-body').html('<p class="text-muted">Loading...</p>');
        
        // Show modal first (so user sees loading)
        let modal = new bootstrap.Modal(document.getElementById('myModalSales'));
        modal.show();

        // Send AJAX POST
        $.ajax({
            url: '<?php echo site_url('laporan/laporan/penjualan_detil_produk_ajax'); ?>',
            type: 'POST',
            data: { id: jurnal},
            success: function(response) {
                $('#myModalSales .modal-body').html(response);
            },
            error: function() {
                $('#myModalSales .modal-body').html('<p class="text-danger">Error loading data.</p>');
            }
        });
    });
</script>