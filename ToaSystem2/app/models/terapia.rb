class Terapia < ApplicationRecord
  belongs_to :prescripcion, inverse_of: :terapia
end
