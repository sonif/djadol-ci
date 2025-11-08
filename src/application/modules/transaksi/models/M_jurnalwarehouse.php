<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class M_jurnalwarehouse extends MY_Model
{

    public $table = 'jurnal_stock_warehouse';
    public $primary_key = 'id';
    public $label = 'Jurnal Stock Warehouse';

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
        $dataorder[$i++] = 'created_at';
        $dataorder[$i++] = 'warehouse_name';

        $q = "SELECT jsw.id,DATE(jsw.created_at) as created_at,jsw.created_by,FORMAT(jsw.total,0) as total,jsw.description,jsw.status 
            ,mw.name as warehouse_name
            FROM jurnal_stock_warehouse jsw
            LEFT JOIN m_warehouse mw on mw.id = jsw.warehouse_id 
            WHERE 1=1 ";
        // echo $q;
        if(!empty($this->input->post('filter_description'))){
            $q .= " AND (LOWER(jsw.description) LIKE '%".$this->input->post('filter_description')."%') ";
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
