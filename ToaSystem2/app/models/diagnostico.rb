class Diagnostico < ApplicationRecord
  belongs_to :sintoma
  belongs_to :consulta
  validates_presence_of :sintoma
  validates_presence_of :consulta
 
end
