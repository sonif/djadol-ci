<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Chart extends MY_Controller {

  
  public function __construct()
  {
    parent::__construct();
    $this->load->model('formx/Formx_model');
    
  }
  

  public function index()
  {
    $this->template('v_chart');
  }


  public function datacamera_chart()
  {
    $m = $this->input->post('m') ?? 1;
    $y = $this->input->post('y') ?? 2021;
    $dusun_id = $this->input->post('dusun_id');

    // camera
    $data = $this->_countDaily($y,$m,$dusun_id);
    $res['datasets'][]=array(
      'label'=>'CAMERA',
      'backgroundColor'=>'#11cdef',
      'data'=>$data
    );
    // // R2
    $data = $this->_countDaily($y,$m,$dusun_id);
    $res['datasets'][]=array(
      'label'=>'R2',
      'backgroundColor'=>'#5e72e4',
      'data'=>$data
    );
    // // R4
    $data = $this->_countDaily($y,$m,$dusun_id);
    $res['datasets'][]=array(
      'label'=>'R4',
      'backgroundColor'=>'#fb6340',
      'data'=>$data
    );
    
    $totalDay=cal_days_in_month(CAL_GREGORIAN,$m,$y);
    for ($i=1; $i <= $totalDay; $i++) { 
      $res['labels'][] = $i;
    }

    $this->output->set_content_type('application/json')->set_output(json_encode($res)); 
  }

  public function _countDaily($y,$m,$dusun_id)
  {
    
    if(!empty($dusun_id))
      $filter_dusunid = " AND customer_dusun_id = $dusun_id ";
    else
      $filter_dusunid = "";


    $q =" SELECT
      YEAR(transaksi_created_date) as year_val, 
      MONTH(transaksi_created_date) as month_val,
      DAY(transaksi_created_date) as day_val,
      COUNT(*) as total
    FROM v_input
    where
      YEAR(transaksi_created_date) = $y
      AND MONTH(transaksi_created_date) = $m
      $filter_dusunid
    GROUP BY 
      YEAR(transaksi_created_date),
      MONTH(transaksi_created_date),
      DAY(transaksi_created_date)";

    $run_q = $this->db->query($q);
    $res = $run_q->result_array();
    $x =array_column($res,'total','day_val');
    
    $totalDay=cal_days_in_month(CAL_GREGORIAN,$m,$y);
    $kendaraanMonthly=[];
    for ($i=1; $i <= $totalDay; $i++) { 
      $kendaraanMonthly[] = (isset($x[$i])) ? $x[$i] : 0;
    }

    return $kendaraanMonthly;

  }

}