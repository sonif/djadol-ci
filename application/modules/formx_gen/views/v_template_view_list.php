<?php
$string = "";
$string .= "
<!-- Main content -->
<div class=''>
  <div class='row'>
    <div class='col'>
      <div class='card shadow'>
        <div class='card-header'>
            <div class=\"row align-items-center\">
                <div class=\"col-7\">
                    <h5 class=\"h3 mb-0 text-uppercase\">".  strtoupper($name)."  </h5>
                </div>
                <div class=\"col-5 text-right\">
                    <div class=\"btn-group\" >
                        <button data-url=\"<?php echo site_url('".$c_url."/form/')?>\" class=\"btn btn-circle btn-info btn-sm openmodal\">
                            <i class=\"fa fa-pencil\"></i> Create
                        </button>
                    </div>
                    <div class=\"btn-group\" id=\"datatable".$c."_tools\">
                        <button class=\"btn btn-sm btn-default dropdown-toggle\" href=\"javascript:;\" data-toggle=\"dropdown\" id=\"dropdownMenu2\" aria-expanded=\"false\">
                            Tools
                        </button>
                        <div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"dropdownMenu2\">";
                    $string .= "
                            <button class=\"dropdown-item tool-action\" data-action=\"0\" class=\"tool-action\">Print</button>
                            <button class=\"dropdown-item tool-action\" data-action=\"1\" class=\"tool-action\">Copy</button>
                            <button class=\"dropdown-item tool-action\" data-action=\"2\" class=\"tool-action\">PDF</button>
                            <button class=\"dropdown-item tool-action\" data-action=\"3\" class=\"tool-action\">Excel</button>
                            <button class=\"dropdown-item tool-action\" data-action=\"4\" class=\"tool-action\">CSV</button>
                            <button class=\"dropdown-item tool-action\" data-action=\"5\" class=\"tool-action\">Reload</button>
                        ";
$string .= "
                        </div>
                </div>
            </div>";
$string .= "
        </div><!-- /.box-header -->
        <div class='card-body'>
            <div class='table-responsive'>
                <table class=\"table table-striped table-bordered table-hover\" id=\"datatable".$c."\">
                    <thead class=\"thead-dark\">
                        <tr role=\"row\" class=\"heading\">
                            <th width=\"2%\" class=\"not-export-column\">
                                No<!-- <input type=\"checkbox\" class=\"group-checkable\" /> -->
                            </th>
                    ";
foreach ($dt as $row) {
    $string .= "
                            <th>" . $row->label_name . "</th>";
}
$string .= "
                            <th width=\"2%\" class=\"not-export-column\">Action</th>
                        </tr>
                        <tr role=\"row\" class=\"filter\">
                            <td></td>
                    ";
foreach ($dt as $row) {
    if ($row->type == 'numeric') {
        $string .= "
                            <td>
                                <input type=\"text\" class=\"form-control form-filter input-sm\" name=\"" . $row->column_name . "_start\">
                                <input type=\"text\" class=\"form-control form-filter input-sm\" name=\"" . $row->column_name . "_end\">
                            </td>";
    } else if($row->type == 'date' || $row->type == 'year'){
        if ($row->type == 'date') {
          $class_date ='date-decade';
        }elseif($row->type == 'year'){
          $class_date ='date-year';
        }
        $string .= "
                            <td>
                                <input class=\"form-control form-filter input-sm ".$class_date." \" readonly name=\"" . $row->column_name . "_start\"  type=\"text\" value=\"\" />
                                <input class=\"form-control form-filter input-sm ".$class_date." \" readonly name=\"" . $row->column_name . "_end\"  type=\"text\" value=\"\" />
                            </td>";
    }else{
        $string .= "
                            <td><input type=\"text\" class=\"form-control form-filter input-sm\" name=\"" . $row->column_name . "\"></td>";
    }
}
$string .= "
                            <td>
                                <div class=\"margin-bottom-5\">
                                    <button class=\"btn btn-sm btn-outline-info filter-submit margin-bottom\" title=\"search\">
                                    <i class=\"fa fa-search\"></i></button>
                                    <button class=\"btn btn-sm btn-outline-danger filter-cancel\" title=\"reset\">
                                    <i class=\"fa fa-times\"></i></button>
                                </div>
                            </td>
                        </tr>
                    </thead>";
$string .= "
                    <tbody>
                    </tbody>
                </table>
            </div><!-- /.table-container -->
        </div><!-- /.portlet-body -->
      </div><!-- /.portlet -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</div><!-- /.content -->

<script type=\"text/javascript\">
    var datatable".$c." = new Datatable();
    datatable".$c.".init({
        src: $(\"#datatable".$c."\"),
        dataTable: {
            \"ajax\": {
                \"url\": \"<?php echo site_url('".$c_url."/getDatatable/') ?>\", // ajax source
            },
            \"order\": [
                [1, \"asc\"]
            ],// set first column as a default sort by asc
        }
    });
    $('#datatable".$c."_tools > div > button.tool-action').on('click', function() {
        var action = $(this).attr('data-action');
        datatable".$c.".getDataTable().button(action).trigger();
    });
</script>";


echo $string;
?>
