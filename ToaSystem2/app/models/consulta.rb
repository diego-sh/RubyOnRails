class Consulta < ApplicationRecord
  belongs_to :cita, inverse_of: :consulta
end
