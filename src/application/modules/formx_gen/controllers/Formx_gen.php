<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Formx_gen extends MY_Controller {

    public function __construct()
    {
        parent::__construct(true);
        $this->load->model('M_form');
        $this->load->model('M_form_param');
        $this->load->helper('permission');
        $this->load->helper('download');
        if($this->db->dbdriver == 'mysqli'){
            $this->load->model('M_table_mysql','M_table');
        }elseif($this->db->dbdriver == 'postgre'){
            $this->load->model('M_table_postgre','M_table');
        }
        $this->data['menu_kode'] = 'form_generator';
    }

    public function index()
    {
        $this->template('v_generator_list');
    }

    public function gitpull(){
        try {
            $command = "git pull";
            $output = shell_exec($command);
            $res['success'] = true;
            $res['message'] = 'Pull Repository OK '.$output;
            
            $this->output->set_content_type('application/json')->set_output(json_encode($res));
        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }
    }

    public function backupdb(){
        try {
            $this->load->database();

            $dbhost = $this->db->hostname.':3036';
            $dbname = $this->db->database;
            $dbuser = $this->db->username;
            $dbpass = $this->db->password;
            
            //$backup_file = $dbname . date("Y-m-d-H-i-s") . '.gz';
            $backup_file = $dbname . '.gz';
            $command = "mysqldump --opt -h $dbhost -u $dbuser -p $dbpass ". "test_db | gzip > $backup_file";
            
            shell_exec($command);
            $command = "mv $backup_file  db/$backup_file";
            shell_exec($command);
            //force_download("db/".$backup_file);
            //header('Location: '.base_url(). "db/".$backup_file);
            $res['success'] = true;
            $res['message'] = 'Backup DB Berhasil : db/'.$backup_file;
            $data['html_content'] = "
            <h1>Backup DB Berhasil</h1>
            <p>
            Download File Dsini : <br/>
            <a href='".base_url("db/".$backup_file)."' target='_blank'>File Backup</a>
            <p>
            ";
            
            // $this->output->set_content_type('application/json')->set_output(json_encode($res));
            $this->template("v_custom_html",$data);
        } catch (Exception $e) {
            echo 'Caught exception: ',  $e->getMessage(), "\n";
        }
    }

    public function getDatatable()
    {
        $customActionName=$this->input->post('customActionName');
        $records         = array();

        if ($customActionName == "delete") {
            $records=$this-> delete_checked();
        }

        $iDisplayLength = ($this->input->get_post('length')) ? $this->input->get_post('length') : 10 ;
        $iDisplayStart  = ($this->input->get_post('start')) ? $this->input->get_post('start') : 0 ;
        $sEcho          = ($this->input->get_post('draw')) ? $this->input->get_post('draw') : 1 ;

        $t              = $this->M_form->get_limit_data($iDisplayStart, $iDisplayLength);
        $iTotalRecords  = $t['total_rows'];
        $get_data       = $t['get_db'];

        $records["data"] = array();

        $i=$iDisplayStart+1;
        if ($get_data) {
            foreach ($get_data as $d) {
                $checkbok= '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline"><input type="checkbox" class="group-checkable" name="id[]" value="'.$d->id.'"><span></span></label>';

                $menu  = '<button class="btn btn-icon-only dopost" title="create menu" data-title="Create menu '.$d->{$this->M_form->label}.'" data-url="'.site_url('formx_gen/formx_gen/create_menu/'.$d->id).'"><i class="fa fa-link fa-lg"></i></button>';

                $approval  = '<button class="btn btn-icon-only dopost" title="Create column approval" data-title="Create column approval'.$d->{$this->M_form->label}.'" data-url="'.site_url('formx_gen/formx_gen/create_column_approval/'.$d->id).'"><i class="fa fa-check fa-lg text-blue"></i></button>';
                $flutter  = '<button class="btn btn-icon-only dopost" title="flutter" data-title="Create file '.$d->{$this->M_form->label}.'" data-url="'.site_url('formx_gen/flutter/generate_file/'.$d->id).'"><i class="fab fa-android fa-2x text-green"></i></button>';
                $flutter_firebase  = '<button class="btn btn-icon-only dopost" title="firebase" data-title="Create file '.$d->{$this->M_form->label}.'" data-url="'.site_url('formx_gen/flutter/generate_file/'.$d->id).'/firebase"><i class="fas fa-fire fa-2x text-orange"></i></button>';

                $web_file  = '<button class="btn btn-icon-only dopost" title="generate file" data-title="Web file '.$d->{$this->M_form->label}.'" data-url="'.site_url('formx_gen/formx_gen/generate_file/'.$d->id).'"><i class="fas fa-cloud text-orange"></i></button>';

                $edit  = '<button class="btn btn-icon-only openmodal" title="edit"  data-url="'.site_url('formx_gen/formx_gen/form/'.$d->id).'"><i class="fa fa-edit fa-lg"></i></button>';

                $delete  = '<button class="btn btn-icon-only delete" title="delete" data-title="'.$d->{$this->M_form->label}.'" data-url="'.site_url('formx_gen/formx_gen/delete/'.$d->id).'"><i class="fa fa-trash fa-lg text-red"></i></button>';
                    // $image = '<a><img  src="'.base_url('uploads/patrol/a.jpg').'" alt=""></>';

                $records["data"][] = array(
                    $d->id,

                    $d->form_name,
                    $d->form_table,
                    $d->parent_form_id,
                    $d->parent_form_foreign_key,
                    $d->is_soft_delete,
                    $edit
                    // .$flutter
                    // .$flutter_firebase
                    // .$delete
                    // .$approval
                    .$menu
                    // .$web_file
                );
            }
        }
        $records["draw"] = $sEcho;
        $records["recordsTotal"] = $iTotalRecords;
        $records["recordsFiltered"] = $iTotalRecords;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    public function form($id = null)
    {
        if (empty($id)) {
            $data['row']       = null;
            $data['id']        = '';
        }else{
            $row = $this->M_form->get($id);

            if ($row) {
                $data['row']       = $row;
                $data['id']        = $row->id;
            } else {
                show_error('Data not found');
            }
        }

        $data['table'] = $this->M_table->get_all_table();

        $data['form_list'] = $this->M_form->order_by('form_name','asc')->get_all();

        $this->template('v_generator_form', $data);
    }

    public function form_field()
    {
        $data['form_id'] = $this->input->post('id');

        $table = $this->input->post('table');

        $data['field'] = $this->M_table->get_all_field($table);

        $data['pk'] = $this->M_table->get_primary_key($table);
        $data['dropdown'] = $this->db->get('s_dropdown');

        $this->load->view('v_generator_form_field', $data);

    }

    public function form_action()
    {
        $res['success'] = false;
        $res['message'] = 'Simpan gagal';

        $table = $this->input->post('table_name');
        $form_table_read = $this->input->post('form_table_read');

        $field = $this->M_table->get_all_field($table);
        if($form_table_read!= ''){
            $field = $this->M_table->get_all_field($form_table_read);
        }else{
            $field = $this->M_table->get_all_field($table);
        }

        if(!empty($this->input->post('parent_form_id')))
            $parent_form_id = $this->input->post('parent_form_id');
        else
            $parent_form_id = NULL;
        if(!empty($this->input->post('parent_form_foreign_key')))
            $parent_form_foreign_key = $this->input->post('parent_form_foreign_key');
        else
            $parent_form_foreign_key = NULL;

        $data = array(
            'form_name'               => $this->input->post('form_name'),
            'slug'                    => $this->input->post('slug'),
            'is_soft_delete'      => $this->input->post('is_soft_delete'),
            'parent_form_id'          => $parent_form_id,
            'parent_form_foreign_key' => $parent_form_foreign_key,
            'form_table'              => $table,
            'form_table_read'              => $form_table_read,
        );
        $form_id = $this->input->post('form_id');
        if (empty($form_id)) {
            $form_id = $this->M_form->insert($data);
        }else{
            $this->M_form->update($data,$form_id);
        }

        foreach ($field->result() as $r) {

            if( !empty($this->input->post('type_'.$r->column_name))){
                $order = ($this->input->post('order_'.$r->column_name)) ? $this->input->post('order_'.$r->column_name) : NULL ;
                $data = array
                (
                    'form_id'          => $form_id,
                    'column_name'      => $r->column_name,
                    'label_name'       => $this->input->post('label_name_'.$r->column_name),
                    'type'             => $this->input->post('type_'.$r->column_name),
                    'required'         => $this->input->post('required_'.$r->column_name),
                    'order_no'         => $order,
                    'active'           => $this->input->post('active_'.$r->column_name),
                    'column_datatable' => $this->input->post('column_datatable_'.$r->column_name),
                    'is_unique'         => $this->input->post('column_unique_'.$r->column_name),
                    'table_ref'        => $this->input->post('table_ref_'.$r->column_name),
                    'path_upload'        => $this->input->post('path_upload_'.$r->column_name),
                );
                $w = array(
                    'form_id' => $form_id,
                    'column_name' => $r->column_name,
                );
                if ($this->M_form_param->get($w)) {
                    $this->M_form_param->update($data,$w);
                } elseif (  !empty($this->input->post('active_'.$r->column_name)) || 
                            !empty($this->input->post('column_datatable_'.$r->column_name))
                    ) {
                    $this->M_form_param->insert($data);
                }

                $res['success'] = true;
                $res['message'] = 'Simpan berhasil';
                $res['datatable'] = 'datatable_generator';

            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));

    }

    public function delete($id)
    {
        $res['success'] = false;
        $res['message'] = 'Hapus gagal';


        $row = $this->M_form->get($id);

        if ($row) {
            $this->M_form->delete($id);
            $res['success'] = true;
            $res['message'] = 'Hapus berhasil';
        } else {
            $res['message'] = 'Data tidak ditemukan';
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function create_menu($form_id)
    {
        $res['success'] = false;
        $res['message'] = 'Simpan gagal';

        $m_form = $this->M_form->get($form_id);


        $data = array(
            'menu_nama' => $m_form->form_name,
            'menu_url' => 'formx/formx/table/'.$form_id,
            'menu_parent' => 0,
            'menu_active' => 'y',
            'menu_kode' => 'form_'.$form_id,
        );

        $this->db->insert('s_menu', $data);
        if ($this->db->affected_rows()) {
            $res['success'] = true;
            $res['message'] = 'Simpan berhasil';
        }

        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function create_column_approval($form_id)
    {
        $this->load->dbforge();

        $res['success'] = false;
        $res['message'] = 'Simpan gagal';

        $m_form = $this->M_form->get($form_id);
        // Add Fields.
        $this->dbforge->add_column($m_form->form_table,array(
            'approval_at' => array(
                'type' => 'timestamp',
                'null' => TRUE,
            ),
            'approval_note' => array(
                'type' => 'character varying',
                'constraint' => '2044',
                'null' => TRUE,
            ),
        ));

        $res['success'] = true;
        $res['message'] = 'Simpan berhasil';

        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function generate_file($form_id)
    {
        $this->load->helper('file');
        $this->load->model('formx/Formx_model');

        $m_form = $this->M_form->get($form_id);
        $slug= $m_form->slug;
        $table = $m_form->form_table;

        $modules = $slug;
        $data['name'] = $slug;
        $data['m'] = 'M_'.$slug;
        $data['c'] = 'C_'.$slug;
        $data['v_list'] = 'v_'.$slug.'_list';
        $data['v_form'] = 'v_'.$slug.'_form';
        $data['c_url'] = $modules.'/'.strtolower($data['c']);

        $data['table_name'] = $m_form->form_table;
        $data['pk'] = $this->M_table->get_primary_key($table);

        $data['non_pk'] = $this->Formx_model->get_param($form_id)->result();
        $data['dt'] = $this->Formx_model->get_param_datatable($form_id)->result();
        $data['label'] = $data['dt'][0]->column_name;

        // var_dump ($c);
        // die();

        //Check if the directory already exists.
        $path= './ci_modules/'.$slug;
        $path= './application/modules/'.$slug;
        if(!is_dir($path.'/controllers')){
            mkdir($path.'/controllers', 0755, true);
        }
        if(!is_dir($path.'/models')){
            mkdir($path.'/models', 0755, true);
        }
        if(!is_dir($path.'/views')){
            mkdir($path.'/views', 0755, true);
        }

        $c = $this->load->view('v_template_controller', $data, TRUE);
        if ( ! write_file($path.'/controllers/'.$data['c'].'.php', $c))
            echo 'Unable to write the controller <br/>';
        else
            echo 'File controller <br/>';

        $c = $this->load->view('v_template_model', $data, TRUE);
        if ( ! write_file($path.'/models/'.$data['m'].'.php', $c))
            echo 'Unable to write the model <br/>';
        else
            echo 'File model <br/>';

        $c = $this->load->view('v_template_view_list', $data, TRUE);
        if ( ! write_file($path.'/views/'.$data['v_list'].'.php', $c))
            echo 'Unable to write the view list <br/>';
        else
            echo 'File view list <br/>';

        $c = $this->load->view('v_template_view_form', $data, TRUE);
        if ( ! write_file($path.'/views/'.$data['v_form'].'.php', $c))
            echo 'Unable to write the view listform <br/>';
        else
            echo 'File view form <br/>';


    }
    
}

/* End of file formx_gen.php */
/* Location: ./application/modules/formx/controllers/formx_gen.php */
