<style>
  .card-note{
            font-size: 0.8em;
            
    }
</style>
<div class="card">
  <div class='card-header'>
    <div class="row align-item-center">
      <div class="col-md-8">
        <h5 class="h3 mb-0 text-uppercase">Cetak</h5>
      </div>
      <div class="col-md-4 text-right">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </div>
  </div>
  <div class="card-body">
  <h5 class="card-title">Jika ada denda input disini : </h5>
    <div class="form-group col-md-4">
      <input class='form-control input-int-separator' name='transaksi_pinalty' id='transaksi_pinalty' value='<?php echo @$record->transaksi_pinalty??0; ?>'/>
    </div>
    <h5 class="card-title">Yakin akan dilunasi dan dicetak ? <button class='btn btn-sm btn-primary' name='mode' value='print' onclick='doprint()'><i class="fa fa-print" aria-hidden="true"></i></button></h5>
    <hr/>
    <div id="divprint">
      <div style="width: 400px;">
        <div>
          <p>
            <center>
              <b>HIPPAM "Tirto Barokah"</b><br/>
              Desa Waleran<br/>
              Kec. Grabagan Kab. Tuban
            </center>
          </p>
              <hr/>
          <h5 class="card-title">Bukti Pembayaran Tagihan (<?php echo $bulan[@$record->transaksi_month_issue]; ?> - <?php echo @$record->transaksi_year_issue; ?>)</h5>                   
          <p class=" card-note">  
            <?php
                $username=(empty($record->username)) ? $user->username : @$record->username;
                $total = @$record->transaksi_total;
            ?>              
            <table class="text-justify card-note">
                <tr><td>No. Rekening</td><td>:</td><td><?php echo @$record->customer_code;?></td></tr>
                <tr><td>Nama</td><td>:</td><td><?php echo @$record->customer_fullname;?></td></tr>
                <tr><td>Alamat</td><td>:</td><td><?php echo @$record->customer_address." ".@$record->dusun_name." RT.".@$record->customer_rt."/RW.".@$record->customer_rw;?></td></tr>
                <tr><td>Stand</td><td>:</td><td><?php echo @$record->transaksi_count_before."-".@$record->transaksi_count_now; ?></td></tr>
                <tr><td>Pemakaian</td><td>:</td><td><?php echo @$record->transaksi_selisih; ?></td></tr>
                <tr><td>Tagihan</td><td>:</td><td><?php echo "Rp. ".number_format(@$record->transaksi_subtotal,2,',','.'); ?></td></tr>
                <tr><td>Denda</td><td>:</td><td><span id="span_pinalty"><?php echo @$record->transaksi_pinalty; ?></span></td></tr>
                <tr><td>Administrasi</td><td>:</td><td><?php echo @$record->transaksi_admin_price; ?></td></tr>
                <tr><td>Total Tagihan</td><td>:</td><td><span id="span_total"><?php echo "Rp. ".number_format($total,2,',','.'); ?></span></td></tr>
            </table><br/>
            <center>              
              <b class="card-note">User : <span id="span_username"><?php echo $username; ?></span>, Tanggal cetak : <?php echo $record->transaksi_printed_date; ?></b><br/>
              <b>Bukti Pembayaran ini sah apabila distempel lunas</b>
            </center>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>


<script>
  function doprint() 
  {
    $.ajax({
        url: '<?php echo site_url('transaksi/transaksi/cetak_nota/'.$record->transaksi_id);?>',
        type: 'post',
        data: {
              "record_id" : <?php echo $record->transaksi_id;?>,
              "transaksi_pinalty" : $("#transaksi_pinalty").val()
              },
        // headers: {
        //     token : '<?php echo $this->session->userdata('SESSION_TOKEN'); ?>',   //If your header name has spaces or any other char not appropriate
        // },
        dataType: 'json',
        success: function (data) {
            if(data.success === 1){              
              $("#span_username").val("<?php echo $username;?>");
              $('#divprint').printThis({
                // importCSS: true,   
              });
              $('#datatable_27').DataTable().ajax.reload();
            }else{
                alert_custom(data.msg,"modal-info");
            }
        }
    });    
  }

  function replaceAll(string, search, replace) {
    return string.split(search).join(replace);
  }

  /* Fungsi formatRupiah */
  function formatRupiah(angka, prefix){
			var number_string = angka.replace(/[^,\d]/g, '').toString(),
			split   		= number_string.split(','),
			sisa     		= split[0].length % 3,
			rupiah     		= split[0].substr(0, sisa),
			ribuan     		= split[0].substr(sisa).match(/\d{3}/gi);
 
			// tambahkan titik jika yang di input sudah menjadi angka ribuan
			if(ribuan){
				separator = sisa ? '.' : '';
				rupiah += separator + ribuan.join('.');
			}
 
			rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
			return prefix == undefined ? rupiah : (rupiah ? 'Rp. ' + rupiah : '');
	}

  $("#transaksi_pinalty").on('keyup',function(e){
      $("#span_pinalty").html($(this).val());

      var pinalty = replaceAll($(this).val(),".","");
      var tagihan = Number(pinalty) + Number(<?php echo $record->transaksi_total;?>);

      $("#span_total").html(formatRupiah(tagihan+'','Rp. '));
  }); 
</script>