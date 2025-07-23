<?php //if (count($form_read_arr)>0||count($form_many_read_arr)>0): ?>
<!-- <div class="note note-warning">
    <h4 class="block">Data Info! </h4>
</div> -->
<?php //endif ?>
<div class="">
  <div class="nav-wrapper">
    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
      <?php $tab_index = 0; ?>

      <!---------------------------------->
      <!----------- read form ------------>
      <!---------------------------------->
      <!-- normal form -->
      <?php //$tab_index = 0; ?>
      <?php foreach ($form_read_arr as $form_id): ?>
        <?php if (!empty($form_id)): ?>
          <?php 
            $form = $this->M_form->get($form_id);
          ?> 
          <li class="nav-item">
              <a href="#tab_read_<?php echo $tab_index ?>" data-toggle="tab" class="nav-link mb-sm-3 mb-md-0  <?php echo ($tab_index==0) ? 'active' :'' ?>"> <?php echo $form->form_name ?> </a>
          </li>
        <?php $tab_index++ ?>
        <?php endif ?>
      <?php endforeach ?>
      <!-- many form -->
      <?php foreach ($form_many_read_arr as $form_id): ?>
        <?php if (!empty($form_id)): ?>
          <?php 
            $form = $this->M_form->get($form_id);
          ?> 
          <li class="nav-item">
              <a href="#tab_read_<?php echo $tab_index ?>" data-toggle="tab" class="nav-link mb-sm-3 mb-md-0  <?php echo ($tab_index==0) ? 'active' :'' ?>"> <?php echo $form->form_name ?> </a>
          </li>
        <?php $tab_index++ ?>
        <?php endif ?>
      <?php endforeach ?>

      <!---------------------------------->
      <!---------- input form ------------>
      <!---------------------------------->

      <!-- normal form -->
      <?php foreach ($form_write_arr as $form_id): ?>
        <?php if (!empty($form_id)): ?>
          <?php 
            $form = $this->M_form->get($form_id);
          ?> 
          <li class="nav-item">
              <a href="#tab_read_<?php echo $tab_index ?>" data-toggle="tab" class="nav-link mb-sm-3 mb-md-0  <?php echo ($tab_index==0) ? 'active' :'' ?>"> <?php echo $form->form_name ?> </a>
          </li>
        <?php $tab_index++ ?>
        <?php endif ?>
      <?php endforeach ?>
      <!-- many form -->
      <?php foreach ($form_many_write_arr as $form_id): ?>
        <?php if (!empty($form_id)): ?>
          <?php 
            $form = $this->M_form->get($form_id);
          ?> 
          <li class="nav-item">
              <a href="#tab_read_<?php echo $tab_index ?>" data-toggle="tab" class="nav-link mb-sm-3 mb-md-0  <?php echo ($tab_index==0) ? 'active' :'' ?>"> <?php echo $form->form_name ?> </a>
          </li>
        <?php $tab_index++ ?>
        <?php endif ?>
      <?php endforeach ?>

    </ul>
  </div>
  <!-- <div class="card shadow"> -->
    <!-- <div class="card-body"> -->
      <div class="tab-content">
        <?php $tab_index = 0; ?>

        <!---------------------------------->
        <!----------- read form ------------>
        <!---------------------------------->

        <?php foreach ($form_read_arr as $form_id): ?>
          <?php if (!empty($form_id)): ?>
          <?php 
            $form = $this->M_form->get($form_id);
            $form_param = $this->Formx_model->get_param($form_id );
            $row = $this->Formx_model->get_row_by_flow_id($form_id,$t_flow_id);
            if ($row) {
                $row       = $row;
                $id        = $row->id;
            } else {
                $row       = null;
                $id        = '';
            }
            $data['form_many'] = $this->M_form->get_child_form($form_id);
            
            $data['row'] = $row;
            $data['id'] = $id;
            $data['form_id'] = $form_id;
            $data['form'] = $form;
            $data['form_param'] = $form_param;
            $data['flow_id'] = $flow_id;
            $data['t_flow_id'] = $t_flow_id;
            $data['authorize'] = "readonly";
          ?>  
          <div class="tab-pane fade <?php echo ($tab_index==0) ? 'show active' :'' ?>" id="tab_read_<?php echo $tab_index++ ?>">
              <?php $this->load->view('v_form',$data); ?>
          </div>
          <?php endif ?>
        <?php endforeach ?>
        <?php foreach ($form_many_read_arr as $form_id): ?>
          <?php if (!empty($form_id)): ?>  
            <div class="tab-pane fade <?php echo ($tab_index==0) ? 'show active' :'' ?>" id="tab_read_<?php echo $tab_index++ ?>">
              <div id="form_table_<?php echo $form_id?>"></div>
              <script>
                $('#form_table_<?php echo $form_id?>').load('<?php echo site_url("formx/formx/table/".$form_id) ?>',
                  {
                    parent_id: "<?php echo $t_flow_id ?>",
                    parent_column: "t_flow_id",
                    flow_id: "<?php echo $flow_id ?>",
                    view_only:"true",
                    authorize:"readonly",
                  } ,
                  function(){
                  /* Stuff to do after the page is loaded */
                });
                
              </script>
            </div>
          <?php endif ?>
        <?php endforeach ?>
        
        <!---------------------------------->
        <!---------- input form ------------>
        <!---------------------------------->

        <?php foreach ($form_write_arr as $form_id): ?>
          <?php if (!empty($form_id)): ?>
          <?php 
            $form = $this->M_form->get($form_id);
            $form_param = $this->Formx_model->get_param($form_id );
            $row = $this->Formx_model->get_row_by_flow_id($form_id,$t_flow_id);
            if ($row) {
                $row       = $row;
                $id        = $row->id;
            } else {
                $row       = null;
                $id        = '';
            }
            $data['form_many'] = $this->M_form->get_child_form($form_id);
            
            $data['row'] = $row;
            $data['id'] = $id;
            $data['form_id'] = $form_id;
            $data['form'] = $form;
            $data['form_param'] = $form_param;
            $data['flow_id'] = $flow_id;
            $data['t_flow_id'] = $t_flow_id;
            $data['authorize'] = "write";
          ?>  
          <div class="tab-pane fade <?php echo ($tab_index==0) ? 'show active' :'' ?>" id="tab_read_<?php echo $tab_index++ ?>">
              <?php $this->load->view('v_form',$data); ?>
          </div>
          <?php endif ?>
        <?php endforeach ?>
        <?php foreach ($form_many_write_arr as $form_id): ?>
          <?php if (!empty($form_id)): ?>  
            <div class="tab-pane fade <?php echo ($tab_index==0) ? 'show active' :'' ?>" id="tab_read_<?php echo $tab_index++ ?>">
              <div id="form_table_<?php echo $form_id?>"></div>
              <script>
                $('#form_table_<?php echo $form_id?>').load('<?php echo site_url("formx/formx/table/".$form_id) ?>',
                  {
                    parent_id: "<?php echo $t_flow_id ?>",
                    parent_column: "t_flow_id",
                    flow_id: "<?php echo $flow_id ?>",
                    view_only:"true",
                    authorize:"write",
                  } ,
                  function(){
                  /* Stuff to do after the page is loaded */
                });
                
              </script>
            </div>
          <?php endif ?>
        <?php endforeach ?>

        
      </div>
    <!-- </div> -->
  <!-- </div> -->
</div>