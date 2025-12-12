<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Api_keys_model extends MY_Model {

  public $table = 's_api_keys';
  public $primary_key = 'id';

  function __construct(){
    parent::__construct();
    $this->soft_deletes = FALSE;
    $this->timestamps = FALSE;
  }
  

}

/* End of file Api_keys.php */
