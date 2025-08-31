<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'third_party/REST_Controller.php';
require APPPATH . 'third_party/Format.php';
use Restserver\Libraries\REST_Controller;


class Act extends REST_Controller {


    function __construct()
    {
        parent::__construct();
        $this->load->model('formx/Formx_model');
        $this->load->model('formx/M_form');
    }

    public function totalsales_post()
    {
        $created_at = $this->input->post('created_at');

        $sql = "SELECT SUM(total_price) as total FROM jurnal_agen WHERE created_at >= ? AND created_at <= ? AND created_by = ?";
        $result = $this->db->query($sql, array($created_at.' 00:00:00', $created_at.' 23:59:59', $this->rest->user_id));
        $records["total"] = $result->row()->total;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    public function totaltokobyagen()
    {
        // $created_by = $this->input->post('created_by');
        $sql = "SELECT COUNT(id) as total FROM m_retail WHERE created_by = ?";
        $result = $this->db->query($sql, array($this->rest->user_id));
        $records["total"] = $result->row()->total;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    public function remove_post()
    {
        $whiteListFormId = [43];


        $http_code = 400;
        $this->output->set_status_header($http_code);
        $form_id = $this->input->post('form_id');
        $id = $this->input->post('id');
        $m_form = $this->M_form->get($form_id);
        if (!$m_form) {
            $res['message'] = 'Form not found';
            $this->response($res,$http_code);
        }
        if(!in_array($form_id, $whiteListFormId)){
            $res['message'] = 'Permission denied';
            $this->response($res,$http_code);
        }

        $this->Formx_model->set_table($form_id);
        if ($this->Formx_model->delete($id)) {
            $http_code = 200;
            $res['message'] = 'Record deleted successfully';
            $this->response($res,$http_code);
            exit();
        } else {
            $http_code = 500;
            $res['message'] = 'Failed to delete record';
            $this->response($res,$http_code);
        }
    }
}

/* End of file api.php */
/* Location: ./application/controllers/api.php */
