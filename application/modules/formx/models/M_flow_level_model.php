<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_flow_level_model extends MY_Model {

	protected $timestamps = FALSE;
    public $table = 'm_flow_level';

    public function get_max_min($flow_id)
    {
    	$this->db->select('MAX(level_no) as max, MIN(level_no) as min');
    	$w = array('flow_id' => $flow_id );
    	$this->db->where($w);
    	$this->db->group_by('flow_id');
		$this->db->from($this->table);
		return $this->db->get()->row();
    }

    public function usergroup_creator($flow_id)
    {
    	$w = array('flow_id' => $flow_id,'level_no' => 1 );
    	$this->db->where($w);
		$this->db->from($this->table);
		return $this->db->get()->row()->usergroup_id;
    }

}

/* End of file M_flow_level_model.php */
/* Location: ./application/modules/formx/models/M_flow_level_model.php */