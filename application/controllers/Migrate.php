<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migrate extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('migration');
	}

	public function index()
	{
		$this->latest();
	}

	public function latest()
	{
        if ($this->migration->latest() === FALSE)
        {
            show_error($this->migration->error_string());
        }
	}

	public function reset($from='20180210131011')
	{
		if ($this->migration->version($from) === FALSE)
        {
            show_error($this->migration->error_string());
        }
		$this->latest();
		$this->seed();
	}

	public function v($no = null)
	{
		if ($this->migration->version($no) === FALSE)
		{
			show_error($this->migration->error_string());
		}
	}

	public function seed($file_m='')
	{
		// ini_set('memory_limit', '-1');
		// ini_set('max_execution_time', 300);
		if (empty($file_m)) {
			# code...
			$seed_files = array(
				'm_menu.xls',
				't_akses.xls',
				'uom.xls',
				'item.xls',
				'm_currency.xls',
				'm_document.xls',
				'partner.xls',
			);
		}else{
			$seed_files = array($file_m);
		}
        $this->load->helper('file');



		foreach ($seed_files as $filename) {
			# code...
			$table_name =  preg_replace("/\.[^.]+$/", "", $filename);
			if($this->db->dbdriver == 'mysqli'){
				$pk_query = $this->db->query("
					SHOW KEYS FROM $table_name WHERE Key_name = 'PRIMARY'
			    ");
				if($pk_query->num_rows() > 0){
		            $pk = $pk_query->row()->Column_name;
		        }else{
		            $pk = false;
		        }
		    }
		    elseif($this->db->dbdriver == 'postgre'){
				$pk_query = $this->db->query("SELECT c.column_name, c.ordinal_position
	            FROM information_schema.key_column_usage AS c
	            LEFT JOIN information_schema.table_constraints AS t
	            ON t.constraint_name = c.constraint_name
	            WHERE t.table_name = '$table_name' AND t.constraint_type = 'PRIMARY KEY';");
		        if($pk_query->num_rows() > 0){
		            $pk = $pk_query->row()->column_name;
		        }else{
		            $pk = false;
		        }
		    }


			$file_path = APPPATH.'migrations/seed/'.$filename;
			$objPHPExcel = PHPExcel_IOFactory::load($file_path );

			$objPHPExcel->setActiveSheetIndex(0);
			$worksheet = $objPHPExcel->getActiveSheet();
			$highestRow         = $worksheet->getHighestRow(); // e.g. 10

			// $highestColumn      = $worksheet->getHighestColumn(); // e.g 'F'
			$headerArr = array();

			for ($col=0; $col < 25; $col++) {
				$cell = $worksheet->getCellByColumnAndRow($col, 1);
				$val = $cell->getValue();
				$headerArr[] = $val;

				$highestColumn=$col;

				if ($val === null || $val === '') {
					break;
				}

			}

			// $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);

			for ($row = 2; $row <= $highestRow; ++ $row) {
				$rowData = array();
				for ($col = 0; $col < $highestColumn; ++ $col) {
					if (empty($worksheet->getCellByColumnAndRow(0, $row)->getValue())) {
						break 2;
					}

					$cell = $worksheet->getCellByColumnAndRow($col, $row);
					$val = $cell->getValue();
					$rowData[$headerArr[$col]] = $val;
					if ($headerArr[$col]==$pk) {
						$pk_value = $val;
					}
				}
				if (!empty($rowData)) {
					if (!isset($pk_value)) {
						$this->db->insert($table_name, $rowData);
					}else{
						$this->db->where($pk, $pk_value);
						$find = $this->db->get($table_name);
						if($find->num_rows()>0){
							$this->db->where($pk, $pk_value);
							$this->db->update($table_name, $rowData);
				        }else{
							$this->db->insert($table_name, $rowData);
				        }
					}
				}
			}
			if($this->db->dbdriver == 'postgre')
				$this->set_sequence($table_name,$pk,$pk_value);
		}
	}

	public function set_sequence($table,$primary_key,$value_seq)
	{
		if (!is_numeric($value_seq) || empty($primary_key)) {
			return;
		}

		$sql = 'SELECT pg_get_serial_sequence(\''.$table."', '".$primary_key."') AS seq";
        $query = $this->db->query($sql);
        $query = $query->row();
        $seq = $query->seq;
        if (!empty($seq)) {
        	$sql = "SELECT nextval('$seq') AS ins_id";
        	$query = $this->db->query($sql);
        	$query = $query->row();
        	$current_seq = $query->ins_id;

        	if ($current_seq < $value_seq) {
	        	$sql = "SELECT setval('$seq', $value_seq, true)";
	        	$query = $this->db->query($sql);
        	}
        }
	}

}
