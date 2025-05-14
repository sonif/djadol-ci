<?php 

$string = "<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class " . $m . " extends MY_Model
{

    public \$table = '$table_name';
    public \$primary_key = '$pk';
    public \$label = '$label';

    function __construct()
    {
        parent::__construct();
            \$this->soft_deletes = FALSE;
            \$this->timestamps = FALSE;
        ";

$string .="
    }
    
    // get total rows
    function get_limit_data(\$limit, \$start) {
        \$order            = \$this->input->post('order');
        \$dataorder = array();
        \$where = array();

        \$i=1;";
foreach ($non_pk as $row) {
    $string .= "
        \$dataorder[\$i++] = '". $row->column_name ."';";
}
foreach ($non_pk as $row) {
    if ($row->type == 'numeric') {
        $string .= "
        if(!empty(\$this->input->post('" . $row->column_name ."_start'))){
            \$where['" . $row->column_name ." >='] = \$this->input->post('" . $row->column_name ."_start');
        }
        if(!empty(\$this->input->post('" . $row->column_name ."_end'))){
            \$where['" . $row->column_name ." <='] = \$this->input->post('" . $row->column_name ."_end');
        }";
    }else if ($row->type == 'date' || $row->type == 'year' ) {
        $string .= "
        if(!empty(\$this->input->post('" . $row->column_name ."_start'))){
            \$where['" . $row->column_name ." >='] = \$this->input->post('" . $row->column_name ."_start');
        }
        if(!empty(\$this->input->post('" . $row->column_name ."_end'))){
            \$where['" . $row->column_name ." <='] = \$this->input->post('" . $row->column_name ."_end');
        }";
    }else{
        $string .= "
        if(!empty(\$this->input->post('" . $row->column_name ."'))){
            \$where['LOWER(" . $row->column_name .") LIKE'] = '%'.strtolower(\$this->input->post('" . $row->column_name ."')).'%';
        }";
    }
}    

$string .= "

        \$this->where(\$where);
        \$result['total_rows'] = \$this->count_rows();
        
        \$this->where(\$where);
        if (\$order) {
            \$this->order_by( \$dataorder[\$order[0][\"column\"]],  \$order[0][\"dir\"]);
        }
        \$this->limit(\$start, \$limit);
        \$result['get_db']=\$this->get_all();
        return \$result;
    }

}

";

echo $string;

?>
