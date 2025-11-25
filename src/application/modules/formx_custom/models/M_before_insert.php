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

	public function jurnal_agen_sales($data){
		$user = $data['created_by'];
		$data['agen_id'] = $user;

		$product_id = $data['product_id'];
		$q = "SELECT * FROM t_product WHERE id='".$product_id."';";
		$product = $this->db->query($q);
		$product = $product->row();
		if(($product->price_sale3>0) && ($product->price_sale_min3< $data['count'])){
			$product_price_agen = $product->price_sale3;
		} elseif(($product->price_sale2>0) && ($product->price_sale_min2< $data['count'])){
			$product_price_agen = $product->price_sale2;
		} else {
			$product_price_agen = $product->price_sale;
		}
		if($data['status']=='out'){
			$data['count'] = $data['count'];
		}
		$data['price'] = $product_price_agen;
		$data['subtotal'] = $product_price_agen * $data['count'];

		return $data;
	}

	public function jurnal_inquiry_detail($data){
		$product_id = $data['product_id'];
		$q = "SELECT * FROM t_product WHERE id='".$product_id."';";
		$product = $this->db->query($q);
		$product = $product->row();
		$data['product_name'] = $product->name;
		return $data;
	}

	public function jurnal_stock($data){
		$product_id = $data['product_id'];
		$q = "SELECT * FROM t_product WHERE id='".$product_id."';";
		$product = $this->db->query($q);
		$product = $product->row();
		$product_price_purchase = $product->price_purchase;
		if($data['status']=='out'){
			$data['count'] = $data['count'] * -1;
		}
		
		$data['price'] = $product_price_purchase;
		$data['subtotal'] = $product_price_purchase * $data['count'];
		return $data;
	}

	function getDistanceBetweenPoints($lat1, $lon1, $lat2, $lon2, $unit = 'K')
	{
		$theta = $lon1 - $lon2;
		$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +
				cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
		$dist = acos($dist);
		$dist = rad2deg($dist);
		$miles = $dist * 60 * 1.1515;

		switch (strtoupper($unit)) {
			case 'K':
				return $miles * 1.609344; // Kilometers
			case 'N':
				return $miles * 0.8684;   // Nautical miles
			default:
				return $miles;            // Miles
		}
	}

	public function jurnal_visitasi($data){
		$created_by = $data['created_by'];
		$retail_id = $data['retail_id'];
		$q = "SELECT COUNT(id) as jumlah FROM jurnal_visitasi WHERE retail_id = '".$retail_id."';";
		$r = $this->db->query($q);
		$r = $r->row();
		$jumlah = $r->jumlah;
		if($jumlah<=0){
			$data['is_new'] = 1;
		}
		$q = "SELECT * FROM m_retail WHERE id = '".$retail_id."';";
		$data_retail = $this->db->query($q);
		$data_retail = $data_retail->row();

		$visit_latlong = str_split(",",$data['latlong']);
		$visit_lat = $visit_latlong[0];
		$visit_long = $visit_latlong[1];

		$distance = $this->getDistanceBetweenPoints($visit_lat, $visit_long, $data_retail->location_lat, $data_retail->location_long, 'K');
		if($distance > 0.1 ){ // 100 meter
			$this->exit_json('Anda berada di ('.number_format($distance,2).' Km), masih diluar jangkauan visitasi');
		}
		
		return $data;
	}
	

	public function t_absen($data){
		$created_by = $data['created_by'];
		$lat1 = $data['absen_lattitude'];
		$lon1 = $data['absen_longitude'];
		$date_absen = date('Y-m-d');

		$data_user = "SELECT s_user.id, s_user.email, s_user.lokasi_id
							,m_lokasi.lat, m_lokasi.long, m_lokasi.name, m_lokasi.radius, m_lokasi.status_lock 
					FROM s_user 
					LEFT JOIN m_lokasi ON m_lokasi.id = s_user.lokasi_id 
					WHERE s_user.id = '".$created_by."';";
		$data_user = $this->db->query($data_user);
		$data_user = $data_user->row();
		$lat2 = $data_user->lat;
		$lon2 = $data_user->long;

		$distance = $this->getDistanceBetweenPoints($lat1, $lon1, $lat2, $lon2, 'K');
		if($data_user->status_lock == 'y'){
			if($distance > $data_user->radius ){ // 100 meter
				$this->exit_json('Anda berada di ('.number_format($distance,2).' Km), masih diluar jangkauan absen');
			}
		}

		$q = "SELECT COUNT(absen_id) as jumlah FROM t_absen 
				WHERE created_by = '".$created_by."' AND DATE(created_at) = '".$date_absen."';";
		$r = $this->db->query($q);
		$r = $r->row();
		$jumlah = $r->jumlah;
		if($jumlah>0){
			$this->exit_json('Anda sudah absen hari ini');
		}
		return $data;
	}

	public function t_absen_out($data){
		$created_by = $data['created_by'];
		$lat1 = $data['absen_lattitude'];
		$lon1 = $data['absen_longitude'];
		$date_absen = date('Y-m-d');

		$data_user = "SELECT s_user.id, s_user.email, s_user.lokasi_id
							,m_lokasi.lat, m_lokasi.long, m_lokasi.name, m_lokasi.radius, m_lokasi.status_lock 
					FROM s_user 
					LEFT JOIN m_lokasi ON m_lokasi.id = s_user.lokasi_id 
					WHERE s_user.id = '".$created_by."';";
		$data_user = $this->db->query($data_user);
		$data_user = $data_user->row();
		$lat2 = $data_user->lat;
		$lon2 = $data_user->long;

		$distance = $this->getDistanceBetweenPoints($lat1, $lon1, $lat2, $lon2, 'K');
		if($data_user->status_lock == 'y'){
			if($distance > $data_user->radius ){ // 100 meter
				$this->exit_json('Anda berada di ('.number_format($distance,2).' Km), masih diluar jangkauan absen');
			}
		}

		return $data;
	}
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
