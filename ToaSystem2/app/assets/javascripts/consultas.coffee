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
    ##COMBO CONDICION DE LLEGADA
    $('#cmbCondicionesLlegada').change ->
        condicion=$('#cmbCondicionesLlegada :selected').text()
        if condicion == 'Otro'
            $('#condicionesLlegadaTexto').prop('disabled', false);
        else
            $('#condicionesLlegadaTexto').prop('disabled', true);
        return
    ##OPCIONES NO HABILITIDAS PARA CONSULTA EMERGENCIA
    $('#tabPanelConsulta a:first').hide()
    $('#btnCaracteristicasDolor').prop('disabled', true);
    $('#btnExamenFisico').prop('disabled', true)
    
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
        debugger
        value=$('#cmbTipoConsulta :selected').text()
        console.log "hey"
        console.log value
        if value == 'CONSULTA POR EMERGENCIA'          
            $('#tabPanelConsulta a:first').show()
            $('#tabPanelConsulta a:first').prop('style', display: 'block')
            $('#btnCaracteristicasDolor').prop('disabled', false);
            $('#btnExamenFisico').prop('disabled', false)
        if value == 'CONSULTA EXTERNA'
            $('#tabPanelConsulta a:first').hide()
            $('#btnCaracteristicasDolor').prop('disabled', true);
            $('#btnExamenFisico').prop('disabled', true)
    
    ##PANEL REGISTRAR PARTE OPERATORIO CIRUGIA MOSTRAR MODAL
    $('#btnCirugia').click ->
        $('#modalCirugia').modal()

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

#EMERGENCIA
$(document).on "ajax:success","form#emergencia-form", (ev,data,xhr, settings)->   
    showModal data.mensaje, 'success'
#PARTE OPERATORIO
$(document).on "ajax:success","form#parteOperatorio-form", (ev,data,xhr, settings)->   
    showModal data.mensaje, 'success'
$(document).on "ajax:error","form#parteOperatorio-form", (ev,data,xhr, settings)->
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