class Medicina < ApplicationRecord
  belongs_to :prescripcion, inverse_of: :medicina
  belongs_to :indicacion
end
