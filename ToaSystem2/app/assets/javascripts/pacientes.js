jQuery(function() {
  debugger;
  //var cantones;
  $('#paciente_residencia_attributes_Res_Canton').prop('disabled', true);
  var cantones = $('#paciente_residencia_attributes_Res_Canton').html();
  console.log(cantones);
  return $('#paciente_residencia_attributes_Res_Provincia').change(function() {
    var provincia, escaped_provincia, options;
    provincia = $('#paciente_residencia_attributes_Res_Provincia :selected').text();
    escaped_provincia = provincia.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(cantones).filter("optgroup[label=" + escaped_provincia + "]").html();
    console.log(options);
    if (options) {
      $('#paciente_residencia_attributes_Res_Canton').html(options);
      return $('#paciente_residencia_attributes_Res_Canton').prop('disabled', false);
    } else {
      $('#paciente_residencia_attributes_Res_Canton option:selected').text("Seleccione");
      return $('#paciente_residencia_attributes_Res_Canton').prop('disabled', true);
    }
  });
});