<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Attchment extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_flow_level_model');
        $this->load->model('T_flow_model');
        $this->load->model('M_form');
        $this->load->model('M_form_param');
    }

    public function get_file($t_flow_id=null)
    {
        $this->data['menu_kode'] = 'attch';

        if($t_flow = $this->T_flow_model->get($t_flow_id)){
            $flow_id = $t_flow->flow_id;
            $level_no = $t_flow->level_no;
        }else{
            show_error('Form not found');
        }

        $flow_levels = $this->M_flow_level_model->get_all(array('flow_id' => $flow_id ));
        $form_id_arr = array();
        $form_many_arr = array();
        foreach ($flow_levels as $flow_level) {
            if (!empty($flow_level->form_id)) {
                $new_form_id_arr = array_filter(explode(',', $flow_level->form_id));
                $form_id_arr = array_merge($form_id_arr,$new_form_id_arr);

                $new_form_many_arr = array_filter(explode(',', $flow_level->form_many));
                $form_many_arr = array_merge($form_many_arr,$new_form_many_arr);
            }
        }

        $data['t_flow_id'] =$t_flow_id;
        $data['form_id_arr'] =$form_id_arr;
        $data['form_many_arr'] =$form_many_arr;

        $this->template('v_flow_attc_file',$data);
    }

}

/* End of file Attchment.php */
/* Location: ./application/modules/formx/controllers/Attchment.php */
