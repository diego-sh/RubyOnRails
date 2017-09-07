# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
    $('.calendarioCirugiaPropuesta').fullCalendar('option', 'height', 650);

#REGISTRA INGRESO
$(document).on "ajax:success","form#ingreso-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    $('#fullCalModal').modal('hide')
$(document).on "ajax:error","form#ingreso-form", (ev,data,xhr, settings)->
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