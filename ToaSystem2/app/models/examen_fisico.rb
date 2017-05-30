class ExamenFisico < ApplicationRecord
    belongs_to :consulta, inverse_of: :examen_fisico
end
