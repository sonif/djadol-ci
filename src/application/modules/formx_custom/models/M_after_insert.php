<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_after_insert extends CI_Model {

	public function jurnal_agen($id,$data)
	{
		// var_dump($data);
		$agen_id = $data['created_by'];
		$company_id = $data['company_id'];

		$this->db->where('jurnal_id', $data['id']);
		$jurnal_agen_sales = $this->db->get('jurnal_agen_sales');
		if($jurnal_agen_sales->num_rows() > 0):
			foreach($jurnal_agen_sales->result() as $row){
				$this->db->where('agen_id',$agen_id);
				$this->db->where('product_id',$row->product_id);
				$this->db->where('company_id',$company_id);
				$stock_agen = $this->db->get('stock_agen');

				if($stock_agen->num_rows() > 0):
					$row_stock = $stock_agen->row();
					$w = array(
						'id' => $row_stock->id
					);

					$n_data = array(
						'count' => $row_stock->count - $row->count, 
					);
					$this->db->update('stock_agen',$n_data,$w);
				endif;
			}
		endif;
	}

	public function jurnal_stock($id,$data)
	{
		//untuk menambah stock di gudang
		$this->db->where('warehouse_id', $data['warehouse_id']);
		$this->db->where('product_id', $data['product_id']);
		$this->db->where('company_id', $data['company_id']);

		$stock_warehouse = $this->db->get('stock_warehouse');
		if($stock_warehouse->num_rows() > 0):
			$row = $stock_warehouse->row();
			$w = array(
				'id' => $row->id
			);
			$n_data = array(
				'count' => $row->count + $data['count'], 
			);
			$this->db->update('stock_warehouse',$n_data,$w);
		else:
			$n_data = array(
				'warehouse_id' => $data['warehouse_id'], 
				'product_id' => $data['product_id'], 
				'company_id' => $data['company_id'],
				'count' => $data['count'],
				'created_by'=>$data['created_by']
			);
			$this->db->insert('stock_warehouse',$n_data);
		endif;
	}

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
