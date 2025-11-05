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
    

    public function alokasi_stocksales(){
        $v_data = array();
        $this->template('v_alokasi_stocksales',$v_data);
    }
    
    public function input_per_dusun(){
        $v_data = array();
        $this->template('v_input_per_dusun',$v_data);
    }

    public function input_per_dusun_ajax(){
        $v_data = array();
        $cb_year = $this->input->post('cb_year');
        $cb_month = $this->input->post('cb_month');

        if(($cb_month-1)<=0){
            $cb_year_before = $cb_year-1;
            $cb_month_before = 12;
        }else{
            $cb_year_before = $cb_year;
            $cb_month_before = $cb_month-1;
        }

        $cb_dusun = $this->input->post('cb_dusun');

        $q = "SELECT customer_id,customer_code,customer_fullname
                    ,t_before.transaksi_count_now as bulan_lalu
                    ,t_now.transaksi_count_now as bulan_ini 
                    ,t_now.transaksi_status
                FROM m_customer 
                left join (SELECT transaksi_count_now,transaksi_customer_id from t_transaksi WHERE transaksi_year_issue = '".$cb_year_before."' AND transaksi_month_issue = '".$cb_month_before."') t_before on m_customer.customer_id = t_before.transaksi_customer_id 
                left join (SELECT transaksi_count_now,transaksi_customer_id,transaksi_status from t_transaksi WHERE transaksi_year_issue = '".$cb_year."'  AND transaksi_month_issue = '".$cb_month."') t_now on m_customer.customer_id = t_now.transaksi_customer_id 
            WHERE customer_dusun_id='".$cb_dusun."'";

        $v_data['v_customer'] = $this->db->query($q);
        $v_data['input_tahun']=$cb_year;
        $v_data['input_bulan']=$cb_month;
        $v_data['input_dusun']=$cb_dusun;

        $this->load->view('v_input_per_dusun_ajax',$v_data);
    }

    function post_input_per_dusun(){
        $q = "SELECT * FROM v_customer WHERE customer_dusun_id='".$this->input->post('input_dusun')."'";
        $sql = $this->db->query($q);

        $this->load->model("M_transaksi_input");
        $this->load->model("M_transaksi");

        foreach($sql->result() as $r):
            $w = array("transaksi_year_issue"=>$this->input->post('input_tahun')
                ,"transaksi_month_issue"=>$this->input->post('input_bulan')
                ,"transaksi_customer_id"=>$r->customer_id
            );
            
            if(!empty($this->input->post("bulan_ini_".$r->customer_id))):
                $bulan_ini = $this->input->post("bulan_ini_".$r->customer_id);
                $bulan_lalu = $this->input->post("bulan_lalu_".$r->customer_id);

                $data = array("transaksi_year_issue"=>$this->input->post('input_tahun')
                    ,"transaksi_month_issue"=>$this->input->post('input_bulan')
                    ,"transaksi_customer_id"=>$r->customer_id
                    ,"transaksi_count_now"=>$bulan_ini
                    ,"transaksi_count_before"=>$bulan_lalu
                    ,"transaksi_price_type"=>$r->customer_productcategory_id
                    ,"transaksi_price"=>$r->productcategory_price
                    ,"transaksi_admin_price"=>$this->M_transaksi->get_config_val('admin_price')
                );

                $this->M_transaksi_input->replace($data,$w);
            else:
                continue;
            endif;
        endforeach;

        $res['success'] = true;
        $res['message'] = 'Input berhasil';
        
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
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
    
    function infometeran()
    {
        $res['value'] =200;
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
        
    }
    
    function confirm_pembayaran($id){
        $data = array();
        
        $this->load->model('M_transaksi');
        $q_update = "UPDATE t_transaksi SET "             
                ."transaksi_admin_price = '".$this->M_transaksi->get_config_val('admin_price')."' " 
            ."WHERE transaksi_id='".$id."'";            
        $sql_update = $this->db->query($q_update);

        $q = "SELECT * FROM v_input_tagihan WHERE transaksi_id='".$id."'";
        $sql = $this->db->query($q);
        $data['record'] = $sql->row();

        $this->load->model('M_transaksi');
        $data['bulan'] = $this->M_transaksi->get_month_array();

        $this->template('transaksi/v_confirm_pembayaran',$data);        
    }
	
}