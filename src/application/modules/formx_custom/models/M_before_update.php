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

	public function jurnal_inquiry_agen($id,$data)
	{
		if($data['status'] == 'diterima'){
			$this->db->where('jurnal_id', $id);
			$inquiry = $this->db->get('jurnal_inquiry_detail');

			foreach($inquiry->result() as $detail_inquiry):
				$this->db->where('agen_id', $data['agen_id']);
				$this->db->where('product_id', $detail_inquiry->product_id);
				$stock_agen = $this->db->get('stock_agen');
				
				if($stock_agen->num_rows() > 0):
					$row = $stock_agen->row();
					$w = array(
						'id' => $row->id
					);
					$n_data = array(
						'count' => $row->count + $detail_inquiry->count, 
					);
					$this->db->update('stock_agen',$n_data,$w);
				else:
					$n_data = array(
						'agen_id' => $data['agen_id'], 
						'product_id' => $detail_inquiry->product_id, 
						'count' => $detail_inquiry->count
					);
					$this->db->insert('stock_agen',$n_data);
				endif;
			endforeach;
		}

		return $data;
	}

}

/* End of file M_before_insert.php */
/* Location: ./application/modules/formx_custom/models.php/M_before_insert.php */
