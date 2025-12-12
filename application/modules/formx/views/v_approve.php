<div class="row">
    <div class="col-md-12">
        <div class="portlet light">
            <div class="portlet-title">
                <div class='caption font-green'>
                    <span class='caption-subject bold uppercase'>Approve </span>
                  </div>
            </div>
            <div class='portlet-body'>
                <form action="<?php echo site_url('formx/flow/update_level') ?>" method="post" id="form_approve">
                    <input type="hidden" name="t_flow_id" value="<?php echo $t_flow_id ?>" class="t_flow_id">
                    <input type="hidden" name="flow_id" value="<?php echo $flow_id ?>">
                    <input type="hidden" name="action" id="modal_action" value="">
                    <div class="form-group">
                        <label for="">Approve</label>
                        <select name="action" class="form-control">
                            <?php if ($max_min->max > $level_no): ?>
                            <option value="ekposisi">Approve</option>
                            <?php endif ?>
                            <?php if ($max_min->min < $level_no): ?>
                            <option value="disposisi">Reject</option>
                            <?php endif ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Catatan</label>
                        <textarea class="form-control" rows="10" class="form-control" name="catatan"></textarea>
                    </div>
                    <div class="form-group" id='field_to_user'>
                      <?php if ($flow_level_next->to_user): ?>
                        <label>User</label>
                        <select name='to_user' class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/user') ?>'>
                        </select>
                      <?php endif ?>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>

                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $('#form_approve').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
    });
</script>
