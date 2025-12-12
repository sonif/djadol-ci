<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Flutter extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_form');
        $this->load->model('M_form_param');
        if($this->db->dbdriver == 'mysqli'){
            $this->load->model('M_table_mysql','M_table');
        }elseif($this->db->dbdriver == 'postgre'){
            $this->load->model('M_table_postgre','M_table');
        }
        $this->data['menu_kode'] = 'form_generator';
    }

    public function generate_file($form_id,$webservice = 'http')
    {
        $this->load->helper('file');
        $this->load->model('formx/Formx_model');
        // $form_id = 30;
        $m_form = $this->M_form->get($form_id);
        $slug= $m_form->slug;
        $table = $m_form->form_table;

        $modules = 'dashboard';
        $data['form_id'] = $form_id;
        $data['name'] = $slug;
        $data['m'] = 'M_'.$slug;
        $data['c'] = 'C_'.$slug;
        $data['v_list'] = 'v_'.$slug.'_list';
        $data['v_form'] = 'v_'.$slug.'_form';
        $data['c_url'] = $modules.'/'.strtolower($data['c']);

        $data['table_name'] = $table;
        $data['pk'] = $this->M_table->get_primary_key($table);

        $data['non_pk'] = $this->Formx_model->get_param($form_id)->result();
        $data['dt'] = $this->Formx_model->get_param_datatable($form_id)->result();
        $data['label'] = $data['dt']{0}->column_name;

        $c = $this->load->view('v_template_controller', $data, TRUE);
        // var_dump ($c);
        // die();

        $path = './application/';

        //dart
        //Check if the directory already exists.
        $directoryName= './dart/'.$slug;
        if(!is_dir($directoryName)){
            //Directory does not exist, so lets create it.
            mkdir($directoryName, 0755, true);
        }

        $service = ($webservice = 'http') ? 'dart_webservice' : 'dart_firebase' ;
        $c = $this->load->view($service.'/v_dart_main', $data, TRUE);
        // echo $c;
        if ( ! write_file('./dart/'.$slug.'/'.$slug.'_main.dart', $c))
            $res['message'] = 'Unable to write .dart <br/>';
        else{
            $c = $this->load->view($service.'/v_dart_details', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_details.dart', $c);

            $c = $this->load->view($service.'/v_dart_edit', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_edit.dart', $c);

            $c = $this->load->view($service.'/v_dart_add', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_add.dart', $c);

            $c = $this->load->view($service.'/v_dart_model', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_model.dart', $c);

            $c = $this->load->view($service.'/v_dart_service', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_service.dart', $c);

            $res['message'] = 'Check folder dart <br/>';
        }

        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function http($form_id,$service='http')
    {
        $this->load->helper('file');
        $this->load->model('formx/Formx_model');
        // $form_id = 30;
        $m_form = $this->M_form->get($form_id);
        $slug= $m_form->slug;
        $table = $m_form->form_table;

        $modules = 'dashboard';
        $data['form_id'] = $form_id;
        $data['name'] = $slug;
        $data['m'] = 'M_'.$slug;
        $data['c'] = 'C_'.$slug;
        $data['v_list'] = 'v_'.$slug.'_list';
        $data['v_form'] = 'v_'.$slug.'_form';
        $data['c_url'] = $modules.'/'.strtolower($data['c']);

        $data['table_name'] = $table;
        $data['pk'] = $this->M_table->get_primary_key($table);

        $data['non_pk'] = $this->Formx_model->get_param($form_id)->result();
        $data['dt'] = $this->Formx_model->get_param_datatable($form_id)->result();
        $data['label'] = $data['dt']{0}->column_name;

        $c = $this->load->view('v_template_controller', $data, TRUE);
        // var_dump ($c);
        // die();

        $path = './application/';

        //dart
        //Check if the directory already exists.
        $directoryName= './dart/'.$slug;
        if(!is_dir($directoryName)){
            //Directory does not exist, so lets create it.
            mkdir($directoryName, 0755, true);
        }
        $c = $this->load->view('v_dart_main', $data, TRUE);
        // echo $c;
        if ( ! write_file('./dart/'.$slug.'/'.$slug.'_main.dart', $c))
            $res['message'] = 'Unable to write .dart <br/>';
        else{
            $c = $this->load->view('v_dart_view', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_view.dart', $c);

            $c = $this->load->view('v_dart_edit', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_edit.dart', $c);

            $c = $this->load->view('v_dart_add', $data, TRUE);
            write_file('./dart/'.$slug.'/'.$slug.'_add.dart', $c);

            $res['message'] = 'File .dart <br/>';
        }

        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

}

/* End of file Flutter.php */
/* Location: ./application/modules/formx_gen/controllers/Flutter.php */
