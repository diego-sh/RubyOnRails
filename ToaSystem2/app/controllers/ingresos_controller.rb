class IngresosController < ApplicationController
    before_action :set_informacion,:set_empleado, only:[:new]
    before_action :set_SignosVitales, :set_enfermeriaNotas, :set_especialistas, :set_notaEvolucion, :set_examenCardiologico, :set_protocolo, only:[:new]    
    layout "hospitalizacion", only: [:new]

    def index
        @habitaciones=ConfiguracionHabitacion.all
        @pacientesIngresados=Ingreso.find_by_sql("SELECT p.paciente_id, i.ingreso_id,i.Ing_Fecha, p.Pac_Apellido_Paterno, P.Pac_Apellido_Materno, p.Pac_Nombres, TIMESTAMPDIFF(YEAR, p.Pac_Fecha_Nacimiento,CURDATE()) AS Age, i.Ing_Habitacion from consultas c 
                                                INNER JOIN citas cc ON c.cita_id=cc.cita_id 
                                                INNER JOIN pacientes p ON p.paciente_id=cc.paciente_id 
                                                INNER JOIN prescripciones pr ON pr.consulta_id=c.consulta_id 
                                                INNER JOIN partes_operatorios po ON po.prescripcion_id=pr.prescripcion_id
                                                INNER JOIN ingresos i ON i.partes_operatorio_id=po.partes_operatorio_id WHERE i.Ing_Estado='HOSPITALIZADO' ")
    end


    def new
        @ingreso=Ingreso.new
    end

    def createEnfermeriaNota
        respond_to do |format|
            @nota=EnfermeriaNota.new
            @nota.ingreso_id=@@ingresoTMP.ingreso_id
            if @@empleadoTMP!=nil
                @nota.empleado_id=@@empleadoTMP.empleado_id
            end
            @nota.Nde_Fecha=params[:ingreso][:enfermeriaNota][:Nde_Fecha]
            @nota.Nde_Hora=params[:ingreso][:enfermeriaNota][:Nde_Hora]
            @nota.Nde_Nota=params[:ingreso][:enfermeriaNota][:Nde_Nota]
            @nota.usuario_id=session[:usuario]["usuario_id"]
            if @nota.save
                @msg="NOTA REGISTRADA SATISFACTORIAMENTE."
                @responsable=session[:persona]["Per_Apellido_Paterno"]+" "+session[:persona]["Per_Nombres"]
                format.json { render json: {data:@nota, mensaje:@msg, responsable:@responsable}, status: :created }
            end
            
        end
        
    end

    def createNotaEvolucion
        respond_to do |format|
            @notaE=Nota.new
            if params[:ingreso][:nota][:Not_Tipo]!= ""          
                @notaE.ingreso_id=@@ingresoTMP.ingreso_id
                @notaE.usuario_id=session[:usuario]["usuario_id"]
                @notaE.Not_Fecha=params[:ingreso][:nota][:Not_Fecha]
                @notaE.Not_Hora=params[:ingreso][:nota][:Not_Hora]
                @notaE.Not_Tipo=params[:ingreso][:nota][:Not_Tipo]
                @notaE.Not_Nota=params[:ingreso][:nota][:Not_Nota]
                if @notaE.save
                    @revision=Revision.new
                    @revision.medico_id=@@medicoTMP.medico_id
                    @revision.nota_id=@notaE.nota_id
                    @revision.save
                    if params[:ingreso][:nota][:medico_id] !=""
                        @revisionAdicional=Revision.new
                        @revisionAdicional.medico_id=params[:ingreso][:nota][:medico_id]
                        @revisionAdicional.nota_id=@notaE.nota_id
                        @revisionAdicional.save
                    end
                    @msg="NOTA REGISTRADA SATISFACTORIAMENTE."
                    @responsable=session[:persona]["Per_Apellido_Paterno"]+" "+session[:persona]["Per_Nombres"]
                    format.json { render json: {data:@notaE, mensaje:@msg, responsable:@responsable}, status: :created }
                end
                
            else
                @msg="Escoja el tipo de nota."
                format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }
            end
            
        end
        
    end

    def createSignosVitales
        respond_to do |format|
            @signosVitales=SignosVitale.new
            @signosVitales.ingreso_id=@@ingresoTMP.ingreso_id
            @signosVitales.usuario_id=session[:usuario]["usuario_id"]
            @signosVitales.Siv_Fecha=params[:ingreso][:signosVitale][:Siv_Fecha]
            @signosVitales.Siv_Hora=params[:ingreso][:signosVitale][:Siv_Hora]
            @signosVitales.Siv_Dia_Internacion=params[:ingreso][:signosVitale][:Siv_Dia_Internacion]
            @signosVitales.Siv_Dia_PostQuirurgico=params[:ingreso][:signosVitale][:Siv_Dia_PostQuirurgico]
            @signosVitales.Siv_Pulso=params[:ingreso][:signosVitale][:Siv_Pulso]
            @signosVitales.Siv_Temperatura=params[:ingreso][:signosVitale][:Siv_Temperatura]
            @signosVitales.Siv_Saturacion=params[:ingreso][:signosVitale][:Siv_Saturacion]
            @signosVitales.Siv_Frecuencia_Respiratoria=params[:ingreso][:signosVitale][:Siv_Frecuencia_Respiratoria]
            @signosVitales.Siv_Presion_Arterial_Diastolica=params[:ingreso][:signosVitale][:Siv_Presion_Arterial_Diastolica]
            @signosVitales.Siv_Presion_Arterial_Sistolica=params[:ingreso][:signosVitale][:Siv_Presion_Arterial_Sistolica]
            @signosVitales.Siv_Ingresos_Parenteral=params[:ingreso][:signosVitale][:Siv_Ingresos_Parenteral]
            @signosVitales.Siv_Ingresos_ViaOral=params[:ingreso][:signosVitale][:Siv_Ingresos_ViaOral]
            @signosVitales.Siv_Ingresos_Total=params[:ingreso][:signosVitale][:Siv_Ingresos_Total]
            @signosVitales.Siv_Eliminaciones_Orina=params[:ingreso][:signosVitale][:Siv_Eliminaciones_Orina]
            @signosVitales.Siv_Eliminaciones_Drenaje=params[:ingreso][:signosVitale][:Siv_Eliminaciones_Drenaje]
            @signosVitales.Siv_Eliminaciones_Otros=params[:ingreso][:signosVitale][:Siv_Eliminaciones_Otros]
            @signosVitales.Siv_Eliminaciones_Total=params[:ingreso][:signosVitale][:Siv_Eliminaciones_Total]
            @signosVitales.Siv_Peso=params[:ingreso][:signosVitale][:Siv_Peso]
            @signosVitales.Siv_Numero_Comidas=params[:ingreso][:signosVitale][:Siv_Numero_Comidas]
            @signosVitales.Siv_Numero_Micciones=params[:ingreso][:signosVitale][:Siv_Numero_Micciones]
            @signosVitales.Siv_Numero_Deposiciones=params[:ingreso][:signosVitale][:Siv_Numero_Deposiciones]
            @signosVitales.Siv_Aseo=params[:ingreso][:signosVitale][:Siv_Aseo]
            @signosVitales.Siv_Dieta_Administrada=params[:ingreso][:signosVitale][:Siv_Dieta_Administrada]            
            @signosVitales.Siv_Cambio_Sonda=params[:ingreso][:signosVitale][:Siv_Cambio_Sonda]
            @signosVitales.Siv_Recanalizacion_Via=params[:ingreso][:signosVitale][:Siv_Recanalizacion_Via]
            @signosVitales.Siv_Actividad_Fisica=params[:ingreso][:signosVitale][:Siv_Actividad_Fisica]
            if @signosVitales.save
                @msg="SIGNOS VITALES registrados satisfactoriamente."
                @responsable=session[:persona]["Per_Apellido_Paterno"]+" "+session[:persona]["Per_Nombres"]
                format.json { render json: {data:@signosVitales, mensaje:@msg, responsable:@responsable}, status: :created } 
            end
        end
    end
    
    def createExamenCardiologico
        respond_to do |format|
            @examenCardio=ChequeosCardiologico.new
            @examenCardio.ingreso_id=@@ingresoTMP.ingreso_id
            @examenCardio.usuario_id=session[:usuario]["usuario_id"]
            @examenCardio.Chc_Fecha=params[:ingreso][:ChequeosCardiologico][:Chc_Fecha]
            @examenCardio.Chc_Hora=params[:ingreso][:ChequeosCardiologico][:Chc_Hora]
            @examenCardio.Chc_Examen_Fisico=params[:ingreso][:ChequeosCardiologico][:Chc_Examen_Fisico]
            @examenCardio.Chc_Ritmo=params[:ingreso][:ChequeosCardiologico][:Chc_Ritmo]
            @examenCardio.Chc_Frecuencia=params[:ingreso][:ChequeosCardiologico][:Chc_Frecuencia]
            @examenCardio.Chc_SAQRS=params[:ingreso][:ChequeosCardiologico][:Chc_SAQRS]
            @examenCardio.Chc_Onda_P=params[:ingreso][:ChequeosCardiologico][:Chc_Onda_P]
            @examenCardio.Chc_Segmento_PR=params[:ingreso][:ChequeosCardiologico][:Chc_Segmento_PR]
            @examenCardio.Chc_Complejo_QRS=params[:ingreso][:ChequeosCardiologico][:Chc_Complejo_QRS]
            @examenCardio.Chc_Indice_SOCOLOV=params[:ingreso][:ChequeosCardiologico][:Chc_Indice_SOCOLOV]
            @examenCardio.Chc_Signo_Morris=params[:ingreso][:ChequeosCardiologico][:Chc_Signo_Morris]
            @examenCardio.Chc_Segmento_QT=params[:ingreso][:ChequeosCardiologico][:Chc_Segmento_QT]
            @examenCardio.Chc_Onda_T=params[:ingreso][:ChequeosCardiologico][:Chc_Onda_T]
            @examenCardio.Chc_Segmento_ST=params[:ingreso][:ChequeosCardiologico][:Chc_Segmento_ST]
            @examenCardio.Chc_Conclusiones=params[:ingreso][:ChequeosCardiologico][:Chc_Conclusiones]
            @examenCardio.Chc_Sugerencias=params[:ingreso][:ChequeosCardiologico][:Chc_Sugerencias]
            @examenCardio.Chc_Riesgo_Quirurgico=params[:ingreso][:ChequeosCardiologico][:Chc_Riesgo_Quirurgico]
            if @examenCardio.save
                @msg="EXAMEN CARDIOLÓGICO REGISTRADO SATISFACTORIAMENTE."
                @responsable=session[:persona]["Per_Apellido_Paterno"]+" "+session[:persona]["Per_Nombres"]
                format.json { render json: {data:@examenCardio, mensaje:@msg, responsable:@responsable}, status: :created }
            end
            
            
        end        
    end
    
    
    private

    def set_informacion
        @res_pacientes = Paciente.find_by_sql("SELECT *, TIMESTAMPDIFF(YEAR, Pac_Fecha_Nacimiento,CURDATE()) AS Edad from pacientes WHERE paciente_id="+params[:pcte])
        @@pacienteTMP=@res_pacientes[0]
        @paciente=@res_pacientes[0]
        @res_ingreso= Ingreso.find_by_sql("SELECT i.ingreso_id, i.Ing_Fecha, i.Ing_Habitacion, i.Ing_Estado, pp.Pop_Cirugia_Propuesta FROM ingresos i 
                                            INNER JOIN partes_operatorios pp ON pp.partes_operatorio_id=i.partes_operatorio_id WHERE i.ingreso_id="+params[:ingreso])
        @infoIngreso=@res_ingreso[0]
        @@ingresoTMP=@res_ingreso[0]
    end
    def set_SignosVitales
        @signosVitalesRegistrados= SignosVitale.find_by_sql("SELECT sv.signos_vitale_id, sv.ingreso_id, sv.Siv_Fecha, sv.Siv_Hora, sv.Siv_Dia_Internacion, sv.Siv_Dia_PostQuirurgico, sv.Siv_Pulso, sv.Siv_Temperatura, sv.Siv_Frecuencia_Respiratoria,
            sv.Siv_Presion_Arterial_Diastolica, sv.Siv_Presion_Arterial_Sistolica, sv.Siv_Saturacion, sv.Siv_Ingresos_Parenteral, sv.Siv_Ingresos_ViaOral, sv.Siv_Ingresos_Total,
            sv.Siv_Eliminaciones_Orina, sv.Siv_Eliminaciones_Drenaje, sv.Siv_Eliminaciones_Otros, sv.Siv_Eliminaciones_Total, sv.Siv_Aseo, sv.Siv_Peso, sv.Siv_Dieta_Administrada,
            sv.Siv_Numero_Comidas, sv.Siv_Numero_Micciones, sv.Siv_Numero_Deposiciones, sv.Siv_Actividad_Fisica, sv.Siv_Cambio_Sonda, sv.Siv_Recanalizacion_Via,
            p.Per_Apellido_Paterno, p.Per_Nombres
            FROM signos_vitales sv INNER JOIN usuarios u ON sv.usuario_id=u.usuario_id INNER JOIN personas p ON p.usuario_id=u.usuario_id WHERE sv.ingreso_id="+@@ingresoTMP.ingreso_id.to_s)
    end
    def set_empleado
        @@empleadoTMP=Empleado.find_by_persona_id(session[:persona]["persona_id"])
        @@medicoTMP= Medico.find_by_persona_id(session[:persona]["persona_id"])
    end
    def set_enfermeriaNotas
        @notasDeEnfermeria=EnfermeriaNota.find_by_sql("SELECT en.enfermeria_nota_id, en.ingreso_id, en.Nde_Fecha, en.Nde_Hora, en.Nde_Nota, p.Per_Apellido_Paterno, p.Per_Nombres FROM enfermeria_notas en 
                                                    INNER JOIN empleados e ON e.empleado_id=en.empleado_id
                                                    INNER JOIN personas p ON p.persona_id=e.persona_id
                                                    WHERE en.ingreso_id="+@@ingresoTMP.ingreso_id.to_s)
    end
    def set_especialistas
        @id=session[:persona]["persona_id"]
        @especialistas=Persona.find_by_sql("SELECT CONCAT(CONCAT(p.Per_Apellido_Paterno,' '), p.Per_Nombres) AS Nombre, m.medico_id, p.persona_id FROM personas p INNER JOIN medicos m on p.persona_id = m.persona_id WHERE NOT p.persona_id="+@id.to_s)
    end
    def set_notaEvolucion
        @notasEvolucion=Nota.find_by_sql("SELECT *FROM notas WHERE ingreso_id="+@@ingresoTMP.ingreso_id.to_s)
    end
    def set_examenCardiologico
        @eCardiologicos=ChequeosCardiologico.find_by_sql("SELECT * FROM chequeos_cardiologicos cc INNER JOIN usuarios u ON cc.usuario_id=u.usuario_id 
                                                        INNER JOIN personas p ON u.usuario_id=p.usuario_id 
                                                        WHERE cc.ingreso_id="+@@ingresoTMP.ingreso_id.to_s)
    end
    def set_protocolo
        @protocolo=ProtocoloOperacion.find_by_ingreso_id(@@ingresoTMP.ingreso_id)
        if @protocolo == nil
            @protocolo=ProtocoloOperacion.new
        end
        
    end
            
    
end
