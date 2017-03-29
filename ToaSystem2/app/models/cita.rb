class Cita < ApplicationRecord
  belongs_to :paciente
  belongs_to :empleado
  belongs_to :medico
end
