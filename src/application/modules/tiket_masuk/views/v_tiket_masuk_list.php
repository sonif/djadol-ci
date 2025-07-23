
<!-- Main content -->
<div class=''>
  <div class='row'>
    <div class='col'>
      <div class='card shadow'>
        <div class='card-header'>
            <div class="row align-items-center">
                <div class="col-7">
                    <h5 class="h3 mb-0 text-uppercase">TIKET_MASUK  </h5>
                </div>
                <div class="col-5 text-right">
                    <div class="btn-group" >
                        <button data-url="<?php echo site_url('tiket_masuk/c_tiket_masuk/form/')?>" class="btn btn-circle btn-info btn-sm openmodal">
                            <i class="fa fa-pencil"></i> Create
                        </button>
                    </div>
                    <div class="btn-group" id="datatableC_tiket_masuk_tools">
                        <button class="btn btn-sm btn-default dropdown-toggle" href="javascript:;" data-toggle="dropdown" id="dropdownMenu2" aria-expanded="false">
                            Tools
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
                            <button class="dropdown-item tool-action" data-action="0" class="tool-action">Print</button>
                            <button class="dropdown-item tool-action" data-action="1" class="tool-action">Copy</button>
                            <button class="dropdown-item tool-action" data-action="2" class="tool-action">PDF</button>
                            <button class="dropdown-item tool-action" data-action="3" class="tool-action">Excel</button>
                            <button class="dropdown-item tool-action" data-action="4" class="tool-action">CSV</button>
                            <button class="dropdown-item tool-action" data-action="5" class="tool-action">Reload</button>
                        
                        </div>
                </div>
            </div>
        </div><!-- /.box-header -->
        <div class='card-body'>
            <div class='table-responsive'>
                <table class="table table-striped table-bordered table-hover" id="datatableC_tiket_masuk">
                    <thead class="thead-dark">
                        <tr role="row" class="heading">
                            <th width="2%" class="not-export-column">
                                No<!-- <input type="checkbox" class="group-checkable" /> -->
                            </th>
                    
                            <th>jumlah pengunjung</th>
                            <th>plat no</th>
                            <th>jenis kendaraan</th>
                            <th>nilai tagihan</th>
                            <th>payment method</th>
                            <th>waktu</th>
                            <th width="2%" class="not-export-column">Action</th>
                        </tr>
                        <tr role="row" class="filter">
                            <td></td>
                    
                            <td><input type="text" class="form-control form-filter input-sm" name="jumlah_pengunjung"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="plat_no"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="jenis_kendaraan"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="nilai_tagihan"></td>
                            <td><input type="text" class="form-control form-filter input-sm" name="payment_method"></td>
                            <td>
                                <input class="form-control form-filter input-sm date-decade " readonly name="createdAt_start"  type="text" value="" />
                                <input class="form-control form-filter input-sm date-decade " readonly name="createdAt_end"  type="text" value="" />
                            </td>
                            <td>
                                <div class="margin-bottom-5">
                                    <button class="btn btn-sm btn-outline-info filter-submit margin-bottom" title="search">
                                    <i class="fa fa-search"></i></button>
                                    <button class="btn btn-sm btn-outline-danger filter-cancel" title="reset">
                                    <i class="fa fa-times"></i></button>
                                </div>
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
</div><!-- /.content -->

<script type="text/javascript">
    var datatableC_tiket_masuk = new Datatable();
    datatableC_tiket_masuk.init({
        src: $("#datatableC_tiket_masuk"),
        dataTable: {
            "ajax": {
                "url": "<?php echo site_url('tiket_masuk/c_tiket_masuk/getDatatable/') ?>", // ajax source
            },
            "order": [
                [1, "asc"]
            ],// set first column as a default sort by asc
        }
    });
    $('#datatableC_tiket_masuk_tools > div > button.tool-action').on('click', function() {
        var action = $(this).attr('data-action');
        datatableC_tiket_masuk.getDataTable().button(action).trigger();
    });
</script>