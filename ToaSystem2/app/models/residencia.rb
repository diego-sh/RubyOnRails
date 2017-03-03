class Residencia < ApplicationRecord
  belongs_to :paciente, inverse_of: :residencia
end
