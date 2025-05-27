<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_form extends MY_Model {

	protected $timestamps = FALSE;
    public $table = 's_form_parent';
    public $label = 'form_name';
    public $primary_key = 'id';

    function get_limit_data($limit, $start) {

        $order            = $this->input->post('order');
        $dataorder = array();
        $where = array();

        $i=0;
        $dataorder[$i++] = 'id';
        $dataorder[$i++] = 'form_name';
        $dataorder[$i++] = 'form_table';
        $dataorder[$i++] = 'parent_form_id';
        if(!empty($this->input->post('form_name'))){
            $where['LOWER(form_name) LIKE'] = '%'.strtolower($this->input->post('form_name')).'%';
        }
        if(!empty($this->input->post('form_table'))){
            $where['LOWER(form_table) LIKE'] = '%'.strtolower($this->input->post('form_table')).'%';
        }
        if(!empty($this->input->post('parent_form_id'))){
            $where['parent_form_id'] = $this->input->post('parent_form_id');
        }

        $this->where($where);
        $result['total_rows'] = $this->count_rows();
        
        $this->where($where);
        if ($order) {
            $this->order_by( $dataorder[$order[0]["column"]],  $order[0]["dir"]);
        }
        $this->limit($start, $limit);

        $result['get_db']=$this->get_all();
        
        return $result;
    }

    public function get_child_form($form_id)
    {
        $w = array('form_parent_id' => $form_id );
        $this->table='s_form_parent';
        return $this->get_all($w);
    }

}

/* End of file M_form.php */
/* Location: ./application/modules/formx/models/M_form.php */
