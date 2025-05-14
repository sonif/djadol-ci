<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_table_postgre extends CI_Model {

	public function get_all_table()
	{
		$query = "SELECT table_name FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE' order by table_name";
		return $this->db->query($query);
	}

	public function get_all_field($table)
	{
		$query = "SELECT *
                FROM information_schema.columns
                WHERE table_name   = '$table'";
		return $this->db->query($query);
	}

	public function get_primary_key($table)
	{
		$query = "SELECT c.column_name, c.ordinal_position
            FROM information_schema.key_column_usage AS c
            LEFT JOIN information_schema.table_constraints AS t
            ON t.constraint_name = c.constraint_name
            WHERE t.table_name = '$table' AND t.constraint_type = 'PRIMARY KEY';";
		return  $this->db->query($query)->row()->column_name;
	}

}

/* End of file M_table_mysql.php */
/* Location: ./application/modules/formx_gen/models/M_table_mysql.php */
