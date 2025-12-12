<!-- <div class="page-content-wrapper"> -->
    <!-- BEGIN CONTENT BODY -->
    <!-- <div class="page-content"> -->
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE BAR -->

        <!-- END PAGE BAR -->
        <!-- END PAGE HEADER-->
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN EXAMPLE TABLE PORTLET-->

                <!-- Main content -->
                <section class='content'>
                  <div class='row'>
                    <div class='col-md-12'>
                      <div class='portlet light'>
                          <div class='portlet-title'>
                            <div class='caption font-green'>
                              <span class='caption-subject bold uppercase'><?php echo $form->form_name ?> </span>
                            </div>
                          </div>
                          <div class='portlet-body form'>
                            <div class="form">
                              <form action="<?php echo $action; ?>" method="post" id="input_form_<?php echo $form_id; ?>" class="horizontal-form <?php echo $authorize ?>" >
                                  <div class='form-body'>
                                    <div class='row'>
                                      <div class='col-md-12'>
                                        <div class='form-group'>
                                          <label class='control-label'>Notes
                                          </label>
                                            <textarea class="form-control" name="approval_note" id="approval_note" cols="30" rows="8"><?php echo (isset($row)) ? $row->approval_note : ''; ?></textarea>

                                        </div>
                                      </div>

                                    </div>
                                    <input type="hidden" name="id" value="<?php echo $id; ?>" />
                                    <input type="hidden" name="form_id" value="<?php echo $form_id; ?>" />

                                  </div>
                                  <div class='form-actions'>
                                        <!-- <a href="<?php echo site_url('formx/formx/table/'.$form_id) ?>" class="btn default">Kembali</a> -->
                                        <button type='submit' class='btn green' name='mode' value='new' >Approve</button>

                                  </div>
                              </form>
                            </div>
                          </div>
                        </div><!-- /.box -->
                        <script type="text/javascript">
                          $('#input_form_<?php echo $form_id; ?>').submit(function(e) {
                                e.preventDefault();
                                e.stopImmediatePropagation();
                                main.submitAjaxModal($(this));
                                return false;
                          });
                        </script>
                    </div><!-- /.col -->
                  </div><!-- /.row -->
                </section><!-- /.content -->

            </div>
        </div>
    <!-- </div> -->
    <!-- END CONTENT BODY -->
<!-- </div> -->
