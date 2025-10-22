var getUrl = window.location;
var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

$("#input_form_26 jq-terima-stock").on('click', function() {
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