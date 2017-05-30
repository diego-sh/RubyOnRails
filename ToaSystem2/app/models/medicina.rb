class Medicina < ApplicationRecord
  belongs_to :prescripcion, inverse_of: :medicina
end
