class Medico < ApplicationRecord
  belongs_to :persona,inverse_of: :medico
end
