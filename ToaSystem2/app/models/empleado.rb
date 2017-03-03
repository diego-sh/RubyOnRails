class Empleado < ApplicationRecord
  belongs_to :persona,inverse_of: :empleado
end
