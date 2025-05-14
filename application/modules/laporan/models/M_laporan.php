<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_laporan extends MY_Model
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
    
    function get_month_array(){
        $data = array('1'=>'01. Jan'
                    ,'2'=>'02. Feb'
                    ,'3'=>'03. Mar'
                    ,'4'=>'04. Apr'
                    ,'5'=>'05. Mei'
                    ,'6'=>'06. Jun'
                    ,'7'=>'07. Jul'
                    ,'8'=>'08. Agt'
                    ,'9'=>'09. Sep'
                    ,'10'=>'10. Okt'
                    ,'11'=>'11. Nop'
                    ,'12'=>'12. Des'
                );
        return $data;
    }

    function get_config_val($name){
        $q = "SELECT * FROM m_config WHERE config_name='".$name."'";
        $sql = $this->db->query($q);
        $r = $sql->row();
        return $r->config_value;
    }

    function get_month_array_s(){
        $data = array('1'=>'Jan'
                    ,'2'=>'Feb'
                    ,'3'=>'Mar'
                    ,'4'=>'Apr'
                    ,'5'=>'Mei'
                    ,'6'=>'Jun'
                    ,'7'=>'Jul'
                    ,'8'=>'Agt'
                    ,'9'=>'Sep'
                    ,'10'=>'Okt'
                    ,'11'=>'Nop'
                    ,'12'=>'Des'
                );
        return $data;
    }

    function get_dusun(){
        $q = $this->db->query("SELECT * FROM m_dusun");
        return $q->result();
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
