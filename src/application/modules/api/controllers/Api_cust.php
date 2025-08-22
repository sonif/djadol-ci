<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'third_party/REST_Controller.php';
require APPPATH . 'third_party/Format.php';
use Restserver\Libraries\REST_Controller;


class Api_cust extends REST_Controller {
    public $data    = array();
    public $usergroup_id;

    function __construct()
    {
        parent::__construct();
        $this->load->helper(['jwt', 'authorization']);
        $this->verify_request();
        $this->load->model('formx/Formx_model');
        $this->load->model('formx/M_form');
        $this->load->model('formx_custom/M_before_insert');
        $this->load->model('formx_custom/M_after_insert');
        $this->load->model('formx_custom/M_before_update');
        $this->load->library('form_validation');
        $this->data['authorize'] = 'write';

    }

    private function verify_request()
    {
        if( $this->rest->user_id){
            $this->load->model('auth/Users_model');
            $user = $this->Users_model->get($this->rest->user_id );
            $this->data['user']  = $user;
            $this->usergroup_id = $user->usergroup_id;
        }
    }

    public function all_post($form_id=null)
    {
        if(empty($form_id))
            $form_id = $this->input->post('form_id');
        if (!is_int($form_id)) {
            $this->db->where('slug', $form_id);
            $p=$this->db->get('s_form');
            if ($p->num_rows()>0) $form_id = $p->row()->id;
        }

        $m_form = $this->M_form->get($form_id);
        $form_param = $this->Formx_model->get_param($form_id);
        $ar_haklistakses= get_listakses_formx($this->usergroup_id, 'form_'.$form_id);

        $customActionName=$this->input->post('customActionName');
        $records         = array();

        if ($customActionName == "delete") {
            $records =$this-> delete_checked();
        }

        $iDisplayLength = ($this->input->get_post('length')) ? $this->input->get_post('length') : 30 ;
        $iDisplayStart  = ($this->input->get_post('page')) ? $this->input->get_post('page')*$iDisplayLength : 0 ;

        $this->Formx_model->set_table($form_id,'view');
        $t              = $this->Formx_model->get_limit_data($iDisplayStart, $iDisplayLength);
        
        $iTotalRecords  = $t['total_rows'];
        $get_data       = $t['get_db'];

        $records["data"] = array();
        $records["total_sales"] = 0;

        $i=$iDisplayStart+1;
        if ($get_data) {
            foreach ($get_data as $d) {
                // iterasi data each row
                $row = array();
                foreach ($form_param->result() as $p) {
                    $row['id']=$d->{$this->Formx_model->primary_key};
                    if ($p->type == 'select') {
                        if (!empty($d->{$p->column_name})) {
                            $row[$p->column_name] = $this->Formx_model->get_value_dd($p->table_ref,$d->{$p->column_name});
                        } else{
                            $row[$p->column_name]='';
                        }

                    }elseif ($p->type == 'select_ajax') {
                        if (!empty($d->{$p->column_name})) {
                            $row[$p->column_name.'_name'] = $this->Formx_model->get_value_dd($p->table_ref,$d->{$p->column_name});
                            $row[$p->column_name] = $d->{$p->column_name};
                        } else{
                            $row[$p->column_name]='';
                        }

                    }elseif ($p->type == 'int_separator') {
                        if (!empty($d->{$p->column_name})) {
                            $row[$p->column_name] = number_format($d->{$p->column_name},0, ',', '.') ;
                        }else{
                            $row[$p->column_name]='';
                        }
                    }elseif ($p->type == 'img' || $p->type == 'file') {
                        if (!empty($d->{$p->column_name})){
                            $row[$p->column_name] = base_url($p->path_upload.'/'.$d->{$p->column_name});
                        }else{
                            $row[$p->column_name]='';
                        }
                    }elseif ($p->type == 'upload') {
                        continue;
                    } else {
                        $row[$p->column_name] = $d->{$p->column_name};
                    }

                }
                $row['created_at']=$d->created_at;
                $row['created_by']=$d->created_by;
                $records["data"][] = $row;
            }
            if($form_id == '44'):
                $t2             = $this->Formx_model->get_all_non_paging();
                $get_data       = $t2['get_db'];
                foreach ($get_data as $d) {
                    $records["total_sales"] += $d->total_price;
                }
            endif;
        }
        $records["recordsTotal"] = $iTotalRecords;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    public function record_delete()
    {
        $http_code = 400;
        $this->output->set_status_header($http_code);
        $form_id = $this->input->post('form_id');
        $id = $this->input->post('id');
        $m_form = $this->M_form->get($form_id);
        if (!$m_form) {
            $res['message'] = 'Form not found';
            $this->response($res,$http_code);
        }

        $this->Formx_model->set_table($form_id);
        if ($this->Formx_model->delete($id)) {
            $http_code = 200;
            $res['message'] = 'Record deleted successfully';
            $this->response($res,$http_code);
            exit();
        } else {
            $http_code = 500;
            $res['message'] = 'Failed to delete record';
            $this->response($res,$http_code);
        }
    }

    public function form_action_post()
    {
        $http_code =400;
        $this->output->set_status_header($http_code);
        $res['message'] = 'Simpan gagal';

        $form_id = $this->input->post('form_id');
        $id = $this->input->post('id');
        $m_form = $this->M_form->get($form_id);

        $this->Formx_model->set_table($form_id);

        $form_param= $this->Formx_model->get_param($form_id);

        foreach ($form_param->result() as $p) {
            $validation_arr = array('trim');
            if ($p->type == 'numeric') {
                $validation_arr[] = 'numeric';
            }
            if ($p->type == 'int') {
                $validation_arr[] = 'integer';
            }
            if ($p->required) {
                $validation_arr[] = 'required';
            }
            if (!empty($p->validation)) {
                $validation_arr[] = $p->validation;
            }
            $validation = implode('|', $validation_arr);
            if (!empty($p->label_name))
                $label = $p->label_name;
            else
                $label = $p->column_name;

            if ($p->type == 'checkbox')
                $this->form_validation->set_rules($p->column_name.'[]',$label,$validation);
            else
                $this->form_validation->set_rules($p->column_name,$label,$validation);
        }

        if ($this->form_validation->run() == FALSE) {
            $res['message'] = 'Lengkapi form dengan benar';
            $res['field_error'] = $this->form_validation->error_array();
            
        } else {
            foreach ($form_param->result() as $p) {
                if ($p->type == 'upload') continue;

                if ( in_array($p->type, ['int','numeric','date','select_ajax','select'])) {
                    if (!empty($this->input->post($p->column_name))) {
                        $data[$p->column_name] = $this->input->post($p->column_name);
                    } else {
                        $data[$p->column_name] = NULL;
                    }
                }
                elseif ($p->type == 'int_separator') {
                    if (!empty($this->input->post($p->column_name))) {
                        $data[$p->column_name] = str_replace('.','', $this->input->post($p->column_name));
                    } else {
                        $data[$p->column_name] = NULL;
                    }
                }
                elseif ($p->type == 'checkbox') {
                    $data[$p->column_name] = json_encode($this->input->post($p->column_name));
                }
                elseif ($p->type == 'img' || $p->type == 'file') {
                    if (!empty($_FILES[$p->column_name]['name'])) {
                        $res = $this->_upload($p->path_upload,$p->column_name);
                        if ($res['success']) {
                            if (isset($res['upload_data'])) {
                                $data[$p->column_name] = $res['upload_data']['file_name'];
                            }
                        }else{
                            $this->output->set_content_type('application/json')->set_output(json_encode($res))->_display();
                            exit();
                        }
                    }
                }
                elseif ($p->type == 'password') {
                    if (!empty($this->input->post($p->column_name))) {
                        // $data[$p->column_name] = md5($this->input->post($p->column_name));
                        $data[$p->column_name] = password_hash($this->input->post($p->column_name), PASSWORD_BCRYPT);
                    }
                }
                else{
                    $data[$p->column_name] = $this->input->post($p->column_name);
                }
            }
            if ($this->input->post('parent_id')) {
                $data[$this->input->post('parent_column')] = $this->input->post('parent_id');
            }
            if ($this->input->post('t_flow_id')) {
                $data['t_flow_id'] = $this->input->post('t_flow_id');
            }
            if (!empty($col=$this->input->post('col'))) {
                foreach ($col=$this->input->post('col') as $key => $value) {
                    $data[$key]=$value;
                }
            }
            // $this->db->trans_start();
            $data['created_at'] = date("Y-m-d H:i:s");
            if (empty($id)) {
                $data['created_by'] = $this->data['user']->id;
                 if($this->data['user']->usergroup_id !=1){
                    $data['company_id'] = $this->data['user']->company_id;
                }
                // DO before insert
                // if(file_exists(APPPATH."modules/formx_custom/models/M_".$m_form->form_table."_custom.php")){
                //     $this->load->model("formx_custom/M_".$m_form->form_table."_custom.php");
                // }
                if (method_exists($this->M_before_insert, $m_form->form_table)) {
                    $data = $this->M_before_insert->{$m_form->form_table}($data);
                }
                    # code...
                    // var_dump($data);die();

                if($id =$this->Formx_model->insert($data)){
                    if ($id_temp = $this->input->post('id_temp')) {
                        $temp_folder= "./uploads/temp/formx/".$id_temp;
                        $target_folder = "./uploads/formx/".$id;
                        if(file_exists($temp_folder)) {
                            mkdir($target_folder,0775,true);
                            rename($temp_folder, $target_folder);
                        }
                    }

                    if ($m_form->table_type == 'tree') {
                        $res['url']     = 'reload';
                    }else{
                        $res['datatable'] = 'datatable_'.$form_id;
                    }

                    // do after insert
                    if (method_exists($this->M_after_insert, $m_form->form_table)) {
                        $this->M_after_insert->{$m_form->form_table}($id,$data);
                    }

                    // resturn respone
                    $http_code = 200;
                    $res['id'] = $id;
                    $res['message'] = 'Simpan berhasil';
                }
            }else{
                $row = $this->Formx_model->get($id);

                if ($row) {
                    // DO before update
                    if (method_exists($this->M_before_update, $m_form->form_table)) {
                        $data = $this->M_before_update->{$m_form->form_table}($id,$data);
                    }
                    // DO update
                    if($this->Formx_model->update($data,$id)){
                        if ($m_form->table_type == 'tree') {
                            $res['url']     = 'reload';
                        }else{
                            $res['datatable'] = 'datatable_'.$form_id;
                        }
                        $http_code = 200;
                        $res['message'] = 'Simpan berhasil';
                    }
                } else {
                    $res['message'] = 'Data not found';
                }
            }
            // $this->db->trans_complete();
        }
        $this->response($res,$http_code);
        // $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function _upload($targetPath="",$form_upload_name='doc_file')
    {
        $this->load->helper('security');

        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size']      = '5000';
        $config['overwrite']     = true;
        if(is_array($targetPath)){
            $config = array_merge($config, $targetPath);
        }else{
            if (empty($targetPath)) {
                $targetPath= "uploads/temp";
            }
            $config['upload_path']   = "./".$targetPath;
        }
        // $config['file_name']     = do_hash(date("Y/m/d h:i:sa"));

        $this->load->model('formx/m_public_function');
        $response = $this->m_public_function->upload($config,$form_upload_name);

        return $response;
    }
}

/* End of file api.php */
/* Location: ./application/controllers/api.php */
