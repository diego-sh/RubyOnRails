# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
    $('#notasEvolucion').hide();
    $('#notasEnfermeria').hide();
    $('#examenCardiologico').hide();
    $('#protocoloOperacion').hide();
    $('#epicrisis').hide();
    $('#recetario').hide();
    $('#pnlRecetaMedicaIngreso').hide();
    $('#pnlTerapiaIngreso').hide();
    $('#ingreso_id').hide();

    $('#opNotasEvolucion').click ->
        $('#notasEvolucion').show();
        $('#notasEnfermeria').hide();
        $('#signosVitales').hide();
        $('#examenCardiologico').hide();
        $('#protocoloOperacion').hide();
        $('#epicrisis').hide();
        $('#recetario').hide();
        document.getElementById("opNotasEnfermeria").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEnfermeria").style["width"] = '95%';
        document.getElementById("opSignosVitales").style["background-color"] = '#b0bec5';
        document.getElementById("opSignosVitales").style["width"] = '95%';
        document.getElementById("opExamenCardiologico").style["background-color"] = '#b0bec5';
        document.getElementById("opExamenCardiologico").style["width"] = '95%';
        document.getElementById("opEpicrisis").style["background-color"] = '#b0bec5';
        document.getElementById("opEpicrisis").style["width"] = '95%';
        document.getElementById("opRecetario").style["background-color"] = '#b0bec5';
        document.getElementById("opRecetario").style["width"] = '95%';
        document.getElementById("opProtocoloOperacion").style["background-color"] = '#b0bec5';
        document.getElementById("opProtocoloOperacion").style["width"] = '95%';
        document.getElementById("opNotasEvolucion").style["background-color"] = '#f0ad4e';
        document.getElementById("opNotasEvolucion").style["width"] = '100%';
    $('#opNotasEnfermeria').click ->
        $('#notasEvolucion').hide();
        $('#signosVitales').hide();
        $('#examenCardiologico').hide();
        $('#protocoloOperacion').hide();
        $('#notasEnfermeria').show();
        $('#epicrisis').hide();
        $('#recetario').hide();
        document.getElementById("opNotasEnfermeria").style["background-color"] = '#f0ad4e';
        document.getElementById("opNotasEnfermeria").style["width"] = '100%';
        document.getElementById("opSignosVitales").style["background-color"] = '#b0bec5';
        document.getElementById("opSignosVitales").style["width"] = '95%';
        document.getElementById("opExamenCardiologico").style["background-color"] = '#b0bec5';
        document.getElementById("opExamenCardiologico").style["width"] = '95%';
        document.getElementById("opEpicrisis").style["background-color"] = '#b0bec5';
        document.getElementById("opEpicrisis").style["width"] = '95%';
        document.getElementById("opRecetario").style["background-color"] = '#b0bec5';
        document.getElementById("opRecetario").style["width"] = '95%';
        document.getElementById("opProtocoloOperacion").style["background-color"] = '#b0bec5';
        document.getElementById("opProtocoloOperacion").style["width"] = '95%';
        document.getElementById("opNotasEvolucion").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEvolucion").style["width"] = '95%';
    $('#opSignosVitales').click ->
        $('#signosVitales').show();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();
        $('#examenCardiologico').hide();
        $('#protocoloOperacion').hide();
        $('#recetario').hide();
        $('#epicrisis').hide();
        document.getElementById("opNotasEnfermeria").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEnfermeria").style["width"] = '95%';
        document.getElementById("opSignosVitales").style["background-color"] = '#f0ad4e';
        document.getElementById("opSignosVitales").style["width"] = '100%';
        document.getElementById("opExamenCardiologico").style["background-color"] = '#b0bec5';
        document.getElementById("opExamenCardiologico").style["width"] = '95%';
        document.getElementById("opEpicrisis").style["background-color"] = '#b0bec5';
        document.getElementById("opEpicrisis").style["width"] = '95%';
        document.getElementById("opRecetario").style["background-color"] = '#b0bec5';
        document.getElementById("opRecetario").style["width"] = '95%';
        document.getElementById("opProtocoloOperacion").style["background-color"] = '#b0bec5';
        document.getElementById("opProtocoloOperacion").style["width"] = '95%';
        document.getElementById("opNotasEvolucion").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEvolucion").style["width"] = '95%';
    $('#opExamenCardiologico').click ->
        $('#examenCardiologico').show();
        $('#signosVitales').hide();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();
        $('#protocoloOperacion').hide();
        $('#recetario').hide();
        $('#epicrisis').hide();
        document.getElementById("opNotasEnfermeria").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEnfermeria").style["width"] = '95%';
        document.getElementById("opSignosVitales").style["background-color"] = '#b0bec5';
        document.getElementById("opSignosVitales").style["width"] = '95%';
        document.getElementById("opExamenCardiologico").style["background-color"] = '#f0ad4e';
        document.getElementById("opExamenCardiologico").style["width"] = '100%';
        document.getElementById("opEpicrisis").style["background-color"] = '#b0bec5';
        document.getElementById("opEpicrisis").style["width"] = '95%';
        document.getElementById("opRecetario").style["background-color"] = '#b0bec5';
        document.getElementById("opRecetario").style["width"] = '95%';
        document.getElementById("opProtocoloOperacion").style["background-color"] = '#b0bec5';
        document.getElementById("opProtocoloOperacion").style["width"] = '95%';
        document.getElementById("opNotasEvolucion").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEvolucion").style["width"] = '95%';
    $('#opProtocoloOperacion').click ->
        $('#protocoloOperacion').show();
        $('#examenCardiologico').hide();
        $('#signosVitales').hide();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();
        $('#recetario').hide();
        $('#epicrisis').hide();
        document.getElementById("opNotasEnfermeria").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEnfermeria").style["width"] = '95%';
        document.getElementById("opSignosVitales").style["background-color"] = '#b0bec5';
        document.getElementById("opSignosVitales").style["width"] = '95%';
        document.getElementById("opExamenCardiologico").style["background-color"] = '#b0bec5';
        document.getElementById("opExamenCardiologico").style["width"] = '95%';
        document.getElementById("opEpicrisis").style["background-color"] = '#b0bec5';
        document.getElementById("opEpicrisis").style["width"] = '95%';
        document.getElementById("opRecetario").style["background-color"] = '#b0bec5';
        document.getElementById("opRecetario").style["width"] = '95%';
        document.getElementById("opProtocoloOperacion").style["background-color"] = '#f0ad4e';
        document.getElementById("opProtocoloOperacion").style["width"] = '100%';
        document.getElementById("opNotasEvolucion").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEvolucion").style["width"] = '95%';
    $('#opEpicrisis').click ->
        $('#protocoloOperacion').hide();
        $('#examenCardiologico').hide();
        $('#signosVitales').hide();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();
        $('#recetario').hide();
        $('#epicrisis').show();
        document.getElementById("opNotasEnfermeria").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEnfermeria").style["width"] = '95%';
        document.getElementById("opSignosVitales").style["background-color"] = '#b0bec5';
        document.getElementById("opSignosVitales").style["width"] = '95%';
        document.getElementById("opExamenCardiologico").style["background-color"] = '#b0bec5';
        document.getElementById("opExamenCardiologico").style["width"] = '95%';
        document.getElementById("opEpicrisis").style["background-color"] = '#f0ad4e';
        document.getElementById("opEpicrisis").style["width"] = '100%';
        document.getElementById("opRecetario").style["background-color"] = '#b0bec5';
        document.getElementById("opRecetario").style["width"] = '95%';
        document.getElementById("opProtocoloOperacion").style["background-color"] = '#b0bec5';
        document.getElementById("opProtocoloOperacion").style["width"] = '95%';
        document.getElementById("opNotasEvolucion").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEvolucion").style["width"] = '95%';
    $('#opRecetario').click ->
        $('#protocoloOperacion').hide();
        $('#examenCardiologico').hide();
        $('#signosVitales').hide();
        $('#notasEvolucion').hide();
        $('#notasEnfermeria').hide();
        $('#epicrisis').hide();
        $('#recetario').show();
        document.getElementById("opNotasEnfermeria").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEnfermeria").style["width"] = '95%';
        document.getElementById("opSignosVitales").style["background-color"] = '#b0bec5';
        document.getElementById("opSignosVitales").style["width"] = '95%';
        document.getElementById("opExamenCardiologico").style["background-color"] = '#b0bec5';
        document.getElementById("opExamenCardiologico").style["width"] = '95%';
        document.getElementById("opEpicrisis").style["background-color"] = '#b0bec5';
        document.getElementById("opEpicrisis").style["width"] = '95%';
        document.getElementById("opRecetario").style["background-color"] = '#f0ad4e';
        document.getElementById("opRecetario").style["width"] = '100%';
        document.getElementById("opProtocoloOperacion").style["background-color"] = '#b0bec5';
        document.getElementById("opProtocoloOperacion").style["width"] = '95%';
        document.getElementById("opNotasEvolucion").style["background-color"] = '#b0bec5';
        document.getElementById("opNotasEvolucion").style["width"] = '95%';
        

    #EDITAR PPROTOCOLO DE OPERACIÓN
    $('#btnEditarProtocolo').click ->
        $("#protocolo-form :input").prop("disabled", false);
    
    #EDITAR EPICRISIS
    $('#btnEditarEpicrisis').click ->
        $("#epicrisis-form :input").prop("disabled", false);
