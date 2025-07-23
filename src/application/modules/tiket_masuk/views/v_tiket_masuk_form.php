
<!-- Main content -->
      <div class='card shadow'>
        <div class='card-header'>
          <div class="col-7">
              <h5 class="h3 mb-0 text-uppercase">TIKET_MASUK  </h5>
          </div>
        </div>
        <div class='card-body  form'>
          <form action="<?php echo $action; ?>" method="post" id="input_form_c_tiket_masuk" class="horizontal-form <?php echo $authorize ?>"  >
            <div class='form-body'>
              <div class='row'>
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>jumlah pengunjung</label>
                    <div class=''>
                      <input type="text" class="form-control <?php echo 'data-'.$authorize ?> numeric" name="jumlah_pengunjung" id="jumlah_pengunjung" placeholder="jumlah pengunjung" value="<?php echo (isset($row->jumlah_pengunjung)) ? $row->jumlah_pengunjung : ''; ?>" />
                    </div>
                  </div>
                </div>
                
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>plat no</label>
                    <div class=''>
                      <input type="text" class="form-control <?php echo 'data-'.$authorize ?>" name="plat_no" id="plat_no" placeholder="plat no" value="<?php echo (isset($row)) ? $row->plat_no : ''; ?>" />
                    </div>
                  </div>
                </div>
                
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>jenis kendaraan</label>
                    <div class=''>
                      <input type="text" class="form-control <?php echo 'data-'.$authorize ?>" name="jenis_kendaraan" id="jenis_kendaraan" placeholder="jenis kendaraan" value="<?php echo (isset($row)) ? $row->jenis_kendaraan : ''; ?>" />
                    </div>
                  </div>
                </div>
                
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>nilai cash pembayaran</label>
                    <div class=''>
                      <input type="text" class="form-control <?php echo 'data-'.$authorize ?> numeric" name="nilai_cash_pembayaran" id="nilai_cash_pembayaran" placeholder="nilai cash pembayaran" value="<?php echo (isset($row->nilai_cash_pembayaran)) ? $row->nilai_cash_pembayaran : ''; ?>" />
                    </div>
                  </div>
                </div>
                
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>nilai tagihan</label>
                    <div class=''>
                      <input type="text" class="form-control <?php echo 'data-'.$authorize ?> numeric" name="nilai_tagihan" id="nilai_tagihan" placeholder="nilai tagihan" value="<?php echo (isset($row->nilai_tagihan)) ? $row->nilai_tagihan : ''; ?>" />
                    </div>
                  </div>
                </div>
                
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>nilai cash kembalian</label>
                    <div class=''>
                      <input type="text" class="form-control <?php echo 'data-'.$authorize ?> numeric" name="nilai_cash_kembalian" id="nilai_cash_kembalian" placeholder="nilai cash kembalian" value="<?php echo (isset($row->nilai_cash_kembalian)) ? $row->nilai_cash_kembalian : ''; ?>" />
                    </div>
                  </div>
                </div>
                
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>payment method</label>
                    <div class=''>
                      <input type="text" class="form-control <?php echo 'data-'.$authorize ?>" name="payment_method" id="payment_method" placeholder="payment method" value="<?php echo (isset($row)) ? $row->payment_method : ''; ?>" />
                    </div>
                  </div>
                </div>
                
                <div class='col-md-12'>
                  <div class='form-group'>
                    <label class='control-label'>waktu</label>
                    <div class=''>
                      <div class='input-group date date-decade' >
                        <span class='input-group-btn'>
                          <button class='btn default' type='button'>
                            <i class='fa fa-calendar'></i>
                          </button>
                        </span>
                        <input type='text' class='form-control <?php echo 'data-'.$authorize ?> ' readonly name="createdAt" value="<?php echo (isset($row)) ? $row->createdAt : ''; ?>">
                      </div>
                    </div>
                  </div>
                </div>
                
                <input type="hidden" name="id" value="<?php echo $id; ?>" />
              </div>
            </div>
            <div class='form-actions float-right'>
              <div class='row'>
                <div class=''>
                  <?php if (!$modal): ?>
                  <a href="<?php echo site_url('tiket_masuk/c_tiket_masuk') ?>" class="btn default">Kembali</a>
                  <?php else: ?>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                  <?php endif ?>
                  <?php if ($authorize == 'edit'): ?>
                  <button type='submit' class='btn btn-primary' >Simpan</button>
                  <?php endif ?>
                </div>
              </div>
            </div>
              
          </form>
        </div><!-- /.box-body -->
      </div><!-- /.box -->

<script type="text/javascript">
  $('#input_form_c_tiket_masuk').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
  });
</script>

