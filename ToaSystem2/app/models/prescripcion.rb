class Prescripcion < ApplicationRecord
  belongs_to :consulta, inverse_of: :prescripcion
  has_many :examenes,  inverse_of: :prescripcion
  has_one :partesOperatorio, inverse_of: :prescripcion
end
