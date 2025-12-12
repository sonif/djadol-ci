<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('auth_model');
	}

		// change password
	public function change_password()
	{
		$data['action']    = site_url('auth/profile/change_password_action');
        $this->template('auth/v_change_password',$data);
	}

	// change password action
	public function change_password_action()
	{
		$response['success'] = false;
		$response['message'] = 'Maaf, telah terjadi kesalahan.';

		$this->load->library('form_validation');
		$this->form_validation->set_rules('old_password', 'Old password', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');
		$this->form_validation->set_rules('rpassword', 'Re-Password', 'trim|required|matches[password]');

		if ($this->form_validation->run() == TRUE) {
			$user = $this->data['user'];
			if ($this->data['user']->logged_in) {
				if ($this->auth_model->check_password($this->input->post('old_password'), $user->password) ) {
					$data = array(
						'password' => $this->auth_model->encrypt_password($this->input->post('password')),
						);
					if($this->auth_model->update($data,$user->id)){
					    $response['success'] 	= true;
					    $response['message'] 	= 'Password berhasil diubah';
					}
				}else{
					$response['success'] 	= false;
				    $response['field_error']['old_password'] 	= 'Wrong password';
				    $response['message'] = '';
				}
			}
		} else {
		    $response['field_error'] = $this->form_validation->error_array();
		    $response['message'] = 'Lengkapi form dengan benar';
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($response));
	}

	public function change_foto()
	{
		$data['action']    = site_url('auth/profile/change_foto_action');
        $this->template('auth/v_change_foto',$data);
	}

	public function change_foto_action()
	{
		if (empty($_FILES['cover_dokumen']['name'])) {
			$res['success'] = false;
			$res['message'] = 'Pleace choose file';
		} else{
			$this->load->helper('security');

	        $targetPath= "uploads/foto_profile/".$this->data['user']->id;
	        $config['upload_path']   = "./".$targetPath;
	        $config['allowed_types'] = 'gif|jpg|png';
	        $config['max_size']      = '5000';
	        $config['overwrite']     = true;
	        $config['file_name']     = do_hash(date("Y/m/d h:i:sa"));

	        $this->load->model('m_public_function');
	        $res = $this->m_public_function->upload($config,'cover_dokumen');
	        if ($res['success']) {
	        	$data['foto'] = $res['upload_data']['file_name'];
	        	$row = $this->auth_model->get($this->data['user']->id);
	        	if($this->auth_model->update($data,$this->data['user']->id)){
	        		delete_image($targetPath.'/'.$row->foto);

                    $res['url']     = 'reload';
                    $res['success'] = true;
                    $res['message'] = 'Simpan berhasil';
                }
	        }
		}


        $this->output->set_content_type('application/json')->set_output(json_encode($res));
	}

}

/* End of file Profile.php */
/* Location: ./application/controllers/Profile.php */
