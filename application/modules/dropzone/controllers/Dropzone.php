<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dropzone extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
        // $this->load->helper('directory');
        $this->load->helper('file');
	}

	public function index()
	{
		
	}

	public function list_image()
    {
    	$folder=$this->input->post('dt');
    	$data['readonly']=($this->input->post('readonly')=='true') ? true : false;
        $data['images'] = get_filenames('./uploads/'.$folder.'/');
        $data['dt'] = $folder;
        $this->load->view('v_dropzone_list_img', $data, FALSE);
    }

	public function upload_form()
	{
		$data = array(
					'dt' => $this->input->post('dt')
				);
		$this->load->view('v_dropzone_form', $data, FALSE);
	}
	public function upload_action()
	{
		$dt = $this->input->post('dt');
		$config = array(
			'upload_path'   => 'uploads/'.$dt, 
			'allowed_types' => '*', 
			'overwrite'     => false

        );
        $res = $this->_upload($config,'file');
        if ($res['success']) {
        	$this->output->set_content_type('application/json')->set_output(json_encode($res));

        }else{
        	$error_dropzone['error']= $res['message'];
            $this->output->set_status_header(500)->set_content_type('application/json')->set_output(json_encode($error_dropzone))->_display();
            exit();
        }
	}

	public function upload_delete()
	{
		$filename = $this->input->post('filename');
		$dt = $this->input->post('dt');
		$file = './uploads/'.$dt.'/'.$filename;
		if (!unlink($file))
		{
			$res['success'] = false;
			$this->output->set_content_type('application/json')->set_output(json_encode($res));
		}
		else
		{
			$res['success'] = true;
			$this->output->set_content_type('application/json')->set_output(json_encode($res));
		}
	}

	public function _upload($targetPath="",$form_upload_name='doc_file')
    {
        $this->load->helper('security');

        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size']      = '5000';
        $config['overwrite']     = true;
        if(is_array($targetPath)){
            $config = array_merge($config, $targetPath);
        }else{
            if (empty($targetPath)) {
                $targetPath= "uploads/temp";
            }
            $config['upload_path']   = "./".$targetPath;
        }
        // $config['file_name']     = do_hash(date("Y/m/d h:i:sa"));

        $this->load->model('M_upload');
        $response = $this->M_upload->upload($config,$form_upload_name);

        return $response;
    }

}

/* End of file dropzone.php */
/* Location: ./application/controllers/dropzone.php */