<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_transaksi extends MY_Model
{

    public $table = 'v_tagihan';
    public $primary_key = 'transaksi_id';
    public $label = 'transaksi_year_issue';

    function __construct()
    {
        parent::__construct();
        $this->soft_deletes = FALSE;
        $this->timestamps = FALSE;        
    }

    function get_config_val($name){
        $q = "SELECT * FROM m_config WHERE config_name='".$name."'";
        $sql = $this->db->query($q);
        $r = $sql->row();
        return $r->config_value;
    }
    
    function get_month_array(){
        $data = array('1'=>'Januari'
                    ,'2'=>'Februari'
                    ,'3'=>'Maret'
                    ,'4'=>'April'
                    ,'5'=>'Mei'
                    ,'6'=>'Juni'
                    ,'7'=>'Juli'
                    ,'8'=>'Agustus'
                    ,'9'=>'September'
                    ,'10'=>'Oktober'
                    ,'11'=>'Nopember'
                    ,'12'=>'Desember'
                );
        return $data;
    }

    // get total rows
    function get_limit_datatables($limit, $start) {
        $order            = $this->input->post('order');
        $dataorder = array();
        $where = array();

        $i=1;
        $dataorder[$i++] = 'customer_fullname';
        $dataorder[$i++] = 'customer_code';

        $q = "select * from m_customer 
        where customer_id not in 
        (SELECT transaksi_customer_id from t_transaksi 
            where transaksi_year_issue ='".$this->input->post('filter_cb_year')."' 
                AND transaksi_month_issue = '".$this->input->post('filter_cb_month')."')";
        
        if(!empty($this->input->post('filter_customer_name'))){
            $q .= " AND (LOWER(customer_fullname) LIKE '%".$this->input->post('filter_customer_name')."%') ";
        }

        $dt = $this->db->query('SELECT COUNT(*) as jum FROM ('.$q.') a');

        $result['total_rows'] = $dt->row()->jum;
        
        $this->where($where);
        if ($order) {
            $this->order_by( $dataorder[$order[0]["column"]],  $order[0]["dir"]);
        }
        
        $dt = $this->db->query($q." LIMIT ".$limit.",". $start);

        $result['get_db']=$dt->result();

        return $result;
    }

}
