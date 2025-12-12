<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_import extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
        $this->load->library(array('PHPExcel','PHPExcel/IOFactory'));
        $this->load->model('M_form');
        $this->load->model('Formx_model');
	}

	public function form($form_id)
	{
		$data['form_id'] = $form_id;
		$this->template('v_import',$data);
	}

	public function form_action()
	{
		$form_id = $this->input->post('form_id');
        $m_form = $this->M_form->get($form_id);
        if (!$m_form->is_import) show_error('not allowed');
        $form_param= $this->Formx_model->get_param($form_id);
        $uniqe_columns = $this->Formx_model->get_param_unique($form_id);


        $config['upload_path'] = "./uploads"; //buat folder dengan nama uploads di root folder
        $config['allowed_types'] = '*';
        $config['max_size'] = 100000;
        $config['overwrite'] = true;

        $this->load->library('upload');
        $this->upload->initialize($config);

        if(!file_exists('./uploads/')) {
            mkdir('./uploads/',0777,true);
        }
        if(! $a=$this->upload->do_upload('file_import') ){

            var_dump($this->upload->display_errors());
            exit();
        }
        $upload_data = $this->upload->data();
        $fileName   = $upload_data['file_name'];
        //$media = $this->upload->data('fileabsen');
        $inputFileName = $config['upload_path'] .'/'.$fileName;//.$media['file_name'];
        // echo $inputFileName;

        try
        {
            $inputFileType = IOFactory::identify($inputFileName);
            $objReader = IOFactory::createReader($inputFileType);
            $objPHPExcel = $objReader->load($inputFileName);
        } catch(Exception $e) {
            die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
        }

        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
        $highestColumn = $sheet->getHighestColumn();

        $header = $sheet->rangeToArray('A1:' . $highestColumn .'1',
                                                NULL,
                                                TRUE,
                                                FALSE);
        // echo '<pre>' , var_dump($header) , '</pre>';

        $this->Formx_model->set_table($form_id);
        $res['message_error'] = '';
        for ($row = 2; $row <= $highestRow; $row++){                  //  Read a row of data into an array
            $rowData = $sheet->rangeToArray('A' . ($row) . ':' . $highestColumn . ($row),
                                                NULL,
                                                TRUE,
                                                FALSE);
            $data_arr = array_combine($header[0], $rowData[0]);


            $data=array();
            $message_error = '';
            foreach ($form_param->result() as $p) {
            	if (isset($data_arr[$p->column_name])) {
            		if ($p->type == 'int') {
                        if (is_numeric($data_arr[$p->column_name]))
                			$data[$p->column_name] = (int)$data_arr[$p->column_name];
                        else
                            $message_error .= 'Line <b>'.$row.'</b>, column <b>'.$p->column_name.'</b> : is not numeric <br/>';
            		}else{
            			$data[$p->column_name] = (string)$data_arr[$p->column_name];
            		}
            	}
            }

            if (count($data) == 0 ) { break;};
            if ($message_error != '' ) {$res['message_error'] .= $message_error; continue;}


            $w = array();
            foreach ($uniqe_columns->result() as $u) {
            	if (isset($data[$u->column_name])) {
            		$w[$u->column_name] = $data[$u->column_name];
            	}
            }

            if (count($w) > 0) {
	            $this->Formx_model->where($w);
				$find = $this->Formx_model->get();
            }else{
            	$find = false;
            }

			if($find){
				$this->Formx_model->update($data,$w);
	        }else{
				$this->Formx_model->insert($data);
			}
        }
      	unlink($inputFileName);

        if ($res['message_error'] == ''){
            $res['success'] = true;
            $res['message'] = 'Import berhasil';
        }
        else{
            $res['success'] = false;
            $res['message'] = 'check file input xls';
        }

        $res['datatable'] = 'datatable_'.$form_id;
        $this->output->set_content_type('application/json')->set_output(json_encode($res));
	}

	public function sample($form_id)
	{
        $m_form = $this->M_form->get($form_id);
        $form_param= $this->Formx_model->get_param($form_id);

	 	$objPHPExcel = new PHPExcel();
		$objPHPExcel->setActiveSheetIndex(0);

		$column_excel = 'A';
		foreach ($form_param->result() as $p) {
			$objPHPExcel->getActiveSheet()->SetCellValue($column_excel++.'1', $p->column_name);
		}
		for ($i=2; $i < 5; $i++) {
			$column_excel = 'A';
			foreach ($form_param->result() as $key=>$p) {
				$objPHPExcel->getActiveSheet()->SetCellValue($column_excel++.$i, 'data'.($key+1));
			}
		}

		$writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="template_'.str_replace(' ','_', $m_form->form_name).'.xls"');
		header('Cache-Control: max-age=0');
		$writer->save('php://output');
	}

}

/* End of file C_import.php */
/* Location: ./application/modules/formx/controllers/C_import.php */
