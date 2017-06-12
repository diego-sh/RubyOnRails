class Equipo < ApplicationRecord
  belongs_to :partes_operatorio
  belongs_to :personas
end
