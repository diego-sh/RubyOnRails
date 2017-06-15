class ConsultasController < ApplicationController
  before_action :set_paciente, only:[:show, :new]
  before_action :list_antecedentes, only:[:new]
  after_action :save_cita, only:[:createConsulta]
  
  def index
      @medico= Medico.find_by_persona_id(session[:persona]["persona_id"])
      @lstPacientesAtender=Cita.find_by_sql("SELECT c.cita_id,c.cit_fecha,c.cit_hora,c.cit_motivo, p.paciente_id, CONCAT(CONCAT(p.pac_apellido_paterno,' '),p.pac_apellido_materno)AS Apellidos, p.pac_nombres 
                                            FROM citas c INNER JOIN pacientes p ON p.paciente_id=c.paciente_id 
                                            WHERE c.medico_id='#{@medico.medico_id}' AND c.cit_fecha=CURDATE() ORDER by c.cit_hora ASC")

  end

  def show
    @medicinas = Medicina.find_by_sql("SELECT * FROM medicinas m JOIN prescripciones p ON m.prescripcion_id = p.prescripcion_id JOIN consultas c ON p.consulta_id = c.consulta_id  WHERE c.consulta_id ="+params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'consultas/Receta', pdf: "Receta"
      end
    end   
  end

#ACCION QUE BUSCA AL PACIENTE
  def buscarPaciente
    respond_to do |format|
      if params[:term]!= ""
        @paciente=Paciente.search(params[:term])
        @msg="Paciente encontrado"
        format.json { render json: {data:@paciente}, status: :created }
        format.html
        
      else
        @msg="Favor ingresa un número de cédula.!"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }
      end
      
    end  
  end


  def new
    @consulta=Consulta.new
    @antecedente= Antecedente.new
    @sintoma=Sintoma.new
    @diagnostico=Diagnostico.new
    @examenFisico= ExamenFisico.new
    @pacienteHC = Paciente.find_by_sql("SELECT * FROM pacientes WHERE paciente_id="+@@pacienteTMP.paciente_id.to_s)
    if @pacienteHC[0].Pac_HC == nil || @pacienteHC[0].Pac_HC ==""
      @hc = Paciente.find_by_sql("SELECT PAC_HC AS HC FROM pacientes ORDER BY Pac_HC DESC LIMIT 1")
      Paciente.where(paciente_id: @@pacienteTMP.paciente_id.to_s).update_all(Pac_HC: 'HCL' + (@hc[0].HC.scan(/\d/).join('').to_i + 1).to_s.rjust(5, '0'))
    end
    @especialistas=Persona.find_by_sql("SELECT CONCAT(CONCAT(p.Per_Apellido_Paterno,' '), p.Per_Nombres) AS Nombre, m.medico_id, p.persona_id FROM personas p INNER JOIN medicos m on p.persona_id = m.persona_id")
    @personal=Persona.find_by_sql("SELECT CONCAT(CONCAT(p.Per_Apellido_Paterno,' '), p.Per_Nombres) AS Nombre,p.persona_id FROM personas p INNER JOIN usuarios u ON p.usuario_id=u.usuario_id INNER JOIN perfiles pr ON u.perfil_id=pr.perfil_id where pr.Nombre_Perfil='ENFERMERA' ")
  end


  # ACCION CREAR PARTE OPERATORIO
  def createParteOperatorio
    respond_to do |format|
      @parteOperatorio=PartesOperatorio.new    
      if @@consultaTMP!=nil
        unless @@prescripcionTMP!=nil
          puts "ingresa a prescripcion"
          @prescripcion=Prescripcion.new
          @prescripcion.consulta_id=@@consultaTMP.consulta_id
          @prescripcion.save
          @@prescripcionTMP=@prescripcion
        end
        @parteOperatorio.prescripcion_id=@@prescripcionTMP.prescripcion_id
        @parteOperatorio.Pop_Diagnostico_PreOperatorio=params[:consulta][:partesOperatorio][:Pop_Diagnostico_PreOperatorio]
        @parteOperatorio.Pop_Cirugia_Propuesta=params[:consulta][:partesOperatorio][:Pop_Cirugia_Propuesta]
        @parteOperatorio.Pop_Fecha_Cirugia=params[:consulta][:partesOperatorio][:Pop_Fecha_Cirugia]
        @parteOperatorio.Pop_Hora_Cirugia=params[:consulta][:partesOperatorio][:Pop_Hora_Cirugia]
        @parteOperatorio.Pop_Cirugia_Tipo=params[:consulta][:partesOperatorio][:Pop_Cirugia_Tipo]
        @parteOperatorio.Pop_Tiempo_Cirugia=params[:consulta][:partesOperatorio][:Pop_Tiempo_Cirugia]
        @parteOperatorio.Pop_Instrumental_Especial=params[:consulta][:partesOperatorio][:Pop_Instrumental_Especial]
        @parteOperatorio.usuario_id=session[:usuario]["usuario_id"] 

        if @parteOperatorio.save  
          if params[:consulta][:partesOperatorio][:Pop_Cirujano]!=""
            @equipo=Equipo.new
            @equipo.persona_id= params[:consulta][:partesOperatorio][:Pop_Cirujano]
            @equipo.partes_operatorio_id=@parteOperatorio.partes_operatorio_id
            @equipo.Rol_Funcion="CIRUJANO"
            @equipo.save
          end          
          params[:consulta][:partesOperatorio][:Pop_Ayudantes].each do |ayudante|
            if ayudante!=""
              @equipo=Equipo.new
              @equipo.persona_id=ayudante
              @equipo.partes_operatorio_id=@parteOperatorio.partes_operatorio_id
              @equipo.Rol_Funcion="AYUDANTE"
              @equipo.save
            end            
          end
          if params[:consulta][:partesOperatorio][:Pop_Anestesiologo]!=""
            @equipo=Equipo.new
            @equipo.persona_id=params[:consulta][:partesOperatorio][:Pop_Anestesiologo]
            @equipo.partes_operatorio_id=@parteOperatorio.partes_operatorio_id
            @equipo.Rol_Funcion="ANESTESIOLOGO"
            @equipo.save
          end
          if params[:consulta][:partesOperatorio][:Pop_Instrumentista]!=""
            @equipo=Equipo.new
            @equipo.persona_id=params[:consulta][:partesOperatorio][:Pop_Instrumentista]
            @equipo.partes_operatorio_id=@parteOperatorio.partes_operatorio_id
            @equipo.Rol_Funcion="INSTRUMENTISTA"
            @equipo.save
          end
          if params[:consulta][:partesOperatorio][:Pop_Circulante]!=""
            @equipo=Equipo.new
            @equipo.persona_id=params[:consulta][:partesOperatorio][:Pop_Circulante]
            @equipo.partes_operatorio_id=@parteOperatorio.partes_operatorio_id
            @equipo.Rol_Funcion="CIRCULANTE"
            @equipo.save
          end
          @msg="CIRUGÍA PROGRAMADA satisfactorimente"
          format.json { render json: {data:@parteOperatorio, mensaje:@msg}, status: :created }                 
        end
      else
        @msg="Guarde primero la consulta"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }  
      end      
    end
    
  end

  # ACCION CREAR ANTECEDENTE
  def createAntecedente
    @antecedente=Antecedente.new
    @antecedente.Ant_tipo=params[:consulta][:antecedente][:Ant_tipo]
    @antecedente.Ant_Descripcion=params[:consulta][:antecedente][:Ant_Descripcion]
    @antecedente.paciente_id=@@pacienteTMP.paciente_id
    @antecedente.usuario_id=session[:usuario]["usuario_id"]
    respond_to do |format|
      if @antecedente.save
        @msg="Antecedente creado satisfactoriamente"
        format.json { render json: {data:@antecedente, mensaje:@msg}, status: :created }
        format.html
      else
         format.json { render json: @antecedente.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def createConsulta
    @consulta=Consulta.new     
    respond_to do |format|
      if !@@inserted
        @consulta.cita_id=@@cita_idTMP
        @consulta.Con_Cronologia=params[:consulta][:Con_Cronologia]
        @consulta.Con_Diagnostico_Final= params[:consulta][:Con_Diagnostico_Final]
        @consulta.Con_Codigo_CIE=params[:consulta][:Con_Codigo_CIE]
        @consulta.Con_Observacion=params[:consulta][:Con_Observacion]
        @consulta.Con_Motivo=params[:consulta][:Con_Motivo]
        @consulta.usuario_id=session[:usuario]["usuario_id"]     
        if @consulta.save          
          @@consultaTMP=@consulta
          @msg="Consulta guardada satisfactoriamente."
          format.json { render json: {data:@consulta, mensaje:@msg}, status: :created }              
        else
          format.json { render json: @consulta.errors, status: :unprocessable_entity }
        end
      else
        @@consultaTMP.update(:Con_Cronologia=>params[:consulta][:Con_Cronologia],:Con_Diagnostico_Final=>params[:consulta][:Con_Diagnostico_Final],:Con_Codigo_CIE=>params[:consulta][:Con_Codigo_CIE],:Con_Observacion=>params[:consulta][:Con_Observacion],:Con_Motivo=>params[:consulta][:Con_Motivo] )
        @msg="Consulta guardada satisfactoriamente."
        format.json { render json: {data:@consulta, mensaje:@msg}, status: :created }  
      end      
   end    
    
  end

  def createSintoma
    @sintoma= Sintoma.new
    respond_to do |format|
      if @@consultaTMP!=nil        
        @sintoma.Sin_Region_Anatomica=params[:consulta][:sintoma][:Sin_Region_Anatomica]
        @sintoma.Sin_Punto_Doloroso=params[:consulta][:sintoma][:Sin_Punto_Doloroso]
        @sintoma.Sin_Evolucion=params[:consulta][:sintoma][:Sin_Evolucion]
        @sintoma.Sin_Tipo=params[:consulta][:sintoma][:Sin_Tipo]
        @sintoma.Sin_Modificaciones=params[:consulta][:sintoma][:Sin_Modificaciones]
        @sintoma.Sin_Alivia=params[:consulta][:sintoma][:Sin_Alivia]
        @sintoma.Sin_Intensidad=params[:consulta][:sintoma][:Sin_Intensidad] 
          
        if @sintoma.save
          @diagnostico=Diagnostico.new
          @diagnostico.consulta_id=@@consultaTMP.consulta_id
          @diagnostico.sintoma_id=@sintoma.sintoma_id
          @diagnostico.Diagnostico_Presuntivo=params[:consulta][:diagnostico][:Diagnostico_Presuntivo]
          @diagnostico.Codigo_CIE=params[:consulta][:diagnostico][:Codigo_CIE]
          @diagnostico.save
          @msg="Característica guardada satisfactoriamente"
          format.json { render json: {data:@sintoma, mensaje:@msg}, status: :created }
          format.html   
        else
          format.json { render json: @sintoma.errors, status: :unprocessable_entity }
        end
            
      else
        @msg="Guarde primero la consulta"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }      
      end
    end
  end

  def createExamenFisico
    @examenFisico= ExamenFisico.new
    respond_to do |format|
      if @@consultaTMP!=nil
        @examenFisico.consulta_id=@@consultaTMP.consulta_id
        @examenFisico.Efb_Observacion=params[:consulta][:examenFisico][:Efb_Observacion]
        @examenFisico.Efb_Parte_CH=params[:consulta][:examenFisico][:Efb_Parte_CH]
        @examenFisico.Efb_Evidencia_Patologica=params[:consulta][:examenFisico][:Efb_Evidencia_Patologica]
        if @examenFisico.save
          @msg="Examen físico guardado satisfactoriamente"
          format.json { render json:{ data:@examenFisico, mensaje:@msg}, status: :created }
        else
        end
                
      else
        @msg="Guarde primero la consulta"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity } 
      end
    end     
  end


  def createPedido
    @examen=Examen.new
    @prescripcion=Prescripcion.new
    respond_to do |format|
      if @@consultaTMP!=nil
        unless @@prescripcionTMP!=nil
          puts "ingresa a prescripcion"
          @prescripcion.consulta_id=@@consultaTMP.consulta_id
          @prescripcion.save
          @@prescripcionTMP=@prescripcion
        end        
        
        @examen.Exa_Tipo=params[:consulta][:examen][:Exa_Tipo]
        @examen.Exa_Prioridad=params[:consulta][:examen][:Exa_Prioridad]
        @examen.Exa_Motivo=params[:consulta][:examen][:Exa_Motivo]
        @examen.Exa_Descripcion=params[:consulta][:examen][:Exa_Descripcion]
        @examen.prescripcion_id=@@prescripcionTMP.prescripcion_id
        if @examen.save
          @msg="Pedido de imagenologia guardado satisfactoriamente"
          format.json { render json: {data:@examen, mensaje:@msg}, status: :created }
        else
          format.json { render json: @examen.errors, status: :unprocessable_entity }
        end
        
      else
        @msg="Guarde primero la consulta"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity } 
      end
      
    end    
  end

  def createTratamiento
    @prescripcion=Prescripcion.new
    respond_to do |format|
      if @@consultaTMP!=nil
        if @@prescripcionTMP!=nil
          @@prescripcionTMP.update(:Pre_Procedimiento=>params[:consulta][:prescripcion][:Pre_Procedimiento], :Pre_Indicaciones_Generales=>params[:consulta][:prescripcion][:Pre_Indicaciones_Generales], :Pre_Observacion=>params[:consulta][:prescripcion][:Pre_Observacion])
          @msg="Tratamiento guardado satisfactoriamente"
          format.json { render json:{data: @prescripcion, mensaje:@msg}, status: :created }
        else
          @prescripcion.consulta_id=@@consultaTMP.consulta_id
          @prescripcion.Pre_Procedimiento=params[:consulta][:prescripcion][:Pre_Procedimiento]
          @prescripcion.Pre_Indicaciones_Generales=params[:consulta][:prescripcion][:Pre_Indicaciones_Generales]
          @prescripcion.Pre_Observacion=params[:consulta][:prescripcion][:Pre_Observacion]
          if @prescripcion.save
            @@prescripcionTMP=@prescripcion
            @msg="Tratamiento guardado satisfactoriamente"
            format.json { render json:{data: @prescripcion, mensaje:@msg}, status: :created }           
          else
            format.json { render json: @prescripcion.errors, status: :unprocessable_entity }
          end
          
        end        
      else
        @msg="Guarde primero la consulta"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }
      end      
    end    
  end

  def createReceta
    @medicina=Medicina.new
    @prescripcion=Prescripcion.new
    respond_to do |format|
      if @@consultaTMP!=nil
        unless @@prescripcionTMP!=nil
          puts "ingresa a prescripcion"
          @prescripcion.consulta_id=@@consultaTMP.consulta_id
          @prescripcion.save
          @@prescripcionTMP=@prescripcion
        end
        @medicina.prescripcion_id=@@prescripcionTMP.prescripcion_id
        @medicina.Ins_Nombre=params[:consulta][:medicina][:Ins_Nombre]
        @medicina.Ins_Indicacion=params[:consulta][:medicina][:Ins_Indicacion]
        @medicina.Ins_Cantidad=params[:consulta][:medicina][:Ins_Cantidad]
        if @medicina.save
          @msg="Medicamento añadido satisfactoriamente"
          format.json { render json: {data:@medicina,consulta: @@consultaTMP,mensaje:@msg}, status: :created }     
        else
          format.json { render json: @medicina.errors, status: :unprocessable_entity }
        end
          
      else
        @msg="Guarde primero la consulta"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }
      end              

    end    
  end

