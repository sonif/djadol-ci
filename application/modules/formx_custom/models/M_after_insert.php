<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_after_insert extends CI_Model {

	// public function t_patrol_check($id,$data)
	// {
	// 	$this->db->where('patrol_id', $data['patrol_id']);
	// 	$t_item_patrol = $this->db->get('t_item_patrol');
	// 	foreach ($t_item_patrol->result() as $r) {
	// 		$n_data = array(
	// 			'item_patrol_id' => $r->id, 
	// 			'patrol_check_id' => $id, 
	// 		);
	// 		$this->db->insert('t_patrol_check_sub',$n_data);
	// 	}
	// }

	// public function t_form_shift_meeting($id,$data)
	// {
	// 	$this->db->where('patrol_id', $data['patrol_id']);
	// 	$m_shift_meeting = $this->db->get('m_shift_meeting');
	// 	foreach ($m_shift_meeting->result() as $r) {
	// 		$n_data = array(
	// 			'm_shift_meeting_id' => $r->id, 
	// 			't_form_sift_meeting_id' => $id, 
	// 		);
	// 		$this->db->insert('t_parameter_operasi_shift_meeting',$n_data);
	// 	}

	// 	$this->db->where('patrol_id', $data['patrol_id']);
	// 	$m_data_produksi = $this->db->get('m_data_produksi');
	// 	foreach ($m_data_produksi->result() as $r) {
	// 		$n_data = array(
	// 			'm_data_produksi_id' => $r->id, 
	// 			't_form_sift_meeting_id' => $id, 
	// 		);
	// 		$this->db->insert('t_data_produksi',$n_data);
	// 	}
	// }


}

/* End of file M_after_insert.php */
/* Location: ./application/modules/formx_custom/models/M_after_insert.php */
