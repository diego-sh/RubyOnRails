class Nota < ApplicationRecord
  belongs_to :ingreso
  has_many :revisiones, inverse_of: :nota

  serialize :revisiones, Array
end
