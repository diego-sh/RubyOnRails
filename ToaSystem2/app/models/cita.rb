class Cita < ApplicationRecord
  belongs_to :paciente, inverse_of: :cita
  belongs_to :empleado, inverse_of: :cita
  belongs_to :medico, inverse_of: :cita
  has_one :consulta, inverse_of: :cita
end
