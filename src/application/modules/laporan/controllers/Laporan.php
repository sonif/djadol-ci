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

    public function kunjungan(){
        $this->load->model("laporan/M_laporan");
        $v_data = array();
        $this->template('v_laporan_kunjungan',$v_data);
    }

    public function tunggakan_ajax(){
        $v_data = array();
        $cb_year = $this->input->post('cb_year');
        $cb_month = $this->input->post('cb_month');
        $cb_agen = $this->input->post('cb_agen');
        $agen_data = $this->db->get_where('s_user',array('id'=>$cb_agen))->row();

        $q = "SELECT DISTINCT(date_field)
                ,IFNULL(`t_absen_datang`.created_at,0) as datang
                ,IFNULL(`t_absen_pulang`.created_at,0) as pulang
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
                    (SELECT created_at,created_by,absen_status FROM t_absen WHERE created_by = '".$cb_agen."') as t_absen_datang 
                    ON tbday.date_field = CAST(t_absen_datang.created_at as DATE) 
                    LEFT JOIN 
                    (SELECT created_at,created_by,absen_status FROM t_absen_out WHERE created_by = '".$cb_agen."') as t_absen_pulang 
                    ON tbday.date_field = CAST(t_absen_pulang.created_at  as DATE)
                    ORDER BY date_field;";
        // echo $q;
        $v_data['v_report'] = $this->db->query($q);
        $v_data['input_month']=$cb_month;
        $v_data['input_year']=$cb_year;
        $v_data['input_agen']=$agen_data;

        $this->load->view('v_laporan_tunggakan_ajax',$v_data);
    }

    public function kunjungan_ajax(){
        $v_data = array();
        $date_start = $this->input->post('date_start');
        $date_end = $this->input->post('date_end');

        $q = "SELECT a.id,a.usergroup_id,a.full_name,a.email
                    ,b.jumlah_visitasi 
            FROM s_user as a
                LEFT JOIN (SELECT created_by, COUNT(id) as jumlah_visitasi FROM jurnal_visitasi 
                            WHERE created_at BETWEEN '".$date_start."' AND '".$date_end."' ) as b 
                ON a.id = b.created_by 
            WHERE a.usergroup_id = 4";
        // echo $q;
        $v_data['v_report'] = $this->db->query($q);
        $v_data['input_date_start']=$date_start;
        $v_data['input_date_end']=$date_end;

        $this->load->view('v_laporan_kunjungan_ajax',$v_data);
    }

    public function kunjungan_detil_ajax(){
        $v_data = array();
        $agen_id = $this->input->post('id');
        $date_start = $this->input->post('date_start');
        $date_end = $this->input->post('date_end');

        $q = "SELECT jurnal_visitasi.created_by,jurnal_visitasi.created_at
                    ,jurnal_visitasi.latlong
                    ,s_user.full_name,m_retail.name as retail_name
                    ,m_retail.address as retail_address
                FROM jurnal_visitasi 
                    LEFT JOIN s_user ON jurnal_visitasi.created_by = s_user.id 
                    LEFT JOIN m_retail ON jurnal_visitasi.retail_id = m_retail.id
                WHERE jurnal_visitasi.created_by = '".$agen_id."' 
                AND jurnal_visitasi.created_at BETWEEN '".$date_start."' AND '".$date_end."' 
                ORDER BY jurnal_visitasi.created_at ASC";
        //echo $q;
        $v_data['v_report']         = $this->db->query($q);
        $v_data['input_date_start'] = $date_start;
        $v_data['input_date_end']   = $date_end;

        $this->load->view('v_laporan_kunjungan_detil_ajax',$v_data);
    }

    public function penjualan(){
        $this->load->model("laporan/M_laporan");
        $v_data = array();
        $this->template('v_laporan_penjualan',$v_data);
    }

    public function penjualan_ajax(){
        $v_data = array();
        $date_start = $this->input->post('date_start');
        $date_end = $this->input->post('date_end');

        $q = "SELECT a.id,a.usergroup_id,a.full_name,a.email
                    ,b.total_price 
            FROM s_user as a
                LEFT JOIN (SELECT created_by, SUM(total_price) as total_price FROM jurnal_agen  
                            WHERE created_at BETWEEN '".$date_start."' AND '".$date_end."' ) as b 
                ON a.id = b.created_by 
            WHERE a.usergroup_id = 4";
        // echo $q;
        $v_data['v_report'] = $this->db->query($q);
        $v_data['input_date_start']=$date_start;
        $v_data['input_date_end']=$date_end;

        $this->load->view('v_laporan_penjualan_ajax',$v_data);
    }

    public function penjualan_detil_ajax(){
        $v_data = array();
        $agen_id = $this->input->post('id');
        $date_start = $this->input->post('date_start');
        $date_end = $this->input->post('date_end');

        $q = "SELECT jurnal_agen.created_by,jurnal_agen.created_at
                    ,jurnal_agen.latlong
                    ,jurnal_agen.total_price
                    ,s_user.full_name,m_retail.name as retail_name
                    ,m_retail.address as retail_address
                FROM jurnal_agen 
                    LEFT JOIN s_user ON jurnal_agen.created_by = s_user.id 
                    LEFT JOIN m_retail ON jurnal_agen.retail_id = m_retail.id
                WHERE jurnal_agen.created_by = '".$agen_id."' 
                AND jurnal_agen.created_at BETWEEN '".$date_start."' AND '".$date_end."' 
                ORDER BY jurnal_agen.created_at ASC";
        //echo $q;
        $v_data['v_report']         = $this->db->query($q);
        $v_data['input_date_start'] = $date_start;
        $v_data['input_date_end']   = $date_end;

        $this->load->view('v_laporan_penjualan_detil_ajax',$v_data);
    }

    public function clear_stock()
    {
        $data_id = $this->input->post('data_id');
        $q = "SELECT * FROM stock_agen WHERE id = ".$data_id;
        $stock_data = $this->db->query($q)->row();

        $q = "INSERT INTO jurnal_return_agen (agen_id,product_id,count,created_at,created_by)
                VALUES (".$stock_data->agen_id."
                ,".$stock_data->product_id."
                ,".$stock_data->count."
                ,NOW()
                ,".$this->session->userdata('user_id').")";
        $this->db->query($q);
        // Lakukan proses pengosongan stock berdasarkan data_id
        $q = "UPDATE stock_agen SET count = 0 WHERE id = ".$data_id;
        $this->db->query($q);

        $this->output->set_content_type('application/json')->set_output(json_encode(array('status' => 'success')));
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