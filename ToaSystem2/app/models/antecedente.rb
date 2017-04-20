class Antecedente < ApplicationRecord
  belongs_to :paciente, inverse_of: :antecedente
end
