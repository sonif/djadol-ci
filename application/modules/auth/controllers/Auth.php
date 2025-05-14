<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Auth_model');
		// $this->load->model('M_perusahaan_model');
		// $this->load->model('Users_model');
        $this->load->library('form_validation');
	}

	// redirect if needed, otherwise display the user list
	public function index()
	{
		$this->login();
	}
	// log the user in
	public function login()
	{
		$this->load->view('auth/v_login_argon');
	}

	public function login_action()
	{
		$res['success'] = false;
		$res['message'] = 'Maaf, telah terjadi kesalahan.';

		$this->load->library('form_validation');
		$this->form_validation->set_rules('email', 'Email', 'trim|required');//valid_email
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if ($this->form_validation->run() == TRUE) {
			$remember = $this->input->post('remember');
			$w = array('email' => $this->input->post('email') );
			if ($user = $this->Auth_model->get($w)) {
				if ($this->Auth_model->check_password($this->input->post('password'), $user->password) ) {
					if($user->active == 1){
						$this->load->library('session');
						$ses = array(
							'user_id'      => $user->id,
							'is_logged_in' => true,
						);
						$this->load->library('session');
						$this->session->set_userdata($ses);


						$res['success'] 	= true;
						$res['message'] 	= 'Login success';
						// if($user->users_groups_id == 3 || $user->users_groups_id == 2){
						// 	$res['url']     	= site_url('Home');
						// }else if($user->users_groups_id == 1){
							$res['url']     	= site_url('home');
						// }
					}
				} else {
					$res['success'] 	= false;
			    	$res['message'] 	= 'Email dan password tidak sesuai';
				}

			} else {
				$res['success'] 	= false;
			    $res['message'] 	= 'Email tidak ditemukan';
			}

		} else {
		    $res['field_error'] = $this->form_validation->error_array();
		    $res['message'] = 'Lengkapi form dengan benar';
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($res));
	}

	// log the user out
	public function logout()
	{
		$this->data['title'] = "Logout";

		//session
		$this->session->sess_destroy();

		redirect('auth/login', 'refresh');
	}

	// forgot password
	public function forgot_password()
	{
		$res['success'] = false;
		$res['message'] = 'Maaf, telah terjadi kesalahan.';

		$this->load->library('form_validation');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|is_exist[users.email]');

		if ($this->form_validation->run() == TRUE) {
			if($this->Auth_model->forgot_password($this->input->post('email'))){
				$res['success'] 	= true;
		    	$res['message'] 	= 'Check your email';
				$res['url']     	= site_url('auth/login');
			}
		} else {
		    $res['field_error'] = $this->form_validation->error_array();
		    $res['message'] = 'Lengkapi form dengan benar';
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($res));
	}

	// reset password - final step for forgotten password
	public function reset_password($code = NULL)
	{
		if (!$code)
		{
			show_404();
		}
		// echo $this->input->post('password');exit();
		$user = $this->Auth_model->forgotten_password_check($code);

		if ($user)
		{
			$data["code"]= $code;
			$res['success'] = false;
			$res['message'] = 'Maaf, telah terjadi kesalahan.';

			$this->load->library('form_validation');
			$this->form_validation->set_rules('password', 'Password', 'trim|required');
			$this->form_validation->set_rules('rpassword', 'Re-Password', 'trim|required|matches[password]');

			if ($this->form_validation->run() == TRUE) {
				$data = array(
					'password' => $this->Auth_model->encrypt_password($this->input->post('password')),
					);
				if($this->Auth_model->update($data,$user->id)){
					$res['success'] 	= true;
			    	$res['message'] 	= 'Reset berhasil, silakan login';
					$res['url']     	= site_url('auth/login');
				}

				$this->output->set_content_type('application/json')->set_output(json_encode($res));
			} else {
				if($this->input->is_ajax_request()){
					$res['field_error'] = $this->form_validation->error_array();
				    $res['message'] = 'Lengkapi form dengan benar';
					$this->output->set_content_type('application/json')->set_output(json_encode($res));
		      	}else{
					$this->load->view('auth/v_reset_password', $data, FALSE);
				}
			}

		}
		else
		{
			echo "not valid";
		}
	}



	// activate the user
	public function activate($id=false, $code=false)
	{
		if (!$code || !$id) {
			show_404();
		}
		$w = array(
			'id' => $id,
			'activation_code' => $code,
		);
		if ($user = $this->Auth_model->get($w)) {
			$data = array(
				'active' => 1,
				'activation_code' => NULL,
				);
			if($this->Auth_model->update($data,$user->id)){
				$this->template_blank('auth/v_activate');
			}else{
				show_404();
			}
		}else{
			show_404();
		}
	}

	public function create_user()
	{
		$response['success'] = false;
		$response['message'] = 'Maaf, telah terjadi kesalahan.';

		$this->load->library('form_validation');
		$this->form_validation->set_message('is_unique', '{field} already exists.');

		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email|is_unique[users.email]');
		$this->form_validation->set_rules('phone', 'Telp', 'trim|required');
		$this->form_validation->set_rules('company', 'Nama Perusahaan', 'trim|required');
		$this->form_validation->set_rules('jenis_usaha_id', 'Jenis Usaha', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');
		$this->form_validation->set_rules('rpassword', 'Confirm Password', 'trim|required|matches[password]');

		if ($this->form_validation->run() == TRUE) {
			$data_p = array(
				'nama_perusahaan' => $this->input->post('company',TRUE),
				'jenis_usaha_id' => $this->input->post('jenis_usaha_id',TRUE),
				'alamat_perusahaan' => $this->input->post('alamat_p',TRUE),
				'telepon_perusahaan' => $this->input->post('phone_p',TRUE)
		    );
			$id_perusahaan = $this->M_perusahaan_model->insert($data_p);
			
			$data_u = array(
				"users_groups_id" => 3,
				"password" => $this->Auth_model->encrypt_password($this->input->post('password')),
				"email" => $this->input->post('email'),
				"full_name" => $this->input->post('nama'),
				"perusahaan_id" => $id_perusahaan,
				"phone" => $this->input->post('phone'),
				"active" => 1
			);
			$this->Users_model->insert($data_u);
		    // if ($this->Auth_model->insert($data)) {
			    $response['success'] 	= true;
			    $response['message'] 	= 'Akun anda telah terdaftar, silahkan login';
			    $response['url'] 		= site_url();
		    // }
			// $res['url']     		= site_url('sample');
		} else {
		    $response['field_error'] = $this->form_validation->error_array();
		    $response['message'] = 'Lengkapi form dengan benar';
		}

		$this->output->set_content_type('application/json')->set_output(json_encode($response));
	}
}
