class ConsultasController < ApplicationController
  before_action :set_paciente, only:[:show, :new]
  
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
    raise
  end
  

  def update
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @res_pacientes = Paciente.find_by_sql("SELECT *, TIMESTAMPDIFF(YEAR, Pac_Fecha_Nacimiento,CURDATE()) AS Edad from pacientes WHERE paciente_id="+params[:pcte])
      @paciente=@res_pacientes[0]
    end
end
