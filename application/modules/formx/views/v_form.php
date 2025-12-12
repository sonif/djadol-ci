<?php
  $tag_form_upload = '';
  foreach ($form_param->result() as $p) {
    if($p->type == 'img' || $p->type == 'file'){
      $tag_form_upload = 'enctype="multipart/form-data"';
      break;
    }
  }
?>
<div class='card shadow' id='print_<?php echo $form->id ?>'>
  <div class='card-header'>
    <div class="row align-item-center">
      <div class="col-md-8">
        <h5 class="h3 mb-0 text-uppercase"><?php echo $form->form_name ?></h5>
      </div>
      <div class="col-md-4 text-right">
        <!-- <button class='btn btn-sm btn-primary' name='mode' value='print' onclick='doprint<?php echo $form->id ?>()'><i class="fa fa-print" aria-hidden="true"></i></button> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </div>
  </div>
  <div class='card-body form'>
    <div class="form">
      <form action="<?php echo $action; ?>" method="post" id="input_form_<?php echo $form_id; ?>" class="horizontal-form <?php echo $authorize ?>" <?php echo $tag_form_upload ?> autocomplete="off">
          <div class='form-body'>
            <div class='row'>
              <?php foreach ($form_param->result() as $p): ?>
              <?php
                $col_md_param = 'col-md-6';
                if (!empty($p->col_md)) {
                  $col_md_param = $p->col_md;
                }
                $readonly ='';
                if ($p->readonly) {
                  $readonly = 'readonly';
                }
                $default_value='';
                if (!empty($p->default_value)) {
                  $default_value=$p->default_value;
                }
              ?>
              <div class='<?php echo $col_md_param ?>'>
                <div class='form-group'>
                  <label class='form-control-label'><?php
                      if (!empty($p->label_name)) {
                          echo $p->label_name;
                      }else{
                          echo $p->column_name;
                      } ?>
                  </label>

                    <?php if ($p->type == 'date'):
                      if ($p->default_value=='now')
                        $default_value = date("Y-m-d");

                      ?>
                      <input type="text" class="form-control date-picker" name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>"  value="<?php echo (isset($row)) ? $row->{$p->column_name} : $default_value; ?>" placeholder="yyyy-mm-dd"/>

                    <?php elseif ($p->type == 'textarea'): ?>
                      <textarea class="form-control" name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>" cols="30" rows="5"><?php echo (isset($row)) ? $row->{$p->column_name} : $default_value; ?></textarea>

                    <?php elseif ($p->type == 'select_ajax'||$p->type == 'selfemployee'): ?>
                      <?php
                      $uom_id = (isset($row)) ? $row->{$p->column_name} : $default_value;
                      
                      if($p->type == 'selfemployee'){
                        if(empty($uom_id)) $uom_id = $user->employee_id;
                        $readonly =true;
                      }

                      if (!empty($uom_id)) {
                        $uom_id_name = $this->Formx_model->get_value_dd($p->table_ref,$uom_id,$row);
                      }else{
                        $uom_id_name = '';
                      }
                      ?>
                      <!-- <div class="input-group"> -->
                      <?php if ($readonly != 'readonly'): ?>
                        <select name='<?php echo $p->column_name ?>' class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/'.$p->table_ref) ?>'>
                          <option value="<?php echo $uom_id; ?>" selected="selected"><?php echo $uom_id_name; ?></option>
                        </select>
                        <?php if (!empty($p->new_form_id)): ?>
                        <span class="input-group-btn">
                          <button type="button" class="btn blue openmodal" data-url="<?php echo site_url('formx/formx/form/'.$p->new_form_id) ?>" data-id="div_modal_form_<?php echo $p->new_form_id?>"><i class="fa fa-plus"></i></button>
                        </span>
                        <!-- <script>
                          var $newOption = $("<option></option>").val("TheID").text("The text");
                          $("#param_id").html($newOption).trigger('change');
                        </script> -->
                        <?php endif ?>
                      <?php else: ?>
                        <select name='<?php echo $p->column_name ?>' class='form-control' readonly>
                          <option value="<?php echo $uom_id; ?>" selected="selected"><?php echo $uom_id_name; ?></option>
                        </select>
                      <?php endif ?>
                      <!-- </div> -->
                    <?php elseif ($p->type == 'select'): ?>
                      <?php
                        if(!$options = json_decode($p->table_ref,true)){
                          $options = $this->Formx_model->get_array_dd($p->table_ref);
                        }
                        $data_attribut = array(
                                'class'       => 'form-control select2me',
                                'data-allow-clear' => 'true',
                        );
                        $options[""]="";
                        $dd_value = (isset($row)) ? $row->{$p->column_name} : $default_value;
                        // echo form_dropdown($p->column_name, $options, $dd_value,$data_attribut);
                       ?>
                       <?php if ($readonly != 'readonly'): ?>
                       <select name='<?php echo $p->column_name ?>' class='form-control'>
                        <?php foreach ($options as $key=>$value ): ?>
                          <?php 
                            $selected='';
                            if($key == $dd_value){
                              $selected = 'selected="selected"';
                            }
                          ?>
                          <option value="<?php echo $key; ?>" <?php echo $selected ?>><?php echo $value; ?></option>
                        <?php endforeach ?>
                      </select>
                      <?php else: ?>
                        <select name='<?php echo $p->column_name ?>' class='form-control' readonly>
                        <?php foreach ($options as $key=>$value ): ?>
                          <?php 
                            $selected='';
                            if($key == $dd_value){
                              $selected = 'selected="selected"';
                            }
                            else{
                              continue;
                            }
                          ?>
                          <option value="<?php echo $key; ?>" <?php echo $selected ?>><?php echo $value; ?></option>
                        <?php endforeach ?>
                      </select>
                      <?php endif ?>

                    <?php elseif ($p->type == 'radio'): ?>
                      <?php
                        if(!$options = json_decode($p->table_ref,true)){
                          $options = $this->Formx_model->get_array_dd($p->table_ref);
                        }
                        $data_attribut = array(
                                'class'       => 'form-control',
                        );
                        echo '<div class="mt-radio-inline">';
                        foreach ($options as $key => $value) {
                          $checked = (isset($row) && $row->{$p->column_name} == $key ) ? 'checked' : '';
                          echo '
                            <div class="custom-control custom-radio mb-3">
                              <input type="radio" class="custom-control-input" id="'.$p->column_name.$key.'" name="'.$p->column_name.'" value="'.$key.'" '.$checked.' >
                            <label class="custom-control-label" for="'.$p->column_name.$key.'"> '.$value.'</label>
                            </div>';
                        }
                        echo "</div>";
                       ?>
                    <?php elseif ($p->type == 'checkbox'): ?>
                      <div class="mt-checkbox-list">
                        <?php
                          if(!$options = json_decode($p->table_ref,true)){
                            $options = $this->Formx_model->get_array_dd($p->table_ref);
                          }
                          $dd_value = (isset($row)) ? json_decode($row->{$p->column_name}) : [];
                          if($dd_value == NULL)$dd_value = [];
                        ?>
                        <ul>
                        <?php foreach ($options as $key => $value): ?>
                          <li>
                            <label class="mt-checkbox mt-checkbox-outline"> 
                                <input value="<?php echo $key ?>" name="<?php echo $p->column_name ?>[]" type="checkbox" <?php echo (in_array($key, $dd_value)) ? "checked" : "" ; ?>>
                                <span> <?php echo $value ?> </span>
                            </label>
                          </li>
                        <?php endforeach ?>
                        </ul>
                      </div>
                    <?php elseif ($p->type == 'upload'): ?>
                      <?php
                      if (empty($id)&&empty($id_temp)) {
                        $id_temp =uniqid();
                        echo form_hidden('id_temp', $id_temp);
                      }
                      ?>

                      <?php
                      if (!empty($id)) {
                        $dt = 'formx/'.$id.'/'.$p->id;
                      }else{
                        $dt = 'temp/formx/'.$id_temp.'/'.$p->id;
                      }
                      $this->load->view('dropzone/v_dropzone_init', array('dt' => $dt,'dz_readonly'=>$authorize), FALSE);
                      ?>
                    <?php elseif ($p->type == 'file'): ?>
                      <div>
                          <?php if (isset($row) && !empty($row->{$p->column_name})): ?>
                            <a href="<?php echo base_url($p->path_upload.$row->{$p->column_name}) ?>" class="btn blue"><i class="fa fa-download"></i></a>
                          <?php endif ?>
                          <?php if ($authorize != 'readonly'): ?>
                          <div class="fileinput fileinput-new" data-provides="fileinput">
                              <span class="btn btn-primary btn-file">
                                  <span class="fileinput-new"> Select file </span>
                                  <span class="fileinput-exists"> Change </span>
                                  <input type="file" name="<?php echo $p->column_name; ?>" id="<?php echo $p->column_name; ?>"> </span>
                              <span class="fileinput-filename"> </span> &nbsp;
                              <a href="javascript:;" class="close fileinput-exists" data-dismiss="fileinput"> </a>
                          </div>
                          <?php endif ?>

                      </div>
                    <?php elseif ($p->type == 'img'): ?>
                      <div>
                        <div class="fileinput fileinput-new <?php echo 'data-'.$authorize ?>" data-provides="fileinput">
                            <?php if (isset($row) && !empty($row->{$p->column_name})): ?>
                            <div class="fileinput-new thumbnail" style="max-width: 300px; max-height: 300px;">
                            <?php if(!empty($p->path_upload)){
                                $folder_upload = $p->path_upload;
                            }else{
                                $folder_upload = 'uploads/'.$p->form_id.'_'.$p->column_name.'/';
                            } ?>
                              <a data-fancybox="gallery" href="<?php echo load_image($folder_upload.$row->{$p->column_name}); ?>">
                                <img src="<?php echo load_thumb($folder_upload.$row->{$p->column_name}); ?>" alt="" />
                              </a>
                            </div>
                            <?php endif ?>
                            <?php if ($authorize != 'readonly'): ?>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 300px; max-height: 300px;"> </div>
                            <div>
                                <span class="btn btn-default btn-file">
                                    <span class="fileinput-new"> Select image </span>
                                    <span class="fileinput-exists"> Change </span>
                                    <input type="file" name="<?php echo $p->column_name; ?>" id="<?php echo $p->column_name; ?>" accept="image/*"> </span>
                                <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> Remove </a>
                            </div>
                            <?php endif ?>
                        </div>
                      </div>
                    <?php elseif ($p->type == 'int'): ?>
                      <input type="text" class="form-control input-int" name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>"  value="<?php echo (isset($row)) ? $row->{$p->column_name} : $default_value; ?>" placeholder="integer"/>
                      <span class="help-block"><?php echo $p->info; ?></span>
                    <?php elseif ($p->type =='numeric'): ?>
                      <input type="text" class="form-control input-numeric" name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>"  value="<?php echo (isset($row)) ? $row->{$p->column_name} : $default_value; ?>" placeholder="numeric"/>
                      <span class="help-block"><?php echo $p->info; ?></span>
                    <?php elseif ($p->type =='int_separator'): ?>
                      <input type="text" class="form-control input-int-separator" name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>"  value="<?php echo (isset($row)) ? $row->{$p->column_name} : $default_value; ?>" placeholder="integer"/>
                      <span class="help-block"><?php echo $p->info; ?></span>
                    <?php elseif ($p->type == 'password'): ?>
                      <input type="password" class="form-control" name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>"  value="" placeholder="type to change"/>
                      <span class="help-block"><?php echo $p->info; ?></span>
                    <?php elseif ($p->type == 'ckeditor'): ?>
                      <div name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>" class="editor"><?php echo (isset($row)) ? $row->{$p->column_name} : ''; ?></div>
                      <script>
                        $('#<?php echo $p->column_name ?>').summernote({
                          height: 300,
                          dialogsInBody: true
                        });
                      </script>
                    <?php else: ?>
                      <input type="text" class="form-control" name="<?php echo $p->column_name ?>" id="<?php echo $p->column_name ?>"  value="<?php echo (isset($row)) ? $row->{$p->column_name} : $default_value; ?>" placeholder="text"/>
                      <span class="help-block"><?php echo $p->info; ?></span>
                    <?php endif ?>
                </div>
              </div>
              <?php endforeach ?>

            </div>
            <input type="hidden" name="id" value="<?php echo $id; ?>" />
            <input type="hidden" name="form_id" value="<?php echo $form_id; ?>" />
            <input type="hidden" name="has_child_form" value="<?php echo (!empty($form_many))?true:false; ?>" />
            <?php if ($this->input->post('parent_id')): ?>
            <input type="hidden" name="parent_id" value="<?php echo $this->input->post('parent_id'); ?>" />
            <input type="hidden" name="parent_column" value="<?php echo $this->input->post('parent_column'); ?>" />
            <?php endif ?>
            <?php if (isset($flow_id)): ?>
              <input type="hidden" name="flow_id" value="<?php echo $flow_id; ?>" />
              <input type="hidden" name="t_flow_id" value="<?php echo $t_flow_id; ?>" class="t_flow_id"/>
            <?php endif ?>
            <?php if (!empty($this->input->post('col'))): ?>
              <?php foreach ($col = $this->input->post('col') as $key => $value): ?>
                <input type="hidden" name="col[<?php echo $key ?>]" value="<?php echo $value; ?>" />
              <?php endforeach ?>
            <?php endif ?>
          </div>
          <div class='form-actions'>
            <div class='row'>
              <div class='col-md-12'>
                <!-- <a href="<?php echo site_url('formx/formx/table/'.$form_id) ?>" class="btn default">Kembali</a> -->
                <button type='submit' class='btn btn-warning btn-block' name='mode' value='new' >Simpan</button>
              </div>
            </div>
          </div>
      </form>
    </div>

    <?php if (!empty($id)&&!empty($form_many)): ?>
    <div class="form mt-4">
      <div class="">
        <?php foreach ($form_many as $form_many_set): ?>
          <?php
            $p_form_id =  $form_many_set->form_child_id;
            $p_form_column = $form_many_set->form_child_fk;
          ?>
          <div id="form_table_<?php echo $p_form_id?>"></div>
          <script>
            $('#form_table_<?php echo $p_form_id?>').load('<?php echo site_url("formx/formx/table/".$p_form_id) ?>',
            {
            parent_id: "<?php echo $id ?>",
            parent_column: "<?php echo $p_form_column ?>",
            parent_form_id: "<?php echo $form_id ?>",
            authorize: "<?php echo $authorize ?>",
            <?php if(isset($flow_id)) : ?>
            flow_id: "<?php echo $flow_id ?>",
            <?php endif ?>
            view_only:"true"
            } ,
              function(){
              /* Stuff to do after the page is loaded */
            });

          </script>
        <?php endforeach ?>
      </div>
    </div>
    <?php endif ?>
  </div>
</div><!-- /.box -->
<script type="text/javascript">
  $('#input_form_<?php echo $form_id; ?>').submit(function(e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        main.submitAjaxModal($(this));
        return false;
  });
  function doprint<?php echo $form->id ?>() 
  {
    $('#print_<?php echo $form->id ?>').printThis({
      importCSS: true, 
    });
    
  }
</script>
<?php if (!empty($form->js_addon)): ?>
<script src="<?php echo base_url('assets/js/formx/'.$form->js_addon)?>" type="text/javascript"></script>
<?php endif ?>
