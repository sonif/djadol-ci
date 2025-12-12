<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Adi Dwi IF">
    <title>Aplikasi Hippam</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>plugins/bootstrap-4.3.1-dist/css/bootstrap.min.css">
    
    <style type="text/css">
        body {
          align-items: center;
          padding: 10px;
          background-color: #f5f5f5;
        }
        .card-body{
            padding: 5px;
        }
        .card-note{
            font-size: 0.8em;
            
        }
    </style>
  </head>

  <body class="text-center">    
    <div class="container-fluid">
      <div class="row">          
        <div class="col-md-4">
            <div class="card" >
              <center>
              <img src="<?php echo base_url(); ?>assets/img/brand/logo.jpeg" width="20%">
              </center>
              <div class="card-body">
                <p class="card-text">
                    <b>HIPPAM "Tirto Barokah"</b><br/>
                    Desa Waleran<br/>
                    Kec. Grabagan Kab. Tuban
                </p>
                    <hr/>
                <h5 class="card-title">Bukti Pembayaran Tagihan</h5>                   
                <p class="text-justify" >
                  
                  <table class="text-justify">
                      <tr><td>No. Rekening</td><td>:</td><td><?php echo $record->customer_code;?></td></tr>
                      <tr><td>Nama</td><td>:</td><td><?php echo $record->customer_fullname;?></td></tr>
                      <tr><td>Alamat</td><td>:</td><td><?php echo $record->customer_address." ".$record->dusun_name." RT.".$record->customer_rt."/RW.".$record->customer_rw;?></td></tr>
                      <tr><td>Stand</td><td>:</td><td><?php echo $record->transaksi_count_before."-".$record->transaksi_count_now; ?></td></tr>
                      <tr><td>Pemakaian</td><td>:</td><td><?php echo $record->transaksi_selisih; ?></td></tr>
                      <tr><td>Tagihan</td><td>:</td><td><?php echo "Rp. ".number_format($record->transaksi_total,2,',','.'); ?></td></tr>
                      <tr><td>Denda</td><td>:</td><td><?php echo $record->transaksi_pinalty; ?></td></tr>
                      <tr><td>Tunggakan</td><td>:</td><td></td></tr>
                      <tr><td>Administrasi</td><td>:</td><td></td></tr>
                      <tr><td>Total Tagihan</td><td>:</td><td></td></tr>
                  </table>
                    <b>Tanggal cetak : <?php echo $record->transaksi_printed_date; ?></b><br/>
                    <hr/>
                </p>
                <p><b>Bukti Pembayaran ini sah apabila distempel lunas</b></p>
              </div>
            </div><!--End Card-->  
        </div> 
          
      </div>   <!-- End Row -->   
     
    </div><!--End Container-->

    <!-- jQuery 3 -->
    <script src="<?php echo base_url(); ?>plugins/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<?php echo base_url(); ?>plugins/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
        
    <script>
      function alert_custom(str,type){
        var mymodal = $('#'+type);
        mymodal.find('.modal-body').html(str);
        mymodal.modal('show');
      }

      $(function () {
        
      });
    </script>

    

  </body>
</html>