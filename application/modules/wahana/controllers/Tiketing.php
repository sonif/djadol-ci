<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'third_party/REST_Controller.php';
require APPPATH . 'third_party/Format.php';
use Restserver\Libraries\REST_Controller;

class Tiketing extends REST_Controller {

  public function __construct()
  {
    parent::__construct();
    $this->load->model('M_t_tiket_harga');
    $this->load->model('M_t_tiket_masuk');
    $this->load->model('M_t_tiket_masuk_detail');
  }
  

  public function tiket_post()
  {
    $t_tiket_harga = $this->M_t_tiket_harga->get_all(array('wahanaid'=>1));

    $data= array();
    $data['plat_no'] = $this->post('plat_no');
    $data['payment_method'] = $this->post('payment_method');
    // $data['nilai_tagihan'] = $this->post('nilai_tagihan');
    // $data['payment_method']
    // $data['payment_method']
    // $data['payment_method']
    // $data['payment_method']
    $t_tiket_masuk_id = $this->M_t_tiket_masuk->insert($data);

    foreach ($t_tiket_harga as $t) {
      $data=array();
      $data['t_harga_tiket_id'] = $t->id;
      $data['quantity'] = $this->post('quantity_'.$t->id);
      if($this->post('is_weekend')){
        $data['price'] = $t->price_weekend;
      }else{
        $data['price'] = $t->price;
      }
      $data['total'] = $data['quantity']*$data['price'];
      $data['t_tiket_masuk_id'] = $t_tiket_masuk_id;

      $this->M_t_tiket_masuk_detail->insert($data);
    }

    $data =  array('a' => 1, 'b' => 2, 'c' => 3, 'd' => $t_tiket_harga, 'e' => $this->rest);
    $this->response($data);
  }

}

/* End of file Tiketing.php */
