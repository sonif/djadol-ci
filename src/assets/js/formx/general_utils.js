
function selfEmployeeId(formId) {
  var employeeid = $("#user_info").data('employeeid');
  
  $(formId+" select[name=employee_id]").attr("readonly", "readonly");
  $(formId+" select[name=employee_id]").val(employeeid);
}