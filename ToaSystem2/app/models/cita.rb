class Cita < ApplicationRecord
  before_save :upperCase
  belongs_to :paciente, inverse_of: :cita
  belongs_to :empleado, inverse_of: :cita
  belongs_to :medico, inverse_of: :cita
  has_one :consulta, inverse_of: :cita
  
  def upperCase
    if self.Cit_Motivo!=nil
      self.Cit_Motivo= self.Cit_Motivo.upcase
    end
    if self.Cit_Observacion!=nil
      self.Cit_Observacion= self.Cit_Observacion.upcase
    end
    
  end

end
