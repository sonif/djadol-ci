<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Transaksi extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
    public function __construct()
	{
			parent::__construct();
			// Your own constructor code
			// $this->lang->load('app_lang', 'english');
	}

	public function index($id = null)
	{		
        $data = array();
    }
    

    public function warehouse(){
        $v_data = array();
        $this->template('v_transaksi_warehouse',$v_data);
    }

    public function post_stockwarehouse(){
        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);

        $q = "INSERT INTO jurnal_stock_warehouse(company_id,created_by,created_at,warehouse_id,status) VALUES(
            '".$this->data['user']->company_id."'
            ,'".$this->data['user']->id."'
            ,NOW()
            ,'".$data['warehouse_id']."'
            ,'draft'
        )";
        $this->db->query($q);
        $inquiry_id = $this->db->insert_id();   

        $products = $data['detail'];
        $totalTransaksi = 0;
        foreach($products as $i){
            $rproduk = $this->get_product($i['product_id']);
            $q_detail = "INSERT INTO jurnal_stock_warehouse_detail(jurnal_id,product_id,product_name,count,price,subtotal,created_by,created_at,company_id) VALUES(
                '".$inquiry_id."'
                ,'".$i['product_id']."'
                ,'".$rproduk->name."'
                ,'".$i['jumlah']."'
                ,'".$rproduk->price_purchase."'
                ,'".($rproduk->price_purchase * $i['jumlah'])."'
                ,'".$this->data['user']->id."'
                ,NOW()
                ,'".$this->data['user']->company_id."'
            )";
            $this->db->query($q_detail);
            $totalTransaksi += ($rproduk->price_purchase * $i['jumlah']);
        }

        $q_update_total = "UPDATE jurnal_stock_warehouse SET total='".$totalTransaksi."' WHERE id='".$inquiry_id."'";
        $this->db->query($q_update_total);

        $res['success'] = true;
        $res['message'] = 'Data berhasil disimpan'; 
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function alokasi_stocksales(){
        $v_data = array();
        $this->template('v_alokasi_stocksales',$v_data);
    }
    
    public function get_product($id){
        $q = "SELECT name,price_purchase FROM t_product WHERE id='".$id."'";
        $sql = $this->db->query($q);
        $res = $sql->row();
        return $res;
    }

    public function get_productname($id){
        $q = "SELECT name,price_purchase FROM t_product WHERE id='".$id."'";
        $sql = $this->db->query($q);
        $res = $sql->row();
        return $res->name;
    }
    
    public function post_stocksales(){
        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);
        $products = $data['detail'];
        $checking_stock = true;
        foreach($products as $i){
            if($this->get_stockwarehouse_product($i['product_id'],$data['warehouse_id']) < $i['jumlah']){
                $checking_stock = false;
                break;
            }
        }

        if(!$checking_stock){
            $res['success'] = false;
            $res['message'] = 'Stok di Warehouse tidak mencukupi'; 
            $this->output->set_content_type('application/json')->set_output(json_encode($res));
            return;
        }else{
            $q = "INSERT INTO jurnal_inquiry_agen(company_id,created_by,created_at,agen_id,status) VALUES(
                '".$this->data['user']->company_id."'
                ,'".$this->data['user']->id."'
                ,NOW()
                ,'".$data['sales_id']."'
                ,'draft'
            )";
            $this->db->query($q);
            $inquiry_id = $this->db->insert_id(); 
            foreach($products as $i){
                $nama_produk = $this->get_productname($i['product_id']);
                $q_detail = "INSERT INTO jurnal_inquiry_detail(jurnal_id,product_id,product_name,count,created_by,created_at,company_id) VALUES(
                    '".$inquiry_id."'
                    ,'".$i['product_id']."'
                    ,'".$nama_produk."'
                    ,'".$i['jumlah']."'
                    ,'".$this->data['user']->id."'
                    ,NOW()
                    ,'".$this->data['user']->company_id."'
                )";
                $this->db->query($q_detail);
                // kurangi stock di warehouse
                $q_stock = "UPDATE stock_warehouse SET count = count - '".$i['jumlah']."'
                , updated_by ='".$this->data['user']->id."'
                , updated_at = NOW() 
                WHERE product_id='".$i['product_id']."' AND warehouse_id='".$data['warehouse_id']."'";
                $this->db->query($q_stock);
            }
            $res['success'] = true;
            $res['message'] = 'Data berhasil disimpan'; 
            $this->output->set_content_type('application/json')->set_output(json_encode($res));
            return;
        }
        
    }

    public function input_per_dusun(){
        $v_data = array();
        $this->template('v_input_per_dusun',$v_data);
    }

    public function getDatatable_jurnalwarehouse()
    {
    	$this->load->model('M_jurnalwarehouse');

        $customActionName=$this->input->post('customActionName');
        $records         = array();

        if ($customActionName == "delete") {
            $records=$this-> delete_checked();
        }

        $iDisplayLength = ($this->input->get_post('length')) ? $this->input->get_post('length') : 10 ;
        $iDisplayStart  = ($this->input->get_post('start')) ? $this->input->get_post('start') : 0 ;
        $sEcho          = ($this->input->get_post('draw')) ? $this->input->get_post('draw') : 1 ;

        $column_sort = array(        	
            1=>'created_at'
            // ,2=>'customer_code'
        );

        $t              = $this->M_jurnalwarehouse->get_limit_datatables($iDisplayStart, $iDisplayLength,$column_sort);

        $iTotalRecords  = $t['total_rows'];
        $get_data       = $t['get_db'];

        $records["data"] = array();

        $i=$iDisplayStart+1;
        if ($get_data) {
            foreach ($get_data as $d) {
                
                $action = ' <button lang="'.$d->id.'" title="Detil" class="btn btn-sm btn-info jq-detil"><i class="fa fa-list"></i></button>';
                if( $d->status == 'draft' ):
                    $action .= ' <button lang="'.$d->id.'" title="terima" class="btn btn-sm btn-warning jq-check"><i class="fa fa-check"></i></button>';
                endif;

                $records["data"][] = array(
                    $i++,
                    $d->created_at,
                    $d->warehouse_name,
                    $d->total,
                    $d->status,
                    //$d->description,
					//Action
                    $action
                );
            }
        }
        $records["draw"] = $sEcho;
        $records["recordsTotal"] = $iTotalRecords;
        $records["recordsFiltered"] = $iTotalRecords;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }
    
    public function get_stockwarehouse_product($product_id,$warehouse_id){
        $q = "SELECT * FROM stock_warehouse WHERE product_id='".$product_id."' AND warehouse_id='".$warehouse_id."'";
        $sql = $this->db->query($q);
        $res = $sql->num_rows();
        return $res;
    }

    public function get_warehouseid_from_jurnal($jurnal_id){
        $q = "SELECT warehouse_id FROM jurnal_stock_warehouse WHERE id='".$jurnal_id."'";
        $sql = $this->db->query($q);
        $r = $sql->row();
        return $r->warehouse_id;
    }

    public function terima_jurnal_warehouse(){
        $id = $this->input->post('id');

        $q = "SELECT * FROM jurnal_stock_warehouse_detail WHERE jurnal_id='".$id."'";
        $sql = $this->db->query($q);
        foreach($sql->result() as $r){
            // tambah stock di warehouse
            if($this->get_stockwarehouse_product($r->product_id,$this->get_warehouseid_from_jurnal($id)) > 0){
                // update stock
                $q_stock = "UPDATE stock_warehouse SET count = count + '".$r->count."'
                , updated_by ='".$this->data['user']->id."'
                , updated_at = NOW() 
                WHERE product_id='".$r->product_id."' AND warehouse_id='".$this->get_warehouseid_from_jurnal($id)."'";
                $this->db->query($q_stock);
                continue;
            }else{
                // insert stock
                $q_stock = "INSERT INTO stock_warehouse(product_id,warehouse_id,count,created_by,created_at,company_id) VALUES(
                    '".$r->product_id."'
                    ,'".$this->get_warehouseid_from_jurnal($id)."'
                    ,'".$r->count."'
                    ,'".$this->data['user']->id."'
                    ,NOW()
                    ,'".$this->data['user']->company_id."'
                )";
                $this->db->query($q_stock);
            }
        }

        $q_update = "UPDATE jurnal_stock_warehouse SET status = 'diterima'
        , updated_by ='".$this->data['user']->id."'
        , updated_at = NOW() WHERE id='".$id."'";
        $this->db->query($q_update);

        $res['success'] = true;
        $res['message'] = 'Stok Warehouse telah Masuk, Jurnal berhasil diterima'; 
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
        
    }

    public function jurnal_warehouse_detil(){
        $id = $this->input->post('id');
        $q = "SELECT * FROM jurnal_stock_warehouse_detail WHERE jurnal_id='".$id."'";
        $sql = $this->db->query($q);
        $data['record'] = $sql;

        $q = "SELECT jurnal_stock_warehouse.*, m_warehouse.name as warehouse_name 
            FROM jurnal_stock_warehouse 
            LEFT JOIN m_warehouse ON m_warehouse.id = jurnal_stock_warehouse.warehouse_id
            WHERE jurnal_stock_warehouse.id='".$id."'";
        $sql = $this->db->query($q);
        $data['header'] = $sql->row();

        $this->load->view('v_transaksi_warehouse_detail',$data);
    }

	public function getDatatable_belum()
    {
    	$this->load->model('M_transaksi');

        $customActionName=$this->input->post('customActionName');
        $records         = array();

        if ($customActionName == "delete") {
            $records=$this-> delete_checked();
        }

        $iDisplayLength = ($this->input->get_post('length')) ? $this->input->get_post('length') : 10 ;
        $iDisplayStart  = ($this->input->get_post('start')) ? $this->input->get_post('start') : 0 ;
        $sEcho          = ($this->input->get_post('draw')) ? $this->input->get_post('draw') : 1 ;

        $column_sort = array(        	
            1=>'customer_fullname'
            ,2=>'customer_code'
        );

        $t              = $this->M_transaksi->get_limit_datatables($iDisplayStart, $iDisplayLength,$column_sort);

        $iTotalRecords  = $t['total_rows'];
        $get_data       = $t['get_db'];

        $records["data"] = array();

        $i=$iDisplayStart+1;
        if ($get_data) {
            foreach ($get_data as $d) {
                
                // $action = ' <button lang="'.$d->productcategory_id.'" title="edit" class="btn btn-info jq-edit"><i class="fa fa-edit"></i></button>';
                // $action .= ' <button lang2="'.$d->productcategory_name.'" lang="'.$d->productcategory_id.'" title="remove" class="btn btn-danger jq-del"><i class="fa fa-trash"></i></button>';
                
                $records["data"][] = array(
                    $i++,
                    $d->customer_fullname,
                    $d->customer_code,
					//Action
                    // $action
                );
            }
        }
        $records["draw"] = $sEcho;
        $records["recordsTotal"] = $iTotalRecords;
        $records["recordsFiltered"] = $iTotalRecords;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    function cetak_nota($id){
        $this->load->model('M_transaksi');
        $q = "SELECT * FROM v_input_tagihan WHERE transaksi_id='".$id."'";
        // echo $q;
        $sql = $this->db->query($q);
        $data['record'] = $sql->row();
        
        if(($data['record']->transaksi_status != 'lunas')):
            $pinalty = str_replace(".","",$this->input->post('transaksi_pinalty'));

            $q_update = "UPDATE t_transaksi SET "
                ."transaksi_price = '".$data['record']->productcategory_price."' "
                .",transaksi_price_type = '".$data['record']->productcategory_name."' " 
                .",transaksi_status = 'lunas' " 
                .",transaksi_printed_date = NOW() " 
                .",transaksi_printed_by = '".$this->data['user']->id."' " 
                .",transaksi_pinalty = '".$pinalty."' " 
                .",transaksi_admin_price = '".$this->M_transaksi->get_config_val('admin_price')."' " 
            ."WHERE transaksi_id='".$id."'";
            
            $sql_update = $this->db->query($q_update);

            
            if($sql = $this->db->query($q)){
                $data['result'] = $sql->row();
                $data['success'] = 1;
                $data['msg'] = '';
            }else{
                $data['success'] = 0;
                $data['msg'] = 'Ada Kendala';
            }
        else:
            $data['success'] = 1;
            $data['msg'] = '';
        endif;

        $this->output->set_content_type('application/json')->set_output(json_encode($data));
    }
    
}