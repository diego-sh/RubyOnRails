class Indicacion < ApplicationRecord
  belongs_to :ingreso
  has_many :medicinas, inverse_of: :indicacion
  has_one :terapia, inverse_of: :indicacion
end
