# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
    $('#notasEvolucion').hide();
    $('#signosVitales').hide();
    $('#examenCardiologico').hide();
    $('#protocoloOperacion').hide();
    $('#opNotasEvolucion').click ->
        $('#notasEvolucion').show();
        $('#notasEnfermeria').hide();
        $('#signosVitales').hide();
        $('#examenCardiologico').hide();
        $('#protocoloOperacion').hide();
    $('#opNotasEnfermeria').click ->
        $('#notasEvolucion').hide();
        $('#signosVitales').hide();
        $('#examenCardiologico').hide();
        $('#protocoloOperacion').hide();
        $('#notasEnfermeria').show();
    $('#opSignosVitales').click ->
        $('#signosVitales').show();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();
        $('#examenCardiologico').hide();
        $('#protocoloOperacion').hide();
    $('#opExamenCardiologico').click ->
        $('#examenCardiologico').show();
        $('#signosVitales').hide();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();
        $('#protocoloOperacion').hide();
    $('#opProtocoloOperacion').click ->
        $('#protocoloOperacion').show();
        $('#examenCardiologico').hide();
        $('#signosVitales').hide();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();

#REGISTRAR EXAMEN CARDIOLOGICO
$(document).on "ajax:success","form#examenCardiologico-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    $('#modalECardiologico').modal('hide');
    textExamenFisico = data.data.Chc_Examen_Fisico.replace(/\r\n/g, '<br />').replace(/[\r\n]/g, '<br />');
    textConclusiones = data.data.Chc_Conclusiones.replace(/\r\n/g, '<br />').replace(/[\r\n]/g, '<br />');
    textSugerencias = data.data.Chc_Sugerencias.replace(/\r\n/g, '<br />').replace(/[\r\n]/g, '<br />');
    textRiesgo = data.data.Chc_Riesgo_Quirurgico.replace(/\r\n/g, '<br />').replace(/[\r\n]/g, '<br />');    
    hora=new Date(data.data.Chc_Hora)
    formatHora=hora.getHours()+":"+hora.getMinutes()    
    $('.pnlExameCardiologico').append("
                                <div class='panel panel-warning'>
                                    <div class='panel-heading'>
                                        <h4 class='panel-title'>
                                            <a data-toggle='collapse' data-parent='#accordion' href='#collapseEC#{data.data.chequeos_cardiologico_id}'>Fecha: #{data.data.Chc_Fecha}    Hora:#{formatHora}</a>
                                        </h4>
                                    </div>
                                    <div id='collapseEC#{data.data.chequeos_cardiologico_id}' class='panel-collapse collapse'>
                                        <div class='panel-body'>
                                            <div class='row' style='color: #1976d2'>
                                                <div class='col-lg-3'><strong>EXAMEN FÍSICO</strong></div>
                                            </div>
                                            <div class='row'>                                                
                                                <div class='col-lg-10'>
                                                    #{textExamenFisico}
                                                </div>
                                            </div>
                                            <div class='row' style='color: #1976d2'>
                                                <div class='col-lg-3'><strong>ELECTROCARDIOGRAMA</strong></div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-1'><strong>Ritmo:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Ritmo}
                                                </div>
                                                <div class='col-lg-2'><strong>Frecuencia:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Frecuencia}
                                                </div>
                                                <div class='col-lg-2'><strong>SAQRS:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_SAQRS}
                                                </div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-1'><strong>Onda P:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Onda_P}
                                                </div>
                                                <div class='col-lg-2'><strong>Segmento PR:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Segmento_PR}
                                                </div>
                                                <div class='col-lg-2'><strong>Complejo QRS:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Complejo_QRS}
                                                </div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-1'><strong>Onda T:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Onda_T}
                                                </div>
                                                <div class='col-lg-2'><strong>Signo Morris:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Signo_Morris}
                                                </div>
                                                <div class='col-lg-2'><strong>Segmento QT:</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Segmento_QT}
                                                </div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-1'><strong>Indice Sokolov</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Indice_SOCOLOV}
                                                </div>
                                                <div class='col-lg-2'><strong>Segmento ST</strong></div>                                              
                                                <div class='col-lg-2'>
                                                    #{data.data.Chc_Segmento_ST}
                                                </div>
                                            </div>
                                            <div class='row' style='color: #1976d2'>
                                                <div class='col-lg-3'><strong>CONCLUSIONES</strong></div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-12'>
                                                    #{textConclusiones}
                                                </div>
                                            </div>
                                            <div class='row' style='color: #1976d2'>
                                                <div class='col-lg-3'><strong>SUGERENCIAS</strong></div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-12'>
                                                    #{textSugerencias}
                                                </div>
                                            </div>
                                            <div class='row' style='color: #1976d2'>
                                                <div class='col-lg-3'><strong>RIESGO QUIRÚRGICO</strong></div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-12'>
                                                    #{textRiesgo}
                                                </div>
                                            </div>

                                            <div class='row'>
                                                <div class='col-lg-12' style='text-align: right; color: #1976d2; font-size: 12px'>
                                                    <strong>Responsable:</strong>  #{data.responsable}
                                                </div>
                                            </div>                                            
                                        </div>
                                    </div>
                                </div>

    ")
