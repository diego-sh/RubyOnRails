class Ingreso < ApplicationRecord
  has_one :partesOperatorio, inverse_of: :ingreso
  has_many :signosVitale, inverse_of: :ingreso
  has_many :notas, inverse_of: :ingreso
  has_many :chequeosCardiologicos, inverse_of: :ingreso
  has_one :protocolo_operacion, inverse_of: :ingreso
  has_one :epicrisi, inverse_of: :ingreso
  has_many :indicaciones, inverse_of: :ingreso
end
