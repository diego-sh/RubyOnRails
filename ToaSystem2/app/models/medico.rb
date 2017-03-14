class Medico < ApplicationRecord
  belongs_to :persona,inverse_of: :medico

  validates :Med_Especialidad, presence: true
  validates :Med_Especialidad, format: { with: /\A[a-zA-Z]+\z/,
    message: "Ingrese solo letras" }

end
