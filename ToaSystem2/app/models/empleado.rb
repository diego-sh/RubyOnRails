class Empleado < ApplicationRecord
  belongs_to :persona,inverse_of: :empleado
  
  validates :Emp_Rol, presence: true
  validates :Emp_Rol, format: { with: /\A[a-zA-Z]+\z/,
    message: "Ingrese solo letras" }
end
