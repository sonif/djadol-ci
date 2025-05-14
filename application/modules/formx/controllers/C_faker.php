<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_faker extends CI_Controller {

	public function index()
	{
		$this->date(date("Y-m-d"));
	}

	public function date($date)
	{
		$m_param = $this->db->get('m_param');
		$m_param = $this->db->get('m_param');
		for ($i=0; $i < 24; $i++) { 
			foreach ($m_param->result() as $param) {
				$data = array(
					'param_id'    => $param->id_param, 
					'param_value' => rand(10,100), 
					'param_date'  => $date, 
					'param_time'  => sprintf("%02d", $i).':00', 
					'created_at'  => date("Y-m-d").' '.sprintf("%02d", $i).':00:00', 
					'created_by'  => 165, 
				);
				$data['image'] = 'a.jpg';
				$this->db->insert('t_logsheet', $data);
			}
		}
	}

	public function akses()
	{
		$akses = $this->db->get('t_akses');
		foreach ($akses->result() as $row) {
			if (!empty($row->akses_listfitur)) {
				$akses_listfitur = $row->akses_listfitur;

		        $sql2 = "
		        select fitur_kode
		        from t_fitur
		        where fitur_id in ($akses_listfitur)
		        ";
		        $data_fitur = $this->db->query($sql2);
		        $res= array();
		        foreach ($data_fitur->result() as $p) {
		        	$res[] = $p->fitur_kode;
		        }
		        // $output = implode(",",$res);
		        $output = json_encode($res);
		        $data = array('akses_code' => $output );
		        $this->db->where('akses_id', $row->akses_id);
		        $this->db->update('t_akses', $data);
			}
		}
	}

}

/* End of file C_faker.php */
/* Location: ./application/modules/formx/controllers/C_faker.php */