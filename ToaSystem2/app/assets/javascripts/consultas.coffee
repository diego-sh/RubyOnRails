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
    $('#showTerapia').hide();
    $('#condicionesLlegadaTexto').prop('disabled', true);
    $('#nombreTipoEvento').prop('disabled',true);
    #INICIALIZADOR DE SELECTED-PARTE OPERAATORIO
    $('#cmbCirujano').selectpicker();
    $('#cmbAyudantes').selectpicker();
    $('#cmbAnestesiologo').selectpicker();
    $('#cmbInstrumentista').selectpicker();
    $('#cmbCirculante').selectpicker(); 
    # DIV INFO DEL PACIENTE
    $('#pnlPacienteRecuperado').hide()
    ##COMBO CONDICION DE LLEGADA
    $('#cmbCondicionesLlegada').change ->
        condicion=$('#cmbCondicionesLlegada :selected').text()
        if condicion == 'Otro'
            $('#condicionesLlegadaTexto').prop('disabled', false);
        else
            $('#condicionesLlegadaTexto').prop('disabled', true);
        return
    ##BUTTOM FINALIZAR CONSULTA EMERGENCIA
    $('#btnFinalizarEmergencia').hide();
    ##OPCIONES NO HABILITIDAS PARA CONSULTA EMERGENCIA
    $('#tabPanelConsulta a:first').hide()
    $('#btnCaracteristicasDolor').prop('disabled', true);
    
    ##COMBO TIPO DE EVENTO
    $('#cmbTipoEvento').change ->
        condicion=$('#cmbTipoEvento :selected').text()
        if condicion == 'Otro'
            $('#nombreTipoEvento').prop('disabled', false);
        else
            $('#nombreTipoEvento').prop('disabled', true);
        return
    
    ##CONSULTA EMERGENCIA-EXTERNA
    $('#cmbTipoConsulta').change ->
        value=$('#cmbTipoConsulta :selected').text()
        if value == 'CONSULTA POR EMERGENCIA'          
            $('#tabPanelConsulta a:first').show()
            $('#tabPanelConsulta a:first').prop('style', display: 'block')
            $('#btnCaracteristicasDolor').prop('disabled', false);
            
            $('#btnFinalizarEmergencia').show();
            $('#btnFinConsulta').hide();
            $('#causaMuerte').prop('disabled', true)
        if value == 'CONSULTA EXTERNA'
            $('#tabPanelConsulta a:first').hide()
            $('#btnCaracteristicasDolor').prop('disabled', true);
           
            $('#btnFinalizarEmergencia').hide();
            $('#btnFinConsulta').show();
    
    ##PANEL REGISTRAR PARTE OPERATORIO CIRUGIA MOSTRAR MODAL
    $('#btnCirugia').click ->
        #$('#modalCirugia2').modal()
        $('#modalCirugia2').on 'shown.bs.modal', ->
            $(".calendariocirugia").fullCalendar('render');

    #BLOQUEO DE OPCIONES CIRUJANO-AYUDANTES EN PARTE OPERATORIO DE ACUERDO LA VALOR
    $('#cmbCirujano').change ->
        op = document.getElementById('cmbAyudantes').getElementsByTagName('option')
        x=0
        while x < op.length
           op[x].disabled = false
           $('#cmbAyudantes').selectpicker('refresh');
           x++

        selected = $(':selected', this).text()
        $('#cmbAyudantes option:contains("' + selected + '")').attr 'disabled', 'disabled'
        $('#cmbAyudantes').selectpicker('refresh');
        $('#cmbAnestesiologo option:contains("' + selected + '")').attr 'disabled', 'disabled'
        $('#cmbAnestesiologo').selectpicker('refresh');

    #BLOQUEO DE OPCIONES AYUDANTES-ANESTESIOLOGO EN PARTE OPERATORIO DE ACUERDO LA VALOR
    $('#cmbAyudantes').change ->
        debugger
        selected = $('#cmbAyudantes').val();
        if selected.length != undefined
            i=0
            op = document.getElementById('cmbAnestesiologo').getElementsByTagName('option')
            while i < selected.length
                j=0
                while j < op.length
                    if selected[i]== op[j].value
                        op[j].disabled = true
                        $('#cmbAnestesiologo').selectpicker('refresh');
                    j++                
                i++

    #BLOQUEO DE OPCIONES CIRUJANO-AYUDANTES EN PARTE OPERATORIO DE ACUERDO LA VALOR
    $('#cmbInstrumentista').change ->
        op = document.getElementById('cmbCirculante').getElementsByTagName('option')
        x=0
        while x < op.length
           op[x].disabled = false
           $('#cmbCirculante').selectpicker('refresh');
           x++
        selected = $(':selected', this).text()
        $('#cmbCirculante option:contains("' + selected + '")').attr 'disabled', 'disabled'
        $('#cmbCirculante').selectpicker('refresh');

    #CARGA DIAGNOSTICO FINAL EN PARTE OPERATORIO
    $('#btnCirugia').click ->
        valor= $('#diagnostico').val()
        $('#diagnosticoPreoperatorio').val(valor)
    
    #CONDICION DE SALIDA CONSULTA EMERGENCIA
    $('#condicionSalida').change ->
        value=$('#condicionSalida :selected').text()
        if value == 'Muerto'
            $('#causaMuerte').prop('disabled', false)
        else
            $('#causaMuerte').prop('disabled', true)

