var getUrl = window.location;
var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

$("#input_form_26 select[name=transaksi_customer_id],#input_form_26 select[name=transaksi_year_issue],#input_form_26 select[name=transaksi_month_issue]").on('change', function() {
  checkmeteran();
})


function checkmeteran() {
  var customer = $("#input_form_26 select[name=transaksi_customer_id]").val();
  var year = $("#input_form_26 select[name=transaksi_year_issue]").val();
  var month = $("#input_form_26 select[name=transaksi_month_issue]").val();

  if(customer != '' && year!='' && month!=''){
    $.post( baseUrl+"/transaksi/infometeran/",
      {
        customer_id: customer,
        year:year,
        month: month
      }
    , function( data ) {
      var newinfo = data.value;
      $("#input_form_26 input[name=transaksi_count_now]").val(newinfo);
    });
  }
}