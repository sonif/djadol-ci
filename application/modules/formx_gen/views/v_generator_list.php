<!-- Main content -->
  <div class='row'>
    <div class='col-md-12'>
      <div class='card shadow'>
        <div class='card-header'>
            <div class="row align-item-center">
                <div class="col-8">Form
                </div>
                <div class="col-4 text-right">
                    <div class="btn-group" >
                        <button data-url="<?php echo site_url('formx_gen/formx_gen/backupdb/')?>" class="btn btn-circle btn-info btn-sm openmodal">
                            <i class="fa fa-pencil"></i> Dump Db
                        </button>
                    </div>
                    <div class="btn-group" >
                        <button data-url="<?php echo site_url('formx_gen/formx_gen/gitpull/')?>" class="btn btn-circle btn-warning btn-sm openmodal">
                            <i class="fa fa-pencil"></i> Git Pull
                        </button>
                    </div>
                    <div class="btn-group" >
                        <button data-url="<?php echo site_url('formx_gen/formx_gen/form/')?>" class="btn btn-circle btn-info btn-sm openmodal">
                            <i class="fa fa-pencil"></i> Create
                        </button>
                    </div>
                </div>
            </div>
        </div><!-- /.box-header -->
        <div class='card-body'>
            <div class='table-container'>
                <!-- <div class="table-actions-wrapper">
                    <span> </span>
                    <select class="table-group-action-input form-control input-inline input-small input-sm">
                        <option value="">Select...</option>
                        <option value="delete">Delete</option>
                    </select>
                    <button class="btn btn-sm green table-group-action-submit">
                        <i class="fa fa-check"></i> Submit</button>
                </div> -->
                <table class="table table-striped table-bordered table-hover" id="datatable_generator">
                    <thead>
                        <tr role="row" class="heading">
                            <th width="2%" class="not-export-column">
                                <!-- <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="group-checkable" />
                                    <span></span>
                                </label> -->
                                ID
                            </th>

                            <th>Form name</th>
                            <th>Table</th>
                            <th>Parent</th>
                            <th>FK</th>
                            <th>Soft delete</th>
                            <th width="2%" class="not-export-column"></th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>

                            <td><input type="text" class="form-control form-filter input-sm" name="form_name"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="form_table"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="parent_form_id"></td>
                            <td></td>
                            <td></td>
                            <td>
                                <div class="margin-bottom-5">
                                    <button class="btn btn-sm green btn-outline filter-submit margin-bottom">
                                    <i class="fa fa-search"></i> Search</button>
                                </div>
                                <button class="btn btn-sm red btn-outline filter-cancel">
                                <i class="fa fa-times"></i> Reset</button>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div><!-- /.table-container -->
        </div><!-- /.portlet-body -->
      </div><!-- /.portlet -->
    </div><!-- /.col -->
  </div><!-- /.row -->

<script type="text/javascript">
    var datatable_generator = new Datatable();
    datatable_generator.init({
        src: $("#datatable_generator"),
        dataTable: {
            // "deferLoading": 0, // stop autoload data
            "ajax": {
                "url": "<?php echo site_url('formx_gen/formx_gen/getDatatable/') ?>", // ajax source
            },
            "order": [
                [0, "desc"]
            ],
            "columnDefs": [
                    { // define columns sorting options(by default all columns are sortable extept the first checkbox column)
                        'orderable': false,
                        'targets': [-1]
                    },
            ]
            // set first column as a default sort by asc
            // "fnDrawCallback": function () { App.initFancybox() },
        }
    });
    $( document ).on('click', '.dopost', function(e) {
        e.preventDefault();
        var url = $(this).data("url");
        var title = $(this).data('title');

        swal(
            {
                title: title+ " ?",
                // text: "Hak Akses berhasil ditambahkan!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: 'btn-success',
                // cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
            },
            function(isConfirm) { console.log('a');
                if (isConfirm) {
                    $.post(url, {param1: 'value1'}, function(data, textStatus, xhr) {
                        if (data.success == true) {
                            toastr.info(data.message);
                        }else{
                            toastr.error(data.message);
                        }
                    });
                }
            }
        );
    });
</script>
