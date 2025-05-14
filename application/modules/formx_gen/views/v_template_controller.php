<?php
$string = "<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class " . $c . " extends MY_Controller
{


    function __construct()
    {
        parent::__construct();
        \$this->load->model('$m');
        \$this->load->library('form_validation');
        \$this->load->helper('permission');
    }
    ";



$string .="\n\n    public function index()
    {
        \$this->template('$v_list');
    }";

$string .="\n\n    public function getDatatable()
    {
        \$customActionName=\$this->input->post('customActionName');
        \$records         = array();

        if (\$customActionName == \"delete\") {
            \$records=\$this-> delete_checked();
        }

        \$iDisplayLength = (\$this->input->get_post('length')) ? \$this->input->get_post('length') : 10 ;
        \$iDisplayStart  = (\$this->input->get_post('start')) ? \$this->input->get_post('start') : 0 ;
        \$sEcho          = (\$this->input->get_post('draw')) ? \$this->input->get_post('draw') : 1 ;

        \$t              = \$this->" . $m . "->get_limit_data(\$iDisplayStart, \$iDisplayLength);
        \$iTotalRecords  = \$t['total_rows'];
        \$get_data       = \$t['get_db'];

        \$records[\"data\"] = array();

        \$i=\$iDisplayStart+1;
        if (\$get_data) {
            foreach (\$get_data as \$d) {
                \$checkbok= '<input type=\"checkbox\" class=\"group-checkable\" name=\"id[]\" value=\"'.\$d->".$pk.".'\">';
                \$view  = '<button class=\"btn btn-icon btn-sm btn-info openmodal\" title=\"view\"  data-url=\"'.site_url('".$c_url."/read/'.\$d->".$pk.").'\"><i class=\"fa fa-search fa-lg\"></i></button>';
                \$edit  = '<button class=\"btn btn-icon btn-sm btn-primary openmodal\" title=\"edit\"  data-url=\"'.site_url('".$c_url."/form/'.\$d->".$pk.").'\"><i class=\"fa fa-edit\"></i></button>';
                \$delete  = '<button class=\"btn btn-icon btn-sm btn-danger delete\" title=\"delete\" data-title=\"'.\$d->{\$this->".$m."->label}.'\" data-url=\"'.site_url('".$c_url."/delete/'.\$d->".$pk.").'\"><i class=\"fa fa-trash\"></i></button>';
                \$add_btn = '';
                
                \$row = array();
                \$row[] = \$i++;
                ";
                foreach ($dt as $row) {

                    if ($row->type == 'int' ) {
                        $string .= "\n\t\t\t\t\$row[] =to_numeric(\$d->". $row->column_name ."); ";
                    }elseif ($row->type == 'select_ajax') {
                        $string .="
                if (!empty(\$d->$row->column_name)) {
                    \$row[] = \$this->Formx_model->get_value_dd('$row->table_ref',\$d->$row->column_name);
                } else{
                    \$row[]='';
                }
                        ";
                    }elseif ($row->type == 'img') {
                        if (!empty($row->path_upload)) {
                          $path_upload = $row->path_upload;
                        }else{
                          $path_upload = "uploads/".strtolower($c)."/";
                        }
                        $string .= "
                \$row[] ='<img style=\"max-width: 80px; max-height: 80px;\" src=\"'.load_thumb('".$path_upload."'.\$d->" . $row->column_name . ").'\" alt=\"\" />'; ";
                    }else{
                        $string .= "\n\t\t\t\t\$row[] =\$d->". $row->column_name ."; ";
                    }
                }
                $string .= "
                   
                \$row[] = \$add_btn.\$view.\$edit.\$delete;
                \$records[\"data\"][] = \$row;
            }
        }
        \$records[\"draw\"] = \$sEcho;
        \$records[\"recordsTotal\"] = \$iTotalRecords;
        \$records[\"recordsFiltered\"] = \$iTotalRecords;

        \$this->output->set_content_type('application/json')->set_output(json_encode(\$records));
    }";

$string .= "\n\n    public function read(\$id)
    {
        \$this->data['authorize'] = 'readonly';
        \$this->form(\$id);
    }

    public function form(\$id=null)
    {
        \$data['action']    = site_url('".$c_url."/form_action');
        if (empty(\$id)) {
            \$data['row']       = null;
            \$data['id']        = '';
        }else{
            \$row = \$this->".$m."->get(\$id);

            if (\$row) {
                \$data['row']       = \$row;
                \$data['id']        = \$row->".$pk.";
            } else {
                show_error('Data not found');
            }
        }

        \$this->template('$v_form',\$data);
    }
    ";

$string .= "
    public function form_action()
    {
        \$res['success'] = false;
        \$res['message'] = 'Simpan gagal';
        ";
        // $this->form_validation->set_rules('tgl', 'tgl', "trim|callback_check_date_format");
foreach ($non_pk as $row) {
    $validation_arr=array();
    $validation_arr[]='trim';
    if ($row->required) {
        $validation_arr[]='required';
    }
    if ($row->type == 'double' || $row->type == 'decimal') {
        $validation_arr[]='int';
    }
    if ($row->type == 'int' || $row->type == 'double' || $row->type == 'decimal') {
        $validation_arr[]='numeric';
    }
    if ($row->type == "date") {
        // $validation_arr[]='callback_check_date_format';
        if ($row->required) {
            $string .= "\n\t\tif(!empty(\$this->input->post('".$row->column_name ."')))";
        }
    }
    if (!empty($row->validation)) {
        $validation_arr[]=$row->validation;
    }

    $string .= "
        \$this->form_validation->set_rules('" . $row->column_name . "','" . $row->column_name . "','".implode("|",$validation_arr)."');";
}
$string .= "\n
        if (\$this->form_validation->run() == FALSE) {
            \$res['message'] = 'Lengkapi form dengan benar';
            \$res['field_error'] = \$this->form_validation->error_array();
        } else {
            \$data = array(";
foreach ($non_pk as $row) {
    if ($row->type == 'int' || $row->type == 'double' || $row->type == 'decimal') {
        $string .= "
                        '" . $row->column_name . "' => convert_numeric(\$this->input->post('" . $row->column_name . "')),";
    }elseif(!($row->type == 'img'||$row->type == 'date')){
        $string .= "
                        '" . $row->column_name . "' => \$this->input->post('" . $row->column_name . "'),";
    }
}
$string .= "
                    );";
foreach ($non_pk as $row) {
    if($row->type == 'img'){
        if (!empty($row->path_upload)) {
            $path_upload = $row->path_upload;
        }else{
            $path_upload = "uploads/".strtolower($c)."/";
        }
$string .= "
            if (!empty(\$_FILES['" . $row->column_name . "']['name'])) {
                \$res = \$this->_upload('".$path_upload."','".$row->column_name."');
                if (\$res['success']) {
                    if (isset(\$res['upload_data'])) {
                        \$data['" . $row->column_name . "'] = \$res['upload_data']['file_name'];
                    }
                }else{
                    \$this->output->set_content_type('application/json')->set_output(json_encode(\$res))->_display();
                    exit();
                }
            }";
    }
}
$string .= "
            if (empty(\$this->input->post('$pk'))) {
                \$this->load->library('uuid');
                \$data['id'] = \$this->uuid->v4();
                if(\$this->".$m."->insert(\$data)){
                    \$res['datatable']     = 'datatable".$c."';
                    \$res['success'] = true;
                    \$res['message'] = 'Simpan berhasil';
                }
            }else{
                \$row = \$this->".$m."->get(\$this->input->post('$pk'));

                if (\$row) {
                    if(\$this->".$m."->update(\$data,\$this->input->post('$pk'))){
                        \$res['datatable']     = 'datatable".$c."';
                        \$res['success'] = true;
                        \$res['message'] = 'Simpan berhasil';
                    }
                } else {
                    \$res['success'] = false;
                    \$res['message'] = 'Data not found';
                }
            }
        }
        \$this->output->set_content_type('application/json')->set_output(json_encode(\$res));
    }
    ";

$string .="
    public function delete(\$id)
    {
        \$res['success'] = false;
        \$res['message'] = 'Hapus gagal';
        \$row = \$this->".$m."->get(\$id);

        if (\$row) {
            \$this->".$m."->delete(\$id);
            \$res['success'] = true;
            \$res['message'] = 'Hapus berhasil';
        } else {
            \$res['message'] = 'Data tidak ditemukan';
        }
        \$this->output->set_content_type('application/json')->set_output(json_encode(\$res));
    }

    public function delete_checked()
    {
        \$id_array=\$this->input->post('id[]');
        foreach (\$id_array as \$id) {
            \$row = \$this->".$m."->get(\$id);

            if (\$row) {
                \$this->".$m."->delete(\$id);
            }
        }
        \$result[\"customActionStatus\"]=\"OK\";
        \$result[\"customActionMessage\"]=\"Delete Record Success\";
        return \$result;
    }
}
    ";


echo $string;

?>
