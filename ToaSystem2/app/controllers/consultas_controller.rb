class ConsultasController < ApplicationController
  before_action :set_paciente, only:[:show, :new]
  before_action :list_antecedentes, only:[:new]
  
  def index
      @lstPacientesAtender=Cita.find_by_sql("SELECT c.cita_id,c.cit_fecha,c.cit_hora,c.cit_motivo, p.paciente_id, CONCAT(CONCAT(p.pac_apellido_paterno,' '),p.pac_apellido_materno)AS Apellidos, p.pac_nombres 
                                            FROM citas c INNER JOIN pacientes p ON p.paciente_id=c.paciente_id 
                                            WHERE c.medico_id=1 AND c.cit_fecha=CURDATE() ORDER by c.cit_hora ASC")

  end

  def edit
  end

  def new
    @consulta=Consulta.new
    @antecedente= Antecedente.new
    
  end

  def create
    
  end

  def createAntecedente
    @antecedente=Antecedente.new
    @antecedente.Ant_tipo=params[:consulta][:antecedente][:Ant_tipo]
    @antecedente.Ant_Descripcion=params[:consulta][:antecedente][:Ant_Descripcion]
    @antecedente.paciente_id=@@pacienteTMP.paciente_id
      if @antecedente.save
        redirect_to :back
      end
  end

  def deleteAntecedente
    
  end
  
  

  def update
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @res_pacientes = Paciente.find_by_sql("SELECT *, TIMESTAMPDIFF(YEAR, Pac_Fecha_Nacimiento,CURDATE()) AS Edad from pacientes WHERE paciente_id="+params[:pcte])
      @paciente=@res_pacientes[0]
      @@pacienteTMP=@res_pacientes[0]
    end

    def list_antecedentes
      @antecedentes= Antecedente.find_by_sql("SELECT *FROM antecedentes WHERE paciente_id="+@@pacienteTMP.paciente_id.to_s+" ORDER BY Ant_tipo")
    end
    
end
