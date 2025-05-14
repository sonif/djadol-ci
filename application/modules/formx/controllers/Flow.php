<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Flow extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('M_flow');
        $this->load->model('M_form');
        $this->load->model('M_form_param');
        $this->load->model('Formx_model');
        $this->load->model('Flow_model');
        $this->load->model('T_flow_model');
        $this->load->model('M_flow_level_model');
        $this->load->model('T_flow_history_model');

        $this->load->library('form_validation');

        $this->data['authorize'] = 'write';

    }

    
    public function table($flow_id=1)
	{
        $this->data['menu_kode'] = 'flow_'.$flow_id;
		$level=1;
        $data['flow_id'] = $flow_id;
        if ($data['m_flow'] = $this->M_flow->get($flow_id)) {
    		$form_id = $data['m_flow']->form_id;

            $data['usergroup_creator'] = $this->M_flow_level_model->usergroup_creator($flow_id);
            $data['usergroup_id'] = $this->usergroup_id;


            $m_form =$this->M_form->get($form_id);
            $data['form'] = $m_form;
            $data['form_id'] = $m_form->id ;

            $data['form_param'] = $this->Formx_model->get_param_datatable($form_id);
            $this->template('v_flow_list', $data);
        }else{
            show_404();
        }
	}

    public function getDatatable()
    {
        $flow_id = $this->input->post('flow_id');
        $form_id = $this->input->post('form_id');
        $flow = $this->M_flow->get($flow_id);
        $form_param = $this->Formx_model->get_param_datatable($form_id);

        $customActionName=$this->input->post('customActionName');
        $records         = array();

        if ($customActionName == "delete") {
            $records=$this-> delete_checked();
        }

        $iDisplayLength = ($this->input->get_post('length')) ? $this->input->get_post('length') : 10 ;
        $iDisplayStart  = ($this->input->get_post('start')) ? $this->input->get_post('start') : 0 ;
        $sEcho          = ($this->input->get_post('draw')) ? $this->input->get_post('draw') : 1 ;

        $this->Flow_model->set_table($form_id,'view');
        $t              = $this->Flow_model->get_limit_data_flow($iDisplayStart, $iDisplayLength,$flow);
        $iTotalRecords  = $t['total_rows'];
        $get_data       = $t['get_db'];

        $records["data"] = array();

        $i=$iDisplayStart+1;
        if ($get_data) {
            foreach ($get_data->result() as $d) {
                // $checkbok= '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="group-checkable" name="id[]" value="'.$d->id.'"><span></span></label>';
                $view  = '<a class="btn btn-sm btn-default" title="view"  href="'.site_url('formx/flow/read/'.$flow_id.'/'.$d->t_flow_id).'"><i class="fa fa-book-open fa-lg"></i></a>';
                $edit  = '<a class="btn btn-sm btn-primary" title="edit"  href="'.site_url('formx/flow/form/'.$flow_id.'/'.$d->t_flow_id).'"><i class="fa fa-edit fa-lg"></i></a>';
                $delete  = '<button class="btn btn-sm btn-danger delete" title="delete" data-title="" data-url="'.site_url('formx/flow/delete/'.$d->t_flow_id).'"><i class="fa fa-trash fa-lg"></i></button>';
                $approve  = '<a class="btn yellow openmodal" title="approve"  href="'.site_url('formx/flow/approve/'.$flow_id.'/'.$d->t_flow_id).'"><i class="fa fa-check fa-lg"></i></a>';
                $attch  = '<a class="btn default openmodal" title="support view"  href="'.site_url('formx/attchment/get_file/'.$d->t_flow_id).'"><i class="fa fa-file fa-lg"></i></a>';


                $row = array();
                $row[] =$i++;
                $max_min = $this->M_flow_level_model->get_max_min($flow_id);

                foreach ($form_param->result() as $p) {
                    if ($p->type == 'select'||$p->type == 'select_ajax'||$p->type == 'selfemployee') {
                        if (!empty($d->{$p->column_name})) {
                            $row[] = $this->Formx_model->get_value_dd($p->table_ref,$d->{$p->column_name});
                        } else{
                            $row[]='';
                        }
                        
                    }elseif ($p->type == 'int_separator') {
                        if (!empty($d->{$p->column_name})) {
                            $row[] = number_format($d->{$p->column_name},0, ',', '.') ;
                        }else{
                            $row[]='';
                        }
                    }elseif ($p->type == 'upload') {
                        continue;
                    }elseif ($p->type == 'file') {
                        $row[] = '<a href="'. base_url($p->path_upload.$d->{$p->column_name}).'" class="btn blue"><i class="fa fa-download"></i></a>';
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

                $status = '';

                $progress = round(($d->level_no-1)/($max_min->max-1)*100);
                if($progress >= 100){
                    $progress_color = 'success';
                }elseif($progress >= 50){
                    $progress_color = 'info';
                }else{
                    $progress_color = 'warning';
                }

                $status .='
                    <div class="">
                        <div class="progress-info">
                            <div class="progress-label">
                                <span><a class="openmodal" href="#" data-url="'.site_url('formx/history/note/'.$d->t_flow_id).'">'.$d->level_no.' - '.$d->level_name.'</a></span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="completion mr-2">'.$progress.'%</span>
                            <div>
                            <div class="progress">
                                <div class="progress-bar bg-'.$progress_color.'" role="progressbar" aria-valuenow="'.$progress.'" aria-valuemin="0" aria-valuemax="100" style="width: '.$progress.'%;"></div>
                            </div>
                            </div>
                        </div>
                    </div>
                ';
                    
  
                $row[]=$status;
                
                $btn_action = '';
                $is_allowed_edit = false;
                $is_allowed_view = false;

                if ($max_min->max > $d->level_no) {
                    if($d->to_user == $this->data['user']->id){
                        $is_allowed_edit = true;
                    } else if($d->usergroup_id == $this->usergroup_id) {
                        $is_allowed_edit = true;
                    } else if(empty($d->usergroup_id) && empty($d->is_approve_leader) && $d->created_by==$this->data['user']->id){
                        $is_allowed_edit = true;
                    }
                }else{
                    $is_allowed_view = true;
                }

                if ($is_allowed_view || $this->usergroup_id == ROLE_ADMIN) {
                    $btn_action .= $view;
                }

                if ($is_allowed_edit) {
                    $btn_action .= $edit;
                }

                if (!empty($flow->btn)) {
                    $btn_action .= $flow->btn;
                }
                if($d->level_no == 1 || $this->usergroup_id == ROLE_ADMIN){
                    $btn_action .= $delete;
                }

                
                $row[] = $btn_action;
                $records["data"][] = $row;
            }
        }
        $records["draw"] = $sEcho;
        $records["recordsTotal"] = $iTotalRecords;
        $records["recordsFiltered"] = $iTotalRecords;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    public function read($flow_id=null,$t_flow_id=null)
    {
        $this->data['authorize'] = 'view';
        $this->form($flow_id,$t_flow_id);
    }

    public function form($flow_id=null,$t_flow_id=null)
    {
        if(empty($t_flow_id)){
            $data_new_flow = array(
                'flow_id' => $flow_id, 
                'level_no' => 1,
                'created_by' =>$this->data['user']->id 
            );
            $t_flow_id = $this->T_flow_model->insert($data_new_flow);
            redirect('formx/flow/form/'.$flow_id.'/'.$t_flow_id, 'refresh');
        }else{}

        $this->data['menu_kode'] = 'flow_'.$flow_id;
        

        if($t_flow = $this->T_flow_model->get($t_flow_id)){
            // $flow_id = $t_flow->flow_id;
            $level_no = $t_flow->level_no;
        }else{
            show_error('Form not found');
        }
        


        $this->db->where('id', $flow_id);
        $m_flow = $this->db->get('m_flow');
        if ($m_flow->num_rows() > 0) {
            $data['flow'] = $m_flow->row();
            
            $w = array(
                'level_no' => $level_no,
                'flow_id' => $flow_id,
                 );
            $flow_level = $this->M_flow_level_model->get($w);
            $w = array(
                'level_no' => $level_no+1,
                'flow_id' => $flow_id,
                 );
            $data['flow_level_next'] = $this->M_flow_level_model->get($w);

            if ($this->data['authorize'] == 'view') {
                $data['form_write_arr'] = array();
                $data['form_read_arr'] = array_merge(
                                             array_filter(explode(',', $flow_level->form_id)),
                                             array_filter(explode(',', $flow_level->form_id_read))
                                         );
                $data['form_many_write_arr'] = array();
                $data['form_many_read_arr'] = array_merge(
                                        array_filter(explode(',', $flow_level->form_many)),
                                        array_filter(explode(',', $flow_level->form_many_read))
                                    );
            }else{
                
                $data['form_write_arr'] = array_filter(explode(',', $flow_level->form_id));
                $data['form_read_arr'] = array_filter(explode(',', $flow_level->form_id_read));
                $data['form_many_write_arr'] = array_filter(explode(',', $flow_level->form_many));
                $data['form_many_read_arr'] = array_filter(explode(',', $flow_level->form_many_read));
            }
            
            $data['max_min'] = $this->M_flow_level_model->get_max_min($flow_id);
            $data['level_no']=$level_no;

            // $data['form_param'] = $this->Formx_model->get_param($form_id);
            $data['action']    = site_url('formx/formx/form_action');
            $data['t_flow_id'] = $t_flow_id;
            $data['flow_id'] = $flow_id;


            $this->template('v_flow_form', $data);
        }else{
            show_error('Form not found');
        }
    }

    public function delete($id)
    {
        $res['success'] = false;
        $res['message'] = 'Hapus gagal';
        

        $row = $this->T_flow_model->get($id);

        if ($this->usergroup_id == ROLE_ADMIN || $row->level_no == 1) {
            $this->T_flow_model->delete($id);
            $res['success'] = true;
            $res['message'] = 'Hapus berhasil';
        } else {
            $res['message'] = 'Not allowed';
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }



    public function approve($flow_id=null,$t_flow_id=null)
    {
        $data['t_flow_id'] = $t_flow_id;
        $data['flow_id'] = $flow_id;

        if (!empty($t_flow_id)) {
            if($t_flow = $this->T_flow_model->get($t_flow_id)){
                $flow_id = $t_flow->flow_id;
                $level_no = $t_flow->level_no;
            }else{
                show_error('Form not found');
            }
        }

        $w = array(
                'level_no' => $level_no+1,
                'flow_id' => $flow_id,
                 );
        $data['flow_level_next'] = $this->M_flow_level_model->get($w);

        $data['max_min'] = $this->M_flow_level_model->get_max_min($flow_id);
        $data['level_no']=$level_no;
        $this->template('v_approve',$data);
    }

    public function update_level()
    {
        $res['success'] = false;
        $res['message'] = 'Simpan gagal';

        $flow_id=$this->input->post('flow_id');
        $t_flow_id=$this->input->post('t_flow_id');
        if (empty($t_flow_id)|| empty($flow_id)) {
            $this->exit_json('No flow id');
        }else{
            $t_flow = $this->T_flow_model->get($t_flow_id);
            $from_level_no = $t_flow->level_no;
        }
        $w= array('flow_id'=>$flow_id,'level_no'=>$from_level_no);
        $m_flow_level = $this->M_flow_level_model->get($w);

        // check form is filled
        if(!empty($m_flow_level->form_id)){
            $pieces_arr = explode(",", $m_flow_level->form_id);
            foreach ($pieces_arr as $formidcheck) {
                $query = $this->db->query("SELECT * from s_form WHERE id=$formidcheck");
                $tableformcheck = $query->row()->form_table;
                $query = $this->db->query("SELECT * FROM $tableformcheck WHERE t_flow_id = $t_flow_id");
                if($query->num_rows() == 0){
                    $this->exit_json('Please save before continue');
                }
            }
        }
        
        $catatan      =$this->input->post('catatan');
        $action       =$this->input->post('action');
        $target_level =$this->input->post('target_level');
        $to_user      = (!empty($this->input->post('to_user'))) ? $this->input->post('to_user') : NULL;
        
        if (empty($target_level)) {
            if ($action == "ekposisi") {
                $level_no = $from_level_no+1;
                $w = array(
                    'level_no' => $level_no,
                    'flow_id' => $flow_id,
                     );
                $flow_level_target = $this->M_flow_level_model->get($w);
                if($flow_level_target->is_approve_leader){
                    $leaderUserId = $this->getLeaderUserId($this->data['user']->id);
                    if(empty($leaderUserId)){
                        $level_no++;
                    }else{
                        $to_user = $leaderUserId;
                    }
                }
            }else if ($action == "disposisi") {
                
                if($m_flow_level->back_to_level_no != '') 
                    $level_no = $m_flow_level->back_to_level_no;
                else 
                    $level_no = $from_level_no-1;

                $w = array(
                    'level_no' => $level_no,
                    'flow_id' => $flow_id,
                     );
                $flow_level_target = $this->M_flow_level_model->get($w);
                if($flow_level_target->to_user){
                    $w = array(
                        't_flow_id' => $t_flow_id,
                        'from_level_no' => $level_no,
                         );
                    $this->db->order_by('id', 'desc');
                    $history = $this->T_flow_history_model->get($w);
                    $to_user = $history->user_id;
                }
            }
        }

        $data = array(
            'user_id'          => $this->data['user']->id, 
            'approval_catatan' => $catatan, 
            'approval_status'  => $action, 
            'approval_date'    => date('Y-m-d h:i:s'), 
            'level_no'         => $level_no, 
            'from_level_no'    => $from_level_no, 
            'flow_id'          => $flow_id, 
            'to_user'          => $to_user, 
        );
        $w = array(
            'id' => $t_flow_id, 
        );

        if ($a=$this->T_flow_model->replace($data,$w) != false) {
            $data['t_flow_id'] = $t_flow_id;
            $this->T_flow_history_model->insert($data);

            $res['url']     = site_url('formx/flow/table/'.$flow_id);
            $res['success'] = true;
            $res['message'] = 'Simpan berhasil';
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));

    }

    function getLeaderUserId($userId)
    {
        $q="SELECT m_employee.parent_id FROM s_user join m_employee on m_employee.id =s_user.employee_id  WHERE s_user.id = $userId";
        $query = $this->db->query($q);
        $leaderEmployeeId = $query->row()->parent_id;
        
        if(empty($leaderEmployeeId)) return '';

        $q="SELECT id FROM s_user WHERE employee_id = $leaderEmployeeId";
        $query = $this->db->query($q);
        $userId = $query->row()->id;
        return $userId;
    }

}