$(document).on "ajax:error","form#examenCardiologico-form", (ev,data,xhr, settings)->
     showModal data.responseJSON.mensaje, 'error'


#REGISTRAR NOTAS DE EVOLUCION
$(document).on "ajax:success","form#notasEvolucion-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    $('#modalNotaEvolucion').modal('hide');
    textNotaEvolucion = data.data.Not_Nota.replace(/\r\n/g, '<br />').replace(/[\r\n]/g, '<br />');
    hora=new Date(data.data.Not_Hora)
    formatHora=hora.getHours()+":"+hora.getMinutes()    
    $('.pnlNotasEvolucion').append("<div class='panel panel-warning'>
                                    <div class='panel-heading'>
                                        <h4 class='panel-title'>
                                            <a data-toggle='collapse' data-parent='#accordion' href='#collapseNE#{data.data.nota_id}'>Fecha: #{data.data.Not_Fecha}  Hora:#{formatHora}</a>
                                        </h4>
                                    </div>
                                    <div id='collapseNE#{data.data.nota_id}' class='panel-collapse collapse in'>
                                        <div class='panel-body'>
                                            <div class='row'>
                                               <div class='col-lg-12' style='color:#8a6d3b'>
                                                    NOTA DE #{data.data.Not_Tipo}
                                                </div> 
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-12'>
                                                    #{textNotaEvolucion}
                                                </div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-12' style='text-align: right; color: #1976d2; font-size: 12px'>
                                                    <strong>Responsable:</strong> #{data.responsable}
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
    ")
    
$(document).on "ajax:error","form#notasEvolucion-form", (ev,data,xhr, settings)->
     showModal data.responseJSON.mensaje, 'error'

#REGISTRAR NOTAS DE ENFERMERIA
$(document).on "ajax:success","form#notasEnfermeria-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    textNota = data.data.Nde_Nota.replace(/\r\n/g, '<br />').replace(/[\r\n]/g, '<br />');
    $('#modalEnfermeriaNota').modal('hide');
    hora=new Date(data.data.Nde_Hora)
    formatHora=hora.getHours()+":"+hora.getMinutes()
    $('.pnlNotasEnfermeria').append("<div class='panel panel-warning'>
                                    <div class='panel-heading'>
                                        <h4 class='panel-title'>
                                            <a data-toggle='collapse' data-parent='#accordion' href='#collapseNE#{data.data.enfermeria_nota_id}'>Fecha: #{data.data.Nde_Fecha}  Hora:#{formatHora}</a>
                                        </h4>
                                    </div>
                                    <div id='collapseNE#{data.data.enfermeria_nota_id}' class='panel-collapse collapse in'>
                                        <div class='panel-body'>
                                            <div class='row'>
                                                <div class='col-lg-12'>
                                                    #{textNota}
                                                </div>
                                            </div>
                                            <div class='row'>
                                                <div class='col-lg-12' style='text-align: right; color: #1976d2; font-size: 12px'>
                                                    <strong>Responsable:</strong> #{data.responsable}
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div> ")
    

$(document).on "ajax:error","form#notasEnfermeria-form", (ev,data,xhr, settings)->
    console.log data

#REGISTRAR SIGNOS VITALES
$(document).on "ajax:success","form#signosVitales-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    $('#modalSignosVitales').modal('hide');
    hora=new Date(data.data.Siv_Hora)
    formatHora=hora.getHours()+":"+hora.getMinutes()
    actividades='';
    if data.data.Siv_Aseo != '0'
        actividades="<div class='col-lg-1'>Aseo/Baño</div>"
    if data.data.Siv_Actividad_Fisica !='0'
        actividades=actividades+"<div class='col-lg-2'>Actividad Física</div>"
    if data.data.Siv_Cambio_Sonda !='0'
        actividades=actividades+"<div class='col-lg-2'>Cambio de sonda</div>"
    if data.data.Siv_Recanalizacion_Via !='0'
        actividades=actividades+"<div class='col-lg-2'>Recanalización de la vía</div>"

    $('#pnlSignosVitales').append("
    <div class='alert alert-success' style='margin-bottom: 6px'>
                            <div class='row cabeceraNotas'>
                                <div class='col-lg-2'>
                                    <strong>Fecha:</strong> #{data.data.Siv_Fecha}
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Hora:</strong> #{formatHora}
                                </div>
                                <div class='col-lg-8' style='text-align: right'>
                                    <strong>Responsable:</strong> #{data.responsable}
                                </div>
                            </div>
                            <div class='row' style='margin-top: 10px'>
                                <div class='col-lg-2'>
                                    <strong>Temperatura:</strong> #{data.data.Siv_Temperatura} °C
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Pulso:</strong> #{data.data.Siv_Pulso} x min
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Saturación:</strong> #{data.data.Siv_Saturacion} %
                                </div>
                                <div class='col-lg-2'>
                                    <strong>F. Respiratoria:</strong> #{data.data.Siv_Frecuencia_Respiratoria} x min
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Presión:</strong> #{data.data.Siv_Presion_Arterial_Diastolica}/ #{data.data.Siv_Presion_Arterial_Sistolica} mmHg
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Peso:</strong> #{data.data.Siv_Peso} kg
                                </div>
                            </div>
                            <div class='row' style='margin-top: 5px'>
                                <div class='col-lg-6' style='text-align: center'>
                                    <strong>INGRESOS CC</strong>                                    

                                </div>
                                <div class='col-lg-6' style='text-align: center'>
                                    <strong>ELIMINACIONES CC</strong>
                                </div>
                            </div>
                            <div class='row'>
                                <div class='col-lg-2'>
                                    <strong>Parenteral:</strong> #{data.data.Siv_Ingresos_Parenteral}
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Via Oral:</strong> #{data.data.Siv_Ingresos_ViaOral}
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Total:</strong> #{data.data.Siv_Ingresos_Total}
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Orina:</strong> #{data.data.Siv_Eliminaciones_Orina}
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Drenaje:</strong> #{data.data.Siv_Eliminaciones_Drenaje}
                                </div>
                                <div class='col-lg-2'>
                                    <strong>Total:</strong> #{data.data.Siv_Eliminaciones_Total}
                                </div>
                            </div>
                            <div class='row' style='margin-top: 7px'>                                
                                 <div class='col-lg-2'>
                                    <strong>Número Comidas:</strong> #{data.data.Siv_Numero_Comidas}
                                </div>
                                 <div class='col-lg-2'>
                                    <strong>Numero Micciones:</strong> #{data.data.Siv_Numero_Micciones}
                                </div>
                                 <div class='col-lg-2'>
                                    <strong>Número Deposiciones:</strong> #{data.data.Siv_Numero_Deposiciones}
                                </div>
                                 <div class='col-lg-3'>
                                    <strong>Dieta Administrada:</strong> #{data.data.Siv_Dieta_Administrada}
                                </div>
                            </div>
                            <div class='row'>
                                <div class='col-lg-12'>
                                    <strong>ACTIVIDADES</strong>
                                </div>                                
                            </div>
                            <div class='row'>
                                #{actividades}
                            </div>
    ")
$(document).on "ajax:error","form#signosVitales-form", (ev,data,xhr, settings)->
    console.log data

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
