<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends MY_Controller {

  public function index()
  {
    $this->template('v_report_resume');
  }

}

/* End of file Report.php */
