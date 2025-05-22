<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan extends MY_Controller {

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

    public function tunggakan(){
        $this->load->model("laporan/M_laporan");
        $v_data['month'] = $this->M_laporan->get_month_array();

        $this->template('v_laporan_tunggakan',$v_data);
    }

    public function tunggakan_ajax(){
        $v_data = array();
        $cb_year = $this->input->post('cb_year');
        $cb_month = $this->input->post('cb_month');
        $cb_agen = $this->input->post('cb_agen');

        $q = "SELECT DISTINCT(date_field)
                ,IFNULL(`t_absen_datang`.absen_date_time,0) as datang
                ,IFNULL(`t_absen_pulang`.absen_date_time,0) as pulang
                ,IFNULL(`t_absen_datang`.absen_date,0)
                ,`t_absen_datang`.created_by as uid_datang
                ,`t_absen_datang`.absen_status as status_datang
                ,`t_absen_pulang`.created_by as uid_pulang
                ,`t_absen_pulang`.absen_status as status_pulang
                FROM 
                (SELECT date_field
                    FROM
                    (
                        SELECT
                            MAKEDATE(".$cb_year.",1) +
                            INTERVAL ('".$cb_month."'-1) MONTH +
                            INTERVAL daynum DAY date_field
                        FROM
                        (
                            SELECT t*10+u daynum
                            FROM
                                (SELECT 0 t UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) A,
                                (SELECT 0 u UNION SELECT 1 UNION SELECT 2 UNION SELECT 3
                                UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7
                                UNION SELECT 8 UNION SELECT 9) B
                            ORDER BY daynum
                        ) AA
                    ) AAA
                    WHERE MONTH(date_field) = '".$cb_month."') AS tbday
                    LEFT JOIN 
                    (SELECT absen_date_time,absen_date,created_by,absen_status FROM t_absen WHERE created_by = '".$cb_agen."') as t_absen_datang 
                    ON tbday.date_field = t_absen_datang.absen_date 
                    LEFT JOIN 
                    (SELECT absen_date_time,absen_date,created_by,absen_status FROM t_absen_out WHERE created_by = '".$cb_agen."') as t_absen_pulang 
                    ON tbday.date_field = t_absen_pulang.absen_date 
                    ORDER BY date_field;";
        // echo $q;
        $v_data['v_report'] = $this->db->query($q);
        $v_data['input_month']=$cb_month;
        $v_data['input_year']=$cb_year;

        $this->load->view('v_laporan_tunggakan_ajax',$v_data);
    }

    public function pencatatan_meteran(){
        $this->load->model("laporan/M_laporan");
        $v_data['month'] = $this->M_laporan->get_month_array();

        $this->template('v_laporan_pencatatan_meteran',$v_data);
    }
    
    public function pencatatan_meteran_ajax(){
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
                    ,customer_rt,customer_rw,dusun_name
                    ,t_before.transaksi_count_now as bulan_lalu
                    ,t_now.transaksi_count_now as bulan_ini 
                    ,t_now.transaksi_status
                FROM m_customer 
                left join m_dusun ON m_customer.customer_dusun_id = m_dusun.dusun_id
                left join (SELECT transaksi_count_now,transaksi_customer_id from t_transaksi WHERE transaksi_year_issue = '".$cb_year_before."' AND transaksi_month_issue = '".$cb_month_before."') t_before on m_customer.customer_id = t_before.transaksi_customer_id 
                left join (SELECT transaksi_count_now,transaksi_customer_id,transaksi_status from t_transaksi WHERE transaksi_year_issue = '".$cb_year."'  AND transaksi_month_issue = '".$cb_month."') t_now on m_customer.customer_id = t_now.transaksi_customer_id 
            WHERE customer_dusun_id='".$cb_dusun."'";

        $v_data['v_customer'] = $this->db->query($q);
        $v_data['input_tahun']=$cb_year;
        $v_data['input_bulan']=$cb_month;
        $v_data['input_dusun']=$cb_dusun;

        $this->load->view('v_laporan_pencatatan_meteran_ajax',$v_data);
    }
    
    public function by_dusun()
    {
        $this->load->model("laporan/M_laporan");
        $v_data['month'] = $this->M_laporan->get_month_array();
        $v_data['dusun'] = $this->M_laporan->get_dusun();

        $this->template('v_laporan_by_dusun',$v_data);
    }

    public function by_dusun_ajax($year)
    {
        $this->load->model("laporan/M_laporan");
        $v_data['month'] = $this->M_laporan->get_month_array();
        $v_data['dusun'] = $this->M_laporan->get_dusun();
        $v_data['year'] = $year;

        $this->load->view('v_laporan_by_dusun_ajax',$v_data);
    }

    public function bayar_by_dusun()
    {
        $this->load->model("laporan/M_laporan");
        $v_data['month'] = $this->M_laporan->get_month_array();
        $v_data['dusun'] = $this->M_laporan->get_dusun();

        $this->template('v_laporan_bayar_by_dusun',$v_data);
    }

    public function bayar_by_dusun_ajax($year)
    {
        $this->load->model("laporan/M_laporan");
        $v_data['month'] = $this->M_laporan->get_month_array();
        $v_data['dusun'] = $this->M_laporan->get_dusun();
        $v_data['year'] = $year;

        $this->load->view('v_laporan_bayar_by_dusun_ajax',$v_data);
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

	
}