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
            $tt = "Laporan Penjualan Sales";
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
                <th >Email</th>
                <th >Full name</th>
                <th >Penjualan</th>
                <th>Aksi</th>
            </tr>
        </thead>
    <tbody>
        <?php
            $i=0;
            $tstyle = " ";
            if($v_report->num_rows() <= 0):
                echo "<tr><td colspan='5' align='center'>-- Tidak ada data --</td></tr>";
            endif;
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
                <td><?php echo $r->email;?> </td>
                <td><?php echo $r->full_name;?> </td>
                <td><?php echo empty($r->total_price) ? "0" : number_format($r->total_price, 0, ',', '.'); ?></td>
                <td><button class="btn btn-info btn-sm btn_detil_visit" lang="<?php echo $r->id; ?>">Detail</button></td>
            </tr>
            
        <?php
            endforeach;
        ?>
    </tbody>
    </table>
</div>

<!-- Modal -->
  <div class="modal fade" id="myModalVisit">
    <div class="modal-dialog modal-lg" style="height: 80vh;">
      <div class="modal-content" style="height: 100%;">
        <div class="modal-header">
          <h5 class="modal-title">Detail</h5>
          <span class="btn btn-secondary btn-sm" id="btn-close-visit"  data-dismiss="modal" >Close</span>
        </div>
        <div class="modal-body" style="overflow-y: auto;">
          <p class="text-muted">Loading...</p>
        </div>
      </div>
    </div>
  </div>

<script>    
    $(document).on('show.bs.modal', '.modal', function () {
        var zIndex = 1040 + (10 * $('.modal:visible').length);
        $(this).css('z-index', zIndex);
        setTimeout(function() {
            $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
        }, 0);
    });

    $("#btn_print_report2").on('click',function(e){
        $('#divprint2').printThis({
            loadCSS : "<?php echo base_url('assets/css/table_print2.css')?>",
        });
    });
    
    $("#btn-close-visit").on('click',function(e){
        $('#myModalVisit').modal('hide');
    });

    $(".btn_detil_visit").on('click',function(e){
        var cb_agen = $(this).attr('lang');
        var date_start = "<?php echo $input_date_start; ?>";
        var date_end = "<?php echo $input_date_end; ?>";
        // Optional: show loading state
        $('#myModalVisit .modal-body').html('<p class="text-muted">Loading...</p>');
        
        // Show modal first (so user sees loading)
        let modal = new bootstrap.Modal(document.getElementById('myModalVisit'));
        modal.show();

        // Send AJAX POST
        $.ajax({
            url: '<?php echo site_url('laporan/laporan/penjualan_detil_ajax'); ?>',
            type: 'POST',
            data: { id: cb_agen, date_start: date_start, date_end: date_end },
            success: function(response) {
                $('#myModalVisit .modal-body').html(response);
            },
            error: function() {
                $('#myModalVisit .modal-body').html('<p class="text-danger">Error loading data.</p>');
            }
        });
    });
</script>


