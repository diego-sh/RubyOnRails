###$(document).ready(function(){
  setTimeout(function(){
    $('.mensajeAlert').fadeOut("slow",function(){
      $(this).remove();
    })
  }, 4500);
});###

$(document).on 'turbolinks:load', ->
  $('#pnlPacienteEncontrado').hide();
  $('.calendar').fullCalendar('option', 'height', 490);


#BUSQUEDA DE PACIENTE
$(document).on "ajax:success","form#buscarPacienteCita-form", (ev,data,xhr, settings)->
  if data.data[0]== undefined
      showModal 'Paciente no encontrado..! Verifique los datos ingresados', 'error'
      $('#pnlPacienteEncontrado').hide()
      $('#pnlPacienteRegistrar').show()
  else
      showModal 'Paciente encontrado.!', 'success'
      $('#pnlPacienteEncontrado').show();
      $('#pnlPacienteRegistrar').hide()
      $('#pcteHistoria').html(data.data[0].Pac_HC)
      $('#pcteNombresApellidos').html(data.data[0].Pac_Nombres+" "+ data.data[0].Pac_Apellido_Paterno+ " "+data.data[0].Pac_Apellido_Materno)
      $('#pcteIdentificacion').html(data.data[0].Pac_Cedula)
      $('#pcteContacto').html(data.data[0].Pac_Telefono)
#REGISTRAR CITA
$(document).on "ajax:success","form#cita-form", (ev,data,xhr, settings)->
    debugger
    showModal data.mensaje, 'success'
    $('#successAction').html("<a href='/citas/#{data.data.cita_id}' class='btn btn-success'>Aceptar</a>")  
$(document).on "ajax:error","form#cita-form", (ev,data)->
    showModal data.responseJSON.mensaje, 'error'    

###FUNCIONES DE AYUDA ###
showModal = (message, type) ->
  if type == 'success'
    $('#titleSuccess').html 'ÉXITO'
    $('#bodySuccess').html "#{message}"
    $('#modalSuccess').modal()
  if type == 'error'
    $('#titleError').html 'ERROR'
    $('#bodyError').html "#{message}"
    $('#modalError').modal()
  return