# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
    
$(document).on 'turbolinks:load', ->
    $('#frmPedidoImagenologia').hide();
    $('#frmCaracteristicasDolor').hide();
    $('#frmExamenFisico').hide();
    $('#frmRecetaMedica').hide();
    $('#frmTerapia').hide();    
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
    $("#antecedente-box").append("<dt>#{data.Ant_tipo}</dt><dd>#{data.Ant_Descripcion}</dd>")

#CARACTERISTICAS-DEL-DOLOR  
$(document).on "ajax:success","form#sintomas-form", (ev,data,xhr, settings)->
    $('#rgAnatomica').val("")
    $('#pdoloroso').val("")
    $('#dgPresuntivo').val("")
    alert "Caracteristica Guardada exitosamente"  
$(document).on "ajax:error","form#sintomas-form", (ev,data)->
    console.log data
    alert "Crea primero la consulta"

#CONSULTA
$(document).on "ajax:success","form#consulta-form", (ev,data,xhr, settings)->
    alert "Consulta Guardada exitosamente"
$(document).on "ajax:error","form#consulta-form", (ev,data,xhr, settings)->
    console.log data

#EXAMEN-FISICO
$(document).on "ajax:success","form#examenFisico-form", (ev,data,xhr, settings)->
    $('#efobservacion').val("")
    alert "Examen Fisico Guardado exitosamente"
$(document).on "ajax:error","form#examenFisico-form", (ev,data)->
    console.log data
    alert "Crea primero la consulta"

#PEDIDO-EXAMEN
$(document).on "ajax:success","form#pedidoExamen-form", (ev,data,xhr, settings)->
    $('#estudioDescripcion').val("")
    $('#estudioMotivo').val("")
    alert "Pedido Guardado exitosamente"
$(document).on "ajax:error","form#pedidoExamen-form", (ev,data,xhr, settings)->
    console.log data
    alert "Crea primero la consulta"

#TRATAMIENTO
$(document).on "ajax:success","form#tratamiento-form", (ev,data,xhr, settings)->
    alert "Tratamiento Guardado exitosamente"
$(document).on "ajax:error","form#tratamiento-form", (ev,data,xhr, settings)->
    console.log data
    alert "Crea primero la consulta"

#RECETA-MEDICA
$(document).on "ajax:success","form#receta-form", (ev,data,xhr, settings)->
    alert "Item Guardado exitosamente"
$(document).on "ajax:error","form#receta-form", (ev,data,xhr, settings)->
    console.log data
    alert "Crea primero la consulta"

#TERAPIA
$(document).on "ajax:success","form#terapia-form", (ev,data,xhr, settings)->
    alert "Terapia Guardada exitosamente"
$(document).on "ajax:error","form#terapia-form", (ev,data,xhr, settings)->
    console.log data
    alert "Crea primero la consulta"

#PRUEBA MODAL
$(document).on 'turbolinks:load', ->
    $('#btnModal').click ->
        $('#modal').dialog()