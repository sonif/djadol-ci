
<style>
.select2-invalid .select2-selection {
    border-color: #dc3545;
}
</style>

<!-- Main content -->
<div class='card shadow'>
        <div class='card-header'>
          <div class="col-7">
              <h5 class="h3 mb-0 text-uppercase">Input Alokasi Stok Barang</h5>
          </div>
        </div>
        <div class='card-body form'>
            <form id="alokasiForm">
                <table id="detailTable">
                    <thead>
                        <tr>
                            <th colspan="3">
                                <div class="form-group mb-0">
                                    <label>Pilih Sales :</label>
                                    <select name='cb_agen' id="cb_agen" class='form-control select2-ajax' data-url='<?php echo site_url('formx/dropdown/dd/dd_user_agen'); ?>'></select>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th width="200px">Barang</th>
                            <th width="100px">Jumlah</th>
                            <th width="10%"><button type="button" class="btn btn-success btn-sm" id="addRow">+</button></th>
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

            <div class='table-responsive' id='wrap_table'>
                
            </div><!-- wrap_table End-->
        </div><!-- /.box-body -->
      </div><!-- /.box -->
      
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
        var submitUrl = <?php echo site_url('transaksi/transaksi/post_stocksales'); ?>;

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
            $.ajax({
                url: submitUrl,
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify(payload),
                success: function(response) {
                    console.log("Submit success", response);
                },
                error: function(xhr) {
                    console.warn("Submit failed", xhr);
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
            var salesId = $("#cb_agen").val();

            markSelectInvalid("#cb_agen", false);

            if (!salesId) {
                isValid = false;
                messages.push("Sales wajib dipilih.");
                markSelectInvalid("#cb_agen", true);
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
                sales_id: salesId,
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
