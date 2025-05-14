<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Users_model extends MY_Model
{

    public $table = 's_user';
    public $primary_key = 'id';
    public $label = 'full_name';
    public $fillable = array(); // If you want, you can set an array with the fields that can be filled by insert/update
    public $protected = array('id'); // ...Or you can set an array with the fields that cannot be filled by insert/update

    function __construct()
    {
        parent::__construct();
        $this->soft_deletes = TRUE;
        $this->has_one['users_groups'] = array('Users_groups_model','id','users_groups_id');

    }

    // get total rows
    function get_limit_data($limit, $start) {
        $order            = $this->input->post('order');
        $dataorder = array();
        $where = array();

        $i=1;
        $dataorder[$i++] = 'email';
        $dataorder[$i++] = 'full_name';
        $dataorder[$i++] = 'phone';
        $dataorder[$i++] = 'users_groups_name';
        $dataorder[$i++] = 'active';
        if(!empty($this->input->post('username'))){
            $where['LOWER(username) LIKE'] = '%'.strtolower($this->input->post('username')).'%';
        }
        if(!empty($this->input->post('email'))){
            $where['LOWER(email) LIKE'] = '%'.strtolower($this->input->post('email')).'%';
        }
        if(is_numeric($this->input->post('active'))){
            $where['active'] = $this->input->post('active');
        }
        if(!empty($this->input->post('full_name'))){
            $where['LOWER(full_name) LIKE'] = '%'.strtolower($this->input->post('full_name')).'%';
        }
        if(!empty($this->input->post('phone'))){
            $where['LOWER(phone) LIKE'] = '%'.strtolower($this->input->post('phone')).'%';
        }
        if(!empty($this->input->post('users_groups_name'))){
            $where['LOWER(users_groups_name) LIKE'] = '%'.strtolower($this->input->post('users_groups_name')).'%';
        }

        $this->where($where);
        $this->db->join('users_groups', 'users_groups.id = '.$this->table.'.users_groups_id', 'left');
        $tempdb = clone $this->db;
        $result['total_rows'] = $this->count_rows();

        $this->_database = $tempdb;
        $this->fields($this->table.'.*,users_groups.name as users_groups_name');
        $this->order_by( $dataorder[$order[0]["column"]],  $order[0]["dir"]);
        $this->limit($start, $limit);
        $result['get_db']=$this
                            ->get_all();
        return $result;
    }

    function create_random_code($length = 8, $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') {

        $str = '';
        $max = strlen($keyspace)-1;
        for ($i = 0; $i < $length; ++$i) {
            $str .= $keyspace[random_int(0, $max)];
        }
        return $str;

    }

    public function forgotten_password_check($code)
    {
        $w = array(
            'forgotten_password_code' => $code,
            'forgotten_password_time >' => time(),
            );
        return $this->get($w);

    }

    public function encrypt_password($pass)
    {
        return password_hash($pass, PASSWORD_BCRYPT);
    }

    public function check_password($pass,$encrypt_pass)
    {
        return password_verify($pass, $encrypt_pass);
    }

}

/* End of file Users_model.php */
/* Location: ./application/models/Users_model.php */
/* Please DO NOT modify this information : */
/* http://harviacode.com */
