class Residencia < ApplicationRecord
  belongs_to :paciente, inverse_of: :residencia

  validates :Res_Sector, :Res_Calle_Principal, :Res_Calle_Secundaria, presence: true
end
