<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_t_tiket_masuk_detail extends MY_Model {

  public $table = 't_tiket_masuk_detail';
  public $primary_key = 'id';

  function __construct(){
    parent::__construct();
    $this->soft_deletes = FALSE;
    $this->timestamps = FALSE;
  }
  

}

/* End of file M_t_tiket_masuk_detail.php */
