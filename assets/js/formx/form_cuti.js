var formId = "#input_form_17";
var levelno = $("#flow_info").data('levelno');
var employeeid = $("#user_info").data('employeeid');

var getUrl = window.location;
var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

// $( document ).ready(function() {
//   if(levelno == 1){
//     selfEmployeeId(formId);
//     checkcuti(employeeid);
//   }
// });

$("#input_form_17 select[name=employee_id]").on('change', function() {
  var employeeid = this.value ;
  checkcuti(employeeid);
})
.change();

function checkcuti(employeeid) {
  $.get( baseUrl+"/info/jmlcuti/"+employeeid, function( data ) {
    var newinfo = data.sisa_cuti;
    if ($('#infoSisaCuti').length) {
      $('#infoSisaCuti').html(newinfo);
    }else{
      $("#input_form_17 select[name=employee_id]").parent().append('<div id="infoSisaCuti">'+newinfo+'</div>');
    }
  });
}

$("#tanggal_cuti_start").on('change', function() {
  dateDiff();
})
$("#tanggal_cuti_end").on('change', function() {
  dateDiff();
})

function dateDiff() {
  var start = new Date($('#tanggal_cuti_start').val());
  var end = new Date(($('#tanggal_cuti_end').val()));

  // end - start returns difference in milliseconds 
  var diffDate = (end - start) / (1000 * 60 * 60 * 24);
  var days = Math.round(diffDate);
  if(days >= 0) days += 1;
  else days -= 1;
  $("#jumlah_hari").val(days);
}