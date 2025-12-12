<?php
$tag_form_upload = '';
foreach ($non_pk as $row) {
  if($row->type == 'img'){
    $tag_form_upload = 'enctype="multipart/form-data"';
    break;
  }
}

$string = "
<!-- Main content -->
      <div class='card shadow'>
        <div class='card-header'>
          <div class=\"col-7\">
              <h5 class=\"h3 mb-0 text-uppercase\">".  strtoupper($name)."  </h5>
          </div>
        </div>
        <div class='card-body  form'>";
        $string .= "
          <form action=\"<?php echo \$action; ?>\" method=\"post\" id=\"input_form_".strtolower($c)."\" class=\"horizontal-form <?php echo \$authorize ?>\" ".$tag_form_upload." >";
            $string .= "
            <div class='form-body'>
              <div class='row'>";
              $i=0;
              foreach ($non_pk as $row) {
                $col_md='col-md-12';
                // if(!empty($row->col_md))
                //   $col_md= $row->col_md;

                //----------------------------------------------------------
                if ($row->type == 'textarea') {
                    $string .= "
                <div class='$col_md'>
                  <div class='form-group'>
                    <label class='control-label'>". $row->label_name . "</label>
                    <div class=''>
                      <textarea class=\"form-control <?php echo 'data-'.\$authorize ?>\" rows=\"3\" name=\"" . $row->column_name . "\" id=\"" . $row->column_name . "\" placeholder=\"" . $row->label_name . "\"><?php echo (isset(\$row)) ? \$row->".$row->column_name." : ''; ?></textarea>
                    </div>
                  </div>
                </div>
                ";

                //----------------------------------------------------------
                } else if($row->type == 'hidden' ){
                    $string .= "
                <input type=\"hidden\" name=\"" . $row->column_name . "\" id=\"" . $row->column_name . "\" placeholder=\"" . $row->label_name . "\" value=\"<?php echo (isset(\$row)) ? \$row->".$row->column_name." : ''; ?>\" />
                ";

                //----------------------------------------------------------
                } else if($row->type == 'date' || $row->type == 'year' ){
                    if ($row->type == 'date') {
                      $class_date ='date-decade';
                    }elseif($row->type == 'year'){
                      $class_date ='date-year';
                    }

                    $string .= "
                <div class='$col_md'>
                  <div class='form-group'>
                    <label class='control-label'>". $row->label_name . "</label>
                    <div class=''>
                      <div class='input-group date ".$class_date."' >
                        <span class='input-group-btn'>
                          <button class='btn default' type='button'>
                            <i class='fa fa-calendar'></i>
                          </button>
                        </span>
                        <input type='text' class='form-control <?php echo 'data-'.\$authorize ?> ' readonly name=\"" . $row->column_name . "\" value=\"<?php echo (isset(\$row)) ? \$row->".$row->column_name." : ''; ?>\">
                      </div>
                    </div>
                  </div>
                </div>
                ";

                //----------------------------------------------------------
                } else if ($row->type == 'int' ){
                    $string .= "
                <div class='$col_md'>
                  <div class='form-group'>
                    <label class='control-label'>". $row->label_name . "</label>
                    <div class=''>
                      <input type=\"text\" class=\"form-control <?php echo 'data-'.\$authorize ?> numeric\" name=\"" . $row->column_name . "\" id=\"" . $row->column_name . "\" placeholder=\"" . $row->label_name . "\" value=\"<?php echo (isset(\$row->".$row->column_name.")) ? \$row->".$row->column_name." : ''; ?>\" />
                    </div>
                  </div>
                </div>
                ";

                //----------------------------------------------------------
                } else if ($row->type == 'select_ajax' ){
                    $string .= "
                <?php
                  \$uom_id = (isset(\$row)) ? \$row->$row->column_name : '';
                  if (!empty(\$uom_id)) {
                    \$uom_id_name = \$this->Formx_model->get_value_dd('$row->table_ref',\$uom_id);
                  }else{
                    \$uom_id_name = '';
                  }
                ?>
                <div class='$col_md'>
                  <div class='form-group'>
                    <label class='control-label'>". $row->label_name . "</label>
                    <div class=''>
                    <select name='$row->column_name' class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/$row->table_ref') ?>'>
                      <option value=\"<?php echo \$uom_id; ?>\" selected=\"selected\"><?php echo \$uom_id_name; ?></option>
                    </select>
                    </div>
                  </div>
                </div>
                ";

                //----------------------------------------------------------
                } else if($row->type == 'img'  ){
                    if (!empty($row->path_upload)) {
                      $path_upload = $row->path_upload;
                    }else{
                      $path_upload = "uploads/".strtolower($c)."/";
                    }
                      $string .= "
                <div class='$col_md'>
                  <div class='form-group'>
                    <label class='control-label'> ". $row->label_name . "</label>
                    <div class=''>
                      <?php \$".$row->column_name." = (isset(\$row)) ? \$row->".$row->column_name." : ''; ?>
                      <div class=\"fileinput fileinput-new <?php echo 'data-'.\$authorize ?>\" data-provides=\"fileinput\">
                          <div class=\"fileinput-new thumbnail\" style=\"max-width: 200px; max-height: 150px;\">
                              <img src=\"<?php echo load_thumb('".$path_upload."'.$" . $row->column_name . "); ?>\" alt=\"\" />
                          </div>
                          <div class=\"fileinput-preview fileinput-exists thumbnail\" style=\"max-width: 200px; max-height: 150px;\"> </div>
                          <?php if (\$authorize == 'edit'): ?>
                          <div>
                              <span class=\"btn btn-sm btn-info btn-file\">
                                  <span class=\"fileinput-new\"> Select image </span>
                                  <span class=\"fileinput-exists\"> Change </span>
                                  <input type=\"file\" name=\"" . $row->column_name . "\" id=\"" . $row->column_name . "\" accept=\"image/*\"> </span>
                              <a href=\"javascript:;\" class=\"btn btn-sm btn-danger fileinput-exists\" data-dismiss=\"fileinput\"> Remove </a>
                          </div>
                          <?php endif ?>
                      </div>

                    </div>
                  </div>
                </div>
                ";

                //----------------------------------------------------------
                } else if($row->type == 'dropdown' ){
                    $string .= "
                <div class='$col_md'>
                  <div class='form-group'>
                    <label class='control-label'>". $row->label_name . "</label>
                    <div class=''>
                      <select name='".$row->column_name."' class='form-control <?php echo 'data-'.\$authorize ?> select2me' >";
                      foreach ($row["data"] as $key_dd => $value_dd) {
                        $string .= "
                        <option value=\"".$value_dd."\" <?php echo (isset(\$row) && \$row->".$row->column_name."==\"".$value_dd."\") ? 'selected=\"\"' : ''; ?>>".$value_dd."</option>";
                      }
                      $string .= "
                      </select>
                    </div>
                  </div>
                </div>
                ";

                //----------------------------------------------------------
                } else {
                    $string .= "
                <div class='$col_md'>
                  <div class='form-group'>
                    <label class='control-label'>". $row->label_name . "</label>
                    <div class=''>
                      <input type=\"text\" class=\"form-control <?php echo 'data-'.\$authorize ?>\" name=\"" . $row->column_name . "\" id=\"" . $row->column_name . "\" placeholder=\"" . $row->label_name . "\" value=\"<?php echo (isset(\$row)) ? \$row->".$row->column_name." : ''; ?>\" />
                    </div>
                  </div>
                </div>
                ";
                }

                //----------------------------------------------------------
                //----------------------------------------------------------

              }

              // bottom form
              //----------------------------------------------------------
              $string .= "
                <input type=\"hidden\" name=\"" . $pk . "\" value=\"<?php echo \$id; ?>\" />
              </div>
            </div>
            <div class='form-actions float-right'>
              <div class='row'>
                <div class=''>
                  <?php if (!\$modal): ?>
                  <a href=\"<?php echo site_url('" . $c_url . "') ?>\" class=\"btn default\">Kembali</a>
                  <?php else: ?>
                  <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Tutup</button>
                  <?php endif ?>
                  <?php if (\$authorize == 'edit'): ?>
                  <button type='submit' class='btn btn-primary' >Simpan</button>
                  <?php endif ?>
                </div>
              </div>
            </div>
              ";
          $string .= "
          </form>
        </div><!-- /.box-body -->
      </div><!-- /.box -->

<script type=\"text/javascript\">
  $('#input_form_".strtolower($c)."').submit(function(e) {
        e.preventDefault();
        main.submitAjaxModal($(this));
  });
</script>

";

echo $string;
?>
