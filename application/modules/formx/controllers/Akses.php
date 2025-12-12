<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Akses extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		//Do your magic here
		$this->load->model('M_akses');
    if($this->usergroup_id != ROLE_ADMIN) show_error('Unauthorized');
  }

  public function setting($menu_id)
  {
    $r = $this->db->query("SELECT * FROM s_menu WHERE menu_id = $menu_id");
    if($r->num_rows() > 0){

      $data['usergroup'] = $this->db->query("SELECT * FROM s_usergroup");
      $data['akses'] = $this->db->query("SELECT * FROM s_akses WHERE menu_id=$menu_id");
      $data['menu_id'] =$menu_id;
      $data['menu'] =$r->row();
      $this->template('v_akses_setting',$data);
    }else{
      show_404();
    }
    
  }

  public function save($menu_id)
  {
    $usergroup = $this->db->query("SELECT * FROM s_usergroup");
    foreach ($usergroup->result() as $r_usergroup) {
      # code...
      $s = $this->input->post('ck_'.$r_usergroup->id.'[]');
      if($s != null){
        $value = json_encode($s);
        
        $data = array(
          'usergroup_id' => $r_usergroup->id,
          'menu_id' => $menu_id,
          'akses_code' => $value
        );
        $w = array(
          'usergroup_id' => $r_usergroup->id,
          'menu_id' => $menu_id
        );
        $this->M_akses->replace($data,$w);
      }
    }
    $res['success'] = true;
    $res['message'] = 'Simpan berhasil';
    $res['url']     = 'reload';
    $this->output->set_content_type('application/json')->set_output(json_encode($res));

  }
}