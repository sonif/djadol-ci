
function selfEmployeeId(formId) {
  var employeeid = $("#user_info").data('employeeid');
  
  $(formId+" select[name=employee_id]").attr("readonly", "readonly");
  $(formId+" select[name=employee_id]").val(employeeid);
}

$("jq-terima-stock").on('click', function() {
    var stock_id = $(this).attr('lang');
    stock_clear(stock_id);
})


function stock_clear(stock_id) {
    alert("LANG: " + stock_id);
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