#BUSCAR PACIENTE-CONSULTA
$(document).on "ajax:success","form#buscarPaciente-form", (ev,data,xhr, settings)->
    if data.data[0]== undefined
        showModal 'Paciente no encontrado..! Verifique los datos ingresados', 'error'
        $('#pnlPacienteRecuperado').hide()
    else
        showModal 'Paciente encontrado.!', 'success'
        $('#pnlPacienteRecuperado').show()
        $('#pnlDatosPaciente').html("<strong>Nombre: </strong>#{data.data[0].Pac_Apellido_Paterno} #{data.data[0].Pac_Apellido_Materno} #{data.data[0].Pac_Nombres}")
        $('#pnlDatosPacienteCedula').html("<strong>Cédula: </strong>#{data.data[0].Pac_Cedula}")        
        $('#pnlButtonPaciente').html("<a href='/consultas/new?pcte=#{data.data[0].paciente_id}' class='btn btn-primary' id='btnEmpezarConsulta'>Empezar Consulta</a>")

$(document).on "ajax:error","form#buscarPaciente-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

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
    $('#modalSintomas').modal('hide')
    showModal data.mensaje, 'success'  
$(document).on "ajax:error","form#sintomas-form", (ev,data)->
    showModal data.responseJSON.mensaje, 'error'    

#CONSULTA
$(document).on "ajax:success","form#consulta-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    $('#btnSalirConsulta69').hide()
$(document).on "ajax:error","form#consulta-form", (ev,data,xhr, settings)->
    console.log data

#EXAMEN-FISICO
$(document).on "ajax:success","form#examenFisico-form", (ev,data,xhr, settings)->
    $('#efobservacion').val("")
    $('#modalEFisico').modal('hide')
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#examenFisico-form", (ev,data)->
    showModal data.responseJSON.mensaje, 'error'

#PEDIDO-EXAMEN
$(document).on "ajax:success","form#pedidoExamen-form", (ev,data,xhr, settings)->
    $('#estudioDescripcion').val("")
    $('#estudioMotivo').val("")
    $('#modalPedidoImagenologia').modal('hide')
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
                                <p class='styleIndicacion'>Cantidad: #{data.data.Ins_Cantidad}</p>
                                <p class='styleIndicacion'>Indicación: #{data.data.Ins_Indicacion}</p>");
    $('#prescripcion2').html("<a href='/consultas/pdfReceta.pdf?rec=#{data.consulta.consulta_id}' onclick='window.open(this.href,\"popupwindow\", \"width=800,height=790,left=400,top=5,scrollbars,toolbar=0,resizable\"); return false;' class='btn btn-primary pull-right' id='btnEmpezarConsulta'><span class='glyphicon glyphicon-print' aria-hidden='true'></span> IMPRIMIR</a>");
    showModal data.mensaje, 'success'
    $('#modalReceta').modal('hide');
$(document).on "ajax:error","form#receta-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

#TERAPIA
$(document).on "ajax:success","form#terapia-form", (ev,data,xhr, settings)->
    $('#showTerapia').show()
    $('#sesionesNumero').val(0)
    $('#sesionIndicacion').val("")
    $('#terapia1').append("<li>#{data.data.Ter_indicacion}</li>
                                <p class='styleIndicacion'>Sesiones: #{data.data.Ter_Numero_Sesiones}</p>");
    $('#terapia2').html("<a href='/consultas/pdfTerapia.pdf?tep=#{data.consulta.consulta_id}' onclick='window.open(this.href,\"popupwindow\", \"width=800,height=790,left=400,top=5,scrollbars,toolbar=0,resizable\"); return false;' class='btn btn-primary pull-right' id='btnEmpezarConsulta'><span class='glyphicon glyphicon-print' aria-hidden='true'></span> IMPRIMIR</a>");    
    showModal data.mensaje, 'success'
    $('#modalTerapia').modal('hide');
$(document).on "ajax:error","form#terapia-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

#EMERGENCIA
$(document).on "ajax:success","form#emergencia-form", (ev,data,xhr, settings)->   
    showModal data.mensaje, 'success'
#PARTE OPERATORIO
$(document).on "ajax:success","form#parteOperatorio-form", (ev,data,xhr, settings)->   
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#parteOperatorio-form", (ev,data,xhr, settings)->
    showModal data.responseJSON.mensaje, 'error'

#FINALIZAR EMERGENCIA
$(document).on "ajax:error","form#finalizarEmergencia-form", (ev,data,xhr, settings)->
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

@recetaHC = (codigo) ->
    window.open '/consultas/pdfReceta.pdf?rec=' + codigo, '_blank', 'width=800,height=790,left=400,top=5,scrollbars,toolbar=0,resizable'
    return

@terapiaHC = (codigo) ->
    window.open '/consultas/pdfTerapia.pdf?tep=' + codigo, '_blank', 'width=800,height=790,left=400,top=5,scrollbars,toolbar=0,resizable'
    return