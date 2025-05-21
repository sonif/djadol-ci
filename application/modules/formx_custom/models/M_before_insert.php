<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_before_insert extends CI_Model {

	public function exit_json($msg)
	{
			$res['success'] = false;
			$res['message'] = $msg;
			// $this->con is get_instance from the constructor
			$this->output->set_content_type('application/json')->_display(json_encode($res));
			exit(0);
	}

	public function t_transaksi($data)
	{
		$w = array(
			'transaksi_customer_id' => $data['transaksi_customer_id'],
			'transaksi_month_issue' => $data['transaksi_month_issue'],
			'transaksi_year_issue' => $data['transaksi_year_issue'],
		);
		$this->db->where($w);
		$this->db->from('t_transaksi');
		$count= $this->db->count_all_results();
		if($count >  0){
			$this->exit_json('Data sudah ada');
		}

		return $data;
	}

	// public function s_user($data){
	// 	$user = $this->data['user'];
	// 	$data['company_id'] = $user->company_id;
	// 	return $data;
	// }

	// public function m_user($data)
	// {
	// 	$w = array(
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
