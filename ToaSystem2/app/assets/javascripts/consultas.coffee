# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
    
$(document).on 'turbolinks:load', ->
    $('#frmPedidoImagenologia').hide();
    $('#frmCaracteristicasDolor').hide();
    $('#frmExamenFisico').hide();
    $('#frmRecetaMedica').hide();
    $('#frmTerapia').hide(); 
    $('#showReceta').hide();   
    $('#btnPedidoExamen').click ->
        $('#pnlOpciones').hide();
        $('#frmPedidoImagenologia').show();
    $('#btnCancelPedidoExamen').click ->
        $('#frmPedidoImagenologia').hide();
        $('#pnlOpciones').show();
    $('#btnCaracteristicasDolor').click ->
        $('#pnlOpciones').hide();
        $('#frmCaracteristicasDolor').show();
    $('#btnCancelSintomas').click ->
        $('#frmCaracteristicasDolor').hide();
        $('#pnlOpciones').show();
    $('#btnExamenFisico').click ->
        $('#pnlOpciones').hide();
        $('#frmExamenFisico').show();
    $('#btnCancelExamenFisico').click ->
        $('#frmExamenFisico').hide();
        $('#pnlOpciones').show();
    $('#btnRecetaMedica').click ->
        $('#pnlOpcionesTratamiento').hide();
        $('#frmRecetaMedica').show();
    $('#btnCancelReceta').click ->
        $('#frmRecetaMedica').hide();
        $('#pnlOpcionesTratamiento').show();
    $('#btnTerapia').click ->
        $('#pnlOpcionesTratamiento').hide();
        $('#frmTerapia').show();
    $('#btnCancelTerapia').click ->
        $('#frmTerapia').hide();
        $('#pnlOpcionesTratamiento').show();

#ANTECEDENTE
$(document).on "ajax:success","form#antecedente-form", (ev,data,xhr, settings)->
    $('#DesAntecedente').val( "")
    $("#antecedente-box").append("<dt>#{data.data.Ant_tipo}</dt><dd>#{data.data.Ant_Descripcion}</dd>")
    showModal data.mensaje, 'success'

#CARACTERISTICAS-DEL-DOLOR  
$(document).on "ajax:success","form#sintomas-form", (ev,data,xhr, settings)->
    $('#rgAnatomica').val("")
    $('#pdoloroso').val("")
    $('#dgPresuntivo').val("")
    showModal data.mensaje, 'success'  
$(document).on "ajax:error","form#sintomas-form", (ev,data)->
    showModal data.responseJSON.mensaje, 'error'    

#CONSULTA
$(document).on "ajax:success","form#consulta-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#consulta-form", (ev,data,xhr, settings)->
    console.log data

#EXAMEN-FISICO
$(document).on "ajax:success","form#examenFisico-form", (ev,data,xhr, settings)->
    $('#efobservacion').val("")
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#examenFisico-form", (ev,data)->
    showModal data.responseJSON.mensaje, 'error'

#PEDIDO-EXAMEN
$(document).on "ajax:success","form#pedidoExamen-form", (ev,data,xhr, settings)->
    $('#estudioDescripcion').val("")
    $('#estudioMotivo').val("")
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#pedidoExamen-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

#TRATAMIENTO
$(document).on "ajax:success","form#tratamiento-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'    
$(document).on "ajax:error","form#tratamiento-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

#RECETA-MEDICA
$(document).on "ajax:success","form#receta-form", (ev,data,xhr, settings)->
    $('#showReceta').show()
    $('#cantidad').val(0)
    $('#medicamento').val("")
    $('#medIndicacion').val("")
    $('#prescipcion1').append("<li>#{data.data.Ins_Nombre}</li>
                                <p class='styleIndicacion'>Indicación: #{data.data.Ins_Indicacion}</p>");
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#receta-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

#TERAPIA
$(document).on "ajax:success","form#terapia-form", (ev,data,xhr, settings)->
    $('#sesionesNumero').val(0)
    $('#sesionIndicacion').val("")    
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#terapia-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

#PRUEBA MODAL
$(document).on 'turbolinks:load', ->
    $('#btnModal').click ->        
        $('#exampleModalLongTitle').html("ERROR")
        $('#body').html("<p>felicidades</p>")
        $('#exampleModalLong').modal()




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