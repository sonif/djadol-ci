
function selfEmployeeId(formId) {
  var employeeid = $("#user_info").data('employeeid');
  
  $(formId+" select[name=employee_id]").attr("readonly", "readonly");
  $(formId+" select[name=employee_id]").val(employeeid);
}

$('#datatable_48').on('click', '.jq-terima-stock', function () {
    var stock_id = $(this).attr('lang');
    stock_clear(stock_id);
})


function stock_clear(stock_id) {
    if (confirm('Yakin terima dan kosongkan stock ini ')) {
      // kirim request AJAX hapus di sini
      alert("LANG: " + stock_id);
    }
    
    // $.post( baseUrl+"/transaksi/infometeran/",
    //   {
    //     customer_id: customer,
    //     year:year,
    //     month: month
    //   }
    // , function( data ) {
    //   var newinfo = data.value;
    //   $("#input_form_26 input[name=transaksi_count_now]").val(newinfo);
    // });
  
}