#AÑADIR RECETA MEDICA INGRESO
$(document).on "ajax:success","form#recetaIngreso-form", (ev,data,xhr, settings)->
    $('#modalReceta').modal('hide');
    $('#pnlRecetaMedicaIngreso').show();
    showModal data.mensaje, 'success'
    $('#prescripcionIngreso1').append("<div class='col-lg-12'>
                                
                                <div class='row'>
                                    <div class='col-lg-6'>
                                        <li>#{data.data.Ins_Nombre} Número: #{data.data.Ins_Cantidad} </li> 
                                    </div>
                                    <div class='col-lg-6'>
                                         #{data.data.Ins_Indicacion}
                                    </div>
                                </div>
                            ")
    $('#prescripcionIngreso2').html("<a href='/ingresos/pdfRecetaIngreso.pdf?recIngreso=#{data.ingreso.ingreso_id}&recIndicacion=#{data.indicacion.indicacion_id}' onclick='window.open(this.href,\"popupwindow\", \"width=800,height=790,left=400,top=5,scrollbars,toolbar=0,resizable\"); return false;' class='btn btn-primary pull-right' id='btnEmpezarConsulta'><span class='glyphicon glyphicon-print' aria-hidden='true'></span> IMPRIMIR</a>");

#AÑADIR TERAPIA DE INGRESO
$(document).on "ajax:success","form#terapiaIngreso-form", (ev,data,xhr, settings)->
    $('#modalTerapia').modal('hide');
    $('#pnlTerapiaIngreso').show();
    showModal data.mensaje, 'success'
    $('#terapiaIngreso1').html("
                                <li>#{data.data.Ter_indicacion}</li>
                                <p class='styleIndicacion'>Sesiones: #{data.data.Ter_Numero_Sesiones}</p>
                                ")
    $('#terapiaIngreso2').html("<a href='/ingresos/pdfTerapiaIngreso.pdf?tepIngreso=#{data.ingreso.ingreso_id}&recIndicacion=#{data.indicacion.indicacion_id}' onclick='window.open(this.href,\"popupwindow\", \"width=800,height=790,left=400,top=5,scrollbars,toolbar=0,resizable\"); return false;' class='btn btn-primary pull-right' id='btnEmpezarConsulta'><span class='glyphicon glyphicon-print' aria-hidden='true'></span> IMPRIMIR</a>");

#REGISTRAR EPICRISIS
$(document).on "ajax:success","form#epicrisis-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    $("#epicrisis-form :input").prop("disabled", true);
$(document).on "ajax:error","form#epicrisis-form", (ev,data,xhr, settings)->
     showModal data.responseJSON.mensaje, 'error'
 
#REGISTRAR PROTOCOLO DE OPERACIÓN
$(document).on "ajax:success","form#protocolo-form", (ev,data,xhr, settings)->
    showModal data.mensaje, 'success'
    $("#protocolo-form :input").prop("disabled", true);
$(document).on "ajax:error","form#protocolo-form", (ev,data,xhr, settings)->
     showModal data.responseJSON.mensaje, 'error'


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
        actividades="<div class='col-lg-2'>Aseo/Baño</div>"
    if data.data.Siv_Actividad_Fisica !='0'
        actividades=actividades+"<div class='col-lg-3'>Actividad Física</div>"
    if data.data.Siv_Cambio_Sonda !='0'
        actividades=actividades+"<div class='col-lg-3'>Cambio de sonda</div>"
    if data.data.Siv_Recanalizacion_Via !='0'
        actividades=actividades+"<div class='col-lg-3'>Recanalización de la vía</div>"

    $('#tblBodySignosVitales').append("
    <tr class='success'>
                                    <td> #{data.data.Siv_Fecha} </td>
                                    <td> #{formatHora}</td>
                                    <td> #{data.data.Siv_Dia_Internacion} </td>
                                    <td> #{data.data.Siv_Dia_PostQuirurgico} </td>
                                    <td> #{data.data.Siv_Peso} </td>
                                    <td> #{data.data.Siv_Pulso} </td>
                                    <td> #{data.data.Siv_Temperatura} </td>
                                    <td> #{data.data.Siv_Saturacion} </td>
                                    <td> #{data.data.Siv_Frecuencia_Respiratoria} </td>
                                    <td> #{data.data.Siv_Presion_Arterial_Diastolica}/ #{data.data.Siv_Presion_Arterial_Sistolica}</td>                                
                                    <td>
                                        <!--BALANCE HIDRICO-->
                                        <button class='btn btn-success btn-sm' data-toggle='modal' data-target='#modalSignos#{data.data.signos_vitale_id}'>Ver
                                        </button>
                                        <div class='modal fade' id='modalSignos#{data.data.signos_vitale_id}' tabindex='-1' role='dialog' aria-labelledby='exampleModalLongTitle' aria-hidden='true'>
                                            <div class='modal-dialog' role='document'>
                                                <div class='modal-content'>
                                                <div class='modal-header' style='background-color: #66bb6a'>
                                                    <h5 class='modal-title' id='titleSuccess' style='color: #fff'>BALANCE HIDRICO</h5>
                                                </div>
                                                <div class='modal-body'>
                                                    <table class='table dt-responsive no-wrap' width='100%'>
                                                        <tbody style='font-size: 14px'>
                                                            <tr style='background-color: #1976d2; color:#fff'>
                                                                <th  colspan='4'>INGRESOS CC</th>
                                                            </tr>
                                                            <tr>
                                                                <th>Parental</th>
                                                                <th>Via Oral</th>
                                                                <th colspan='2' style='text-align: right'>Total</th>
                                                            </tr>
                                                            <tr>
                                                                <td> #{data.data.Siv_Ingresos_Parenteral}</td>
                                                                <td> #{data.data.Siv_Ingresos_ViaOral} </td>
                                                                <td colspan='2' style='text-align: right'> #{data.data.Siv_Ingresos_Total}</td>
                                                            </tr>
                                                            <tr style='background-color: #f44336; color:#fff'>
                                                                <th  colspan='4'>ELIMINACIONES cc</th>
                                                            </tr>
                                                            <tr>
                                                                <th>Orina</th>
                                                                <th>Drenaje</th>
                                                                <th>Otros</th>
                                                                <th style='text-align: right'>Total</th>
                                                            </tr>
                                                            <tr>
                                                                <td> #{data.data.Siv_Eliminaciones_Orina}</td>
                                                                <td> #{data.data.Siv_Eliminaciones_Drenaje}</td>
                                                                <td> #{data.data.Siv_Eliminaciones_Otros}</td>
                                                                <td style='text-align: right'> #{data.data.Siv_Eliminaciones_Total}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class='modal-footer'>
                                                    <button type='button' class='btn btn-success btn-sm' data-dismiss='modal'>ACEPTAR</button>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    

                                    </td>
                                    <td>
                                        <!--MEDICIONES Y ACTIVIDADES-->
                                        <button class='btn btn-success btn-sm' data-toggle='modal' data-target='#modalMediciones#{data.data.signos_vitale_id}'>Ver
                                        </button>
                                        <div class='modal fade' id='modalMediciones#{data.data.signos_vitale_id}' tabindex='-1' role='dialog' aria-labelledby='exampleModalLongTitle' aria-hidden='true'>
                                            <div class='modal-dialog' role='document'>
                                                <div class='modal-content'>
                                                <div class='modal-header' style='background-color: #66bb6a'>
                                                    <h5 class='modal-title' id='titleSuccess' style='color: #fff'>MEDICIONES Y ACTIVIDADES</h5>
                                                </div>
                                                <div class='modal-body'>
                                                    <table class='table dt-responsive no-wrap' width='100%'>
                                                        <tbody style='font-size: 14px'>
                                                            <tr>
                                                                <th>Número De Comidas</th>
                                                                <th>Número De Micciones</th>
                                                                <th>Número De Deposiciones</th>
                                                            </tr>
                                                            <tr>
                                                                <td> #{data.data.Siv_Numero_Comidas} </td>
                                                                <td> #{data.data.Siv_Numero_Micciones}</td>
                                                                <td> #{data.data.Siv_Numero_Deposiciones}</td>
                                                            </tr>                                                            
                                                        </tbody>
                                                    </table>
                                                    <div class='row' style='text-align: left'>
                                                        <div class='col-lg-12'><strong>Dieta Administrada:</strong> #{data.data.Siv_Dieta_Administrada}</div>
                                                    </div>
                                                    <div class='row' style='text-align: left'>
                                                        <div class='col-lg-12'><strong>Actividades:</strong>                                                           
                                                        </div>
                                                    </div>
                                                    <div class='row'>
                                                        #{actividades}
                                                    </div>
                                                </div>
                                                <div class='modal-footer'>
                                                    <button type='button' class='btn btn-success btn-sm' data-dismiss='modal'>ACEPTAR</button>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    

                                    </td>
                                    <td style='font-size: 10px; color: #1976d2'>#{data.responsable}</td>

                                </tr>
    ")
$(document).on "ajax:error","form#signosVitales-form", (ev,data,xhr, settings)->
    console.log data

###FUNCIONES DE AYUDA ###
showModal = (message, type) ->
  if type == 'success'
    $('#titleSuccess').html("ÉXITO")
    $('#bodySuccess').html "#{message}"
    $('#modalSuccess').modal()
  if type == 'error'
    $('#titleError').html 'ERROR'
    $('#bodyError').html "#{message}"
    $('#modalError').modal()
  return
