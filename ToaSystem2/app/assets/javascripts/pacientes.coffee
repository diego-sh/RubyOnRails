$(document).on 'turbolinks:load', ->
    $('#tblPacientes').dataTable({
      "language": {
        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
      }
    })
    
$(document).on 'turbolinks:load', ->
  provincia = $('#paciente_residencia_attributes_Res_Provincia :selected').text()
  cantones = $('#paciente_residencia_attributes_Res_Canton').html()
  escaped_provincia = provincia.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(cantones).filter("optgroup[label= '#{escaped_provincia}']").html()
  $('#paciente_residencia_attributes_Res_Canton').html options

  $('#paciente_residencia_attributes_Res_Provincia').change ->
    provincia = undefined
    escaped_provincia = undefined
    options = undefined
    provincia = $('#paciente_residencia_attributes_Res_Provincia :selected').text()
    escaped_provincia = provincia.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(cantones).filter("optgroup[label= '#{escaped_provincia}']").html()
    ##console.log options
    if options
      $('#paciente_residencia_attributes_Res_Canton').html options
      $('#paciente_residencia_attributes_Res_Canton').prop 'disabled', false
    else
      $('#paciente_residencia_attributes_Res_Canton option:selected').text 'Seleccione'
      $('#paciente_residencia_attributes_Res_Canton').prop 'disabled', true


###$(document).on 'turbolinks:load', ->
  debugger
  cantones = undefined
  cantones = $('#paciente_residencia_attributes_Res_Canton').html()
  provincia2 = undefined
  options2 = undefined
  provincia2 = $('#paciente_residencia_attributes_Res_Provincia :selected').text()
  options2 = $(cantones).filter("optgroup[label=' + provincia2 + ']").html()
  $('#paciente_residencia_attributes_Res_Canton').html options2
  console.log cantones
  $('#paciente_residencia_attributes_Res_Provincia').change ->
    debugger
    provincia = undefined
    options = undefined
    provincia = $('#paciente_residencia_attributes_Res_Provincia :selected').text()
    options = $(cantones).filter("optgroup[label=' + provincia + ']").html()
    console.log options
    if options
      $('#paciente_residencia_attributes_Res_Canton').html options
    else
      $('#paciente_residencia_attributes_Res_Canton').empty()###