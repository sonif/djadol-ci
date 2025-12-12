
<style>
.select2-invalid .select2-selection {
    border-color: #dc3545;
}
#detailTable tbody tr td {
    padding: 0.75rem 0.5rem;
}
#detailTable tbody tr + tr td {
    padding-top: 0.50rem;
}
#detailTable .btn {
    padding: 0.4rem 0.85rem;
}
#alokasiForm .btn-primary {
    margin-top: 1rem;
}
</style>

<!-- Main content -->
<div class='card shadow'>
        <div class='card-header'>
          <div class="col-7">
              <h5 class="h3 mb-0 text-uppercase">Input Stok Barang di Gudang</h5>
          </div>
        </div>
        <div class='card-body form'>
            <form id="alokasiForm">
                <table id="detailTable" width="90%" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th colspan="3">
                                <div class="form-group col-md-4">
                                    Gudang :
                                    <select name='cb_warehouse' id="cb_warehouse" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_warehouse'); ?>'></select>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th width="250px">Barang</th>
                            <th width="100px">Jumlah</th>
                            <th width="10%"><button type="button" class="btn btn-success btn-sm" id="addRow">+ Tambah Barang</button></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <select name='cb_product[]' class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_product'); ?>'></select>
                            </td>
                            <td><input type="number" name="jumlah[]" class="form-control" required></td>
                            <td><button type="button" class="btn btn-danger btn-sm removeRow">x</button></td>
                        </tr>
                    </tbody>
                </table>

                <button type="submit" class="btn btn-primary">Simpan Semua</button>
            </form>
            <hr/>
            <div class='table-responsive' id='wrap_table' style="margin-top:10px;">
                <table class="table table-striped table-hover table-bordered" id="tbbelum"
                                width="100%" cellspacing="0" role="grid" aria-describedby="example_info" style="width: 100%;">
                    <thead class="thead-dark">                            
                        <tr role="row" class="heading">
                            <th width="30">No.</th>
                            <th width="100" align="center">Tanggal</th>
                            <th align="center">Warehouse</th>
                            <th width="100" align="center">Total</th>
                            <th width="100" align="center">Status</th>
                            <th width="100">Action</th>      
                        </tr>
                        
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
            </div><!-- wrap_table End-->
        </div><!-- /.box-body -->
      </div><!-- /.box -->
      
      <div class="modal fade" id="myModalDetil" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title">Detail</h5>
            <button class="btn btn-default btn-sm" id="btn-close-visit">Close</button>
            </div>
            <div class="modal-body">
            <p class="text-muted">Loading...</p>
            </div>
        </div>
        </div>
    </div>
