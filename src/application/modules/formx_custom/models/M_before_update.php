<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_before_update extends CI_Model {

	// public function t_hk_schedule($id,$data)
	// {
	// 	$w = array(
	// 		't_hk_schedule_id !=' => $id,
	// 		't_hk_id' => $data['t_hk_id'],
	// 		't_hk_schedule_date' => $data['t_hk_schedule_date'],
	// 	);
	// 	$this->db->where($w);
	// 	$t= $this->db->get('t_hk_schedule');

	// 	if ($t->num_rows()>0) {
	// 		$res['success'] = false;
 //            $res['message'] = 'Jadwal sudah ada';
 //            $this->output->set_content_type('application/json')->_display(json_encode($res));
 //            die();
	// 	}

	// 	return $data;
	// }

	// public function m_user($id,$data)
	// {
	// 	$w = array(
	// 		'user_id !=' => $id,
	// 		'm_staff_id' => $data['m_staff_id'],
	// 	);
	// 	$this->db->where($w);
	// 	$t= $this->db->get('m_user');

	// 	if ($t->num_rows()>0) {
	// 		$res['success'] = false;
 //            $res['message'] = 'Staff sudah ada';
 //            $this->output->set_content_type('application/json')->_display(json_encode($res));
 //            die();
	// 	}

	// 	$multi_site_arr = $this->input->post('user_siteid[]');
	// 	foreach ($multi_site_arr as $value) {
	// 		$data['siteid'] = $value;
	// 		break;
	// 	}

	// 	return $data;
	// }

}

/* End of file M_before_insert.php */
/* Location: ./application/modules/formx_custom/models.php/M_before_insert.php */
