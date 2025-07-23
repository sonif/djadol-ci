<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Formx extends MY_Controller
{


    function __construct()
    {
        parent::__construct();
        $this->load->model('Formx_model');
        $this->load->model('formx_custom/M_before_insert');
        $this->load->model('formx_custom/M_after_insert');
        $this->load->model('formx_custom/M_before_update');
        $this->load->model('M_form');
        $this->load->library('form_validation');
        $this->load->helper('general');
        $this->data['authorize'] = 'write';

    }

    public function tree($form_id)
    {
        $data['form_id'] = $form_id;
        $data['menu_kode'] = 'form_'.$form_id;

        $data['m_form'] = $this->M_form->get($form_id);

        $this->template('v_formx_tree',$data);
    }

    public function data_tree()
    {
        $form_id = $this->input->get('form_id');
        $parent = $this->input->get('parent');
        if ($parent == '#') {
            $parent = 0 ;
        }

        $m_form = $this->M_form->get($form_id);
        $col_label = $this->Formx_model->get_param_datatable($form_id)->row()->column_name;
        $this->Formx_model->set_table($form_id);


        $res = array();
        $this->db->where($m_form->parent_form_foreign_key, $parent);
        $this->db->order_by($m_form->col_sort_name, $m_form->col_sort_type);
        $get_data = $this->Formx_model->get_all();
        if ($get_data) {
            foreach ($get_data as $d) {
                $t = array();
                $t['id']=$d->{$this->Formx_model->primary_key};
                $add  = '<a class="btn btn-icon btn-sm openmodal" title="tambah" data-col[menu_parent]="'.$d->{$this->Formx_model->primary_key}.'"  data-url="'.site_url('formx/form/'.$form_id).'" data-id="div_modal_form_'.$form_id.'"><i class="fa fa-plus text-green"></i></a>';
                $edit  = '<a class="btn btn-icon btn-sm openmodal" title="edit"  data-url="'.site_url('formx/form/'.$form_id.'/'.$d->{$this->Formx_model->primary_key}).'" data-id="div_modal_form_'.$form_id.'"><i class="fa fa-edit text-purple"></i></a>';
                $delete  = '<a class="btn btn-icon btn-sm tree-delete" title="delete" data-id="'.$d->{$this->Formx_model->primary_key}.'" data-title="'.$d->{$col_label}.'" data-url="'.site_url('formx/formx/delete/'.$form_id.'/'.$d->{$this->Formx_model->primary_key}).'"><i class="fa fa-trash text-orange"></i></a>';
                $t['text']=$d->{$col_label}.$add.$edit.$delete;
                $t['icon']='fa fa-folder icon-lg icon-state-danger';

                $this->db->where($m_form->parent_form_foreign_key, $d->{$this->Formx_model->primary_key});
                $this->db->from($m_form->form_table);
                if($this->db->count_all_results() > 0)
                    $t['children']=true;
                else
                    $t['children']=false;

                $t['data']=array();
                $res[]=$t;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function update_tree_move()
    {
        $res['success'] = false;
        $res['message'] = 'Simpan gagal';

        $id       = $this->input->post('id');
        $form_id  = $this->input->post('form_id');
        $position = $this->input->post('position');
        $parent   = $this->input->post('parent');
        if ($parent == '#') {
            $parent = 0 ;
        }

        $m_form = $this->M_form->get($form_id);

        $col_parent = $m_form->parent_form_foreign_key;
        $col_order = $m_form->col_sort_name;

        $this->Formx_model->set_table($form_id);
        $data = array(
            $col_parent => $parent,
            $col_order => $position,
        );

        if($this->Formx_model->update($data,$id)){
            $res['success'] = true;
            $res['message'] = 'Simpan berhasil';
        }

        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function table($form_id)
    {
        if (!is_int($form_id)) {
            $this->db->where('slug', $form_id);
            $p=$this->M_form->get();
            if ($p) $form_id = $p->id;
        }
        cek_hak_akses_formx($this->usergroup_id, 'form_'.$form_id);
        $data['ar_haklistakses']= get_listakses_formx($this->usergroup_id, 'form_'.$form_id);
        $this->data['menu_kode'] = 'form_'.$form_id;

        if ($m_form = $this->M_form->get($form_id)) {
            $data['form'] = $m_form;
            $data['form_id'] = $data['form']->id ;
            $data['m_form_filter'] = $this->db->where('form_id',$data['form']->id)->get('s_form_filter');

            if ($m_form->table_type == 'tree') {
                $this->template('v_formx_tree',$data);
            }else{
                $data['form_param'] = $this->Formx_model->get_param_datatable($form_id);
                $this->template('v_formx_list', $data);
                //$this->load->view('v_formx_list', $data);
            }
        }else{
            show_404();
        }
    }

    public function getDatatable()
    {

        $form_id = $this->input->post('form_id');
        $m_form = $this->M_form->get($form_id);
        $form_param = $this->Formx_model->get_param_datatable($form_id);
        $ar_haklistakses= get_listakses_formx($this->usergroup_id, 'form_'.$form_id);

        $customActionName=$this->input->post('customActionName');
        $records         = array();

        if ($customActionName == "delete") {
            $records=$this-> delete_checked();
        }

        $iDisplayLength = ($this->input->get_post('length')) ? $this->input->get_post('length') : 10 ;
        $iDisplayStart  = ($this->input->get_post('start')) ? $this->input->get_post('start') : 0 ;
        $sEcho          = ($this->input->get_post('draw')) ? $this->input->get_post('draw') : 1 ;

        $this->Formx_model->set_table($form_id,'view');
        $t              = $this->Formx_model->get_limit_data($iDisplayStart, $iDisplayLength);
        $iTotalRecords  = $t['total_rows'];
        $get_data       = $t['get_db'];

        $records["data"] = array();

        $i=$iDisplayStart+1;
        if ($get_data) {
            foreach ($get_data as $d) {
                $checkbok= '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="group-checkable" name="id[]" value="'.$d->{$this->Formx_model->primary_key}.'"><span></span></label>';
                $view  = '<button class="btn btn-icon btn-sm btn-default openmodal" title="view"  data-url="'.site_url('formx/read/'.$form_id.'/'.$d->{$this->Formx_model->primary_key}).'" data-id="div_modal_form_'.$form_id.'"><i class="fa fa-book-open"></i></button>';
                $edit  = '<button class="btn btn-icon btn-sm btn-primary openmodal" title="edit"  data-url="'.site_url('formx/form/'.$form_id.'/'.$d->{$this->Formx_model->primary_key}).'" data-id="div_modal_form_'.$form_id.'"><i class="fa fa-edit"></i></button>';
                $approval  = '<a class="btn btn-icon btn-sm yellow openmodal" title="approval"  data-url="'.site_url('formx/formx/approval_form/'.$form_id.'/'.$d->{$this->Formx_model->primary_key}).'" data-id="div_modal_form_'.$form_id.'"><i class="fa fa-check"></i></a>';
                $delete  = '<button class="btn btn-icon btn-sm btn-danger delete" title="delete" data-title="" data-url="'.site_url('formx/formx/delete/'.$form_id.'/'.$d->{$this->Formx_model->primary_key}).'"><i class="fa fa-trash"></i></button>';

                // addtional button
                $add_btn = '';
                if (!empty($m_form->datatable_button_addon)) {
                    $n1 = str_replace("URL",site_url(),$m_form->datatable_button_addon);
                    $n2 = str_replace("ID",$d->{$this->Formx_model->primary_key},$n1);
                    $add_btn = $n2;
                }

                // custom function to show hide edit button
                if (!empty($m_form->fun_is_editable)){
                    $this->load->model('formx_custom/M_datatable_edit');
                    if (!$this->M_datatable_edit->{$m_form->fun_is_editable}($d)) {
                        $edit ='';
                    }
                }

                // iterasi data each row
                $row = array();
                $checkbok = '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input name="id[]" type="checkbox" class="checkboxes" value="'.$d->{$this->Formx_model->primary_key}.'"><span></span></label>';
                $row[] =$i++;
                foreach ($form_param->result() as $p) {
                    if ($p->type == 'select') {
                        if (!empty($d->{$p->column_name})) {
                            $row[] = $this->Formx_model->get_value_dd($p->table_ref,$d->{$p->column_name},$d);
                        } else{
                            $row[]='';
                        }

                    }elseif ($p->type == 'select_ajax'||$p->type == 'selfemployee') {
                        if (!empty($d->{$p->column_name})) {
                            $row[] = $this->Formx_model->get_value_dd($p->table_ref,$d->{$p->column_name},$d);
                        } else{
                            $row[]='';
                        }

                    }elseif ($p->type == 'int_separator') {
                        if (!empty($d->{$p->column_name})) {
                            $row[] = number_format($d->{$p->column_name},0, ',', '.') ;
                        }else{
                            $row[]='';
                        }
                    }elseif ($p->type == 'file') {
                        $row[]='<a href="'. base_url($p->path_upload.$d->{$p->column_name}).'" class="btn blue"><i class="fa fa-download"></i> Download'
                        // .$d->{$p->column_name}
                        .'</a>';
                    }elseif ($p->type == 'latlong') {
                        $row[]='<a href="#" target="blank" class="btn blue"><i class="fa fa-map"></i> show'
                        // .$d->{$p->column_name}
                        .'</a>';
                    }elseif ($p->type == 'img') {
                        if(!empty($p->path_upload)){
                            $folder_upload = $p->path_upload;
                        }else{
                            $folder_upload = 'uploads/'.$p->form_id.'_'.$p->column_name.'/';
                        }
                        $row[]='<div class="fileinput-new thumbnail" >
                        <a data-fancybox="gallery" href="'.load_image($folder_upload.$d->{$p->column_name}).'">
                            <img src="'.load_thumb($folder_upload.$d->{$p->column_name}).'" alt="" style="max-width: 100px; max-height: 100px;"/>
                        </a>
                    </div>';
                    } else {
                        $row[] = $d->{$p->column_name};
                    }

                }
                if (!in_array('xupdate', $ar_haklistakses)){
                    $edit='';
                }
                if (!in_array('xdelete', $ar_haklistakses)){
                    $delete='';
                }
                if (!in_array('xread', $ar_haklistakses)){
                    $view='';
                }
                if (!in_array('xapproval', $ar_haklistakses)){
                    $approval='';
                }

                if (isset($d->approval_note) && !empty($d->approval_note)) {
                    $edit='';
                    $approval  = '<a class="btn btn-icon btn-sm yellow openmodal" title="approval"  data-url="'.site_url('formx/formx/approval_read/'.$form_id.'/'.$d->{$this->Formx_model->primary_key}).'" data-id="div_modal_form_'.$form_id.'"><i class="fa fa-comment fa-lg"></i></a>';
                }

                $row[] = $add_btn.$view.$edit.$approval.$delete;
                $records["data"][] = $row;
            }
        }
        $records["draw"] = $sEcho;
        $records["recordsTotal"] = $iTotalRecords;
        $records["recordsFiltered"] = $iTotalRecords;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    public function read($form_id=null,$id=null)
    {
        $this->_is_allowed("xread",$form_id);

        $this->data['authorize'] = 'readonly';
        $this->_form_data($form_id,$id);
    }

    public function form($form_id=null,$id=null)
    {
        if (empty($id)) {
            $this->_is_allowed("xcreate",$form_id);
        }else{
            $this->_is_allowed("xupdate",$form_id);
        }

        $this->_form_data($form_id,$id);
    }

    public function _form_data($form_id=null,$id=null)
    {
        $this->db->where('id', $form_id);
        $m_form = $this->db->get('s_form');
        if ($m_form->num_rows() > 0) {
            $data['form'] = $m_form->row();
            $data['form_id'] = $form_id;

            $data['form_param'] = $this->Formx_model->get_param($form_id);
            $data['action']    = site_url('formx/formx/form_action');
            if (empty($id)) {
                $data['row']       = null;
                $data['id']        = '';
            }else{
                $row = $this->Formx_model->get_row($form_id,$id);

                if ($row) {
                    $data['row']       = $row;
                    $data['id']        = $row->{$this->Formx_model->primary_key};
                } else {
                    show_error('Data not found');
                }
            }

            $data['form_many'] = $this->M_form->get_child_form($form_id);
            $this->template('v_formx_form',$data);
        }else{
            show_error('Form not found');
        }
    }

    public function form_action()
    {

        $res['success'] = false;
        $res['message'] = 'Simpan gagal';

        $datalog_user = $this->data['user'];
        if($datalog_user->usergroup_id !=1){
            $data['company_id'] = $datalog_user->company_id;
        }

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
                        if(!empty($p->path_upload)){
                            $folder_upload = $p->path_upload;
                        }else{
                            $folder_upload = 'uploads/'.$p->form_id.'_'.$p->column_name.'/';
                        }
                        $res = $this->_upload($folder_upload,$p->column_name);
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
            // var_dump($data);die();
            // $this->db->trans_start();
            if (empty($id)) {
                $this->_is_allowed("xcreate",$form_id);
                $data['created_by'] = $datalog_user->id;
                $data['created_at'] = date('Y-m-d H:i:s');
                // $this->load->library('uuid');
                // $data['id']=$this->uuid->v4();
                // DO before insert
                if (method_exists($this->M_before_insert, $m_form->form_table)) {
                    $data = $this->M_before_insert->{$m_form->form_table}($data);
                }
                    # code...

                if($id =$this->Formx_model->insert($data)){
                    // if ($id_temp = $this->input->post('id_temp')) {
                    //     $temp_folder= "./uploads/temp/formx/".$id_temp;
                    //     $target_folder = "./uploads/formx/".$id;
                    //     if(file_exists($temp_folder)) {
                    //         mkdir($target_folder,0775,true);
                    //         rename($temp_folder, $target_folder);
                    //     }
                    // }

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
                    $res['success'] = true;
                    $res['id'] = $id;
                    $res['message'] = 'Simpan berhasil';

                    if (!empty($this->input->post('t_flow_id'))) 
                    $res['url']     = 'reload';
                }else{
                    $res['success'] = false;
                    $res['message'] = $this->db->error()['message']; 
                }
            }else{
                $this->_is_allowed("xupdate",$form_id);
                $data['updated_by'] = $datalog_user->id;
                $data['updated_at'] = date('Y-m-d H:i:s');

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
                        $res['success'] = true;
                        $res['message'] = 'Simpan berhasil';
                        if($this->input->post('has_child_form')) $res['keepmodal'] = true;
                    }else{
                        $res['success'] = false;
                        $res['message'] = $this->db->error()['message']; 
                    }
                    
                } else {
                    $res['success'] = false;
                    $res['message'] = 'Data not found';
                }
            }
            // $this->db->trans_complete();
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function delete($form_id,$id)
    {
        $this->_is_allowed("xdelete",$form_id);

        $res['success'] = false;
        $res['message'] = 'Hapus gagal';

        $this->Formx_model->set_table($form_id);

        $row = $this->Formx_model->get($id);

        if ($row) {
            $this->Formx_model->delete($id);
            $res['success'] = true;
            $res['message'] = 'Hapus berhasil';
        } else {
            $res['message'] = 'Data tidak ditemukan';
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function delete_checked()
    {
        $id_array=$this->input->post('id[]');
        $form_id=$this->input->post('form_id');
        $this->_is_allowed("xdelete",$form_id);

        $this->Formx_model->set_table($form_id);

        foreach ($id_array as $id) {
            $row = $this->Formx_model->get($id);

            if ($row) {
                $this->Formx_model->delete($id);
            }
        }
        $result["customActionStatus"]="OK";
        $result["customActionMessage"]="Delete Record Success";
        return $result;
    }

    public function approval_read($form_id=null,$id=null)
    {
        $this->data['authorize'] = 'readonly';
        $this->approval_form($form_id,$id);
    }

    public function approval_form($form_id=null,$id=null)
    {
        $this->db->where('id', $form_id);
        $m_form = $this->db->get('s_form');
        if ($m_form->num_rows() > 0) {
            $data['form'] = $m_form->row();
            $data['form_id'] = $form_id;

            $data['form_param'] = $this->Formx_model->get_param($form_id);
            $data['action']    = site_url('formx/formx/approval_action');
            if (empty($id)) {
                $data['row']       = null;
                $data['id']        = '';
            }else{
                $row = $this->Formx_model->get_row($form_id,$id);

                if ($row) {
                    $data['row']       = $row;
                    $data['id']        = $row->{$this->Formx_model->primary_key};
                } else {
                    show_error('Data not found');
                }
            }
            $this->template('v_formx_form_approval',$data);
        }else{
            show_error('Form not found');
        }
    }

    public function approval_action($value='')
    {
        $res['success'] = false;
        $res['message'] = 'Simpan gagal';

        $form_id = $this->input->post('form_id');
        $id = $this->input->post('id');
        $m_form = $this->M_form->get($form_id);

        $this->Formx_model->set_table($form_id);
        $this->form_validation->set_rules('approval_note','Notes','required');
        if ($this->form_validation->run() == FALSE) {
            $res['message'] = 'Lengkapi form dengan benar';
            $res['field_error'] = $this->form_validation->error_array();
        } else {
            $row = $this->Formx_model->get($id);

            if ($row) {
                $data = array(
                    'approval_note' => $this->input->post('approval_note'),
                    'approval_at' => date("Y-m-d h:i:s"),
                );
                if($this->Formx_model->update($data,$id)){
                    if ($m_form->table_type == 'tree') {
                        $res['url']     = 'reload';
                    }else{
                        $res['datatable'] = 'datatable_'.$form_id;
                    }
                    $res['success'] = true;
                    $res['message'] = 'Simpan berhasil';
                }
            } else {
                $res['success'] = false;
                $res['message'] = 'Data not found';
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));

    }

    function _is_allowed($access,$form_id)
    {
        $ar_haklistakses= get_listakses_formx($this->usergroup_id, 'form_'.$form_id);

        if (!in_array($access, $ar_haklistakses)){
            show_error('not have permission'); //cut off procedure
        }
    }

}
