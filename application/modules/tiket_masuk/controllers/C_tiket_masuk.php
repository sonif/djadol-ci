<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class C_tiket_masuk extends MY_Controller
{


    function __construct()
    {
        parent::__construct();
        $this->load->model('M_tiket_masuk');
        $this->load->library('form_validation');
        $this->load->helper('permission');
    }
    

    public function index()
    {
        $this->template('v_tiket_masuk_list');
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

        $t              = $this->M_tiket_masuk->get_limit_data($iDisplayStart, $iDisplayLength);
        $iTotalRecords  = $t['total_rows'];
        $get_data       = $t['get_db'];

        $records["data"] = array();

        $i=$iDisplayStart+1;
        if ($get_data) {
            foreach ($get_data as $d) {
                $checkbok= '<input type="checkbox" class="group-checkable" name="id[]" value="'.$d->id.'">';
                $view  = '<button class="btn btn-icon btn-sm btn-info openmodal" title="view"  data-url="'.site_url('tiket_masuk/c_tiket_masuk/read/'.$d->id).'"><i class="fa fa-search fa-lg"></i></button>';
                $edit  = '<button class="btn btn-icon btn-sm btn-primary openmodal" title="edit"  data-url="'.site_url('tiket_masuk/c_tiket_masuk/form/'.$d->id).'"><i class="fa fa-edit"></i></button>';
                $delete  = '<button class="btn btn-icon btn-sm btn-danger delete" title="delete" data-title="'.$d->{$this->M_tiket_masuk->label}.'" data-url="'.site_url('tiket_masuk/c_tiket_masuk/delete/'.$d->id).'"><i class="fa fa-trash"></i></button>';
                $add_btn = '';
                
                $row = array();
                $row[] = $i++;
                
				$row[] =to_numeric($d->jumlah_pengunjung); 
				$row[] =$d->plat_no; 
				$row[] =$d->jenis_kendaraan; 
				$row[] =to_numeric($d->nilai_tagihan); 
				$row[] =$d->payment_method; 
				$row[] =$d->createdAt; 
                   
                $row[] = $add_btn.$view.$edit.$delete;
                $records["data"][] = $row;
            }
        }
        $records["draw"] = $sEcho;
        $records["recordsTotal"] = $iTotalRecords;
        $records["recordsFiltered"] = $iTotalRecords;

        $this->output->set_content_type('application/json')->set_output(json_encode($records));
    }

    public function read($id)
    {
        $this->data['authorize'] = 'readonly';
        $this->form($id);
    }

    public function form($id=null)
    {
        $data['action']    = site_url('tiket_masuk/c_tiket_masuk/form_action');
        if (empty($id)) {
            $data['row']       = null;
            $data['id']        = '';
        }else{
            $row = $this->M_tiket_masuk->get($id);

            if ($row) {
                $data['row']       = $row;
                $data['id']        = $row->id;
            } else {
                show_error('Data not found');
            }
        }

        $this->template('v_tiket_masuk_form',$data);
    }
    
    public function form_action()
    {
        $res['success'] = false;
        $res['message'] = 'Simpan gagal';
        
        $this->form_validation->set_rules('jumlah_pengunjung','jumlah_pengunjung','trim|required|numeric');
        $this->form_validation->set_rules('plat_no','plat_no','trim');
        $this->form_validation->set_rules('jenis_kendaraan','jenis_kendaraan','trim|required');
        $this->form_validation->set_rules('nilai_cash_pembayaran','nilai_cash_pembayaran','trim|numeric');
        $this->form_validation->set_rules('nilai_tagihan','nilai_tagihan','trim|required|numeric');
        $this->form_validation->set_rules('nilai_cash_kembalian','nilai_cash_kembalian','trim|numeric');
        $this->form_validation->set_rules('payment_method','payment_method','trim');
		if(!empty($this->input->post('createdAt')))
        $this->form_validation->set_rules('createdAt','createdAt','trim|required');

        if ($this->form_validation->run() == FALSE) {
            $res['message'] = 'Lengkapi form dengan benar';
            $res['field_error'] = $this->form_validation->error_array();
        } else {
            $data = array(
                        'jumlah_pengunjung' => convert_numeric($this->input->post('jumlah_pengunjung')),
                        'plat_no' => $this->input->post('plat_no'),
                        'jenis_kendaraan' => $this->input->post('jenis_kendaraan'),
                        'nilai_cash_pembayaran' => convert_numeric($this->input->post('nilai_cash_pembayaran')),
                        'nilai_tagihan' => convert_numeric($this->input->post('nilai_tagihan')),
                        'nilai_cash_kembalian' => convert_numeric($this->input->post('nilai_cash_kembalian')),
                        'payment_method' => $this->input->post('payment_method'),
                    );
            if (empty($this->input->post('id'))) {
                $this->load->library('uuid');
                $data['id'] = $this->uuid->v4();
                if($this->M_tiket_masuk->insert($data)){
                    $res['datatable']     = 'datatableC_tiket_masuk';
                    $res['success'] = true;
                    $res['message'] = 'Simpan berhasil';
                }
            }else{
                $row = $this->M_tiket_masuk->get($this->input->post('id'));

                if ($row) {
                    if($this->M_tiket_masuk->update($data,$this->input->post('id'))){
                        $res['datatable']     = 'datatableC_tiket_masuk';
                        $res['success'] = true;
                        $res['message'] = 'Simpan berhasil';
                    }
                } else {
                    $res['success'] = false;
                    $res['message'] = 'Data not found';
                }
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }
    
    public function delete($id)
    {
        $res['success'] = false;
        $res['message'] = 'Hapus gagal';
        $row = $this->M_tiket_masuk->get($id);

        if ($row) {
            $this->M_tiket_masuk->delete($id);
            $res['success'] = true;
            $res['message'] = 'Hapus berhasil';
        } else {
            $res['message'] = 'Data tidak ditemukan';
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
    }

    public function delete_checked()
    {
        $id_array=$this->input->post('id[]');
        foreach ($id_array as $id) {
            $row = $this->M_tiket_masuk->get($id);

            if ($row) {
                $this->M_tiket_masuk->delete($id);
            }
        }
        $result["customActionStatus"]="OK";
        $result["customActionMessage"]="Delete Record Success";
        return $result;
    }
}
    