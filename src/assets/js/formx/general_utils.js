
var getUrl = window.location;
var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

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
      $.post( baseUrl+"/laporan/laporan/clear_stock",
      {
        data_id : stock_id,
      }
    ,function( data ) {
      alert("Stock ID " + stock_id + " telah diterima dan dikosongkan.");
    });
    }
    
    
  
}