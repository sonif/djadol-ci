<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Formx_model extends MY_Model {

	protected $timestamps = FALSE;
    // protected $soft_deletes = FALSE;

	public function set_table($form_id,$type_table='table')
	{
		$this->db->where('id', $form_id);
        $m_form = $this->db->get('s_form')->row();
        if($type_table == 'view'){
            if(!empty($m_form->form_table_read)){
                $this->table = $m_form->form_table_read;
            }
            else{
                $this->table=$m_form->form_table;
            }
        }
        else{
            $this->table=$m_form->form_table;
        }

        $this->set_pk($m_form->form_table);

        if ($m_form->is_soft_delete) {
            $this->soft_deletes= TRUE ;
            $this->_deleted_at_field= 'deleted_at' ;
        }

        

        // if ($this->db->field_exists('siteid', $this->table))
        // {
        //     $this->before_create[]='add_siteid';
        // }
	}

    public function set_pk($table)
    {
        if($this->db->dbdriver == 'mysqli'){
            $query = "
                SHOW KEYS FROM $table WHERE Key_name = 'PRIMARY'
            ";
            $this->primary_key = $this->db->query($query)->row()->Column_name ?? 'id';
        }else{
            $query = "SELECT c.column_name, c.ordinal_position
                FROM information_schema.key_column_usage AS c
                LEFT JOIN information_schema.table_constraints AS t
                ON t.constraint_name = c.constraint_name
                WHERE t.table_name = '$table' AND t.constraint_type = 'PRIMARY KEY';";
            $this->primary_key = $this->db->query($query)->row()->column_name;
        }
    }

    public function add_siteid($data)
    {
        $data['siteid'] = $this->session->userdata('siteid');
        return $data;
    }

    public function get_param($form_id)
    {
        $this->db->where('form_id', $form_id);
        $this->db->where('active', '1');
        $this->db->order_by('order_no', 'asc');
        return $this->db->get('s_form_param');
    }

    public function get_param_unique($form_id)
    {
        $this->db->where('form_id', $form_id);
        $this->db->where('is_unique', 1);
        $this->db->order_by('order_no', 'asc');
        return $this->db->get('s_form_param');
    }

    public function get_param_datatable($form_id)
    {
        $this->db->where('form_id', $form_id);
        $this->db->where('column_datatable', '1');
        $this->db->order_by('order_no', 'asc');
        return $this->db->get('s_form_param');
    }

    public function get_filter($form_id)
    {
        $this->db->where('form_id', $form_id);
        return $this->db->get('s_form_filter');
    }

	public function get_limit_data($limit, $start) {
        $user = $this->data['user'];
        // var_dump($user);
		$form_id=$this->input->post('form_id');
        $form_param = $this->get_param_datatable($form_id);
        $form_filter = $this->get_filter($form_id);

        $order            = $this->input->post('order');
        $dataorder = array();
        $where = array();

        $i=0;
        $dataorder[$i++] = $this->primary_key;
        foreach ($form_param->result() as $value) {
        	$dataorder[$i++] = $value->column_name;
        }

      	foreach ($form_param->result() as $p) {
            if ($p->type == 'upload') {
                continue;
            }
            if ($p->type == 'datetime') {
                if(!empty($this->input->post($p->column_name.'_min'))){
                    $where[$p->column_name.' >='] = $this->input->post($p->column_name.'_min')." 00:00:00";
                }
                if(!empty($this->input->post($p->column_name.'_max'))){
                    $where[$p->column_name.' <='] = $this->input->post($p->column_name.'_max')." 24:00:00";
                }
            }
            if ($p->type == 'int' || $p->type == 'int_separator' || $p->type == 'date') {
                if(!empty($this->input->post($p->column_name.'_min'))){
                    $where[$p->column_name.' >='] = $this->input->post($p->column_name.'_min');
                }
                if(!empty($this->input->post($p->column_name.'_max'))){
                    $where[$p->column_name.' <='] = $this->input->post($p->column_name.'_max');
                }
            }
            elseif ($p->type == 'select_ajax' || $p->type == 'select') {
                if(!empty($this->input->post($p->column_name))){
                    $where[$p->column_name] = $this->input->post($p->column_name);
                }
            }
            else{
            	if(!empty($this->input->post($p->column_name))){
    	            $where["LOWER($p->column_name) LIKE"] = '%'.strtolower($this->input->post($p->column_name)).'%';
    	        }
            }
        }
        // foreach ($form_filter->result() as $p) {
        //     if(!empty($this->input->post($p->column_name))){
        //         $where[$p->column_name] = $this->input->post($p->column_name);
        //     }
        // }
        if ($this->input->post('parent_id')) {
            $where[$this->input->post('parent_column')] = $this->input->post('parent_id');
        }

        if($user->usergroup_id != 1 ){
            $this->db->where('company_id', $user->company_id, FALSE);
        }
        // if ($this->db->field_exists('user_siteid', $this->table))
        // {
        //     $siteid_arr = json_decode($user->user_siteid,true);
        //     $w_custom = "user_siteid::jsonb ?| array".str_replace("\"","'",$user->user_siteid);
        //     $this->db->where($w_custom, NULL, FALSE);
        // }
        // elseif ($this->db->field_exists('siteid', $this->table))
        // {
        //     $siteid_arr = json_decode($user->user_siteid,true);
        //     $this->db->where_in('siteid', $siteid_arr);
        // }
        $this->db->where($where);
        $result['total_rows'] = $this->count_rows();

        // if ($this->db->field_exists('user_siteid', $this->table))
        // {
        //     $siteid_arr = json_decode($user->user_siteid,true);
        //     $w_custom = "user_siteid::jsonb ?| array".str_replace("\"","'",$user->user_siteid);
        //     $this->db->where($w_custom, NULL, FALSE);
        // }
        // elseif ($this->db->field_exists('siteid', $this->table))
        // {
        //     $siteid_arr = json_decode($user->user_siteid,true);
        //     $this->db->where_in('siteid', $siteid_arr);
        // }
        if($user->usergroup_id != 1 ){
            $this->db->where('company_id', $user->company_id, FALSE);
        }
        $this->db->where($where);
        if ($order) {
            $this->db->order_by( $dataorder[$order[0]["column"]],  $order[0]["dir"]);
        }
        $this->db->limit($start, $limit);
        $result['get_db']=$this->get_all();
        return $result;
    }

    public function get_row($form_id,$id)
    {
        $this->set_table($form_id,'view');
        return $this->get($id);
    }

    public function get_row_by_flow_id($form_id,$t_flow_id)
    {
        $this->db->where('id', $form_id);
        $m_form = $this->db->get('s_form');
        if ($m_form->num_rows() > 0) {
            $form = $m_form->row();

            $this->db->where('t_flow_id', $t_flow_id);
            $d = $this->db->get($form->form_table);
            if ($d->num_rows() > 0) {
                return $d->row();
            }else{
                return false;
            }
        }else{
            return false;
        }
    }

    public function get_value_dd($m='',$id,$data=null)
    {
        $sql = " SELECT * FROM s_dropdown WHERE dd_title='$m'";
        $setting_row = $this->db->query($sql);

        if ($setting_row->num_rows() > 0) {
            $setting = $setting_row->row();

            if($setting->table_name == 'm_flow_level')
                return $this->getNameFlowLevel($setting->dd_field_id,$id,$data);

            if($options = json_decode($setting->json_value,true)){
                if (array_key_exists($id,$options))
                    return $options[$id];
                else
                    return '';
            }

            $table = $setting->table_name;
            $dd_id = $setting->dd_field_id;
            $dd_name = $setting->dd_field_name;
        }else{
            $table = $m;
            $dd_id = 'id';
            $dd_name = 'name';
        }

        $this->db->where($dd_id, $id);
        $c = $this->db->get($table);
        if ($c->num_rows() > 0) {
            return $c->row()->{$dd_name};
        } else {
            return '';
        }

    }

    public function getNameFlowLevel($flow_id,$level_no,$data=null)
    {
        $this->load->model('M_flow_level_model');

        $sql = " SELECT * FROM m_flow_level WHERE flow_id='$flow_id' AND level_no=$level_no";
        $r = $this->db->query($sql);
        if ($r->num_rows() > 0) {
            $d = $r->row();

            $max_min = $this->M_flow_level_model->get_max_min($flow_id);
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
                            <span><a class="openmodal" href="#" data-url="'.site_url('formx/history/note/'.$data->t_flow_id).'">'.$d->level_no.' - '.$d->level_name.'</a></span>
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

            return $status ; 
        }
        return '';
    }

    public function get_array_dd($m='')
    {
        $sql = " SELECT * FROM s_dropdown WHERE table_name='$m' OR dd_title='$m'";
        $setting_row = $this->db->query($sql);
        if ($setting_row->num_rows() > 0) {
            $setting = $setting_row->row();

            if($options = json_decode($setting->json_value,true)){
              return $options;
            }

            $table = $setting->table_name;
            $dd_id = $setting->dd_field_id;
            $dd_name = $setting->dd_field_name;
            $dd_desc = $setting->dd_field_subname;
        }else{
            $table = $m;
            $dd_id = 'id';
            $dd_name = 'name';
            $dd_desc = '';
        }

        if ($this->db->field_exists('siteid', $table))
        {
            $siteid = $this->input->get_post('siteid');
            if (empty($siteid)) {
                $this->db->where('user_id', $this->user_id);
                $user = $this->db->get('s_user');
                if ($user->num_rows() > 0) {
                    $siteid_arr = json_decode($user->row()->user_siteid,true);
                    $this->db->where_in('siteid', $siteid_arr);
                }
            }else{
                $this->db->where_in('siteid', [$siteid]);
            }
        }

        $this->db->order_by($dd_id, 'asc');
        $c = $this->db->get($table);
        $options = array();
        foreach ($c->result() as $r) {
            $options[$r->{$dd_id}] = $r->{$dd_name};
        }
        return $options;

    }
}

/* End of file formx_model.php */
/* Location: ./application/models/formx_model.php */