#ACCION CREAR TERAPIA
  def createTerapia
    @terapia=Terapia.new
    respond_to do |format|
      if @@consultaTMP!=nil
        unless @@prescripcionTMP!=nil
          puts "ingresa a prescripcion"
          @prescripcion.consulta_id=@@consultaTMP.consulta_id
          @prescripcion.save
          @@prescripcionTMP=@prescripcion
        end
        @terapia.prescripcion_id=@@prescripcionTMP.prescripcion_id
        @terapia.Ter_Numero_Sesiones=params[:consulta][:terapia][:Ter_Numero_Sesiones]
        @terapia.Ter_indicacion=params[:consulta][:terapia][:Ter_indicacion]
        if @terapia.save
          @msg="Terapia guardada satisfactoriamente"
          format.json { render json:{data: @terapia, mensaje:@msg}, status: :created } 
        else
          format.json { render json: @terapia.errors, status: :unprocessable_entity }
        end
      else
        @msg="Guarde primero la consulta"
        format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }
      end      
    end    
  end
  
  


   private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @res_pacientes = Paciente.find_by_sql("SELECT *, TIMESTAMPDIFF(YEAR, Pac_Fecha_Nacimiento,CURDATE()) AS Edad from pacientes WHERE paciente_id="+params[:pcte])
      @paciente=@res_pacientes[0]
      @@pacienteTMP=@res_pacientes[0]
      @@cita_idTMP= params[:cit]
      @@inserted=false
      @@consultaTMP=nil
      @@prescripcionTMP=nil
    end

    def save_cita
      @@cita_idTMP= @@cita_idTMP
      @@inserted=true
    end
    

    def list_antecedentes
      @antecedentes= Antecedente.find_by_sql("SELECT *FROM antecedentes WHERE paciente_id="+@@pacienteTMP.paciente_id.to_s+" ORDER BY Ant_tipo")
    end
    
end
