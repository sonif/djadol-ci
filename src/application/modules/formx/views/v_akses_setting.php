<form action="<?php echo site_url('formx/akses/save/'.$menu_id) ?>" method="post" id="input_form" class="horizontal-form">
  <div class="card">
    <div class="table-responsive">
      <div class="card-header">
        <div class="row">
          <div class="col-md-6"><h3>Akses menu : <?php echo($menu->menu_nama) ?> </h3></div>
          <div class="col-md-6 text-right"><button type='submit' class='btn btn-primary' name='mode' value='save' >Simpan</button></div>
        </div>
        
        
      </div>

      <table class="table">
        <thead class="thead-light">
          <tr>
            <td>Usergroup</td>
            <td><input type="checkbox" id="check_all_read"> Read</td>
            <td><input type="checkbox" id="check_all_create"> Create</td>
            <td><input type="checkbox" id="check_all_update"> Update</td>
            <td><input type="checkbox" id="check_all_delete"> Delete</td>
          </tr>
        </thead>

        <tbody>
          <?php $akses_val = convert_arr_primary_key($akses->result(),'usergroup_id'); ?>
          <?php foreach ($usergroup->result() as $r_usergroup): ?>
            <?php 
              $row =  $akses_val[$r_usergroup->id] ?? null ; 
              if($row){
                $xvalue = json_decode($row->akses_code,true) ?? [];
              }else{
                $xvalue = [];
              }
            ?>
            <tr>
              <td><?php echo $r_usergroup->name ?></td>
              <td><input type="checkbox" name="ck_<?php echo $r_usergroup->id ?>[]" class="xread" value="xread" <?php echo (in_array("xread", $xvalue)) ? 'checked=""' : '' ?> ></td>
              <td><input type="checkbox" name="ck_<?php echo $r_usergroup->id ?>[]" class="xcreate" value="xcreate" <?php echo (in_array("xcreate", $xvalue)) ? 'checked=""' : '' ?> ></td>
              <td><input type="checkbox" name="ck_<?php echo $r_usergroup->id ?>[]" class="xupdate" value="xupdate" <?php echo (in_array("xupdate", $xvalue)) ? 'checked=""' : '' ?> ></td>
              <td><input type="checkbox" name="ck_<?php echo $r_usergroup->id ?>[]" class="xdelete" value="xdelete" <?php echo (in_array("xdelete", $xvalue)) ? 'checked=""' : '' ?> ></td>
            </tr>
          <?php endforeach ?>
        </tbody>
      </table>
    </div>
  </div>
</form>

<script>
  $('#check_all_read').change(function(event) {
		$('.xread').not(this).prop('checked', this.checked);
	});
	$('#check_all_create').change(function(event) {
        $('.xcreate').not(this).prop('checked', this.checked);
    });
    $('#check_all_update').change(function(event) {
        $('.xupdate').not(this).prop('checked', this.checked);
    });
    $('#check_all_delete').change(function(event) {
		$('.xdelete').not(this).prop('checked', this.checked);
  })
  
  $('#input_form').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
  	});
</script>