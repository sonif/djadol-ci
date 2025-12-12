<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class History extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		//Do your magic here
		$this->load->model('M_flow_level_model');
		$this->load->model('T_flow_model');
		$this->load->model('T_flow_history_model');
		$this->load->model('M_flow_level_model');
		$this->load->model('M_form');
		$this->load->model('M_form_param');
		$this->load->model('Formx_model');
	}

	public function note($t_flow_id)
	{
		

		$this->T_flow_model->table = 'v_t_flow';
		$w = array('id' => $t_flow_id );
		$data['t_flow'] = $this->T_flow_model->get($w);

		$w = array(
			'flow_id' => $data['t_flow']->flow_id,
			'level_no' => $data['t_flow']->level_no,
		);
		$data['flow_level'] = $this->M_flow_level_model->get($w);
		// if(!empty($data['flow_level']->usergroup_id)){
		// 	$query = $this->db->query("select * from s_usergroup where id = ".$data['flow_level']->usergroup_id);
		// 	$data['usergoup_action'] = $query->row()->name;
		// }else{
		// 	$data['usergoup_action'] = '';
		// }

		$this->T_flow_history_model->table = 'v_t_flow_history';
		$w = array('t_flow_id' => $t_flow_id );
		$this->db->order_by('id', 'asc');
		$data['history'] = $this->T_flow_history_model->get_all($w);
		$data['t_flow_id'] = $t_flow_id;
		$this->load->view('v_flow_history',$data);
	}

}

/* End of file History.php */
/* Location: ./application/modules/formx/controllers/History.php */