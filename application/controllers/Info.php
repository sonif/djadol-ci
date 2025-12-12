<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Info extends CI_Controller {

	public function jmlcuti($employeeid)
	{
    $q= 'SELECT * from v_total_cuti where employee_id ='.$employeeid;
    $query= $this->db->query($q);

    if($query->num_rows() > 0){
      $sisa = $query->row()->deposit;
    }else{
      $sisa = 0 ;
    }

    $res=array('sisa_cuti'=>'Total cuti '.$sisa);
    $this->output->set_content_type('application/json')->set_output(json_encode($res));
  }
}