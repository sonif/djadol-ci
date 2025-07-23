
      <div class='card shadow'>
        <div class='card-header'>
            <h3 class='uppercase'>Change password </h3>
          </div>
        </div>
        <div class='card-body form'>
          <form action="<?php echo $action; ?>" method="post" id="input_form" class="" role="form" >
            <div class='form-body'>
              <div class='form-group'>
                <label class='control-label'>Old password</label>
                <input type="password" class="form-control" name="old_password" placeholder="Old password"  />
              </div>
              <div class="form-group">
                  <label>New password</label>
                  <input type="password" class="form-control" name="password" placeholder="New password"  />
              </div>
              <div class="form-group">
                  <label>Confirm password</label>
                  <input type="password" class="form-control" name="rpassword" placeholder="Confirm password"  />
              </div>
            </div>
            <div class='form-actions right1'>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
                <button type='submit' class='btn btn-primary' name='mode' value='new' >Simpan</button>
            </div>
          </form>
        </div><!-- /.box-body -->
      </div><!-- /.box -->


<script type="text/javascript">
  $('#input_form').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
  });
</script>