<script>
    

    $('.date-year').datepicker({
        orientation:"left",
        format:"yyyy",
        minViewMode:"years",
        autoclose:true
    });
    function show_form(id){
        var mymodal = $('#'+id);
        mymodal.modal('show');
    }

    $(document).ready(function () {
        var tbs = new Datatable();
        // tbs.setDefaultParam("filter_customer_name",$("#filter_customer_name").val());
        // tbs.setDefaultParam("booking_date",$("#booking_date").val());
        tbs.init({
            src : $("#tbbelum"),
            dataTable:{
                "ajax":{
                    "url":"<?php echo site_url("transaksi/transaksi/getDatatable_jurnalwarehouse");?>",
                },
                "order":[
                    [1,"asc"]
                ],
            }
        });  

        $("#btn-close-visit").on('click',function(e){
            $('#myModalDetil').modal('hide');
        });

        // Handle click on .jq-detail button in the datatable
        $('#tbbelum').on('click', '.jq-check', function() {
            var jurnal_id = $(this).attr('lang');
            if(confirm("Yakin terima jurnal ini?")){
                $.ajax({
                    url: '<?php echo site_url('transaksi/transaksi/terima_jurnal_warehouse'); ?>',
                    type: 'POST',
                    data: { id: jurnal_id },
                    success: function(response) {
                        alert("Jurnal telah diterima.");
                        tbs.reload();
                    },
                    error: function() {
                        alert("Error saat menerima jurnal.");
                    } 
                });
            }
        });

        $('#tbbelum').on('click', '.jq-detil', function() {
            var jurnal_id = $(this).attr('data-id') || $(this).attr('lang');
            // Show loading state in modal
            $('#myModalDetil .modal-body').html('<p class="text-muted">Loading...</p>');
            $('#myModalDetil').modal('show');

            // AJAX to fetch detail
            $.ajax({
                url: '<?php echo site_url('transaksi/transaksi/jurnal_warehouse_detil'); ?>',
                type: 'POST',
                data: { id: jurnal_id },
                success: function(response) {
                    $('#myModalDetil .modal-body').html(response);
                },
                error: function() {
                    $('#myModalDetil .modal-body').html('<p class="text-danger">Error loading data.</p>');
                }
            });
        });
        

        var submitUrl = "<?php echo site_url('transaksi/transaksi/post_stockwarehouse'); ?>";

        function markSelectInvalid(selectElement, invalid) {
            var $select = $(selectElement);
            $select.toggleClass('is-invalid', !!invalid);
            var $container = $select.next('.select2-container');
            if ($container.length) {
                $container.toggleClass('select2-invalid', !!invalid);
            }
        }

        function createDetailRow() {
            var row = $("<tr/>");

            var productSelect = $("<select/>", {
                name: "cb_product[]",
                'class': "form-control select2-ajax"
            }).attr("data-url", "<?php echo site_url('formx/dropdown/dd/dd_product'); ?>");
            row.append($("<td/>").append(productSelect));

            var qtyInput = $("<input/>", {
                type: "number",
                name: "jumlah[]",
                'class': "form-control"
            }).attr("required", true);
            row.append($("<td/>").append(qtyInput));

            var removeButton = $("<button/>", {
                type: "button",
                'class': "btn btn-danger btn-sm removeRow",
                text: "x"
            });
            row.append($("<td/>").append(removeButton));

            return row;
        }

        function submitAllocation(payload) {
            // Show loading indicator
            $("#alokasiForm button[type='submit']").prop('disabled', true).html(
            '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Menyimpan...'
            );

            $.ajax({
            url: submitUrl,
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(payload),
            success: function(response) {
                if(response.success) {
                    alert("Alokasi stok berhasil disimpan.");
                    $("#alokasiForm")[0].reset(); // Reset form
                    $("#detailTable tbody tr:not(:first)").remove(); // Remove additional rows except first
                    $(".select2-ajax").val('').trigger('change'); // Reset select2 dropdowns
                    tbs.reload(); // Reload datatable
                    location.reload(); // Reload the page to reflect changes
                } else {
                    alert("Gagal menyimpan alokasi stok: " + (response.message || "Unknown error"));
                }
            },
            error: function(xhr) {
                console.warn("Submit failed", xhr);
                alert("Terjadi kesalahan saat menyimpan data");
            },
            complete: function() {
                // Reset button state
                $("#alokasiForm button[type='submit']").prop('disabled', false).html('Simpan Semua');
                tbs.reload();
            }
            });
        }

        $("#addRow").click(function() {
            var newRow = createDetailRow();
            $("#detailTable tbody").append(newRow);
            if (typeof sonifjs !== "undefined" && typeof sonifjs.initAjax === "function") {
                sonifjs.initAjax();
            }
        });

        // Hapus baris
        $(document).on('click', '.removeRow', function() {
            if ($("#detailTable tbody tr").length > 1)
            $(this).closest('tr').remove();
        });

        $(document).on('change', '#cb_agen', function() {
            markSelectInvalid(this, false);
        });

        $(document).on('change', "select[name='cb_product[]']", function() {
            markSelectInvalid(this, false);
        });

        $(document).on('input', "input[name='jumlah[]']", function() {
            $(this).removeClass('is-invalid');
        });

        $("#alokasiForm").on("submit", function(e) {
            e.preventDefault();

            var messages = [];
            var isValid = true;
            var wareId = $("#cb_warehouse").val();

            markSelectInvalid("#cb_warehouse", false);

            if (!wareId) {
                isValid = false;
                messages.push("Sales wajib dipilih.");
                markSelectInvalid("#cb_warehouse", true);
            }

            var detail = [];
            $("#detailTable tbody tr").each(function(index) {
                var productSelect = $("select[name='cb_product[]']", this);
                var qtyInput = $("input[name='jumlah[]']", this);

                markSelectInvalid(productSelect, false);
                qtyInput.removeClass('is-invalid');

                var product = productSelect.val();
                var qty = qtyInput.val();
                var rowValid = true;

                if (!product) {
                    isValid = false;
                    rowValid = false;
                    messages.push("Barang pada baris " + (index + 1) + " wajib dipilih.");
                    markSelectInvalid(productSelect, true);
                }

                if (!qty || parseFloat(qty) <= 0) {
                    isValid = false;
                    rowValid = false;
                    messages.push("Jumlah pada baris " + (index + 1) + " harus lebih dari 0.");
                    qtyInput.addClass('is-invalid');
                }

                if (rowValid) {
                    var selectedOption = productSelect.find("option:selected").text();
                    detail.push({
                        product_id: product,
                        product_label: selectedOption || "",
                        jumlah: parseFloat(qty)
                    });
                }
            });

            if (!isValid) {
                if (messages.length) {
                    alert(messages.join("\n"));
                }
                return;
            }

            var payload = {
                warehouse_id: wareId,
                detail: detail
            };

            if (!submitUrl || submitUrl === "REPLACE_WITH_REAL_ENDPOINT") {
                console.log("Payload ready to submit:", payload);
                alert("Payload ready. Periksa konsol browser dan ganti submitUrl.");
                return;
            }

            submitAllocation(payload);
        });

        
    });
</script>
