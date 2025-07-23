<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_table_mysql extends CI_Model {

	public function get_all_table()
	{
		$schema = $this->db->database;
		$query = "SELECT table_name as table_name FROM information_schema.tables where table_schema='$schema'";
		return $this->db->query($query);
	}

	public function get_all_field($table)
	{
		$schema = $this->db->database;
		$query = "
			SELECT
				`COLUMN_NAME` as column_name,
				`DATA_TYPE` as data_type,
				`IS_NULLABLE` as is_nullable
			FROM `INFORMATION_SCHEMA`.`COLUMNS`
			WHERE `TABLE_SCHEMA`='$schema'
			    AND `TABLE_NAME`='$table';
	    ";
		return $this->db->query($query);
	}

	public function get_primary_key($table)
	{
		$query = "
			SHOW KEYS FROM $table WHERE Key_name = 'PRIMARY'
	    ";
		return $this->db->query($query)->row()->Column_name??'id';
	}

}

/* End of file M_table_mysql.php */
/* Location: ./application/modules/formx_gen/models/M_table_mysql.php */
