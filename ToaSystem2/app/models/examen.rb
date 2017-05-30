class Examen < ApplicationRecord
  belongs_to :prescripcion,  inverse_of: :examen
end
