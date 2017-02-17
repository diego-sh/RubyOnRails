# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success","form#comentarios-form", (ev,data)->
    console.log data
    $("#comentarios-box").append("<li>#{data.cuerpo}</li>");
    
$(document).on "ajax:error","form#comentarios-form", (ev,data)->
    console.log data