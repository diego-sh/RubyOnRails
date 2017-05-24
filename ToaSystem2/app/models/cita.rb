class Cita < ApplicationRecord
  before_save :fields_complete, :upperCase
  belongs_to :paciente, inverse_of: :cita
  belongs_to :empleado, inverse_of: :cita
  belongs_to :medico, inverse_of: :cita
  has_one :consulta, inverse_of: :cita

  def fields_complete
    self.Cit_Estado= "PENDIENTE"
    self.Cit_Hora_Fin= self.Cit_Hora+30.minutes
  end
  
  def upperCase
    self.Cit_Motivo= self.Cit_Motivo.upcase
    self.Cit_Observacion= self.Cit_Observacion.upcase
  end

end
