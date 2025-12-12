<?php if (! defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class MY_Controller extends CI_Controller
{
    public $data 	= array();
    public $res 	= array();
    public $jwt;
    public $usergroup_id;


    protected $middlewares = array();

    public function __construct($is_public = false)
    {
        parent::__construct();
        $this->data['usergroup_id']=0;
        $this->data['user']=null;
        $this->usergroup_id=0;
        if (!$is_public) 
            $this->_run_middlewares();
        $this->set_default_data();

    }

    protected function _run_middlewares()
    {
        $this->load->model('auth/users_model');
        $valid_auth =false;

        $is_logged_in = $this->session->userdata('is_logged_in');

        if ($is_logged_in) {
            $user_id = $this->session->userdata('user_id');
            if ($this->data['user'] = $this->users_model->get($user_id)) {
                // var_dump($this->data['user']);exit();
                $valid_auth = true;
                $this->data['user']->logged_in = true;
                $this->usergroup_id = $this->data['user']->usergroup_id;
                $this->data['usergroup_id'] = $this->data['user']->usergroup_id;
            // $this->check_new_token();
            } else {
                show_error('Oooops! something wrong');
            }
        }

        // if (in_array($this->router->class, $without_login)) {
        //     $valid_auth = true;
        // }

        if (!$valid_auth) {
            if ($this->input->is_ajax_request()) {
                $response['success'] = false;
                $response['message'] = 'Unauthorized';
                $this->output->set_content_type('application/json')->set_output(json_encode($response));
            } else {
                redirect('auth/login', 'refresh');
            }
        }


    }

    public function authorize()
    {
        $this->load->model('users/users_role_model');

        if ($this->users_role_model->check_permision($this->router->class,$this->router->method)) {
            // code...
        }else{
            echo "Forbiden";
            exit();
        }
    }

    public function set_default_data()
    {
        $this->data['authorize'] = 'edit';
        $this->data['menu_kode'] = '';
    }

    public function check_new_token()
    {
        $time_limit = strtotime('+1 hour');
        if (time() < $this->jwt->exp && $this->jwt->exp < $time_limit) {
            $data = array(
                'id' => $this->user->id,
                'exp'=> strtotime('+3 hour')
            );
            $this->jwt 	= JWT::encode($data, $this->config->item('jwt_key'));
        }
    }

    public function json_output($arr)
    {
        if (isset($arr['token'])) {
            $arr['token'] = $this->jwt;
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($json));
    }

    public function exit_json($msg)
    {
        $res['success'] = false;
        $res['message'] = $msg;
        // $this->con is get_instance from the constructor
        $this->output->set_content_type('application/json')->_display(json_encode($res));
        exit(0);
    }

    public function template($view_file, $local_data = null)
    {
        if ($local_data != null) {
            $this->data = array_merge($this->data, $local_data);
        }
        if ($this->input->post('view_only')) {
            $this->load->view($view_file, $this->data);
        }else{
            if ($view_file) {
                $this->data['modal'] = $this->input->post('modal');
                $this->data['page_content'] = $this->load->view($view_file, $this->data, true);
            }
            if ($this->input->post('modal')) {
                $this->load->view('argon/v_modal_main', $this->data);
            }
            else {
                // $this->load->view('m4/v_bo_template', $this->data);
                $this->load->view('argon/v_bo_template', $this->data);
            }
        }
    }

    public function template_blank($view_file, $local_data = null)
    {
        if ($local_data != null) {
            $this->data = array_merge($this->data, $local_data);
        }
        if ($view_file) {
            $this->data['page_content'] = $this->load->view($view_file, $this->data, true);
        }
        $this->load->view('template/v_blank_template', $this->data);
    }

    public function check_date_format($str)
    {
        if (!DateTime::createFromFormat('Y-m-d', $str)) { //yes it's YYYY-MM-DD
            $this->form_validation->set_message('check_date_format', 'The {field} has not a valid date format');
            return false;
        } else {
            return true;
        }
    }

    public function _upload($targetPath="",$form_upload_name='doc_file',$is_image=false)
    {
        $this->load->helper('security');
        if($is_image){
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
        }else{
            $config['allowed_types'] = '*';
        }
        // $config['max_size']      = '5000';
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

        $this->load->model('formx/m_public_function');
        $response = $this->m_public_function->upload($config,$form_upload_name);

        return $response;
    }

    // public function load_img($file='')
    // {
    // 	if (empty($file)) {
    // 		return "data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==";
    // 	}else{
    // 		$filename = './'.$file;
    //
    // 		if (is_file($filename)  && file_exists($filename) ) {
    // 		    return base_url($file);
    // 		} else {
    // 			return "data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==";
    // 		}
    // 	}
    // }
}

class FrontendController extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }
}

class BackendController extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }
}
