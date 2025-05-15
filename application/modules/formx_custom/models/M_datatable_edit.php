<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_datatable_edit extends CI_Model {

	// public function pdm_srwo($row)
	// {
	// 	if ($row->srwo_status < 100 && empty($row->srwo_wo_tgl_close)) {
	// 		return true;
	// 	}else{
	// 		return false;
	// 	}
	// }
	public function t_media($row)
	{
		if ($row->status==1) {
			return true;
		}else{
			return false;
		}
	}

}

/* End of file M_datatable_edit.php */
/* Location: ./application/modules/formx_custom/models/M_datatable_edit.php */
