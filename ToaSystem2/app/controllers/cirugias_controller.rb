class CirugiasController < ApplicationController
    before_action :partes_operatorios, only:[:index]
    after_action :partes_operatorios, only:[:createIngreso]
    def index
        @ingreso=Ingreso.new        
       

    end

    def createIngreso
        respond_to do |format|
            if params[:ingreso][:Ing_Habitacion]!=""
                @ingreso=Ingreso.new
                @ingreso.partes_operatorio_id=params[:ingreso][:partes_operatorio_id]
                @ingreso.Ing_Fecha=params[:ingreso][:Ing_Fecha]
                @ingreso.Ing_Hora=params[:ingreso][:Ing_Hora]
                @ingreso.Ing_Habitacion=params[:ingreso][:Ing_Habitacion]
                @ingreso.Ing_Estado="HOSPITALIZADO"
                @ingreso.usuario_id=session[:usuario]["usuario_id"]
                if @ingreso.save
                    @msg="Ingreso realizado satisfactoriamente"
                    format.json { render json: {data:@ingreso, mensaje:@msg}, status: :created }
                    format.js {render inline: "location.reload();" }  
                end                
            else
                @msg="ESCOJA UNA HABITACIÓN"
                format.json { render json:{mensaje:@msg}, status: :unprocessable_entity }
            end            
        end
        
    end
    
    private
    def partes_operatorios
        @partesOperatorios=PartesOperatorio.find_by_sql("SELECT p.Pac_Apellido_Paterno, p.Pac_Nombres, po.partes_operatorio_id, po.Pop_Cirugia_Propuesta, po.Pop_Fecha_Cirugia, po.Pop_Hora_Cirugia, po.Pop_Tiempo_Cirugia, i.Ing_Estado FROM consultas c 
                                                        INNER JOIN citas cc ON c.cita_id=cc.cita_id 
                                                        INNER JOIN pacientes p ON p.paciente_id=cc.paciente_id 
                                                        INNER JOIN prescripciones pr ON pr.consulta_id=c.consulta_id 
                                                        INNER JOIN partes_operatorios po ON po.prescripcion_id=pr.prescripcion_id
                                                        LEFT JOIN ingresos i ON i.partes_operatorio_id=po.partes_operatorio_id")
    end
    
end