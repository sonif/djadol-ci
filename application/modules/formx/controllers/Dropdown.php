<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dropdown extends CI_Controller {

    public $table = "";
    public $dd_id = "id";
    public $dd_name = "name";
    public $dd_desc = "";
    public $dd_img = "";

    

    public function dd($m='')
    {
        $this->load->model('auth/users_model');
        
        if($m == 'dd_usergroup'){
            $user_id = $this->session->userdata('user_id');
            $user = $this->users_model->get($user_id);
            $item = array();
            if($user->usergroup_id != 1){
                
                $res = array("id"=>"4","title"=>"agen");
                array_push($item,$res);
                $output['items'] = $item;
                return $this->output->set_content_type('application/json')->set_output(json_encode($output));
            }
            
        }


        $sql = " SELECT * FROM s_dropdown WHERE dd_title='$m'";
        $setting_row = $this->db->query($sql);
        if ($setting_row->num_rows() > 0) {
            $setting = $setting_row->row();
            if($setting->table_name == 'm_flow_level')
                return $this->flow_level($setting->dd_field_id);

            if(!empty($setting->json_value )){
                $dd_json = json_decode($setting->json_value);
                $res     =array();
                foreach ($dd_json as $key => $value) {
                    $item=array();
                    $item['id']    =  $key;
                    $item['title'] =  $value;
                    $res[] = $item;
                }
                $output["items"]=$res;

                return $this->output->set_content_type('application/json')->set_output(json_encode($output));
            }
            $this->table = $setting->table_name;
            $this->dd_id = $setting->dd_field_id;
            $this->dd_name = $setting->dd_field_name;
            $this->dd_desc = $setting->dd_field_subname;
        }

        if ($this->db->field_exists('siteid', $this->table))
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

        $limit  = ($this->input->get('limit')) ? $this->input->get('limit') : 30 ;
        $page   = ($this->input->get('page')) ? $this->input->get('page') : 1 ;
        $page   = $page - 1;
        if ($this->input->get('q')) {
            $this->db->like("LOWER($this->dd_name)",strtolower($this->input->get('q')));
            if (!empty($dd_desc)) {
                $this->db->or_like("LOWER($dd_desc)",strtolower($this->input->get('q')));
            }
        }

        $this->db->from($this->table);
        $output["total_count"]=$this->db->count_all_results('',false);
        $this->db->limit($limit,($page*$limit));
        $this->db->order_by($this->dd_name, 'asc');
        $data_db =$this->db->get();

        $res     =array();
        if ($data_db->num_rows()>0) {
            foreach ($data_db->result() as $r) {
                $item=array();
                $item['id']    = $r->{$this->dd_id};
                $item['title'] = $r->{$this->dd_name};
                if (!empty($this->dd_desc))
                $item['desc']   = $r->{$this->dd_desc};

                // $item['img'] = $r->{$this->$m->img};

                $res[] = $item;
            }
        }
        $output["items"]=$res;
        // var_dump($output);
        $this->output->set_content_type('application/json')->set_output(json_encode($output));
    }

    public function flow_level($flow_id)
    {
        $sql = " SELECT * FROM m_flow_level WHERE flow_id=$flow_id ORDER BY level_no ASC";
        $data_db = $this->db->query($sql);
        
        $res     =array();
        if ($data_db->num_rows()>0) {
            foreach ($data_db->result() as $r) {
                $item=array();
                $item['id']    = $r->level_no;
                $item['title'] = $r->level_no.' - '.$r->level_name;

                $res[] = $item;
            }
        }
        $output["items"]=$res;
        // var_dump($output);
        $this->output->set_content_type('application/json')->set_output(json_encode($output));
    }

    public function logsheet_unchecked()
    {
        $this->dd_id   ="logsheet_id";
        $this->dd_name ="nama";

        $param_date = $this->input->get('param_date');
        $param_time = $this->input->get('param_time');
        $siteid     = $this->input->get('siteid');
        $sql = "
        SELECT * from (
            SELECT  logsheet_id, nama
            from (
                    select * from
                    (
                        select * from m_param
                        where m_param.logsheet_id notnull
                    )tbl_1
                    left join (select * from t_logsheet where param_date = '$param_date' and param_time = '$param_time') tbl_2 on tbl_1.id_param = tbl_2.param_id
                    left join m_logsheet on m_logsheet.id = tbl_1.logsheet_id
                ) tbl_3
            where tbl_3.param_value isnull and tbl_3.siteid = '$siteid'
            group by logsheet_id, nama
        ) a
        order by logsheet_id asc
        ";

        $this->_show_result($sql);
    }

    public function _show_result($sql)
    {
        $limit  = ($this->input->get('limit')) ? $this->input->get('limit') : 30 ;
        $page   = ($this->input->get('page')) ? $this->input->get('page') : 1 ;
        $page   = $page - 1;
        $offset = $page*$limit;
        $w="";
        if ($q=strtolower($this->input->get('q'))) {
            $w = " LOWER($this->dd_name) LIKE '%$q%'";
            if (!empty($dd_desc)) {
                $w = " OR LOWER($this->dd_desc) LIKE '%$q%'";
            }
            $w = "where $w";
        }
        $sql = "SELECT * FROM ($sql) A $w";

        $sql_count = " SELECT COUNT(*) as total from ($sql) B";
        $output["total_count"] = $this->db->query($sql_count)->row()->total;

        $sql .= " ORDER BY $this->dd_name ASC";
        $sql .= " LIMIT $limit OFFSET $offset";
        $data_db =$this->db->query($sql);

        $res = array();
        if ($data_db->num_rows()>0) {
            foreach ($data_db->result() as $r) {
                $item=array();
                $item['id']    = $r->{$this->dd_id};
                $item['title'] = $r->{$this->dd_name};
                if (!empty($this->dd_desc))
                $item['desc']   = $r->{$this->dd_desc};

                // $item['img'] = $r->{$this->$m->img};

                $res[] = $item;
            }
        }
        $output["items"]=$res;
        // var_dump($output);
        $this->output->set_content_type('application/json')->set_output(json_encode($output));
    }

	public function get($m='')
    {


            $limit  = ($this->input->get('limit')) ? $this->input->get('limit') : 30 ;
            $page   = ($this->input->get('page')) ? $this->input->get('page') : 1 ;
            $page   = $page - 1;
            if ($this->input->get('q')) {
                $this->db->like('LOWER('.$this->name.')',strtolower($this->input->get('q')));
            }

            $this->db->from($m);
            $output["total_count"]=$this->db->count_all_results('',false);
            $this->db->limit($limit,($page*$limit));
            $data_db =$this->db->get();

            $res     =array();
            if ($data_db->num_rows()>0) {
                foreach ($data_db->result() as $r) {
                    $item=array();
                    $item['id']    = $r->{$this->id};
                    $item['title'] = $r->{$this->name};
                    if(!empty($this->desc)) $item['desc'] = $r->{$this->desc};
                    // // $item['img'] = $r->{$this->$m->img};

                    $res[] = $item;
                }
            }
            $output["items"]=$res;
            // var_dump($output);
            $this->output->set_content_type('application/json')->set_output(json_encode($output));

    }

    public function user()
    {
		$this->id   = 'id';
		$this->name = 'name';

		$this->db->where('active', 1);
    	$this->get('users');
    }

}

/* End of file Dropdown.php */
/* Location: ./application/modules/formx/controllers/Dropdown.php */
