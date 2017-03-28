class Perfil < ApplicationRecord
    has_one :usuario, inverse_of: :perfil
end