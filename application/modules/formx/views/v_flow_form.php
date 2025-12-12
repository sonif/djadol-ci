<span id="flow_info" data-levelno="<?php echo($level_no) ?>"></span>
<span id="user_info" data-userid="<?php echo($user->id) ?>" data-employeeid="<?php echo($user->employee_id) ?>"></span>
<div class="row">
    <div class="col">

      <div class='card shadow'>
        <div class='card-header'>
          <div class='row align-items-center'>
            <div class="col-7">
              <a href="<?php echo site_url('formx/flow/table/'.$flow_id) ?>" class="btn"><i class="fa fa-arrow-left"></i> </a>
              <span class='h2 text-uppercase'><?php echo $flow->name ?> </span>
            </div>
            <div class="col-5 text-right">
              <?php if ($authorize == 'write'): ?>
              <div class="actions">
                <?php if ($max_min->min < $level_no): ?>
                <div class="btn-group" >
                  <a class="btn btn-danger btn_do" data-toggle="modal" data-action="disposisi" href='#modal-flow-catatan'>← Return</a>
                </div>
                <?php endif ?>
                <?php if ($max_min->max > $level_no): ?>
                <div class="btn-group" id="next_btn" <?php echo (empty($t_flow_id)) ? 'style="display:none"' : "" ; ?> >
                  <a class="btn btn-success btn_do" data-toggle="modal" data-action="ekposisi" href='#modal-flow-catatan'>Next →</a>
                </div>
                <?php endif ?>
              </div>
              <?php endif ?>
            </div>
          </div>


        </div>
        <div class='card-body'>
          <?php $this->load->view('v_flow_tab_read'); ?>

        </div> 
      </div>
            
    </div>
</div>

<div class="modal fade" id="modal-flow-catatan">
  <div class="modal-dialog">
    <form action="<?php echo site_url('formx/flow/update_level') ?>" method="post" id="form-catatan">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Submit</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
      <div class="modal-body">
        <input type="hidden" name="t_flow_id" value="<?php echo $t_flow_id ?>" class="t_flow_id">
        <input type="hidden" name="flow_id" value="<?php echo $flow_id ?>">
        <input type="hidden" name="action" id="modal_action" value="">
        <?php if($level_no > 1): ?>
        <div class="form-group">
            <label>Catatan</label>
            <textarea class="form-control" rows="10" class="form-control" name="catatan"></textarea>
        </div>
        <?php else: ?>
        <h1><?php echo $flow->name ?></h1>
        <?php endif ?>

        <!-- <div class="form-group" id='field_to_user'> -->
          <?php //if ($flow_level_next->to_user): ?>
            <!-- <label>User</label>
            <select name='to_user' class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/user') ?>'>
            </select> -->
          <?php //endif ?>
        <!-- </div> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
    </form>
  </div>
</div>
<script type="text/javascript">
  $('.input_form').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
        // var options = {'f_response':'update_t_flow_id'};
        // main.submitAjaxModal($(this),options);
  });
  $('#form-catatan').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
  });
  $('.btn_do').click(function(event) {
    if ($(this).data('action') == "ekposisi") {
      $('#field_to_user').show();
    }else{
      $('#field_to_user').hide();
    }
    $('#modal_action').val($(this).data('action'));
  });

  function update_t_flow_id(response,formObj) {
    if (response.t_flow_id) {
      $('.t_flow_id').val(response.t_flow_id);
      $("input[name='id']", formObj).val(response.id);
      $('#next_btn').show();
    }
  }
</script>
